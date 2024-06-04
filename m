Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6838FAF4D
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 11:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB6D9DEC;
	Tue,  4 Jun 2024 11:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB6D9DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717494957;
	bh=r6RvP2n9en7SM9ZCewNVBQx41RT6DI0t88AmBPjP4lU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gIEI3ivqDABw0OSdN5UfFxzIKqDkFKPAEmmcfudzvPi1x8/RWB/xTy/lK1L7Y+ITi
	 3OcJTv/IHz/w0er69EbXNK9TnqQD7Nes6pKtaO8D8mhptpW2O+WJahGVkFCtO1ZUz7
	 ORm/Wy1TsAT6kQcmmpquqkZk5NwSAVEXuzi1oOoo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C74D8F80496; Tue,  4 Jun 2024 11:55:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D3CF804E5;
	Tue,  4 Jun 2024 11:55:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EE36F802DB; Tue,  4 Jun 2024 11:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40E79F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 11:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40E79F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=eTl6Oqml
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4549t7Dh118037;
	Tue, 4 Jun 2024 04:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717494907;
	bh=YP4oBrC+7QEADT2fGVE3UTVws0H5q4ZZzSJpBXFPj6o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=eTl6OqmlqgQKQBjiQ7Yt85XAqeOeCL3JpZB+jCb0ovOjP7zCXE1KIaH3Sxp2inOwv
	 7Ij40/O2KdgEn6ZutuLO3iauoFU4GZig3WFahZ/eJ8U8yMccodXDBhpX5ViLt6gWCp
	 RiWezmKB2R8sRETOd1EgHTOeUXHfKNCqctA0kONg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4549t7oj025321
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 04:55:07 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 04:55:06 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Tue, 4 Jun 2024 04:55:06 -0500
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
        "tiwai@suse.de" <tiwai@suse.de>, "Xu, Baojun"
	<baojun.xu@ti.com>,
        "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com"
	<Baojun.Xu@fpt.com>,
        "yuhsuan@google.com" <yuhsuan@google.com>,
        "Yue, Jaden"
	<jaden-yue@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>, "Hari, Raj" <s-hari@ti.com>,
        "zhourui@huaqin.com"
	<zhourui@huaqin.com>
Subject: RE: [EXTERNAL] Re: [PATCH v6] ASoC: tas2781: Fix wrong loading
 calibrated data sequence
Thread-Topic: [EXTERNAL] Re: [PATCH v6] ASoC: tas2781: Fix wrong loading
 calibrated data sequence
Thread-Index: AQHaqS31kPp1+e8rVkmNZkec74ALOLGg2NiAgBOuXWCAAdixgIABGDzw
Date: Tue, 4 Jun 2024 09:55:06 +0000
Message-ID: <5cdc0aeca5df44a5a29e000f78b67b56@ti.com>
References: <20240518141546.1742-1-shenghao-ding@ti.com>
 <171623322336.94469.13172149100331733795.b4-ty@kernel.org>
 <138b621eeccc47329ec5fc808790667f@ti.com>
 <90d891b7-1978-4a6c-86c6-bb693ce764d0@sirena.org.uk>
In-Reply-To: <90d891b7-1978-4a6c-86c6-bb693ce764d0@sirena.org.uk>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.122]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: JJEVID3F7HCS4KY4K6LHY7AJC4YCBHPU
X-Message-ID-Hash: JJEVID3F7HCS4KY4K6LHY7AJC4YCBHPU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJEVID3F7HCS4KY4K6LHY7AJC4YCBHPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks for your comments.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, June 3, 2024 8:12 PM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com;
> perex@perex.cz; pierre-louis.bossart@linux.intel.com;
> 13916275206@139.com; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; liam.r.girdwood@intel.com; tiwai@suse.de; Xu,
> Baojun <baojun.xu@ti.com>; soyer@irl.hu; Baojun.Xu@fpt.com;
> yuhsuan@google.com; Yue, Jaden <jaden-yue@ti.com>; Lo, Henry
> <henry.lo@ti.com>; Navada Kanyana, Mukund <navada@ti.com>; Hari, Raj
> <s-hari@ti.com>; zhourui@huaqin.com
> Subject: Re: [EXTERNAL] Re: [PATCH v6] ASoC: tas2781: Fix wrong loading
> calibrated data sequence
>=20
> On Sun, Jun 02, 2024 at 01:11:39PM +0000, Ding, Shenghao wrote:
>=20
> > One of my customers requested tas2781 driver in kernel 6.10 to be merge=
d
> into kernel 6.1.
> > I wondered how I  can handle this. May I resubmit the whole code into
> latest 6.1 branch?
> > Looking forward to your reply. Thanks.
>=20
> You'd need to do something yourself - the stable kernels themselves don't
> add new features, and I think v6.1 is not updated any more anyway.
> The usual thing would be to do a backport and then publish it somehow,
> some vendors have git trees they use (some use github), some share patche=
s
> via e-mail but there's a bunch of options there.
>=20
> If this is for some OS vendor (or for use with a specific OS) you may be =
able
> to work directly with them to add the driver, some OSs are open to that b=
ut
> some aren't.
