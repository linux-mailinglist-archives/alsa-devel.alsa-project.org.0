Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40C710C7A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 14:54:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8366AD8;
	Thu, 25 May 2023 14:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8366AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685019287;
	bh=bBqGtYVgCnS1CciZqfD3OH5Ui83KyWnhgnpcFAjQyJU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SvyEmdHV7v2lxf05LJu6x2w7d42AY9aEV5NaIs4LPwHDbpE0l+D0gTWcQty4jL/Na
	 PrZ8TNM3UKI0RnphMG3kZoXrzbxO94PC7AZIKpuTl/16z6IMNMabOPlud5AOXvh2Zg
	 7WUw8o8XXr34tz3sMHnFTOXstQyIt7M8DN8LcziI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAF5CF8016A; Thu, 25 May 2023 14:53:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BA47F80053;
	Thu, 25 May 2023 14:53:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C991EF800DF; Thu, 25 May 2023 14:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F013F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 14:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F013F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=odMtc5Dx
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PCrdrO005723;
	Thu, 25 May 2023 07:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685019219;
	bh=6ks66yZV5gcEqGgIUg5LbU7F3LbUrto/eH+llPvKqdE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=odMtc5DxIo5ppR5sgJNi9JAWEZ+rLNZAW34GpZlVlUYWm6vKgKu6d5yls9aahr3c9
	 7B052k0opU+ux7gLR7y6FMOfnoymvm2lxsciC+qhwgoQeqJQrLX9EFD1OWvGzEQNCr
	 qblLB1Ax/1ulfnVB23Iou4TYWBL2WE0/UhXDRGlM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PCrd5O123006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 07:53:39 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 07:53:39 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Thu, 25 May 2023 07:53:39 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Shenghao Ding <13916275206@139.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Xu, Baojun"
	<x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
        "Navada Kanyana,
 Mukund" <navada@ti.com>,
        "gentuser@gmail.com" <gentuser@gmail.com>,
        "Ryan_Chu@wistron.com" <Ryan_Chu@wistron.com>,
        "Sam_Wu@wistron.com"
	<Sam_Wu@wistron.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3 4/5] ALSA: hda/tas2781: Add tas2781 HDA
 driver
Thread-Topic: [EXTERNAL] Re: [PATCH v3 4/5] ALSA: hda/tas2781: Add tas2781 HDA
 driver
Thread-Index: AQHZi7qiFX/KEOnLRkSXJDizgQHnya9nuCRggABbjACAAuPwoA==
Date: Thu, 25 May 2023 12:53:38 +0000
Message-ID: <0102db2e22dc472091a586bb73b467d9@ti.com>
References: <20230519080227.20224-1-13916275206@139.com>
	<871qjayuvv.wl-tiwai@suse.de>	<9daf95da47b540329aa9fbbd2df5e504@ti.com>
 <87353ngtp1.wl-tiwai@suse.de>
In-Reply-To: <87353ngtp1.wl-tiwai@suse.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.162.66]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: FUPLAWMS74YDRESAHMEHNRWVHH3NVDTD
X-Message-ID-Hash: FUPLAWMS74YDRESAHMEHNRWVHH3NVDTD
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUPLAWMS74YDRESAHMEHNRWVHH3NVDTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, May 23, 2023 7:43 PM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: Shenghao Ding <13916275206@139.com>; broonie@kernel.org;
> devicetree@vger.kernel.org; krzysztof.kozlowski+dt@linaro.org;
> robh+dt@kernel.org; lgirdwood@gmail.com; perex@perex.cz; pierre-
> louis.bossart@linux.intel.com; Lu, Kevin <kevin-lu@ti.com>; alsa-
> devel@alsa-project.org; linux-kernel@vger.kernel.org; Xu, Baojun
> <x1077012@ti.com>; Gupta, Peeyush <peeyush@ti.com>; Navada Kanyana,
> Mukund <navada@ti.com>; gentuser@gmail.com; Ryan_Chu@wistron.com;
> Sam_Wu@wistron.com
> Subject: Re: [EXTERNAL] Re: [PATCH v3 4/5] ALSA: hda/tas2781: Add tas2781
> HDA driver
>=20
> On Tue, 23 May 2023 13:22:03 +0200,
> Ding, Shenghao wrote:
> >
> > > +	[ALC287_FIXUP_TAS2781_I2C_2] =3D {
> > > +		.type =3D HDA_FIXUP_FUNC,
> > > +		.v.func =3D tas2781_fixup_i2c,
> > > +		.chained =3D true,
> > > +		.chain_id =3D ALC269_FIXUP_THINKPAD_ACPI,
> > > +	},
> > > +	[ALC287_FIXUP_TAS2781_I2C_4] =3D {
> > > +		.type =3D HDA_FIXUP_FUNC,
> > > +		.v.func =3D tas2781_fixup_i2c,
> > > +		.chained =3D true,
> > > +		.chain_id =3D ALC269_FIXUP_THINKPAD_ACPI,
> > > +	},
> >
> > What's a difference between *_2 and *_4?
> > Combine them into ALC287_FIXUP_TAS2781_I2C
>=20
> Hm, so there is no difference in stereo and quad speakers?
Yes, our firmware defines the stereo or quad speaker
>=20
> > > +static int tas2781_save_calibration(struct tasdevice_priv
> > > +*tas_priv) {
> > > +	efi_guid_t efi_guid =3D EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4,
> 0x3d,
> > > +		0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
> > > +	static efi_char16_t efi_name[] =3D L"CALI_DATA";
> > > +	struct hda_codec *codec =3D tas_priv->codec;
> > > +	unsigned int subid =3D codec->core.subsystem_id & 0xFFFF;
> > > +	struct tm *tm =3D &tas_priv->tm;
> > > +	unsigned int attr, crc;
> > > +	unsigned int *tmp_val;
> > > +	efi_status_t status;
> > > +	int ret =3D 0;
> > > +
> > > +	//Lenovo devices
> > > +	if ((subid =3D=3D 0x387d) || (subid =3D=3D 0x387e) || (subid =3D=3D=
 0x3881)
> > > +		|| (subid =3D=3D 0x3884) || (subid =3D=3D 0x3886) || (subid =3D=3D=
 0x38a7)
> > > +		|| (subid =3D=3D 0x38a8) || (subid =3D=3D 0x38ba) || (subid =3D=3D
> 0x38bb)
> > > +		|| (subid =3D=3D 0x38be) || (subid =3D=3D 0x38bf) || (subid =3D=3D=
 0x38c3)
> > > +		|| (subid =3D=3D 0x38cb) || (subid =3D=3D 0x38cd))
> > > +		efi_guid =3D EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, 0x09,
> > > +			0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
> >
> > Here can be a problem: the device ID is embedded here, and it's hard to
> find out.  You'd better to make it some quirk flag that is set in a commo=
n
> place and check the flag here instead of checking ID at each place.
> >
> > Do you have example of the solution? I found some quirk flag is static =
in
> the patch_realtek.c, can't be accessed outside that file.
>=20
> You may store some values in struct hda_component, I suppose?
I will try it.
>=20
> BTW, please try to fix your mailer to do citation more correctly...
accept
>=20
>=20
> thanks,
>=20
> Takashi
