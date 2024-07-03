Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC338925236
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 06:28:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE2171925;
	Wed,  3 Jul 2024 06:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE2171925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719980900;
	bh=afFBUcRiUw/uSnUuZOl4J32FjnbvltPxLHc8UdKHsoc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jMcffBH/y7koaw+0krWQOeiorgXMs5WCwCkMOXpg48Idw1c2ZEMGIrGGgZgOKcixF
	 UBbioM4A69oPwRqc81fwFn8wTjKy6yQxFEzhc7U6VyyW8UTO1DEBWUp8TXIs9krthi
	 ps7DMt3t73T17NH4KmL8dsrdQVn11h24oNyZQTxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C636AF805AF; Wed,  3 Jul 2024 06:27:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D5EEF805A8;
	Wed,  3 Jul 2024 06:27:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1543FF8025E; Wed,  3 Jul 2024 06:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D05E7F800F8
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 06:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D05E7F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=AQo9Ti6A
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4634JoKv086081;
	Tue, 2 Jul 2024 23:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719980390;
	bh=htFylJICkiDuwB5yYHq2LC3E7cQvuIoGFvuuR013PkU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=AQo9Ti6AXUmkJWvbZMYVNuj2fotDM1alb3Js9vGLtNaImA5uoHJaw9mHazZ+3vGP3
	 tP58YT7W5ES6hBWQSCK6LweEHYr9+uaMUTesoPo9qX1MhrzR05J+7gWSCjNd+gpiH2
	 sNGP4lWzVS948zUBOWNrIVzPXbz8tuTi01RtZ/Ok=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4634JoUY121890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2024 23:19:50 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 Jul 2024 23:19:49 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Tue, 2 Jul 2024 23:19:49 -0500
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
Thread-Index: AQHaygy3zqcBdt6oi0KleesuzWGEKLHiIqwA///EuhCAAIolgIAB+XEg
Date: Wed, 3 Jul 2024 04:19:49 +0000
Message-ID: <c53c1f597e6c43e3874f4bbe1b467d24@ti.com>
References: <20240629101112.628-1-shenghao-ding@ti.com>
 <8245d8e7-3ff0-4f05-9f99-666e9693603f@sirena.org.uk>
 <664b818a177f4403bd60c3d4cd0bf4d1@ti.com>
 <7a44a36c-6f95-4c5b-a86d-044f9ad13ac1@sirena.org.uk>
In-Reply-To: <7a44a36c-6f95-4c5b-a86d-044f9ad13ac1@sirena.org.uk>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.205]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: VUNFY3VUXPSY43P442XRDJUT37TGFVGC
X-Message-ID-Hash: VUNFY3VUXPSY43P442XRDJUT37TGFVGC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUNFY3VUXPSY43P442XRDJUT37TGFVGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Brown
Thanks for your comment. Feedback is inline.
> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, July 2, 2024 1:06 AM
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
> Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add name_prefix as
> the prefix name of DSP firmwares and calibrated data files
>=20
> On Mon, Jul 01, 2024 at 02:00:13PM +0000, Ding, Shenghao wrote:
>=20
> > > I'll apply this but I do wonder if it's worth falling back to trying
> > > to load the unprefixed name if we fail to load the prefixed one.
>=20
> > If fail to load dsp firmware, the driver won't load unprefixed name
> > firmware, but switch tas2563/tas2781 to bypass-dsp mode automatically.
> > In this mode, smartamp become simple amp.
> > These day, I met a case from one of my customers, they put 2 pieces of
> > tas2563, and 2 pieces of tas2781 in the same i2c bus. In order to
> > identify tas2563 and tas2781, I think name_prefix is a good solution fo=
r this
> case.
> > Looking forward to your comment. Thanks.
>=20
> Yes, the name_prefix is a good idea and probably people want things
> specifically tuned for the DSP - I was thinking about error handling or
> upgrade cases where wrong calibration might work better.  Bypass mode
> means the device will still function at least.
In bypass mode, tas2563/tas2781 can still work without speaker protection o=
r audio acoustic function.
In case of only dsp firnmware loading without calibrated data, tas2563/tas2=
781 still can work with
default calibrated data and default audio acoustic parameter.

