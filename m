Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D192874700
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 04:57:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E474868;
	Thu,  7 Mar 2024 04:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E474868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709783855;
	bh=60LNj6IGYfVZoj/gyXjOZf0QfdP/hyNETqINZbDOM9c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DZ6rAN3hU/PALkXlhDVpZbDFkNUQoBH3uXdm6g3keTVU5knBbc94HXbbnwUTdWQ26
	 7laIAZMMENNAXMWFmbJ4UKMftrnVfcz2RJdiJtN9OdgDNdz5RUYOyvAu1v+l5fqGIR
	 U0MOQ4kYvUrXsSVxaD/tayK/FhUPnBF8NM9IzwWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7CB7F8058C; Thu,  7 Mar 2024 04:57:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 362FFF805A0;
	Thu,  7 Mar 2024 04:57:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7640F8024E; Thu,  7 Mar 2024 04:56:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E592CF80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 04:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E592CF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=RZcwJTdm
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4273ufAm048912;
	Wed, 6 Mar 2024 21:56:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709783801;
	bh=ehmInrd2KsR/7lA/FjYVpc2p7JwpKwG8Gj2BdP6Ou14=;
	h=From:To:CC:Subject:Date;
	b=RZcwJTdmuWFbWgS33QGjugd4CfHqcHBBYu5wWUoFcmqXBIHl8VK/bq3aOhAODYsfQ
	 dvYSeMswMwyncV9yusf3IM/nQleVlKbvU/iAwV9ETPkZn7Lfuk3k6NO5hnpuq/W9J4
	 WYRehLwnlhYxdTh7dfR1rY0841y9UUskNybWnFfs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4273ufki092782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Mar 2024 21:56:41 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Mar 2024 21:56:41 -0600
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Wed, 6 Mar 2024 21:56:40 -0600
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "bard.liao@intel.com" <bard.liao@intel.com>,
        "mengdong.lin@intel.com" <mengdong.lin@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "Xu,
 Baojun" <baojun.xu@ti.com>, "Lu, Kevin" <kevin-lu@ti.com>,
        "tiwai@suse.de"
	<tiwai@suse.de>, "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com"
	<Baojun.Xu@fpt.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v10] The tas2783 is a smart audio amplifier
 with integrated MIPI SoundWire interface (Version 1.2.1 compliant), I2C, and
 I2S/TDM interfaces designed for portable applications. An on-chip DSP
 supports Texas Instruments SmartAmp sp
Thread-Topic: [EXTERNAL] Re: [PATCH v10] The tas2783 is a smart audio
 amplifier with integrated MIPI SoundWire interface (Version 1.2.1 compliant),
 I2C, and I2S/TDM interfaces designed for portable applications. An on-chip
 DSP supports Texas Instruments SmartAmp sp
