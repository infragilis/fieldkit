boonstra@fieldkit:/var/www/html $ vi index.php
<!DOCTYPE html>
<html>
    <head>
        <title>fieldkit</title>
    </head>
    <body>
        <?php echo '<p>Hello fieldkit</p>'; ?>
    <?php
        $ip_server = $_SERVER['SERVER_ADDR'];
        echo '<a href=/data target="_blank">Data</a>';
    ?>
</body>
</html>
