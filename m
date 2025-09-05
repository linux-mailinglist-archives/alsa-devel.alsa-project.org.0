Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E5B4FAB7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09CAC60201;
	Tue,  9 Sep 2025 14:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09CAC60201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757420235;
	bh=ud7JbkiHOCmI6mqhWepWfvvmpT1R+N/RUvTs7iar6HY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uwBdjQqS6s2TuvcpcjxgWS1WvFPbH+yzVM5uiacU5uL41Ft6Z6h7nP3xnxy0VWYiy
	 ZtsAzEfG+zIAEr8ufjmiGr9ZCQ5Gf4Qhq4ByH5uRlGxz6MBO5LNngOlF30agSelXwO
	 vEnJWeb3lBbBxWcIuuuqlIz5iyQ2sUEc18/lvrNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 490DBF805D3; Tue,  9 Sep 2025 14:16:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BB1AF805C9;
	Tue,  9 Sep 2025 14:16:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 537FEF80508; Fri,  5 Sep 2025 06:16:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3483FF800AE
	for <alsa-devel@alsa-project.org>; Fri,  5 Sep 2025 06:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3483FF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=yvNHDBHe
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5854Flm43627524;
	Thu, 4 Sep 2025 23:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757045747;
	bh=ud7JbkiHOCmI6mqhWepWfvvmpT1R+N/RUvTs7iar6HY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=yvNHDBHeQN8D64rb4EC6U2OgdKFZghuqRyPQSidhtzSBVvukbFUUHDl7EQ/GV8EA9
	 UfcZLNxIn+6pOolcu8jjJu0W5f8JAksOp9CkgaqgwMHB2oTZNNREF7BPuFjM+HxO2I
	 dZNkiIvfDuYanMGDiKvop1QAKmeQ1LM/o8J2sm9U=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5854FkZ11367942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 23:15:46 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 23:15:45 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.055; Thu, 4 Sep 2025 23:15:45 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "tiwai@suse.de" <tiwai@suse.de>,
        "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Yi, Ken" <k-yi@ti.com>, "Lo, Henry"
	<henry.lo@ti.com>,
        "Chen, Robin" <robinchen@ti.com>, "Ji, Jesse"
	<jesse-ji@ti.com>,
        "Wang, Will" <will-wang@ti.com>,
        "jim.shil@goertek.com"
	<jim.shil@goertek.com>,
        "toastcheng@google.com" <toastcheng@google.com>,
        "chinkaiting@google.com" <chinkaiting@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118,
 tas2x20, tas5825 support
Thread-Topic: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118,
 tas2x20, tas5825 support
Thread-Index: AQHcGXV+g3xOktIe00qAtAz2a1355LSBruqAgAJSFIw=
Date: Fri, 5 Sep 2025 04:15:45 +0000
Message-ID: <12aa63e694c94213aeb6b48959d02b45@ti.com>
References: 
 <20250830061459.24371-1-baojun.xu@ti.com>,<993d7fe7-5206-45a9-acb6-0d610a3a2136@sirena.org.uk>
In-Reply-To: <993d7fe7-5206-45a9-acb6-0d610a3a2136@sirena.org.uk>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.241.91]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 65WYT24YZA4MHNDHXOHMP2LREJP6Q73P
X-Message-ID-Hash: 65WYT24YZA4MHNDHXOHMP2LREJP6Q73P
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:16:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65WYT24YZA4MHNDHXOHMP2LREJP6Q73P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>=20
> ________________________________________
> From: Mark Brown <broonie@kernel.org>
> Sent: 03 September 2025 19:36
> To: Xu, Baojun
> Cc: tiwai@suse.de; andriy.shevchenko@linux.intel.com; 13916275206@139.com=
; alsa-devel@alsa-project.org; Ding, Shenghao; linux-sound@vger.kernel.org;=
 linux-kernel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+d=
t@kernel.org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo,=
 Henry; Chen, Robin; Ji, Jesse; Wang, Will; jim.shil@goertek.com; toastchen=
g@google.com; chinkaiting@google.com
> Subject: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118, tas2x2=
0, tas5825 support
>=20
> On Sat, Aug 30, 2025 at 02:14:58PM +0800, Baojun Xu wrote:
> > Add tas2020, tas2118, tas2120, tas2320, tas2570, tas2572, tas5825
> > tas5827 support in tas2781 driver.
> > Tas2118, tas2x20, tas257x have no on-chip DSP, tas582x have on-chip
> > DSP but have no calibration required stereo smart amplifier.
>=20
> This doesn't apply against current code, please check and resend.
>=20

Hi, do you mean I need a re-patch for the newest (next/linux-next.git) code=
?
Or need to create patches on tree broonie/linux.git?

Best Regards
Jim=
