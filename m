Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DE791E1C3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 16:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4C72353;
	Mon,  1 Jul 2024 16:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4C72353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719842474;
	bh=3reg4i/O4YiAE5aKRVANGYOBm/8AOHKu8/Lh8yOWM1w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mqVy3OnlVb28rI2gbwsNRl5CxzzyHVr6b6+3cVsAduTqeLyZb9F/Pdj5fGt8Nql3Y
	 loAcmt0GSdKg7LrfpOYq5KL6oPYm5qTHLjR3MCOn7TO7BkxE96ex822N7sEAuqUdWX
	 P8SoR1O2VFALuSxl5R3Pq8AB9MTfQ32gqmxkjUtQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC8DF805AC; Mon,  1 Jul 2024 16:00:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A206F80588;
	Mon,  1 Jul 2024 16:00:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7739DF8028B; Mon,  1 Jul 2024 16:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 339EFF8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 16:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 339EFF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=r+sBtxYi
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 461E0EUt074153;
	Mon, 1 Jul 2024 09:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719842414;
	bh=jjxKQjXPGDBo7KD1g9SLb7Db/+v0i0QFj/MuvZQRvGE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=r+sBtxYiyUPBmKIZZ+6Li8yXVLl8t//deqhOz+TkK1RE0sVS9TD9AEtgfU1DTkwy5
	 g4hJ5tWBXY3HHX2Mq59rXbviXtUpxwne2CBnsjsi3deohEZ5Luq27mtf7wWxWbw0PC
	 Yrc8Drq7UJboRayPxaXqR0D/54nuCIt8GT/e1doU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 461E0ETD003409
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 09:00:14 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 09:00:13 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Mon, 1 Jul 2024 09:00:13 -0500
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
        "zhourui@huaqin.com" <zhourui@huaqin.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Salazar, Ivan"
	<i-salazar@ti.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Chadha, Jasjot Singh" <j-chadha@ti.com>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "Yue, Jaden"
	<jaden-yue@ti.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Rao, Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
        "Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "judyhsiao@google.com" <judyhsiao@google.com>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>,
        "cujomalainey@google.com" <cujomalainey@google.com>,
        "Kutty,
 Aanya" <aanya@ti.com>,
        "Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
        "savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
        "flaviopr@microsoft.com" <flaviopr@microsoft.com>,
        "Ji, Jesse"
	<jesse-ji@ti.com>,
        "darren.ye@mediatek.com" <darren.ye@mediatek.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add name_prefix as the
 prefix name of DSP firmwares and calibrated data files
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add name_prefix as the
 prefix name of DSP firmwares and calibrated data files
Thread-Index: AQHaygy3zqcBdt6oi0KleesuzWGEKLHiIqwA///EuhA=
Date: Mon, 1 Jul 2024 14:00:13 +0000
Message-ID: <664b818a177f4403bd60c3d4cd0bf4d1@ti.com>
References: <20240629101112.628-1-shenghao-ding@ti.com>
 <8245d8e7-3ff0-4f05-9f99-666e9693603f@sirena.org.uk>
In-Reply-To: <8245d8e7-3ff0-4f05-9f99-666e9693603f@sirena.org.uk>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.163]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: 24UETEX3MWZTPNUM2LCZFXBQZRIBPCJT
X-Message-ID-Hash: 24UETEX3MWZTPNUM2LCZFXBQZRIBPCJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24UETEX3MWZTPNUM2LCZFXBQZRIBPCJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Brown
Thanks for your comment.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, July 1, 2024 8:23 PM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com;
> perex@perex.cz; pierre-louis.bossart@linux.intel.com;
> 13916275206@139.com; zhourui@huaqin.com; alsa-devel@alsa-project.org;
> Salazar, Ivan <i-salazar@ti.com>; linux-kernel@vger.kernel.org; Chadha,
> Jasjot Singh <j-chadha@ti.com>; liam.r.girdwood@intel.com; Yue, Jaden
> <jaden-yue@ti.com>; yung-chuan.liao@linux.intel.com; Rao, Dipa
> <dipa@ti.com>; yuhsuan@google.com; Lo, Henry <henry.lo@ti.com>;
> tiwai@suse.de; Xu, Baojun <baojun.xu@ti.com>; soyer@irl.hu;
> Baojun.Xu@fpt.com; judyhsiao@google.com; Navada Kanyana, Mukund
> <navada@ti.com>; cujomalainey@google.com; Kutty, Aanya
> <aanya@ti.com>; Mahmud, Nayeem <nayeem.mahmud@ti.com>;
> savyasanchi.shukla@netradyne.com; flaviopr@microsoft.com; Ji, Jesse
> <jesse-ji@ti.com>; darren.ye@mediatek.com
> Subject: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add name_prefix as the
> prefix name of DSP firmwares and calibrated data files
>=20
> On Sat, Jun 29, 2024 at 06:11:10PM +0800, Shenghao Ding wrote:
>=20
> >  	tas_priv->fw_state =3D TASDEVICE_RCA_FW_OK;
> > -	scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
> > -		tas_priv->dev_name);
> > +	if (tas_priv->name_prefix)
> > +		scnprintf(tas_priv->rca_binaryname, 64, "%s-%s_coef.bin",
> > +			tas_priv->name_prefix, tas_priv->dev_name);
> > +	else
> > +		scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
> > +			tas_priv->dev_name);
>=20
> I'll apply this but I do wonder if it's worth falling back to trying to l=
oad the
> unprefixed name if we fail to load the prefixed one.
If fail to load dsp firmware, the driver won't load unprefixed name firmwar=
e,=20
but switch tas2563/tas2781 to bypass-dsp mode automatically.
In this mode, smartamp become simple amp.
These day, I met a case from one of my customers, they put 2 pieces of tas2=
563,=20
and 2 pieces of tas2781 in the same i2c bus. In order to identify tas2563 a=
nd=20
tas2781, I think name_prefix is a good solution for this case.
Looking forward to your comment. Thanks.
