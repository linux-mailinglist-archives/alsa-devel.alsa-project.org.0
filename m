Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3DA685B2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Mar 2025 08:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B7CA6034A;
	Wed, 19 Mar 2025 08:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B7CA6034A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742368731;
	bh=VkPG6VmJuOpNBatg8d60V5rDvjQ0pWYUS6dXmD6QVpU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YSFZOOvJui7wy6QRoz5YkeXtfv9Uzo1O7HPHX7KiGYS1pcmtNKGDAREKxUfUq2qq3
	 Jq/mvDz0JEkEvKmlyI3sO3gMRDJwLG6Mm9Ja11bv85AbDHV0vMxSLrlufArHNtPQ4q
	 aSvr/WPkrNoBMYTHpIkU2dvwyGN8Pb+EfBGixgAA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31BF0F805BE; Wed, 19 Mar 2025 08:18:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F4010F805A0;
	Wed, 19 Mar 2025 08:18:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B85CF805A0; Wed, 19 Mar 2025 08:18:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 334DFF800B5
	for <alsa-devel@alsa-project.org>; Wed, 19 Mar 2025 08:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 334DFF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DOEuujtn
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52J7I2BV2809162
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 02:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742368682;
	bh=VkPG6VmJuOpNBatg8d60V5rDvjQ0pWYUS6dXmD6QVpU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=DOEuujtnMrID5JU3umRJwoh31gqt0ILBeA+kmR3gC+LGBXrzDVQLxdHCWVXxdhpOD
	 6UUYmFaO/litJZX/K07mS+YFgihPlIVe7peFcRUE0FM25sQkvptQoFk3loLRXyg7tX
	 VhdntcP76IWjsHHu3oLWd3xIrWJb5vYxYZ9TILAw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52J7I2F2085580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 02:18:02 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 02:18:02 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Wed, 19 Mar 2025 02:18:02 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: "tiwai@suse.de" <tiwai@suse.de>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "13564923607@139.com"
	<13564923607@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Xu, Baojun" <baojun.xu@ti.com>, Mark Brown
	<broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [RESEND PATCH v5] ASoC: tas2781: Support dsp
 firmware Alpha and Beta seaies
Thread-Topic: [EXTERNAL] Re: [RESEND PATCH v5] ASoC: tas2781: Support dsp
 firmware Alpha and Beta seaies
Thread-Index: AQHbk/rhOLAQJNAiDEuX6RvFG/iN5bNx+d2AgAgbWSA=
Date: Wed, 19 Mar 2025 07:18:01 +0000
Message-ID: <a696042d25b94790885ec20bf1468323@ti.com>
References: <20250313093238.1184-1-shenghao-ding@ti.com>
 <f0bc9d68-5383-43b8-afea-0a065bcbe93c@sirena.org.uk>
In-Reply-To: <f0bc9d68-5383-43b8-afea-0a065bcbe93c@sirena.org.uk>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.161.197]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: TONXZDDQWMVZTLRSIJK45KHF25CVZBUN
X-Message-ID-Hash: TONXZDDQWMVZTLRSIJK45KHF25CVZBUN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TONXZDDQWMVZTLRSIJK45KHF25CVZBUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Tiwai
There's one change in the HAD tree. Would you be so kind and apply it?
Looking forward to your feedback. Thanks.
> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, March 14, 2025 6:27 AM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: tiwai@suse.de; andriy.shevchenko@linux.intel.com;
> 13916275206@139.com; 13564923607@139.com; alsa-devel@alsa-project.org;
> Xu, Baojun <baojun.xu@ti.com>
> Subject: [EXTERNAL] Re: [RESEND PATCH v5] ASoC: tas2781: Support dsp
> firmware Alpha and Beta seaies
>=20
> On Thu, Mar 13, 2025 at 05:32:38PM +0800, Shenghao Ding wrote:
> > For calibration, basic version does not contain any calibration
> > addresses, it depends on calibration tool to convey the addresses to th=
e
> driver.
> > Since Alpha and Beta firmware, all the calibration addresses are saved
> > into the firmware.
>=20
> Reviewed-by: Mark Brown <broonie@kernel.org>
>=20
> Takashi, this depends on changes in your tree due to the HDA bit - can yo=
u
> apply it please?
