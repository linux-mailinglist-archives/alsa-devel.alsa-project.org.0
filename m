Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C538D6AC
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 19:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 489111681;
	Sat, 22 May 2021 19:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 489111681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621705043;
	bh=akB7EkLI97i7NPGaBc1YQcTxsaURsEttC48YPS/dNt0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2LzvP1XRj2hO247nTnCPhiEzhmEjDyHznmG4/jfUbl2XajKv/vmJ30aMxv1aE2n2
	 kdyKrIXtMXfATaSw02mkVKFm3VOhD24+vhQD+L2b8+/DSY8kz5eNLXQRxi/+u/49YM
	 RBovnNEkLy0sHFaUMG1+TKQ8V+Ijg4DwswQGV2tQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1536F80229;
	Sat, 22 May 2021 19:35:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEA36F80217; Sat, 22 May 2021 19:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09BEBF800E5
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 19:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09BEBF800E5
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CC4C6100B;
 Sat, 22 May 2021 17:35:41 +0000 (UTC)
Date: Sat, 22 May 2021 18:37:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/8] iio: accel: bmc150: Move check for second ACPI
 device into a separate function
Message-ID: <20210522183703.4328c4d8@jic23-huawei>
In-Reply-To: <20210521171418.393871-4-hdegoede@redhat.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-4-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jeremy Cline <jeremy@jcline.org>, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 21 May 2021 19:14:13 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Move the check for a second ACPI device for BOSC0200 ACPI fwnodes into
> a new bmc150_acpi_dual_accel_probe() helper function.
> 
> This is a preparation patch for adding support for a new "DUAL250E" ACPI
> Hardware-ID (HID) used on some devices.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

A few places I'd like comments rewrapped on basis of still having
a minor preference for a 80 chars limit unless there is a reason to
do otherwise.

If this is all that turns up in the series, I can do that whilst
applying.

Thanks,

Jonathan


> ---
>  drivers/iio/accel/bmc150-accel-i2c.c | 80 +++++++++++++++++-----------
>  1 file changed, 49 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
> index 2afaae0294ee..e24ce28a4660 100644
> --- a/drivers/iio/accel/bmc150-accel-i2c.c
> +++ b/drivers/iio/accel/bmc150-accel-i2c.c
> @@ -21,6 +21,51 @@
>  
>  #include "bmc150-accel.h"
>  
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
> +	{"BOSC0200"},
> +	{ },
> +};
> +
> +/*
> + * Some acpi_devices describe 2 accelerometers in a single ACPI device, try instantiating

80 char wrap still preferred when it doesn't otherwise hurt readability.

> + * a second i2c_client for an I2cSerialBusV2 ACPI resource with index 1.
> + */
> +static void bmc150_acpi_dual_accel_probe(struct i2c_client *client)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	struct i2c_client *second_dev;
> +	struct i2c_board_info board_info = {
> +		.type = "bmc150_accel",
> +		/*
> +		 * The 2nd accel sits in the base of 2-in-1s. Note this
> +		 * name is static, as there should never be more then 1
> +		 * BOSC0200 ACPI node with 2 accelerometers in it.

Given the lesser indent after pulling this out into a new function, it would
be good to rewrap this text as nearer to 80 chars.

> +		 */
> +		.dev_name = "BOSC0200:base",
> +		.fwnode = client->dev.fwnode,
> +		.irq = -ENOENT,
> +	};
> +
> +	if (acpi_match_device_ids(adev, bmc150_acpi_dual_accel_ids))
> +		return;
> +
> +	second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
> +	if (!IS_ERR(second_dev))
> +		bmc150_set_second_device(client, second_dev);
> +}
> +
> +static void bmc150_acpi_dual_accel_remove(struct i2c_client *client)
> +{
> +	struct i2c_client *second_dev = bmc150_get_second_device(client);
> +
> +	i2c_unregister_device(second_dev);
> +}
> +#else
> +static void bmc150_acpi_dual_accel_probe(struct i2c_client *client) {}
> +static void bmc150_acpi_dual_accel_remove(struct i2c_client *client) {}
> +#endif
> +
>  static int bmc150_accel_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> @@ -30,7 +75,6 @@ static int bmc150_accel_probe(struct i2c_client *client,
>  		i2c_check_functionality(client->adapter, I2C_FUNC_I2C) ||
>  		i2c_check_functionality(client->adapter,
>  					I2C_FUNC_SMBUS_READ_I2C_BLOCK);
> -	struct acpi_device __maybe_unused *adev;
>  	int ret;
>  
>  	regmap = devm_regmap_init_i2c(client, &bmc150_regmap_conf);
> @@ -46,42 +90,16 @@ static int bmc150_accel_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> -	/*
> -	 * Some BOSC0200 acpi_devices describe 2 accelerometers in a single ACPI
> -	 * device, try instantiating a second i2c_client for an I2cSerialBusV2
> -	 * ACPI resource with index 1. The !id check avoids recursion when
> -	 * bmc150_accel_probe() gets called for the second client.
> -	 */
> -#ifdef CONFIG_ACPI
> -	adev = ACPI_COMPANION(&client->dev);
> -	if (!id && adev && strcmp(acpi_device_hid(adev), "BOSC0200") == 0) {
> -		struct i2c_board_info board_info = {
> -			.type = "bmc150_accel",
> -			/*
> -			 * The 2nd accel sits in the base of 2-in-1s. Note this
> -			 * name is static, as there should never be more then 1
> -			 * BOSC0200 ACPI node with 2 accelerometers in it.
> -			 */
> -			.dev_name = "BOSC0200:base",
> -			.fwnode = client->dev.fwnode,
> -			.irq = -ENOENT,
> -		};
> -		struct i2c_client *second_dev;
> -
> -		second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
> -		if (!IS_ERR(second_dev))
> -			bmc150_set_second_device(client, second_dev);
> -	}
> -#endif
> +	/* The !id check avoids recursion when probe() gets called for the second client. */

Won't hurt readability to wrap this to 80 chars as a multiline comment.

> +	if (!id && has_acpi_companion(&client->dev))
> +		bmc150_acpi_dual_accel_probe(client);
>  
>  	return 0;
>  }
>  
>  static int bmc150_accel_remove(struct i2c_client *client)
>  {
> -	struct i2c_client *second_dev = bmc150_get_second_device(client);
> -
> -	i2c_unregister_device(second_dev);
> +	bmc150_acpi_dual_accel_remove(client);
>  
>  	return bmc150_accel_core_remove(&client->dev);
>  }

