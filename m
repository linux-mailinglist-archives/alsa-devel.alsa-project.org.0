Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B4898BC52
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11482E0D;
	Tue,  1 Oct 2024 14:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11482E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786368;
	bh=PqL3Pl6zhZE3g7J0nUEAS8V+gUiZy/QuIfE5rvizv98=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BHo46GZXksI/JBKexdRJ3Psbk+jotzNb48fLJ1/DuqYB6h3dVjn8jvHGJTd6lLmRf
	 LB7qwCyLJRDwTVYez6tTZo7SlvkVUfHP+OUpP9klO2tj2gaSrLaxMuUxBkzcqWdxMW
	 TI0QhV042mo3p0i4nt07fvSAJJGYTMB+YeZ+2N3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D5D9F8081B; Tue,  1 Oct 2024 14:36:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87236F8060B;
	Tue,  1 Oct 2024 14:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72AA1F802DB; Thu, 26 Sep 2024 23:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A8DAF80007
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 23:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A8DAF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=unist.ac.kr header.i=@unist.ac.kr header.a=rsa-sha256
 header.s=selector1 header.b=Pj01/eO2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAN6xesapLb367xtpbyNs+mOaskxVZS/NY2qmkYp3Qb5AbimrVRbtvc/vGoIS/XPVvE59qxqfM+hCOoVvp8r/jpaK1vNG8dB0TCzRsXRoYCQa12GQu5ry7eWvF+nbx15b92cBETFIx8aNnYxTh7+MkXIgn642eaxuc8Dq6oaD8dNnwSYn74pedqwqWTUe33582eocqVSS3f/0KorB9Pw4Wyr69BVYuUwyHJpwJTZ+ODAK8KrolEBn4x0M7coCXuvVpoxZOPnjVr+rm/nIPkCOnxhJ1RjtVdxivqnfxgnNLhuwReWfJPgU6Hznf2hq4yZ47H4mvBqURwSvZN4ymTl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqL3Pl6zhZE3g7J0nUEAS8V+gUiZy/QuIfE5rvizv98=;
 b=Tkf/TcubMsHADgN/+FntFo/rrWN3fKEaVDAN8862yu2H0RqM4jpyUS5OXJdyndR+wM7EuH8CDzizRTPcGjCnlOTpD1I9xBOzyKFLQjpMm8wDJL3cLyc/IFxAkwe5UAMWetTp5oU9J5KMlQs8g/s5ADBUpwG67XyUPH6cXouVRhPv4oL3+4RH14avgr/YhFE8nBrmsxOLvlUkKdj69y+COQiLAtSYfmzc7YnfUJLdqfgzVK2v/qIvgpWDUsh7oto4qf7auwVFAJS37yzNcM/qjC6z1IAnPihJkluJSS8R906u5eDTVjlA/PI3anlS5RHgKMao0cbHluuT3gjyMp62DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unist.ac.kr; dmarc=pass action=none header.from=unist.ac.kr;
 dkim=pass header.d=unist.ac.kr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unist.ac.kr;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqL3Pl6zhZE3g7J0nUEAS8V+gUiZy/QuIfE5rvizv98=;
 b=Pj01/eO2DBL0uCIVbGVQ+O1iRKCG1kne3yti02Om/JA6BO4E2bF+y4bgAWM44maD/PtaWSU8enqLxqQalKE2sRtOaZgrn6gu50rQKujz9kghtyeYQDEycMEBwmkh1rErrqDehRG01pQQs99t8GMWA1oFGD4rrLTBR9rYZEH5s9I=
Received: from SE1P216MB2287.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15d::5)
 by SL2P216MB2865.KORP216.PROD.OUTLOOK.COM (2603:1096:101:285::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Thu, 26 Sep
 2024 21:15:19 +0000
Received: from SE1P216MB2287.KORP216.PROD.OUTLOOK.COM
 ([fe80::abfa:51df:7a24:2f06]) by SE1P216MB2287.KORP216.PROD.OUTLOOK.COM
 ([fe80::abfa:51df:7a24:2f06%4]) with mapi id 15.20.8005.020; Thu, 26 Sep 2024
 21:15:18 +0000
From: =?ks_c_5601-1987?B?KMfQu/0pIMDlwM6x1CAoxMTHu8XNsPjH0LD6KQ==?=
	<ingyujang25@unist.ac.kr>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] sound: soc: uniphier: Handle regmap_write errors in
 aio_src_set_param()
