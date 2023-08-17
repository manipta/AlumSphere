echo " BUILD START"
python3.9 -m pip install -r requirements.txt
echo "Make Migrations...."
python3.9 manage.py makemigrations
python3.9 manage.py migrate
echo "Collect Static...."
python3.9 manage.py collectstatic --noinput --clear
python3.9 manage.py shell -c "from django.contrib.auth.models import User, Group, Permission; from django.contrib.contenttypes.models import ContentType; admins, _ = Group.objects.get_or_create(name='admins'); admins_ct = ContentType.objects.get(app_label='auth', model='user'); is_admin, _ = Permission.objects.get_or_create(name='is_admin', codename='is_admin', content_type=admins_ct); admins.permissions.add(is_admin); admin,_ = User.objects.get_or_create(username='admin'); admin.set_password('anteater'); admin.groups.add(admins); admin.save(); admin.has_perm('auth.is_admin')"
python3.9 manage.py shell -c "from django.contrib.auth.models import Group, Permission; from django.contrib.contenttypes.models import ContentType; alumni, _ = Group.objects.get_or_create(name='alumni'); alumni_ct, _ = ContentType.objects.get_or_create(app_label='auth', model='user'); is_alumnus, _ = Permission.objects.get_or_create(name='is_alumnus', codename='is_alumnus', content_type=alumni_ct); alumni.permissions.add(is_alumnus)"
python3.9 manage.py shell -c "from django.contrib.auth.models import Group, Permission; from django.contrib.contenttypes.models import ContentType; students, _ = Group.objects.get_or_create(name='students'); students_ct, _ = ContentType.objects.get_or_create(app_label='auth', model='User'); is_student, _ = Permission.objects.get_or_create(name='is_student', codename='is_student', content_type=students_ct); students.permissions.add(is_student)"

# echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@admin.com', 'anteater')" | python3.9 manage.py shell
echo " BUILD END" 