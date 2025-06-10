Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E574AD42F7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 21:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA8760188;
	Tue, 10 Jun 2025 21:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA8760188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749584126;
	bh=uS9IpZchzQpiGWRJFnkYRUAAyBY9MJE8DrTgLEu4uT4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mHxj4OkkKiRZvbi2Y9bQt2YJ6hj0vCqsPVW1QcZyBHcxlLSs0UeJdtuAGgGOzDCXE
	 YafdiAEB520Au65rPc4ZPk10reB1uhkrQfhRAKNx0flSzhmO0G+lxlzkfmPEgnzB69
	 P3UbUzKAVpMdmmXN8EzED/Reu2DQsjm0T7V8eWNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90CD1F806BA; Tue, 10 Jun 2025 21:33:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A204F806BF;
	Tue, 10 Jun 2025 21:33:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02F6FF804B2; Tue, 10 Jun 2025 15:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4908BF801F7
	for <alsa-devel@alsa-project.org>; Tue, 10 Jun 2025 15:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4908BF801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=OjsbthxL
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55ADDPxs2296499;
	Tue, 10 Jun 2025 08:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749561205;
	bh=J1DaJFU/elI4WLNNuZqSsnOqNGaFv+l+RPQb/509Tog=;
	h=From:To:CC:Subject:Date;
	b=OjsbthxLXdFpk7laAUglM2nQhlf3rsM7AmiuRUQGH4oj5Q68dBbfoJQkzHyMlgHUL
	 DcVVZlC0dR1hQlaNsMnDn8AvBFyY5HGr7/J1Z5zyjr4p4Bpq50NHAZItqzYhi69A5B
	 lDvguhgZfxnRcSkvqYvrp5skKp0PxlfHescHpcRc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55ADDO3Y932335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 08:13:24 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 08:13:24 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.023; Tue, 10 Jun 2025 08:13:24 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "tiwai@suse.de" <tiwai@suse.de>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Ji, Jesse"
	<jesse-ji@ti.com>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Girdwood, Liam
 R" <liam.r.girdwood@intel.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v1 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Thread-Topic: [PATCH v1 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Thread-Index: AdvaALPBccbDT0Y+QrG7W9hUKun6iw==
Date: Tue, 10 Jun 2025 13:13:23 +0000
Message-ID: <2160affa35c4436c8e6875fa449a0763@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.149.200]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4BTHTCIKWFRBCM5ECMWCHAUAQ63EJ4AN
X-Message-ID-Hash: 4BTHTCIKWFRBCM5ECMWCHAUAQ63EJ4AN
X-Mailman-Approved-At: Tue, 10 Jun 2025 19:33:19 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BTHTCIKWFRBCM5ECMWCHAUAQ63EJ4AN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, June 6, 2025 6:17 PM
> Subject: Re: [PATCH v1 1/4] ASoc: tac5x1x: add codec driver
> tac5x1x family
>=20
> On Fri, Jun 06, 2025 at 12:21:33PM +0530, Niranjan H Y wrote:
...=20
> There's a few issues below but nothing that's *hugely* structural, the
> bulk of the code here looks good.

Thank you for your time and review comments.=20
I will add fixes for most the comments in the next patch.=20
Request you to take a look at some comments below.

>=20
> > +config SND_SOC_TAC5X1X
> > +	tristate "Texas Instruments TAC5X1X family codecs"
> > +	depends on I2C && REGMAP_I2C
> > +
> > +config SND_SOC_TAC5X1X_I2C
> > +	tristate "Texas Instruments TAC5X1X family driver based on I2C"
> > +	depends on I2C && REGMAP_I2C
> > +	select SND_SOC_TAC5X1X
>=20
> You need to select REGMAP_I2C if you use it, it can't be turned on
> independently.  If the device is I2C only then there's no need to have
> the second option for I2C, that's used for devices that support both I2C
> and SPI to avoid problems with dependencies on the I2C and SPI core
> code.

Many of these devices support SPI interface as well. So I thought I will ma=
ke
library and I2C interface file. But currently SPI support is not added in t=
he driver.
Is this okay to still keep this ? please suggest.

...
>=20
> > +static const char * const out_ch2_ltch[] =3D {
> > +	"OUT_CH2 OUT2P Short circuit Fault",
> > +	"OUT_CH2 OUT2M Short circuit Fault",
> > +	"OUT_CH2 DRVRP Virtual Ground Fault",
> > +	"OUT_CH2 DRVRM Virtual ground Fault",
> > +	"Reserved",
> > +	"Reserved",
> > +	"AREG SC Fault Mask",
> > +	"AREG SC Fault",
> > +};
>=20
> For ones where the reserved values are in the middle of the set of
> values you can use _VAL_ENUM() which lets you skip over the values that
> are invalid.

