Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02A73B012
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 07:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87EFA83B;
	Fri, 23 Jun 2023 07:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87EFA83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687498305;
	bh=u7jQGrNvAwgXqE4utvcz4rFJXc/AUn1UFnDq2eS3I0w=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A3VPbF8njnLIA+lSHnez6SYv36vF4wmG38hvGa5wlPVuY9zTi9szZuFsArnWBhdUp
	 K4J9nTq63ltA+2qMWjts01/L9BWzUhdYpyGWK6PWmOm31lNEhtcKCvcMKdq9yII6eR
	 wxk4Ggh0iBxAJmsRsUo4mUHztHrfjWh7QUHgbYTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4AB5F80141; Fri, 23 Jun 2023 07:30:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C096F80093;
	Fri, 23 Jun 2023 07:30:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1247F80141; Fri, 23 Jun 2023 07:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91446F80130
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 07:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91446F80130
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOPKI3DDLPC
 (unknown[2409:8a1e:90b3:ce80:ac77:361:71ec:add6])
	by rmsmtp-lg-appmail-37-12051 (RichMail) with SMTP id 2f1364952df3498-364bd;
	Fri, 23 Jun 2023 13:30:30 +0800 (CST)
X-RM-TRANSID: 2f1364952df3498-364bd
From: <13916275206@139.com>
To: "'Dan Carpenter'" <dan.carpenter@linaro.org>
Cc: <alsa-devel@alsa-project.org>
References: <5e37bcfa-50d9-45e8-8a68-52438a5a8dc6@moroto.mountain>
In-Reply-To: <5e37bcfa-50d9-45e8-8a68-52438a5a8dc6@moroto.mountain>
Subject: 
 =?gb2312?B?u9i4tDogW2J1ZyByZXBvcnRdIEFTb0M6IHRhczI3ODE6IEFkZCB0YXMyNzg=?=
	=?gb2312?B?MSBkcml2ZXI=?=
Date: Fri, 23 Jun 2023 13:30:29 +0800
Message-ID: <00f701d9a593$d348cf00$79da6d00$@139.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGx+kf9xzGqxzDJA6Hha46OjACZWK/nMLTg
Content-Language: zh-cn
Message-ID-Hash: WCDUFN364TWJLLW3ELSPZBYY6JLGYYQR
X-Message-ID-Hash: WCDUFN364TWJLLW3ELSPZBYY6JLGYYQR
X-MailFrom: 13916275206@139.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCDUFN364TWJLLW3ELSPZBYY6JLGYYQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----=D3=CA=BC=FE=D4=AD=BC=FE-----
> =B7=A2=BC=FE=C8=CB: Dan Carpenter <dan.carpenter@linaro.org>
> =B7=A2=CB=CD=CA=B1=BC=E4: 2023=C4=EA6=D4=C222=C8=D5 23:07
> =CA=D5=BC=FE=C8=CB: 13916275206@139.com
> =B3=AD=CB=CD: alsa-devel@alsa-project.org
> =D6=F7=CC=E2: [bug report] ASoC: tas2781: Add tas2781 driver
>=20
> Hello Shenghao Ding,
>=20
> The patch ef3bcde75d06: "ASoC: tas2781: Add tas2781 driver" from Jun =
18,
> 2023, leads to the following Smatch static checker warning:
>=20
> 	sound/soc/codecs/tas2781-i2c.c:651 tasdevice_parse_dt()
> 	warn: assigning signed to unsigned: 'tas_priv->ndev =3D ndev'
> 's32min-s32max'
>=20
> sound/soc/codecs/tas2781-i2c.c
>     602 static void tasdevice_parse_dt(struct tasdevice_priv =
*tas_priv)
>     603 {
>     604         struct i2c_client *client =3D (struct i2c_client
> *)tas_priv->client;
>     605         unsigned int dev_addrs[TASDEVICE_MAX_CHANNELS];
>     606         int rc, i, ndev =3D 0;
>     607
>     608         if (tas_priv->isacpi) {
>     609                 ndev =3D
> device_property_read_u32_array(&client->dev,
>     610                         "ti,audio-slots", NULL, 0);
>=20
> When we pass NULL to device_property_read_u32_array() then it returns =
then
> number of items.
>=20
>     611                 if (ndev <=3D 0) {
>     612                         ndev =3D 1;
>     613                         dev_addrs[0] =3D client->addr;
>     614                 } else {
>     615                         ndev =3D (ndev <
> ARRAY_SIZE(dev_addrs))
>     616                                 ? ndev :
> ARRAY_SIZE(dev_addrs);
>     617                         ndev =3D
> device_property_read_u32_array(&client->dev,
>                                 ^^^^^^^
> Smatch is concerned that this value can be negative.  But actually =
this
sets it
> to zero, doesn't it?  Is that intentional?  It feels like we should =
leave
ndev as
> the number of items.  Or if we want ndev to be zero do "ndev =3D 0;" =
on the
> next line.
>=20
>     618                                 "ti,audio-slots", dev_addrs,
> ndev);
Thanks for your report, correct and add as following:
			if (ndev <=3D 0) {
				ndev =3D 1;
				dev_addrs[0] =3D client->addr;
			}
One more thing, how to smatch the code in kernel. Where can I find the
guideline?
>     619                 }
>     620
>     621                 tas_priv->irq_info.irq_gpio =3D
>     622
> acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
>     623         } else {
>     624                 struct device_node *np =3D
> tas_priv->dev->of_node;
>     625 #ifdef CONFIG_OF
>     626                 const __be32 *reg, *reg_end;
>     627                 int len, sw, aw;
>     628
>     629                 aw =3D of_n_addr_cells(np);
>     630                 sw =3D of_n_size_cells(np);
>     631                 if (sw =3D=3D 0) {
>     632                         reg =3D (const __be32
> *)of_get_property(np,
>     633                                 "reg", &len);
>     634                         reg_end =3D reg + len/sizeof(*reg);
>     635                         ndev =3D 0;
>     636                         do {
>     637                                 dev_addrs[ndev] =3D
> of_read_number(reg, aw);
>     638                                 reg +=3D aw;
>     639                                 ndev++;
>     640                         } while (reg < reg_end);
>     641                 } else {
>     642                         ndev =3D 1;
>     643                         dev_addrs[0] =3D client->addr;
>     644                 }
>     645 #else
>     646                 ndev =3D 1;
>     647                 dev_addrs[0] =3D client->addr;
>     648 #endif
>     649                 tas_priv->irq_info.irq_gpio =3D of_irq_get(np, =
0);
>     650         }
> --> 651         tas_priv->ndev =3D ndev;
>                 ^^^^^^^^^^^^^^^^^^^^^
> Warning
>=20
Do I need the casting? ndev is sure to less than or equal to 8 and more =
than
1, is won't be overflow in unsigned char.
>     652         for (i =3D 0; i < ndev; i++)
>     653                 tas_priv->tasdevice[i].dev_addr =3D =
dev_addrs[i];
>     654
>     655         tas_priv->reset =3D =
devm_gpiod_get_optional(&client->dev,
>     656                         "reset-gpios", GPIOD_OUT_HIGH);
>=20
> regards,
> dan carpenter