Thread-Topic: [PATCH] sound: soc: uniphier: Handle regmap_write errors in
 aio_src_set_param()
Thread-Index: AdsQWOQVzV45oQfQS/+H6footqgKlQ==
Date: Thu, 26 Sep 2024 21:15:18 +0000
Message-ID: 
 <SE1P216MB2287F4D575CFBDC9755E896BFD6A2@SE1P216MB2287.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=unist.ac.kr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB2287:EE_|SL2P216MB2865:EE_
x-ms-office365-filtering-correlation-id: a6f8526d-6383-4f06-8341-08dcde7052ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info: 
 =?ks_c_5601-1987?B?OGFmZWZvRU1QMStxbUMzWU9BNE9TTzMxQmprQ0QwTmJIMzlPVnhy?=
 =?ks_c_5601-1987?B?VVZUYmRvMTdWOG9Oc2xzSFpQVTgxb3d3dTZGTFdISDM1dnhQOWNX?=
 =?ks_c_5601-1987?B?blQ1NXVTeE5LMTk0Z1JRNXliMGswVFZmNGFoVWR6WEE0SzdIbEZF?=
 =?ks_c_5601-1987?B?MGE4dG9EcE1DYys1QURtRktITWxkcmFFcEFJTThmV05qeW5pcjVP?=
 =?ks_c_5601-1987?B?UEJRdnk0RHdsMWZwamltNWZ3KzNhQTRncXFvR0kwdmkzY1BzYjNZ?=
 =?ks_c_5601-1987?B?eFVuK3ZQemg3bXBxSURBVWFENHhtSlpJVE1aSEJEVDFnc3loZlIy?=
 =?ks_c_5601-1987?B?aTFWcDBmRVpNV3ZLNVljY2ZMQkg4UU1TT1pnMTVIUllSc2pGNkY5?=
 =?ks_c_5601-1987?B?eXdmb2xpRzFlajNoSy9OcFNNVHB2bjRnNFk0dUI2NEtPYmMzazNU?=
 =?ks_c_5601-1987?B?aVFPZHNaSWcvazg1cVkvN1g3dUQyN2ZaeDErOWhiSC9GMWlFMmc1?=
 =?ks_c_5601-1987?B?RUV6eTk2MEdoT25XVm9PaEpQOHhiSWZRMzY4S2FlSDUvTnhhNkRD?=
 =?ks_c_5601-1987?B?ZUVmeUhMWXF6citheUJPUU16N2lHN0JrSkRNWGh4V0R3bzBjaWVk?=
 =?ks_c_5601-1987?B?RTBXaWdiRVR3ZW54QXEreVEzNEsxa3B6QkhNaVlEZE5aQzM3d3pB?=
 =?ks_c_5601-1987?B?WDhhQ0c3MHNZcndwNmtOUG1HR2NvQ001SG5PQlh5SFZNaVRZZ0ha?=
 =?ks_c_5601-1987?B?MGVuUTVzSk1tYzVhSG1uaXFYMC8vNWgxLzltejZuTkJ6Z2lDOCs4?=
 =?ks_c_5601-1987?B?VEJxUVFScXoza2g2L245TG9mSk9odjNTcVZaVDV1czhBVjd0SjYz?=
 =?ks_c_5601-1987?B?QmQvaGswS1lWRDZBLzhLYWFjdkc5S0ZwODUrV292RkhFRVdUSjdy?=
 =?ks_c_5601-1987?B?Q2hxNEFRZFJlQnpkbHNlVXlSbXMraFk1YWlKeVNYUngxL2lLTnRi?=
 =?ks_c_5601-1987?B?cG9lT0VodDNLWnNGVUNYOVZjZTBlL2pTR3hWQnRoRWhxd2pPN3M3?=
 =?ks_c_5601-1987?B?TkxLVG1lL1ZIRzM1SlZOaFVUZzBmZXlQZzRZeGVsV3l4U1IyZTBE?=
 =?ks_c_5601-1987?B?SldzazRTSEtIei81VS9BcE5uWXdrWUdXSEJkd081MGxSV0doY2I0?=
 =?ks_c_5601-1987?B?WFZ5M1ZiU0lYdUFEZklZeGJQbzNtTlR5aU5pYjE3YlJKeVNUTEJt?=
 =?ks_c_5601-1987?B?c2x2cFBrZ2YyY1U2Nlg2WkJkd2wxN3d6aUp6LzJESUJOR1Z4bzdr?=
 =?ks_c_5601-1987?B?ME83OGJXZmp1WWJFTmVSd2dqMG02Y3BaczdEZlVnRmFETVg5NUQy?=
 =?ks_c_5601-1987?B?UlhHSnQrUDRWOTFFdzk5bWliTVVKUTU5azRBb3VPM3dDMkZZQzFX?=
 =?ks_c_5601-1987?B?LzFRRFA4dmdBQk5mN0x5T1ZUcktMSERJVmFlSldsc2hmUkN2Tytt?=
 =?ks_c_5601-1987?B?SWhpdVBDSFluaWQwdW5sN0hvTllCdklYM0NBS0YyazdwSmlwL3VM?=
 =?ks_c_5601-1987?B?NHlRYWZDdXMzL3QvWS9vOGNFNzhOT2tzZExRTDNQNm15UDE5MStz?=
 =?ks_c_5601-1987?B?bDJYcmJZODNJR3hJVnRsd2hWcmxZM1dZaFJLY3JnRUtUbnZGM2Fs?=
 =?ks_c_5601-1987?B?ZEYwUldDRlR0VHNoM3ZvSG0yd3BxTldLTXJTNVlCZXNmeFdUcjBS?=
 =?ks_c_5601-1987?B?bk5ZR2RNSzc1WGVYekdLTUNlSHJTWitJVnZXV3Rvc21VZWhyMUQv?=
 =?ks_c_5601-1987?B?YkgzVDlVNlNTeklOdUtJbDArTTNyaHBoNkZhUmYzWGRSTUNBcnYx?=
 =?ks_c_5601-1987?B?VEJwRjNFSTRDazE4NEl2QW5iK1ErZTVRcmUzcU4rNkh1KzRFejA4?=
 =?ks_c_5601-1987?B?Y2FNWklhY1VlTS9xUXgrcHliRGxDazBXUFYrQVVKb1RqZkUvcEs3?=
 =?ks_c_5601-1987?B?QTNacS90cXQyUmJWK1RQZ2oreFNLUVovTzlHRWQ1Skl2dkdSbXU4?=
 =?ks_c_5601-1987?B?eU1vdUQydzdVaERKNDBraVJKcGZtQjlzaXpCZlJTWUZNTEFhbnhN?=
 =?ks_c_5601-1987?B?QT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB2287.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?ZnhFM2c0SDRJSlNoR0U1TzdQNWN5NUhYejVwNmRzYWN0U24vN0c3?=
 =?ks_c_5601-1987?B?bzMxT0p2QjlQWHF2dmRDT0k2bjgxaGFVZ0swRzkzZENuUDBUcE1R?=
 =?ks_c_5601-1987?B?c0ZPV0VSc0YrQ2EvNlVoazRVWG9obVpqMXFhSTNBNldHWHB6OGll?=
 =?ks_c_5601-1987?B?d01MSWUxcnpwSHkxbVdNcG1aMGc1NkF0M01XTG1NM0NQa0U2alVw?=
 =?ks_c_5601-1987?B?bHdaUnFsUkk4WmQrS2c2R3R5L2lPNVJPeGE4Vi9PVXMxczVIRnQ3?=
 =?ks_c_5601-1987?B?VGpkZFlBUHJOcVYrck1Nblp2TVlmU0RMYlQyODlSc3BKdGFXa2xa?=
 =?ks_c_5601-1987?B?MDBXbS9MYXZQVWk1dk5UOHQ0WnFYWERmbXVhK0pPRmp5WlpsQWtz?=
 =?ks_c_5601-1987?B?c08yVUt6a0JodUpBVjZzT3JCWkpmejRvSE45ZkU3cVZUN3A5Qnk3?=
 =?ks_c_5601-1987?B?cWhIclNUbldUOGxhTXJYUW5WOUhjS0YxbHBHSmVMQW5sbjlxVzcw?=
 =?ks_c_5601-1987?B?OXZaRXgzNHNzWGJ2bFE2YytXcTd3TmpvQ0JFOWlXTnRWaXJweCtw?=
 =?ks_c_5601-1987?B?ZFRvRWJlNTVFM3FhU1JyV1k4cUxBbFh5QkZHcTMvTGZ0bTliOFNQ?=
 =?ks_c_5601-1987?B?MmxYM3RXdUVieXBYQmhMbGNyN3B1Zy9SdGN0dC9VamI0dnFrcEdJ?=
 =?ks_c_5601-1987?B?N21HK1Rnb3pFUWVPMXYyMVJ0R3dEL2tlQVJsRDV1eTVkWFRDQ1h0?=
 =?ks_c_5601-1987?B?ZHNQbWsvNnpJdG1BNkF3T25DTmFDZlBIcy9PQ1dZSjVUc2FsajlB?=
 =?ks_c_5601-1987?B?THNPb2NhNlE4RlVOLzlEOENqTTdHbmsxaStYbTF6Q3NnMkJnTis1?=
 =?ks_c_5601-1987?B?WFFRdDh4dHVnWGk4Yzd3K3YrLzJLSkZBU2xUcmRHblBPdStDSG14?=
 =?ks_c_5601-1987?B?OSs4MWxlUEJjazV6ODd3d2N2SmxTUDljbkozRnpkWkdVQ0x3dDlK?=
 =?ks_c_5601-1987?B?SElwZnY4ZG11dU5SL29SVmxsUlJvRWFkVDhFQURDNnpyMUdyWDhR?=
 =?ks_c_5601-1987?B?NzF2RDdyTDh1RXBBb1dWUU9hMEMxeGxNUnFWT2s4WTA3NFV6Z1ZE?=
 =?ks_c_5601-1987?B?Z2xFVnNxbnA4YkNMRjFaTGZicFlrSVVTL1ExN2s1MHhMdnhGVVlm?=
 =?ks_c_5601-1987?B?VHYrNC92Z0NGT3FScFArR2FmRnVlSWl1M1hGcENJcllrV2hYOGxB?=
 =?ks_c_5601-1987?B?dy80cDlERkpqTk1SMXFveFZDTzNUK3JpZ2IvVTRPTEpmb0tHTVAv?=
 =?ks_c_5601-1987?B?RHBJLytCUWVCWWVGUTBZVUE5dlUzYTIvRzkwYmxYU29QZVJ2RzFn?=
 =?ks_c_5601-1987?B?Yk5MM2tWN3g2TVFmazdza042VXQ5REZwME11RkQ2YXlCNStlMHVJ?=
 =?ks_c_5601-1987?B?UHd6MDJMNkQwSGVBSCtFVllUUDRVSm4zWFlwNEEvZldaVGk3WkRy?=
 =?ks_c_5601-1987?B?WUI5aEtwOU5lRVFzNzc5Nm8yKzl1OHhzMmsyVm8zNjBQTjV6dEt2?=
 =?ks_c_5601-1987?B?SHdKRFlTNEVVWHUyNmlUWWxBblkxa3hkVnVqcm9YRFU5R3dCOW1p?=
 =?ks_c_5601-1987?B?ZEQxVnZ1NmFtTEJRbi9DZ2hvVU1JalpLQnJjbXMybjNtOUZEVkZC?=
 =?ks_c_5601-1987?B?VkRyRm44VWxqK0dGdGdtVTFTck9VVEZMR2lRckhvSys5dmpHQTFn?=
 =?ks_c_5601-1987?B?L3RyeG9NVUNQTnlGQldjaXpOWTZJQlBuTzZmeVZ6c09GRURZSGN1?=
 =?ks_c_5601-1987?B?bm03cTZLY1ZlTDFuNmJyYmt0K2lrOTh4NndnUWpOYWU4QkkrV050?=
 =?ks_c_5601-1987?B?cU9CSzduWS8yaUZSVXpMaldHN29qWnNCUFFBR2pMaEw3TzZEcHhT?=
 =?ks_c_5601-1987?B?Z0QydGpkVGdCUFB6MVdFL3lvYUcraTFGRDNCZDZvejFtdXJObDBx?=
 =?ks_c_5601-1987?B?UFNoaWE2RmRDZENJNzNqR1hPbkhTTHlYSEF5dXR1aDNuNzJXTTJs?=
 =?ks_c_5601-1987?B?c1NHcXVFSGZTRDZBdUVManppOGJLMG91RGdiRHhJdk0vNmRhM2JI?=
 =?ks_c_5601-1987?B?Z01rZU92TGE2ckR2SVZUWDRHWFlFNWk4bWpiNmZKQ203bVJVTVJM?=
 =?ks_c_5601-1987?B?b251UFFWWlYrVmZ4bnVsM1p1S09kYTkzVFRWMzg0TXVtUXg4eWt1?=
 =?ks_c_5601-1987?B?ZDdsVnlOeDBXTlVYR0diOFk4d05NakdXZklTMUlKQlNFSGJrNmx2?=
 =?ks_c_5601-1987?B?SFdzOFUzSlIzd1g2amhtbGVtaFAwbGNqWFg4b3cySHp2NDhranRj?=
 =?ks_c_5601-1987?B?NElaaVNjNDBYc0JYMzJUdmtxL1V0RnhsMTdzNG96TVBkLzkzZkpY?=
 =?ks_c_5601-1987?Q?zvo5qRz3tfEz228/1Ef6aMGMicEEXdfQwA2lrmoR?=
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: unist.ac.kr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB2287.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6f8526d-6383-4f06-8341-08dcde7052ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 21:15:18.8570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8715ec0-6179-432a-a864-54ea4008adc2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 7hL+BCz4xFeSE6w1QzKN74FaiuhsJEJalpudvbJsknByHCI+knSa2q7kFsjSs+dbnVm/uZDUWzCAbnKIYwKikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2865
X-MailFrom: ingyujang25@unist.ac.kr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AGMYKUWKNWUY3ZV44XDTDS2IIVTUYKYA
X-Message-ID-Hash: AGMYKUWKNWUY3ZV44XDTDS2IIVTUYKYA
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:36:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKYOKOQ4TW3FIMYK5RFHAFWEI7XAJJFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RnJvbSA3OTE3MTZiZjM1OWI4NTQwYzUxOTgxMDg0OGZkMWY4MDA2ZDdjM2M1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogSW5neXUgSmFuZyA8aW5neXVqYW5nMjVAdW5pc3QuYWMua3I+
DQpEYXRlOiBUaHUsIDI2IFNlcCAyMDI0IDE5OjQwOjA0ICswOTAwDQpTdWJqZWN0OiBbUEFUQ0hd
IHNvdW5kOiBzb2M6IHVuaXBoaWVyOiBIYW5kbGUgcmVnbWFwX3dyaXRlIGVycm9ycyBpbg0KIGFp
b19zcmNfc2V0X3BhcmFtKCkNCg0KVGhlIGFpb19zcmNfc2V0X3BhcmFtKCkgZnVuY3Rpb24gZGlk
IG5vdCBwcmV2aW91c2x5IGNoZWNrIHRoZSByZXR1cm4NCnZhbHVlcyBvZiByZWdtYXBfd3JpdGUo
KSBhbmQgcmVnbWFwX3VwZGF0ZV9iaXRzKCkuDQpJZiB0aGVzZSBmdW5jdGlvbnMgZmFpbCwgaXQg
Y291bGQgbGVhZCB0byBzaWxlbnQgZmFpbHVyZXMgd2hlbg0KY29uZmlndXJpbmcgdGhlIHNhbXBs
ZSByYXRlIGNvbnZlcnRlciAoU1JDKSwgY2F1c2luZyBpbXByb3BlciBiZWhhdmlvcg0KaW4gYXVk
aW8gcHJvY2Vzc2luZyB3aXRob3V0IGFueSBpbmRpY2F0aW9uIG9mIGFuIGVycm9yLg0KDQpUaGlz
IHBhdGNoIG1vZGlmaWVzIGFpb19zcmNfc2V0X3BhcmFtIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFs
dWVzIG9mDQpyZWdtYXBfd3JpdGUoKSBhbmQgcmVnbWFwX3VwZGF0ZV9iaXRzKCkuDQpJZiBlaXRo
ZXIgZnVuY3Rpb24gcmV0dXJucyBhbiBlcnJvciwgdGhlIGVycm9yIGNvZGUgaXMgcHJvcGFnYXRl
ZCBiYWNrDQp0byB0aGUgY2FsbGVyIHRvIGVuc3VyZSBwcm9wZXIgZXJyb3IgaGFuZGxpbmcuDQpU
aGlzIGNoYW5nZSBhbGlnbnMgd2l0aCB0aGUgZXhpc3RpbmcgZXJyb3ItaGFuZGxpbmcgYmVoYXZp
b3IgaW4NCmZ1bmN0aW9ucyBsaWtlIHVuaXBoaWVyX2Fpb19wcmVwYXJlKCksIHdoZXJlIGEgZmFp
bHVyZSBpbiBhIHN1Yi1mdW5jdGlvbg0Kc2hvdWxkIHJlc3VsdCBpbiBhbiBpbW1lZGlhdGUgcmV0
dXJuIG9mIHRoZSBlcnJvci4NCg0KU2lnbmVkLW9mZi1ieTogSW5neXUgSmFuZyA8aW5neXVqYW5n
MjVAdW5pc3QuYWMua3I+DQotLS0NCiBzb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWNvcmUuYyB8IDE1
ICsrKysrKysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3VuaXBoaWVyL2Fpby1jb3JlLmMg
Yi9zb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWNvcmUuYw0KaW5kZXggMGViYTYwNzU4MTM0Li4yYzRl
OGI4NzMyNTMgMTAwNjQ0DQotLS0gYS9zb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWNvcmUuYw0KKysr
IGIvc291bmQvc29jL3VuaXBoaWVyL2Fpby1jb3JlLmMNCkBAIC05MjEsMTYgKzkyMSwxOSBAQCBp
bnQgYWlvX3NyY19zZXRfcGFyYW0oc3RydWN0IHVuaXBoaWVyX2Fpb19zdWIgKnN1YiwNCiB7DQog
CXN0cnVjdCByZWdtYXAgKnIgPSBzdWItPmFpby0+Y2hpcC0+cmVnbWFwOw0KIAl1MzIgdjsNCisJ
aW50IHJldDsNCiANCiAJaWYgKHN1Yi0+c3dtLT5kaXIgIT0gUE9SVF9ESVJfT1VUUFVUKQ0KIAkJ
cmV0dXJuIDA7DQogDQotCXJlZ21hcF93cml0ZShyLCBPUE9SVE1YU1JDMUNUUihzdWItPnN3bS0+
b3BvcnQubWFwKSwNCisJcmV0ID0gcmVnbWFwX3dyaXRlKHIsIE9QT1JUTVhTUkMxQ1RSKHN1Yi0+
c3dtLT5vcG9ydC5tYXApLA0KIAkJICAgICBPUE9SVE1YU1JDMUNUUl9USE1PREVfU1JDIHwNCiAJ
CSAgICAgT1BPUlRNWFNSQzFDVFJfU1JDUEFUSF9DQUxDIHwNCiAJCSAgICAgT1BPUlRNWFNSQzFD
VFJfU1lOQ19BU1lOQyB8DQogCQkgICAgIE9QT1JUTVhTUkMxQ1RSX0ZTSUlQU0VMX0lOTkVSIHwN
CiAJCSAgICAgT1BPUlRNWFNSQzFDVFJfRlNJU0VMX0FDTEspOw0KKwlpZiAocmV0KQ0KKwkJcmV0
dXJuIHJldDsNCiANCiAJc3dpdGNoIChwYXJhbXNfcmF0ZShwYXJhbXMpKSB7DQogCWRlZmF1bHQ6
DQpAQCAtOTUxLDEyICs5NTQsMTggQEAgaW50IGFpb19zcmNfc2V0X3BhcmFtKHN0cnVjdCB1bmlw
aGllcl9haW9fc3ViICpzdWIsDQogCQlicmVhazsNCiAJfQ0KIA0KLQlyZWdtYXBfd3JpdGUociwg
T1BPUlRNWFJBVEVfSShzdWItPnN3bS0+b3BvcnQubWFwKSwNCisNCisJcmV0ID0gcmVnbWFwX3dy
aXRlKHIsIE9QT1JUTVhSQVRFX0koc3ViLT5zd20tPm9wb3J0Lm1hcCksDQogCQkgICAgIHYgfCBP
UE9SVE1YUkFURV9JX0FDTEtTUkNfQVBMTCB8DQogCQkgICAgIE9QT1JUTVhSQVRFX0lfTFJDS1NU
UF9TVE9QKTsNCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHIsIE9QT1JUTVhSQVRFX0koc3ViLT5zd20t
Pm9wb3J0Lm1hcCksDQorCWlmIChyZXQpDQorCQlyZXR1cm4gcmV0Ow0KKw0KKwlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMociwgT1BPUlRNWFJBVEVfSShzdWItPnN3bS0+b3BvcnQubWFwKSwNCiAJ
CQkgICBPUE9SVE1YUkFURV9JX0xSQ0tTVFBfTUFTSywNCiAJCQkgICBPUE9SVE1YUkFURV9JX0xS
Q0tTVFBfU1RBUlQpOw0KKwlpZiAocmV0KQ0KKwkJcmV0dXJuIHJldDsNCiANCiAJcmV0dXJuIDA7
DQogfQ0KLS0gDQoyLjM0LjENCg0KDQo=
