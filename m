Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB18BFD5B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0EDAE8;
	Wed,  8 May 2024 14:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0EDAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172011;
	bh=55z97sRh9h5KGiOyjsL70lXcOnVxdW5waVpArCPl7eo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uSHFhb1Af8jWbspcrZ8Xl4PaAYrgBkAWxlJjX/0WWa3/p5eyR5SAakJ6P1YsIPSWH
	 Z+COhE6pVDZR4NDad/M1DKL5lsRqoS2XIFFxJlO3gRF1pNVHqzfqpRW8xggb6JTIjH
	 v2nKbDQOq/STVBBDo+vrqQ4tq+2kx2T4B1YLgv2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60438F805A8; Wed,  8 May 2024 14:39:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B595F80588;
	Wed,  8 May 2024 14:39:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC4AF80266; Tue, 30 Apr 2024 20:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0068d901.pphosted.com (mx0a-0068d901.pphosted.com
 [205.220.168.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8BECF8023A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 20:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8BECF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=biamp.com header.i=@biamp.com header.a=rsa-sha256
 header.s=proofpoint header.b=nmklETRr;
	dkim=pass (2048-bit key,
 unprotected) header.d=biamp.com header.i=@biamp.com header.a=rsa-sha256
 header.s=selector2 header.b=V54Gpv7S
Received: from pps.filterd (m0278264.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43UAfRCx000809;
	Tue, 30 Apr 2024 11:52:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	proofpoint; bh=ZcFKYky11mKg2ladb+Dy2PFQnoFwwPb40yDRpoQ3eXc=; b=n
	mklETRrYpcDej9I6l2i0xjOcw7EZCXfjzG/tq84o73L6yfIX38t+SmkceHGPvTH/
	JCUkoCoEwTYSE6E/owJHIUR8XyWxoWfBLSqH11vhwwRG4hybdByEp55S2jeovQgu
	sSLxZbx0RxW3cDu7EvMKgW7c4cJlcLISguqgPXur0288uwbouZa0BkWzz0uSGSX+
	mGj2WEylRESrDENl/oW/UB1TKbEpLRdnAkr/zUzUmysksq/U+cC+2S2PIne+rnQS
	rZLhUoO3FYUwzI5/Jn/vUpLF+Z2Un/X0iaaCT1XFRM6DRLots+zkLxTK214X+MKn
	Fw8YYf2zsdkA4Js2reMhQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xs0dh2ha1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 11:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzXimbGjdJhF9Ia8o0uvtqw1lpi8En0VXVFo5qjtH26zibpBiJtI6SKIL5jVJ6RDQZqPC79Ygq1tq1l3WhqXi21fQwmssGEQcX6QOuzotKhqFzi+7iGXFFlpJ3+m6o+A2YyLfphOV6AUg/OF3O20h82v80TOv2sXZOLdl1i15FjAopgc9GrXWZqhRrpaNF0AWmYexTs92iM5Nr0dEnHlI0FRVvEkWLhB4KGe1qPUoCliXzaYdUrmOSfR+bTeQ+79zOU3ZsI4vcdDFp0t3tBcUEgQCs9hiU8T027/48svjW0V+H//4ASkEVDyGH1v6/TXmVBiSj+4p9e2UOTdAb91HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcFKYky11mKg2ladb+Dy2PFQnoFwwPb40yDRpoQ3eXc=;
 b=eiyK7n6Mzucrz8tbMXcNnt2sZ+dl3NKvnZ1VVe+Bj1maxjsk5yZp+LnRemZCp4x1QLHGt/Zs+fnqyqLhHUyPxkh1NzzF7DCjE9o7LwSzyKE6OCqdWvTiU0mwn3gTkApodOmRAdA4wHtwbZDlxBH23db30v0QhdrW8klfiwPWznQ5uRQgQHV5nuS7/3uATi/whGsBchK0DOV+Xnj0pCUm7JdKNAlaW1kHtiXirtO0WtM2qVhDaITxOvN7kfZh7BC+PoiTUC7VN/t6VHsV9HeqnkJdMEm1u0H/SCUs7IIQcRrSWmVH9ewHxO2CLXR5RwcX99hgkvcEbw9oePKP4U2Ibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcFKYky11mKg2ladb+Dy2PFQnoFwwPb40yDRpoQ3eXc=;
 b=V54Gpv7S7obQeGUho7vU3rzms8TImNEMonQdg4rd3Oxk/zI20KxVIzoa04VgX40J9nmWEnchdWtDKpLwRajA2Qy+PCU2h7rmoe2jEGEX6esLQJn48F/G9rMF8I9l2ZVdUqsez3zZHfYXzoqOl0HXZyMmwbl3ZUqrv47N24IYEcWbUNcqij/yi5WwKZqzpJYXMR1rTbtP4A4YrSxl0N/MHLSV21KLw484jah9UJ6TX4jD5VyPGkYfWFX8wMXGffjZrMvUhk7m6qSb7skVssKybA/qRhacxrtF5A8j73bj0iAThyv4uMfqH6Sl/wyut3CxrNo94e2xe0g401NV9y7iIw==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by SJ0PR17MB4285.namprd17.prod.outlook.com (2603:10b6:a03:2a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 18:51:55 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 18:51:55 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: Pavel Hofman <pavel.hofman@ivitera.com>, Chris Wulff <crwulff@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
        Julian
 Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>,
        AKASH KUMAR <quic_akakum@quicinc.com>,
        Jack
 Pham <jackp@codeaurora.org>
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
Thread-Topic: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
Thread-Index: 
 AQHalhrEn9WZsEFVxUGMqGyQkwLwG7F4t+YAgABglgCABL1jgIAAERlTgAF5SICAAb0u7Q==
Date: Tue, 30 Apr 2024 18:51:55 +0000
Message-ID: 
 <CO1PR17MB54198ECD1842EAF3CC79985FE11A2@CO1PR17MB5419.namprd17.prod.outlook.com>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
 <871q6tbxvf.wl-tiwai@suse.de>
 <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
 <CAB0kiBJm=Ya6a1mWRZ28p9=D_BesH55DFk4fd4wP0be4zKPR7w@mail.gmail.com>
 <CO1PR17MB5419D45A1BDC2AFA22F60DD9E1142@CO1PR17MB5419.namprd17.prod.outlook.com>
 <0ba8963c-9b2a-f7aa-3c0f-296bdddac5e5@ivitera.com>
In-Reply-To: <0ba8963c-9b2a-f7aa-3c0f-296bdddac5e5@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|SJ0PR17MB4285:EE_
x-ms-office365-filtering-correlation-id: 44156ab4-0241-45d4-83c9-08dc69469b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|7416005|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?K2SM9H8H22gRyNkMEchfIRfb7g6VJBsxQfgjNmMT7/7Zr9NXS7ij9bnGDx?=
 =?iso-8859-1?Q?m72U6XjwVdkGZw4wniMN9SdEXJNXXjVovHATsVjX137wo1sDRPoKfrqcdx?=
 =?iso-8859-1?Q?OkqpdSQcBqCGN5a731ozR7Rn1Pzqz9+sFYlmyUq395LWfxm8AkoCap2fIU?=
 =?iso-8859-1?Q?ME72Hg4qnNd8fLvUUUr/b/k6agOw/A5c1x4KD4iUKm6UAXXVtTzXWvDGYC?=
 =?iso-8859-1?Q?csVX8wAGbi9yi2FWZHUxAw+i2YLqjiYsJ0gbCC7Y6ToB7dnFWMIhKi1uDD?=
 =?iso-8859-1?Q?mC6eue/0/TlFInK9kCTBGza9pFKYxmZn4WIIS8Gb14esON+C8jxpAV1+i2?=
 =?iso-8859-1?Q?/o8YK2/y1dAo2kNO9juZqkA5Dbbm5YYtFG2Pt3zN5dzBZHxZAgvqxw01fk?=
 =?iso-8859-1?Q?shKtHZk7BmqS0LXHGec69+SYKHOLsNFpJ946HwzKlSTPX9DMNmyD0o/WuF?=
 =?iso-8859-1?Q?BHtXg0Py82lBRDX2eQJA73s46OT4V4Isb75Yn+gyoCl72N4ReD0he8xUWE?=
 =?iso-8859-1?Q?2638ykTOZYGdDqVlKUwYXOMhzeo3XJeZK5LPXKnDlZlalS/Xya7OIdj1/l?=
 =?iso-8859-1?Q?1TwTAzSrMK9KMY+U5ch+nCR+JLXhmotGiXl1RoCZyjQNF3elwB/iGDaTkn?=
 =?iso-8859-1?Q?sJSogDsTWRmUDL8WCd1NnNS8MGyEoYI2AaJLKrBPjj3oH0/MyJ3K8OlJUV?=
 =?iso-8859-1?Q?+t2/LPdyY7tFWo/bCP8JOy7A4YM1ERs0VfuRNLgQeStwe97uQmoB6l0j5A?=
 =?iso-8859-1?Q?V8Xw/wasv/ng1VsZaA1VkRuox3Pz/Z0IJ7k2TLElR5Qup2F3Cb6udntlyB?=
 =?iso-8859-1?Q?xmbWBXoJ8ZgXg80CP3arSZ+LuYt7DGpTRwqeUux2sAYg1XcBqh1k78S4QV?=
 =?iso-8859-1?Q?UoPlNyogzbeYbukrh5s9OHBJ+6xjxueVmG94IojPuz9F0LVHcAF6ksJwrl?=
 =?iso-8859-1?Q?lNtr/pNya/CBH1JGgwhR3NQocXi3XnFh7SOhNJ031c5GaHkgKvVW5ut1Gk?=
 =?iso-8859-1?Q?vU3rzWzp2w0ybjppy8ev7yK0cUr6/rzW2NsJXUvKSAFXYk2ApDtPP/Vu3c?=
 =?iso-8859-1?Q?RroaGuWQNsFet1W/CNay8vg/9kEEh7U2LUwcwiAzV8qk6prgdbAUgaXWIu?=
 =?iso-8859-1?Q?fLouCtepmLVP83HM4np0lQyULZu5MIiynyaEpwUaGsu31+A7Kih3DqUCz2?=
 =?iso-8859-1?Q?oRS1eWaMFY7oYXNs9P6UoBlMquziZ2A4dRLjGu2UMgzjTpVFegOPRVzqPu?=
 =?iso-8859-1?Q?vLdJlN1WB4ff2MeUkiNlI6gyWo636sCzqGVLHIcYFiLql94tzu4Y/NPWmK?=
 =?iso-8859-1?Q?3q13DUBGmfmf+qgVh/bCYiSXLlA799xxN59najWfN2SLGh8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?SO8Ogt88F/QA2q5LNu3muDmUsVhtPLfj1fMfVzXiLp+stU2HFXdg824f6g?=
 =?iso-8859-1?Q?DaNUJREbt3+lGgv67lA58HTmIifr4mHieV303qVQdx5BGqRXtUcjgYqDwH?=
 =?iso-8859-1?Q?+mwqDl9frxj6lvGd68u1HUIpeE6EMNCVsD5WBkOBUxWyIpzrY73PI9o+t/?=
 =?iso-8859-1?Q?66dfnM3GfT41LJTX/JVu1b5Ouu9WROtQcX4H5kJ2oZFm4aMNWY7cur/YCr?=
 =?iso-8859-1?Q?q0PdFvOHMDXW2ty2GtnYyYzfZw6dU8LkEqWkmx0fzOGAepdqSztHRGNGJI?=
 =?iso-8859-1?Q?ZYPYfVfh2obuuV9PWXUZ/F7c+QQlUsHExglxV3IoCbrg14xeht2ocPcLtB?=
 =?iso-8859-1?Q?M3pfprolwtl62dzaRWNTjKJzgOGv78TauOoj/FU7e2Jrqkr8aGnA7XhOGO?=
 =?iso-8859-1?Q?A2eMj/awanqMG022ur0i+DyIwSRu61LDk0mbuBYncJhsLSvob8aQEBNiWZ?=
 =?iso-8859-1?Q?ypWnYGY2F3SB1WJiSQ4ijUuSD2DswefvfuoOSuRUist2Vo7JpOnWHeq8d+?=
 =?iso-8859-1?Q?Raun/QFSZQiSgL7Z3DTa1PITOTC9GMSlKGqVek+z9qVdg3sQLrEPEdydUQ?=
 =?iso-8859-1?Q?0MQYj2g7riSXdSaXjNPoYBV9OJwpZbnGYBlHrVjUlb4nI10R6OKgvoGHCw?=
 =?iso-8859-1?Q?qCaiOHnGGXcY4rBZ3DXz6yWYvAjUO96cYfsu9LDRgL/zw12+MWujzgd9J7?=
 =?iso-8859-1?Q?ZTJf5ENm5VRQXNeDfZkkdZouOxrn43mtQP8snrW+vSqvmB2PtSxrmRXhGH?=
 =?iso-8859-1?Q?3w9MCsZUHwocjcjxQgAZ96jK4TzxmaMQ8B5ZDmjJZBqYP5bVe84NLtW1/d?=
 =?iso-8859-1?Q?u3FWI5UJIJdoh46/eH4u4HhCdxk7edqWJEMwIx+yIbUMlcQSzKi9w0rBDf?=
 =?iso-8859-1?Q?81224WiqaX5z8vkxw1PA+el+bmNHpZf22BJilbrfw64CP1SwU2FB4AWY3a?=
 =?iso-8859-1?Q?R3ak2iL5jeXur44DrPenpSGA/UXB4I8vc8F1S8JwwSaylVfYyv/uI6lsvE?=
 =?iso-8859-1?Q?dk5r0uTmBl9JvTtxMnUvAr9Bw1a6mmBaLBrE33QRGkQ1ylWIl7VZPjx/lh?=
 =?iso-8859-1?Q?DuQOgcdRcUIEiZL8j0SiAitutL9BrOflKnb1NP39srO/33rHVo38PQfPx8?=
 =?iso-8859-1?Q?UQXJI7x8KiJlikSpV+r2WwwdF9oupMfvL18IT2F6ARNSzR5Ge7WJvXt7eT?=
 =?iso-8859-1?Q?XCbU+ngXrvUeWwAq/Hy/0/gBKBJb4p0Kv44Kkkcg2Ub5UiRGCnNvsN3t44?=
 =?iso-8859-1?Q?bi2pgPSzyq5LZnivNh7nRZ1IgEdfiCgjCDohdPOCp4V8v9puOJOIh/Zdho?=
 =?iso-8859-1?Q?EJcRPH8DMndEyHNc/YLkqK8QY4vbRh1RvpKvL9O1zOksmgQdCuOmRnZ1r0?=
 =?iso-8859-1?Q?9elPp++0bJpNg9Gi64/vE7VcizRwS6GlVE4pmDFUcKzBOPa/aWMQ2VFkTD?=
 =?iso-8859-1?Q?8wv8bNbY1dkacd4blnsm7aw9X5OW7SaB8vcdk1nOLTu4PL+D03nL9kHcDi?=
 =?iso-8859-1?Q?VsPLGc4e8Eli/xMTvOQCHW5i4SSYrFGDS/+daJLw7E3CFpBx0v4HMhr3Yi?=
 =?iso-8859-1?Q?QdjNahXXh3xFJNoAqgTu2l6D73KdASJNhUJIgctYMBry6wQVMO/LWqkIap?=
 =?iso-8859-1?Q?UyXl+j7MBpadSJHkmdQGk+XUS+X5XOBFEF?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44156ab4-0241-45d4-83c9-08dc69469b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 18:51:55.1404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 i7fIESYIFwEjorCnKcyUlIwDbnAvSKtP9sVMVTz2hSs+pX/atd+X4RoJZjv0oJ3bqlcRrQ44JTy4pGzIM3gg+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB4285
X-Proofpoint-ORIG-GUID: Fdsz8kvg2mn2b2Q959HizhnuVp68QFjk
X-Proofpoint-GUID: Fdsz8kvg2mn2b2Q959HizhnuVp68QFjk
X-MailFrom: prvs=58500cf064=chris.wulff@biamp.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XMENWEAXUB5R6KZI3XBPV66NFG3PJPAS
X-Message-ID-Hash: XMENWEAXUB5R6KZI3XBPV66NFG3PJPAS
X-Mailman-Approved-At: Wed, 08 May 2024 12:39:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLY57W47JJA3BZ5MVI3QBYR4WLKONQEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4.29.2024 11:02 Pavel Hofman  wrote:=0A=
>> Example from that thread with c_alt_name changed to c_name as it lives=
=0A=
>> in an "alt.x" directory and removal of the num_alt_modes in favor of jus=
t=0A=
>> allowing "mkdir alt.x" to create new alt mode settings:=0A=
>>=0A=
>> (all existing properties + the following new properties)=0A=
>> c_it_name=0A=
>> c_it_ch_name=0A=
>> c_fu_name=0A=
>> c_ot_name=0A=
>> p_it_name=0A=
>> p_it_ch_name=0A=
>> p_fu_name=0A=
>> p_ot_name=0A=
>>=0A=
>> alt.0=0A=
>> =A0 c_name=0A=
>> =A0 p_name=0A=
>> alt.1 (for alt.1, alt.2, etc.)=0A=
>> =A0 c_name=0A=
>> =A0 p_name=0A=
>> =A0 c_ssize=0A=
>> =A0 p_ssize=0A=
>> =A0 (Additional properties here for other things that are settable for e=
ach alt mode,=0A=
>> =A0=A0 but the only one I've implemented in my prototype so far is sampl=
e size.)=0A=
>=0A=
>Please let me a question regarding some of the proposed string configs.=0A=
>Currently we have one feature unit which implements volume and mute=0A=
>feature controls. IIUC more feature units can be added, with specific=0A=
>controls set, as specified by the UAC. IIUC the linux USB audio driver=0A=
>works with volume+mute specifically and other controls by creating=0A=
>corresponding alsa ctls, Windows UAC2 driver works with AGC too=0A=
>https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-a=
udio-drivers#class-requests-and-interrupt-data-messages=0A=
>. That means there is a potential for adding more feature units to the=0A=
>gadget.=0A=
>=0A=
>Would it make sense to name the p/c_fu_name properties specifically=0A=
>p/c_fu_volume_name, to leave name room for additional feature units?=0A=
=0A=
Yeah, I think that makes sense. I will change it to be p/c_fu_volume_name.=
=0A=
=0A=
>Please what does p/c_it_ch_name stand for?=0A=
=0A=
This is the iChannelNames string from the Input Terminal descriptor=0A=
"the name of the first logical channel" from the UAC1 spec.=0A=
=0A=
>>=0A=
>>=0A=
>> Here is a more detailed breakdown of the (current) proposal:=0A=
>>=0A=
>> * Allow the user to create "alt.x" directories inside uac1 and uac2=0A=
>>=A0=A0 function configfs=0A=
>> =A0 * Prior to creation of any of these alt.x subdirectories, the=0A=
>>=A0=A0=A0=A0 function behaves the same as it does today. No "alt.x" direc=
tories would=0A=
>>=A0=A0=A0=A0 exist on creation of the function.=0A=
>> =A0 * Creation of "alt.0" contains only "c_name" and "p_name" to set the=
=0A=
>>=A0=A0=A0=A0 USB string name for this alt mode, with the defaults as "Cap=
ture Inactive"=0A=
>>=A0=A0=A0=A0 and "Playback Inactive"=0A=
>> =A0 * Creation of "alt.x" where x is an integer, contains the same name=
=0A=
>>=A0=A0=A0=A0 strings but with defaults of "Capture Active" and "Playback =
Active" and=0A=
>>=A0=A0=A0=A0 additional files for any per-alt-mode configurable settings =
(such as=0A=
>>=A0=A0=A0=A0 c_ssize, p_ssize, etc.) At the time of creation, values for =
those are copied=0A=
>>=A0=A0=A0=A0 from the corresponding settings in the function main configf=
s directory.=0A=
>> =A0 * Creation of "alt.1" in particular changes the meaning of the files=
=0A=
>>=A0=A0=A0=A0 in the main function configfs dir so that they are only _def=
ault_ values used=0A=
>>=A0=A0=A0=A0 when creating "alt.x" directories and settings from "alt.1" =
will now be used=0A=
>>=A0=A0=A0=A0 for alt mode 1. (Alt mode 1 always exists, even when "alt.1"=
 has not been=0A=
>>=A0=A0=A0=A0 created.)=0A=
>>=0A=
>> * ALSA card interface behavior=0A=
>> =A0 * Configuration of the ALSA card interface remains the same. It is c=
onfigured=0A=
>> =A0=A0=A0 when binding the function to match the settings in the main fu=
nction configfs.=0A=
>> =A0=A0=A0 "alt.x" settings have no effect on the created ALSA card setup=
=0A=
>> =A0 * Sample size will be converted between ALSA and USB data by droppin=
g=0A=
>>=A0=A0=A0=A0 extra bits or zero padding samples (eg 16->24 will zero pad =
a byte, 24->16=0A=
>>=A0=A0=A0=A0 will drop a byte)=0A=
>=0A=
>Is not this work for userspace, e.g. for the plug plugin? IMO the=0A=
>hw_params should reflect the requested format as is now, doing no=0A=
>conversions in the gadget driver. Currently the driver just copies the=0A=
>buffer from the packet area to the alsa area which is the correct way, IMO=
.=0A=
>=0A=
>It also allows for future addition of FLOAT_LE format which is part of=0A=
>UAC specs and which (at least) the windows and linux host drivers=0A=
>support (for which I would already have a use case). Actually the linux=0A=
>and windows USB audio driver supports the TYPE III digital formats.=0A=
>=0A=
>IIUC the gadget itself does not (and should not, IMO) care much about=0A=
>the actual format (apart of converting the USB format ID to the alsa=0A=
>format code for hw_params).=0A=
>=0A=
>=0A=
>> =A0 * Channel count differences will ignore extra incoming channels and =
zero=0A=
>>=A0=A0=A0=A0 outgoing extra channels (eg 8->2 will just copy the first tw=
o and ignore=0A=
>>=A0=A0=A0=A0 the rest. 2->8 will copy the first two and zero the rest.)=
=0A=
>=0A=
>I think it's dtto. Either alsa automatic plug plugin, or detailed with=0A=
>the route plugin.=0A=
>=0A=
>> =A0 * Per-alt-mode configurable settings will have a read-only ALSA cont=
rol (like=0A=
>> =A0=A0=A0 sample rate does currently) that can be used to inform the pro=
gram attached=0A=
>> =A0=A0=A0 to the ALSA card what the current state of those settings are =
when the USB=0A=
>> =A0=A0=A0 host selects an alt mode.=0A=
>=0A=
>The fact is that samplerate is already reported in a separate ctl. But=0A=
>the main motivation for this control was not to report the rate, but to=0A=
>give some indication that USB host started streaming/requesting data.=0A=
>The rate ctl was actually handy to report both this change and the=0A=
>actual rate.=0A=
>=0A=
>Actually there have been submitted patches (IMO not yet included) which=0A=
>report this change using uevents=0A=
>https://patchwork.kernel.org/project/linux-usb/list/?series=3D745790&state=
=3D*2A&archive=3DbothPkQoo0QVJgWMFZtW46HQJf-mRkm_KJCQ$=0A=
>. IMO a perfectly valid approach too.=0A=
>=0A=
>Also the alsa loopback device is very similar from this POV. It reports=0A=
>(via ctl notifications) that the other/master side has been opened, and=0A=
>it's up to the userspace to read current hw_params to determine what=0A=
>format/channels/rate to use to successfully open the device.=0A=
>=0A=
>Maybe we could leave it to the userspace here too. In fact there are=0A=
>already open-source clients which try to handle this master/slave=0A=
>principle of the loopback and gadget basically in the same way=0A=
>https://github.com/HEnquist/camilladsp/pull/341*issue-2267218348=0A=
>https://github.com/HEnquist/camilladsp/issues/342=0A=
>=0A=
=0A=
I will take a look at the references you provided. I may have solved this p=
roblem=0A=
in a different way and maybe there is a better way to handle this.=0A=
=0A=
The primary use case for the USB gadget interface of the products that I am=
=0A=
working on is to interface with UC clients (like Microsoft Teams or Google =
Meet).=0A=
=0A=
My basic problem is that I'm using alsaloop to connect the UAC gadget to a=
=0A=
second ALSA interface. I ended up making modifications to alsaloop that=0A=
keeps it running correctly when the host starts/stops audio on the USB inte=
rface.=0A=
Without doing that I was having trouble with dropping the start of speaking=
=0A=
or high latency when the USB host decides to start streaming audio because =
of=0A=
the time required to get alsaloop running again after getting notified that=
 a=0A=
different alt mode was selected. I do still have the plug plugin in the pip=
eline=0A=
as well, so this does result in a double conversion with how I have the UAC=
=0A=
gadget driver currently doing sample size conversion.=0A=
=0A=
If we allow userspace to handle all the rate/channel conversion (which does=
=0A=
seem like a cleaner approach and is what I initially was trying to do), I t=
hink that=0A=
would mean advertising multiple bit depths/channel counts in the hw_params.=
=0A=
That part is pretty easy.=0A=
=0A=
Then the userspace program can pick which to use, but what should we do=0A=
with the sample data to/from USB if the userspace program picks a different=
=0A=
combination than the alt mode currently selected by the host?=0A=
=0A=
Perhaps just discarding audio when the ALSA and USB formats differ would=0A=
be the right thing to do here. I might be able to solve my latency/data cho=
pping=0A=
issues instead by reconfiguring the ALSA pipeline in response to the change=
=0A=
of the ssize ALSA control (or uevent). I think a fair bit of my time delay =
was=0A=
re-launching alsaloop. I will experiment a bit with this and see what I can=
 get.=0A=
=0A=
>=0A=
>>=0A=
>> An simple example of how this could be used to create a second alt mode:=
=0A=
>>=0A=
>> mkdir uac1.0=0A=
>> echo 24 > uac1.0/p_ssize=0A=
>> echo 24 > uac1.0/c_ssize=0A=
>> mkdir uac1.0/alt.2=0A=
>> echo 16 > uac1.0/alt.2/c_ssize=0A=
>=0A=
>Currently the p/c_ssize values represent number of bytes (i.e. 1-4). IMO=
=0A=
>it would make sense to keep this meaning here. In the future e.g.=0A=
>negative numbers could be used to select some non-integer format types.=0A=
=0A=
My mistake. You are correct and it is in bytes. I was not intending to chan=
ge=0A=
it here. My example should have had 3 and 2 instead of 24 and 16.=0A=
=0A=
>=0A=
>=0A=
>> NOTE: Alt modes are separately selectable by the host for playback and c=
apture=0A=
>> so the host can pick and choose as desired. There is no need to make an =
alt mode=0A=
>> for every combination of playback and capture settings. In this example =
the host=0A=
>> can pick either 24 or 16 bit samples for capture, but is only allowed 24=
 bit samples=0A=
>> for playback as both alt.1 (via uac1.0/p_ssize) and alt.2 (via default c=
opied to=0A=
>> uac1.0/alt.2/p_ssize) have been configured as 24-bit.=0A=
>=0A=
>Are capture and playback alt modes dependent? I thought they were=0A=
>separate configurations but I may be wrong.=0A=
>=0A=
>If they are separate, perhaps p_alt.X and c_alt.X dirs would make sense=0A=
>instead, with using non-prefixed properties within them (ssize, ch_mask,=
=0A=
>etc.). I.e. p/c_xxx on the main level (setting the defaults and default=0A=
>alt1 for each direction) and non-prefixed properties in the actual=0A=
>p/c_alt.X subdirs.=0A=
=0A=
They are indeed separate. I like this idea. I will separate these into c_al=
t.x and p_alt.x=0A=
which can be created separately.=0A=
=0A=
>=0A=
>Thanks a lot for your great effort,=0A=
>=0A=
>Pavel.=0A=
=0A=
And thank you for your feedback. I'm happy to work towards a solution that =
works=0A=
for more than just my particular use case.=0A=
=0A=
  -- Chris Wulff=
