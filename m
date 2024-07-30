Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6E940391
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59130E80;
	Tue, 30 Jul 2024 03:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59130E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722302731;
	bh=BpjfebOz05C7JZVV+p5ipcYp6b3vih29sNrNTDUdqvg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PUuSve+fZ8/2aeDsMcJj/P/MJ4zfTWHpE7kOHCswEEoH2TWij28AptJRyYMvQIbK9
	 tZJbSMeUcWnBbNSwD6nE1gfabjBOmcmAj69VxDPzfflUtND2Zj3yPbsW6MfKnRmUiq
	 rLtxrWoWdNTe/+qHkf1YuD24H2BUsoWnzrYV+XW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27D17F805B5; Tue, 30 Jul 2024 03:24:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB025F805B1;
	Tue, 30 Jul 2024 03:24:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B44DAF802DB; Tue, 30 Jul 2024 03:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17C33F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17C33F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=iRWjE2EN
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46U1OZgs018710;
	Mon, 29 Jul 2024 20:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722302675;
	bh=BpjfebOz05C7JZVV+p5ipcYp6b3vih29sNrNTDUdqvg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=iRWjE2ENrgkR2NQlqsbvzttaeNQloBAkAEQgOBsvCaoFqUOggIjPgVytQ1xRae0RA
	 DuvDheC4uRtFWIURqXfONJ5hlnE6Do1E18BJDsSBEiL0Rgfn1gZ56ho+bqFeYzNPjA
	 ho3t9KgHuKo8n6wKmloGaxxivtR62KUBMH3WbvG0=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46U1OZSP083287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jul 2024 20:24:35 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Jul 2024 20:24:34 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Mon, 29 Jul 2024 20:24:34 -0500
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
        "darren.ye@mediatek.com" <darren.ye@mediatek.com>,
        "antheas.dk@gmail.com" <antheas.dk@gmail.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Move tas2563_dvc_table
 into a separate Header file
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Move tas2563_dvc_table
 into a separate Header file
Thread-Index: AQHa10cEjfotFf/Vgk2obNCAlPwD9bIOUcYAgAA8p8A=
Date: Tue, 30 Jul 2024 01:24:34 +0000
Message-ID: <9f92b5275c3e4b7d896e90f8a654f11e@ti.com>
References: <20240716061123.127-1-shenghao-ding@ti.com>
 <1dc0518a-f0b3-4617-9c79-ac903ca9ee33@sirena.org.uk>
In-Reply-To: <1dc0518a-f0b3-4617-9c79-ac903ca9ee33@sirena.org.uk>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.49]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: UV3JSUCQYKSZSDT3T6JCIXPTYYC2L6GQ
X-Message-ID-Hash: UV3JSUCQYKSZSDT3T6JCIXPTYYC2L6GQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UV3JSUCQYKSZSDT3T6JCIXPTYYC2L6GQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Broonie
Thank for your feedback. I will resend them.
One more thing, these day my colleague and I want have some adjustment on t=
he=20
tas2781 driver code to support both i2c and spi interface, and plan to abst=
ract
the common part, especially the dsp binary parsing, as a shared lib. Would =
you
be so kind and give us some advice on it? Thanks.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, July 30, 2024 12:42 AM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com;
> perex@perex.cz; pierre-louis.bossart@linux.intel.com;
> 13916275206@139.com; zhourui@huaqin.com; alsa-devel@alsa-project.org;
> Salazar, Ivan <i-salazar@ti.com>; linux-kernel@vger.kernel.org; Chadha, J=
asjot
> Singh <j-chadha@ti.com>; liam.r.girdwood@intel.com; Yue, Jaden <jaden-
> yue@ti.com>; yung-chuan.liao@linux.intel.com; Rao, Dipa <dipa@ti.com>;
> yuhsuan@google.com; Lo, Henry <henry.lo@ti.com>; tiwai@suse.de; Xu,
> Baojun <baojun.xu@ti.com>; soyer@irl.hu; Baojun.Xu@fpt.com;
> judyhsiao@google.com; Navada Kanyana, Mukund <navada@ti.com>;
> cujomalainey@google.com; Kutty, Aanya <aanya@ti.com>; Mahmud, Nayeem
> <nayeem.mahmud@ti.com>; savyasanchi.shukla@netradyne.com;
> flaviopr@microsoft.com; Ji, Jesse <jesse-ji@ti.com>; darren.ye@mediatek.c=
om;
> antheas.dk@gmail.com
> Subject: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Move tas2563_dvc_table
> into a separate Header file
>=20
> On Tue, Jul 16, 2024 at 02:11:21PM +0800, Shenghao Ding wrote:
> > Move tas2563_dvc_table into a separate Header file, as only tas2781
> > codec driver use this table, and hda side codec driver won't use it.
>=20
> This doesn't apply against current code (or your other patch to this driv=
er from
> the same day), please check and resend?
