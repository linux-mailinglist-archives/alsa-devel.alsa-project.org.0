Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A838D6BB
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 19:53:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 268371681;
	Sat, 22 May 2021 19:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 268371681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621706030;
	bh=MpM/12P1x4GI/wXG4q7GH1+gIQonJ0K7KyI25+Uw2Zo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNM767+YHheBaoQMNNogNkWv0NcdQzZddxls86WR4uJWpnruduQMb4JnxXo6ZdSRQ
	 /7SJrMeX59ZbuDFlfC9eKY9j1rRMSp4GSrew47/h6+vMZJxO8aTLOuyDELqa/QvipD
	 ULCHuZngSO5401ulhEFKprIxMfYExJ47O9X8Krss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9099EF80229;
	Sat, 22 May 2021 19:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4096F80217; Sat, 22 May 2021 19:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=PRX_BODY_21,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0585F800E5
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 19:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0585F800E5
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E17B761002;
 Sat, 22 May 2021 17:52:09 +0000 (UTC)
Date: Sat, 22 May 2021 18:53:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 7/8] iio: accel: bmc150: Add support for DUAL250E ACPI
 DSM for setting the hinge angle
Message-ID: <20210522185332.735d605d@jic23-huawei>
In-Reply-To: <20210521171418.393871-8-hdegoede@redhat.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-8-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 21 May 2021 19:14:17 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Some 360 degree hinges (yoga) style 2-in-1 devices use 2 bmc150 accels
> to allow the OS to determine the angle between the display and the base
> of the device, so that the OS can determine if the 2-in-1 is in laptop
> or in tablet-mode.
>=20
> On Windows both accelerometers are read (polled) by a special service
> and this service calls the DSM (Device Specific Method), which in turn
> translates the angles to one of laptop/tablet/tent/stand mode and then
> notifies the EC about the new mode and the EC then enables or disables
> the builtin keyboard and touchpad based in the mode.
>=20
> When the 2-in-1 is powered-on or resumed folded in tablet mode the
> EC senses this independent of the DSM by using a HALL effect sensor
> which senses that the keyboard has been folded away behind the display.
>=20
> At power-on or resume the EC disables the keyboard based on this and
> the only way to get the keyboard to work after this is to call the
> DSM to re-enable it.
>=20
> Call the DSM on probe() and resume() to fix the keyboard not working
> when powered-on / resumed in tablet-mode.
>=20
> This patch was developed and tested on a Lenovo Yoga 300-IBR.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Putting aside my general grumpiness at this stuff having to pollute
accelerometer drivers (and the broken DSM implementation on the hardware!)
this is a fairly clean implementation so I guess we can survive it.

Jonathan

