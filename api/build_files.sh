echo " BUILD START"
python3.9 -m pip install -r requirements.txt
echo "Make Migrations...."
python3.9 manage.py makemigrations
python3.9 manage.py migrate
echo "Collect Static...."
python3.9 manage.py collectstatic --noinput --clear
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@admin.com', 'anteater')" | python3.9 manage.py shell
echo " BUILD END" 