Thread-Index: AQHabzH/b3I/bWWVFUK0e05J8vV+lrErpzBQ
Date: Thu, 7 Mar 2024 03:56:40 +0000
Message-ID: <dff90323b41a4e3a8e0e8540fbb32154@ti.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.249]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: JWPRWX6ROGTHR2VHC65JIYVJYPRS3T4X
X-Message-ID-Hash: JWPRWX6ROGTHR2VHC65JIYVJYPRS3T4X
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWPRWX6ROGTHR2VHC65JIYVJYPRS3T4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Wednesday, March 6, 2024 3:19 AM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com;
> perex@perex.cz; pierre-louis.bossart@linux.intel.com;
> 13916275206@139.com; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; liam.r.girdwood@intel.com; bard.liao@intel.com;
> mengdong.lin@intel.com; yung-chuan.liao@linux.intel.com; Xu, Baojun
> <baojun.xu@ti.com>; Lu, Kevin <kevin-lu@ti.com>; tiwai@suse.de;
> soyer@irl.hu; Baojun.Xu@fpt.com; Navada Kanyana, Mukund
> <navada@ti.com>
> Subject: [EXTERNAL] Re: [PATCH v10] The tas2783 is a smart audio amplifie=
r
> with integrated MIPI SoundWire interface (Version 1.2.1 compliant), I2C, =
and
> I2S/TDM interfaces designed for portable applications. An on-chip DSP
> supports Texas Instruments SmartAmp spe...
>=20
> On Tue, Mar 05, 2024 at 04:43:35PM +0800, Shenghao Ding wrote:
> > The ASoC component provides the majority of the functionality of the
> > device, all the audio functions.
>=20
> > +static const struct reg_default tas2783_reg_defaults[] =3D {
> > +	/* Default values for ROM mode. Activated. */
> > +	{ 0x8002, 0x1a },	/* AMP inactive. */
> > +	{ 0x8097, 0xc8 },
> > +	{ 0x80b5, 0x74 },
> > +	{ 0x8099, 0x20 },
> > +	{ 0xfe8d, 0x0d },
> > +	{ 0xfebe, 0x4a },
> > +	{ 0x8230, 0x00 },
> > +	{ 0x8231, 0x00 },
> > +	{ 0x8232, 0x00 },
> > +	{ 0x8233, 0x01 },
> > +	{ 0x8418, 0x00 },	/* Set volume to 0 dB. */
> > +	{ 0x8419, 0x00 },
> > +	{ 0x841a, 0x00 },
> > +	{ 0x841b, 0x00 },
> > +	{ 0x8428, 0x40 },	/* Unmute channel */
> > +	{ 0x8429, 0x00 },
> > +	{ 0x842a, 0x00 },
> > +	{ 0x842b, 0x00 },
> > +	{ 0x8548, 0x00 },	/* Set volume to 0 dB. */
> > +	{ 0x8549, 0x00 },
> > +	{ 0x854a, 0x00 },
> > +	{ 0x854b, 0x00 },
> > +	{ 0x8558, 0x40 },	/* Unmute channel */
> > +	{ 0x8559, 0x00 },
> > +	{ 0x855a, 0x00 },
> > +	{ 0x855b, 0x00 },
> > +	{ 0x800a, 0x3a },	/* Enable both channel */
>=20
> These comments sound like this register default table is not actually the
> physical default register values that the chip has...
>=20
> > +static const struct regmap_config tasdevice_regmap =3D {
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 8,
> > +	.readable_reg =3D tas2783_readable_register,
> > +	.volatile_reg =3D tas2783_volatile_register,
> > +	.max_register =3D 0x44ffffff,
> > +	.reg_defaults =3D tas2783_reg_defaults,
> > +	.num_reg_defaults =3D ARRAY_SIZE(tas2783_reg_defaults),
>=20
> ...but this is set as the register defaults.  This will cause problems wi=
th things
> like cache sync where we don't write values out if they're not the defaul=
ts.
> We also try to keep default settings from the silicon except in the most
> obvious cases, it avoids issues with trying to work out what to set and
> accomodate different use cases for different systems.
>=20
> If you do need to set non-default values then either just regular writes =
during
> probe or a regmap patch would do it.

So, can I remove=20
".reg_defaults =3D tas2783_reg_defaults," and tas2783_reg_defaults from the=
 code?

>=20
> > +	.cache_type =3D REGCACHE_RBTREE,
> > +	.use_single_read =3D true,
> > +	.use_single_write =3D true,
>=20
> REGCACHE_MAPLE is generally the most sensible choice for modern devices
> - it's a newer and fancier data structure underlying it and there's only =
a few
> cases with low end devices, mostly doing block I/O which this doesn't
> support, where the RBTREE cache is still better.

Accept

>=20
> > +	u16 dev_info;
> > +	int ret;
> > +
> > +	if (!tas_dev->sdw_peripheral) {
> > +		dev_err(tas_dev->dev, "%s: peripheral doesn't exist.\n",
> > +			__func__);
> > +		return;
> > +	}
> > +
> > +	dev_info =3D tas_dev->sdw_peripheral->bus->link_id |
> > +		tas_dev->sdw_peripheral->id.unique_id << 16;
>=20
> I'm kind of surprised dev_info works as a variable name without something
> getting upset that it aliases the function of the same name.

Accept