Is there some example which I can refer?=20
I could not find anything in the kernel source with _VAL_ENUM.
I will try to refactor to avoid this.

>=20
> > +static s32 tac5x1x_regmap_write(struct tac5x1x_priv *tac5x1x,
> > +				u32 reg, u32 value)
> > +{
> > +	s32 ret;
> > +	s32 retry_count =3D 5;
> > +
> > +	while (retry_count--) {
> > +		ret =3D regmap_write(tac5x1x->regmap, reg,
> > +				   value);
> > +		if (ret >=3D 0)
> > +			break;
> > +		usleep_range(5000, 5050);
> > +	}
> > +	if (retry_count =3D=3D -1)
> > +		return 3;
> > +	else
> > +		return ret;
> > +}
>=20
> Is the hardware genuinely so unstable that we need to retry all the I/O?
> This seems really concerning.

I think this can be dropped as this is used for some legacy devices for som=
e=20
customer platforms. I will remove this in next patch and redo the tests.

> > +static s32 tac5x1x_set_GPO1_gpio(struct snd_kcontrol *kcontrol,
> > +				 struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *component =3D
> snd_kcontrol_chip(kcontrol);
> > +	s32 gpio_check, val;
> > +
> > +	val =3D snd_soc_component_read(component, TAC5X1X_GPO1);
> > +	gpio_check =3D ((val & TAC5X1X_GPIOX_CFG_MASK) >> 0);
> > +	if (gpio_check !=3D TAC5X1X_GPIO_GPO) {
> > +		dev_err(component->dev,
> > +			"%s: GPO1 is not configure as a GPO output\n",
> > +			__func__);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (ucontrol->value.integer.value[0])
> > +		val =3D 0;
> > +	else
> > +		val =3D TAC5X1X_GPO1_VAL;
>=20
> This seems to be exposing a GPIO directly to userspace, which will
> prevent using that GPIO with other kernel subsystems.  It would be
> better to expose this via gpiolib, then if userspace control is needed
> that can be done through gpiolib.

Thanks for the suggestion. But, in our case, codec chip has some GPIO pins
which are specific to the codec. We do not intend to expose to the other=20
kernel subsystem. It is more of codec chip configuration to use these
GPIO pins as - for e.g. daisy-chain input, audio data output, PLL input clo=
ck source,
interrupt, digital audio input(PDM) etc. Depending on the hardware connecti=
on,=20
we need to configure some registers so that the pin can function as any one=
 of the=20
features which mentioned in the data sheet. More info in section=20
"5 Pin Configuration and Functions" & "Table 7-70. Multifunction Pin Assign=
ments"=20
in the data sheet. https://www.ti.com/lit/ds/symlink/tac5212.pdf
If it feels right, I can make this also as part of the dts configuration.=20
Please suggest if I still need to expose this as gpiolib.

>=20
> > +static const char *const tac5x1x_slot_select_text[] =3D {
> > +	"Slot 0", "Slot 1", "Slot 2", "Slot 3",
> > +	"Slot 4", "Slot 5", "Slot 6", "Slot 7",
> > +	"Slot 8", "Slot 9", "Slot 10", "Slot 11",
> > +	"Slot 12", "Slot 13", "Slot 14", "Slot 15",
> > +	"Slot 16", "Slot 17", "Slot 18", "Slot 19",
> > +	"Slot 20", "Slot 21", "Slot 22", "Slot 23",
> > +	"Slot 24", "Slot 25", "Slot 26", "Slot 27",
> > +	"Slot 28", "Slot 29", "Slot 30", "Slot 31",
> > +};
>=20
> TDM slot control would usually be done via set_tdm_slot().

We need the slots to be configurable in case we need to swap capture
channels. Is it okay to keep this ?

>=20
> > +static const char *const out2x_vcom_text[] =3D {
> > +	"0.6 * Vref",
> > +	"AVDD by 2",
> > +};
> > +

This can be device tree setting. I will move it.

> > +static const char *const diag_cfg_text[] =3D {
> > +	"0mv", "30mv", "60mv", "90mv",
> > +	"120mv", "150mv", "180mv", "210mv",
> > +	"240mv", "270mv", "300mv", "330mv",
> > +	"360mv", "390mv", "420mv", "450mv",
> > +};
> > +
> > +static const char *const diag_cfg_gnd_text[] =3D {
> > +	"0mv", "60mv", "120mv", "180mv",
> > +	"240mv", "300mv", "360mv", "420mv",
> > +	"480mv", "540mv", "600mv", "660mv",
> > +	"720mv", "780mv", "840mv", "900mv",
> > +};
>=20
> Are these controls that should be device tree data?

We need these values to be configurable via mixer controls.

Thanks,
Niranjan H Y