> ---
>  drivers/iio/accel/bmc150-accel-core.c |   3 +
>  drivers/iio/accel/bmc150-accel-i2c.c  | 109 ++++++++++++++++++++++++++
>  drivers/iio/accel/bmc150-accel.h      |   3 +
>  3 files changed, 115 insertions(+)
>=20
> diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bm=
c150-accel-core.c
> index 0291512648b2..932007895f18 100644
> --- a/drivers/iio/accel/bmc150-accel-core.c
> +++ b/drivers/iio/accel/bmc150-accel-core.c
> @@ -1803,6 +1803,9 @@ static int bmc150_accel_resume(struct device *dev)
>  	bmc150_accel_fifo_set_mode(data);
>  	mutex_unlock(&data->mutex);
> =20
> +	if (data->resume_callback)
> +		data->resume_callback(dev);
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc=
150-accel-i2c.c
> index 1dd7b8a9a382..31256c32a33c 100644
> --- a/drivers/iio/accel/bmc150-accel-i2c.c
> +++ b/drivers/iio/accel/bmc150-accel-i2c.c
> @@ -28,6 +28,107 @@ static const struct acpi_device_id bmc150_acpi_dual_a=
ccel_ids[] =3D {
>  	{ },
>  };
> =20
> +/*
> + * The DUAL250E ACPI device for 360=C2=B0 hinges type 2-in-1s with 1 acc=
elerometer
> + * in the display and 1 in the hinge has an ACPI-method (DSM) to tell the
> + * ACPI code about the angle between the 2 halves. This will make the AC=
PI
> + * code enable/disable the keyboard and touchpad. We need to call this t=
o avoid
> + * the keyboard being disabled when the 2-in-1 is turned-on or resumed w=
hile
> + * fully folded into tablet mode (which gets detected with a HALL-sensor=
).
> + * If we don't call this then the keyboard won't work even when the 2-in=
-1 is
> + * changed to be used in laptop mode after the power-on / resume.
> + *
> + * This DSM takes 2 angles, selected by setting aux0 to 0 or 1, these pr=
esumably
> + * define the angle between the gravity vector measured by the accelerom=
eter in
> + * the display (aux0=3D0) resp. the base (aux0=3D1) and some reference v=
ector.
> + * The 2 angles get subtracted from each other so the reference vector d=
oes
> + * not matter and we can simply leave the second angle at 0.
> + */
> +
> +#define BMC150_DSM_GUID				"7681541e-8827-4239-8d9d-36be7fe12542"
> +#define DUAL250E_SET_ANGLE_FN_INDEX		3
> +
> +struct dual250e_set_angle_args {
> +	u32 aux0;
> +	u32 ang0;
> +	u32 rawx;
> +	u32 rawy;
> +	u32 rawz;
> +} __packed;
> +
> +static bool bmc150_acpi_set_angle_dsm(struct i2c_client *client, u32 aux=
0, u32 ang0)
> +{
> +	struct acpi_device *adev =3D ACPI_COMPANION(&client->dev);
> +	struct dual250e_set_angle_args args =3D {
> +		.aux0 =3D aux0,
> +		.ang0 =3D ang0,
> +	};
> +	union acpi_object args_obj, *obj;
> +	guid_t guid;
> +
> +	if (strcmp(acpi_device_hid(adev), "DUAL250E"))
> +		return false;
> +
> +	guid_parse(BMC150_DSM_GUID, &guid);
> +
> +	if (!acpi_check_dsm(adev->handle, &guid, 0, BIT(DUAL250E_SET_ANGLE_FN_I=
NDEX)))
> +		return false;
> +
> +	/*
> +	 * Note this triggers the following warning:
> +	 * "ACPI Warning: \_SB.PCI0.I2C2.ACC1._DSM: Argument #4 type mismatch -
> +	 *                Found [Buffer], ACPI requires [Package]"
> +	 * This is unavoidable since the _DSM implementation expects a "naked"
> +	 * buffer, so wrapping it in a package will _not_ work.

ouch.

> +	 */
> +	args_obj.type =3D ACPI_TYPE_BUFFER;
> +	args_obj.buffer.length =3D sizeof(args);
> +	args_obj.buffer.pointer =3D (u8 *)&args;
> +
> +	obj =3D acpi_evaluate_dsm(adev->handle, &guid, 0, DUAL250E_SET_ANGLE_FN=
_INDEX, &args_obj);
> +	if (!obj) {
> +		dev_err(&client->dev, "Failed to call DSM to enable keyboard and touch=
pad\n");
> +		return false;
> +	}
> +
> +	ACPI_FREE(obj);
> +	return true;
> +}
> +
> +static bool bmc150_acpi_enable_keyboard(struct i2c_client *client)
> +{
> +	/*
> +	 * The EC must see a change for it to re-enable the kbd, so first set t=
he
> +	 * angle to 270=C2=B0 (tent/stand mode) and then change it to 90=C2=B0 =
(laptop mode).
> +	 */
> +	if (!bmc150_acpi_set_angle_dsm(client, 0, 270))
> +		return false;
> +
> +	/* The EC needs some time to notice the angle being changed */
> +	msleep(100);
> +
> +	return bmc150_acpi_set_angle_dsm(client, 0, 90);
> +}
> +
> +static void bmc150_acpi_resume_work(struct work_struct *work)
> +{
> +	struct bmc150_accel_data *data =3D
> +		container_of(work, struct bmc150_accel_data, resume_work.work);
> +
> +	bmc150_acpi_enable_keyboard(data->second_device);
> +}
> +
> +static void bmc150_acpi_resume_handler(struct device *dev)
> +{
> +	struct bmc150_accel_data *data =3D iio_priv(dev_get_drvdata(dev));
> +
> +	/*
> +	 * Delay the bmc150_acpi_enable_keyboard() call till after the system
> +	 * resume has completed, otherwise it will not work.
> +	 */
> +	schedule_delayed_work(&data->resume_work, msecs_to_jiffies(1000));
> +}
> +
>  /*
>   * Some acpi_devices describe 2 accelerometers in a single ACPI device, =
try instantiating
>   * a second i2c_client for an I2cSerialBusV2 ACPI resource with index 1.
> @@ -55,12 +156,20 @@ static void bmc150_acpi_dual_accel_probe(struct i2c_=
client *client)
>  	board_info.irq =3D acpi_dev_gpio_irq_get_by(adev, NULL, 1);
> =20
>  	data->second_device =3D i2c_acpi_new_device(&client->dev, 1, &board_inf=
o);
> +
> +	if (!IS_ERR(data->second_device) && bmc150_acpi_enable_keyboard(data->s=
econd_device)) {
> +		INIT_DELAYED_WORK(&data->resume_work, bmc150_acpi_resume_work);
> +		data->resume_callback =3D bmc150_acpi_resume_handler;
> +	}
>  }
> =20
>  static void bmc150_acpi_dual_accel_remove(struct i2c_client *client)
>  {
>  	struct bmc150_accel_data *data =3D iio_priv(i2c_get_clientdata(client));
> =20
> +	if (data->resume_callback)
> +		cancel_delayed_work_sync(&data->resume_work);
> +
>  	i2c_unregister_device(data->second_device);
>  }
>  #else
> diff --git a/drivers/iio/accel/bmc150-accel.h b/drivers/iio/accel/bmc150-=
accel.h
> index 5da6fd32bac5..d67d6ed6ae77 100644
> --- a/drivers/iio/accel/bmc150-accel.h
> +++ b/drivers/iio/accel/bmc150-accel.h
> @@ -6,6 +6,7 @@
>  #include <linux/iio/iio.h>
>  #include <linux/mutex.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/workqueue.h>
> =20
>  struct regmap;
>  struct i2c_client;
> @@ -62,6 +63,8 @@ struct bmc150_accel_data {
>  	int64_t timestamp, old_timestamp; /* Only used in hw fifo mode. */
>  	const struct bmc150_accel_chip_info *chip_info;
>  	struct i2c_client *second_device;
> +	void (*resume_callback)(struct device *dev);
> +	struct delayed_work resume_work;
>  	struct iio_mount_matrix orientation;
>  };
> =20

