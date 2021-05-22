Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18F438D6B2
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 19:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD201666;
	Sat, 22 May 2021 19:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD201666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621705434;
	bh=0ceOGunYke8hxyMWcgXEoI0oMmt+KYcP5vy17aWbBM4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVdr1vAvLdN3K7tx+CVba/1cSxVgiU2RxqihuaLE5v1181X7e8EgWA6bvEmUs3Cs5
	 BNf2qZFPw8Ej0fl0r/rraLSo1aAYexJUlExRMsZoHUTGl+7r6K30d6tl6P1+1AUnPr
	 Cbt/Iegdd8lXm3qRIrHg3lIVCfXNA5FSXt9RLbf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D05A8F800E5;
	Sat, 22 May 2021 19:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ABD7F80217; Sat, 22 May 2021 19:42:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC970F800E5
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 19:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC970F800E5
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EC686108D;
 Sat, 22 May 2021 17:42:14 +0000 (UTC)
Date: Sat, 22 May 2021 18:43:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 4/8] iio: accel: bmc150: Add support for
 dual-accelerometers with a DUAL250E HID
Message-ID: <20210522184336.09c219cd@jic23-huawei>
In-Reply-To: <20210521171418.393871-5-hdegoede@redhat.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-5-hdegoede@redhat.com>
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

On Fri, 21 May 2021 19:14:14 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> The Lenovo Yoga 300-11IBR has a ACPI fwnode with a HID of DUAL250E
> which contains I2C and IRQ resources for 2 accelerometers, 1 in the
> display and one in the base of the device. Add support for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/iio/accel/bmc150-accel-i2c.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
> index e24ce28a4660..b81e4005788e 100644
> --- a/drivers/iio/accel/bmc150-accel-i2c.c
> +++ b/drivers/iio/accel/bmc150-accel-i2c.c
> @@ -24,6 +24,7 @@
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
>  	{"BOSC0200"},
> +	{"DUAL250E"},
>  	{ },
>  };
>  
> @@ -35,21 +36,24 @@ static void bmc150_acpi_dual_accel_probe(struct i2c_client *client)
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  	struct i2c_client *second_dev;
> +	char dev_name[16];

I'm a bit in two minds about having a fixed length array for this.
Obviously this is always big enough (I think a bit too big), but it
might be a place where a future bug is introduced.  Perhaps it's worth the dance
of a kasprintf and kfree, to avoid that possibility?

>  	struct i2c_board_info board_info = {
>  		.type = "bmc150_accel",
> -		/*
> -		 * The 2nd accel sits in the base of 2-in-1s. Note this
> -		 * name is static, as there should never be more then 1
> -		 * BOSC0200 ACPI node with 2 accelerometers in it.
> -		 */
> -		.dev_name = "BOSC0200:base",
> +		.dev_name = dev_name,
>  		.fwnode = client->dev.fwnode,
> -		.irq = -ENOENT,
>  	};
>  
>  	if (acpi_match_device_ids(adev, bmc150_acpi_dual_accel_ids))
>  		return;
>  
> +	/*
> +	 * The 2nd accel sits in the base of 2-in-1s. The suffix is static, as
> +	 * there should never be more then 1 ACPI node with 2 accelerometers in it.
> +	 */
> +	snprintf(dev_name, sizeof(dev_name), "%s:base", acpi_device_hid(adev));
> +
> +	board_info.irq = acpi_dev_gpio_irq_get_by(adev, NULL, 1);
> +
>  	second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
>  	if (!IS_ERR(second_dev))
>  		bmc150_set_second_device(client, second_dev);
> @@ -114,6 +118,7 @@ static const struct acpi_device_id bmc150_accel_acpi_match[] = {
>  	{"BMA222E",	bma222e},
>  	{"BMA0280",	bma280},
>  	{"BOSC0200"},
> +	{"DUAL250E"},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(acpi, bmc150_accel_acpi_match);

