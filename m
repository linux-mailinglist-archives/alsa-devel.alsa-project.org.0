Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C60AC8334
	for <lists+alsa-devel@lfdr.de>; Thu, 29 May 2025 22:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42F12601D7;
	Thu, 29 May 2025 22:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42F12601D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748550417;
	bh=3x6DKim0U08gJJ39k0tOg5YnDQQmJJqmYmwn/sc6lrI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s3vUc+u4sljXDfm1u8ObRLjQN/E6KZVCETt2lOQtpEXfOxre69dagfR4B+OsVwGyE
	 k4S2UPn5dRcSp2uQ2dEC0GI6R2eu/pg+FIoumVmDS56G4LGuyzaiQ2Owwrzp35F0ok
	 SaH1leIhHMvHbMuxP/KerXleDhf1sEES5d/JjAFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9875CF805B3; Thu, 29 May 2025 22:26:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8933EF805BA;
	Thu, 29 May 2025 22:26:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFDA4F8025E; Thu, 29 May 2025 22:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FFA3F800E2
	for <alsa-devel@alsa-project.org>; Thu, 29 May 2025 22:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFA3F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h+q1Vlyd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kySVjJTHWikJTxkCzrKrJBj1jH+1QzTpqBVmOyi9qlIQuNjp7MTboEQHIDczXtxXJAoaPpIINU49LgXQ8WdDDwxLpKVNeAMeSKRjXayLcXq1CnGL6RSEovj+m8rNETcnEud5rNAHQLj+0o94GxctP07kPCl36wRwjKu0j+mNkSbB9BfCAnGZOvC/xLL1DIHHQ4pd5Az0NKTVT29d4zElDThu13MOYHR9FzRAODjHhCJQeHcGgvo+1FSB8m/jZ8WMXrpo6WSuS5ToeXPbARuvDt34Xs6AW6WIDXc7ySTAWDqAN1OZ42jSYXXltZxRbT+wvWlCTFgn0bBdYhZOqP1lCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqhsnEztS2GXis87qC5jgK5vLtsQR1MqgjB7wL4Ew18=;
 b=EJm7hP7xA6O3X9MNyTulaIXTfrnf7Jafyd8JNlPHJFJXswEaFa0vsbzRTLNDBrzdN6k9SiKLvxLOpClzFROUL3sIgsULDdKEMYBhM/mArXIRVJBemcNCTE4wx3fIos9gRzlZUqKQzDDiyqz5cnoAB8OiIGDaTvH1GramGOKlHT8gn0wPeAqOoVnaOG7Mlk2J69HIB7Uv20h9w6TTzjLwtO7uQDt17i0xLup1BUo07x8y27K4jRZ0nWIap+ytD1HnyYc/8GxtuQJt5EATaeix3e5e2FcsJHrg4Hf3LC3smXZV+GmBZHzERTc/fbHM2eUm1HIDXoAgtzcOpFVfxNvuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqhsnEztS2GXis87qC5jgK5vLtsQR1MqgjB7wL4Ew18=;
 b=h+q1Vlydl+A8EdhhCgk8oqz1oExcoxiQ48nTDBXcQMkVg/lhf8KmgqafJMZAnKEVSXTXdK7UsQTCVDnR/4x0UBlxvY+oI5AdfmpbTnc4fu6OfxHtyojnMTIyzykC9PrnOvjaZLASw/CiFCliumsEEJr7z7Jjch2jcFiBPsl45UY=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 20:26:08 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 20:26:07 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio
 controller
Thread-Topic: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio
 controller
Thread-Index: AQHb0Fv6FBOHJGSOy0eC2x+24FgmCrPqDbyw
Date: Thu, 29 May 2025 20:26:07 +0000
Message-ID: 
 <BL1PR12MB51449240DD771DB4C8005890F766A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250529053838.2350071-1-Vijendar.Mukunda@amd.com>
In-Reply-To: <20250529053838.2350071-1-Vijendar.Mukunda@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=316ebbc7-d5c3-4007-978c-d20e79014754;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-29T20:21:51Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH8PR12MB7375:EE_
x-ms-office365-filtering-correlation-id: 9765f691-b1f9-4834-c96a-08dd9eef0aea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8fYtkpW91fccC3JXwLD3htAZBDf+NZgNajfwHHCKN+SPZDWbNnwLj7l1ZSLs?=
 =?us-ascii?Q?eiU9U5HR4OxcRyPJOOJxnJfWyor/ZLqN2lz5TZr9mP0PuS2pKHQWL/zkXUd8?=
 =?us-ascii?Q?Oo1W2njZNbFc11agZ0m4V30uoGQh6XsIXTwCEo9mOVUVjPx8OUrQosfE2a4D?=
 =?us-ascii?Q?ADA2aa0O9H9aSc1W31oZWhoaYGAoQm/YwF6fV6G3cWUxH6L9UTuryOCaVmxL?=
 =?us-ascii?Q?DmIt57tSSR0NrLXw+nSZ9AiJTO9wFFKi5L+pnfmMBEcKOKfAKEa4/9XUK8Bo?=
 =?us-ascii?Q?lbUW+Syr87GYALZ4xHyjAeSKYTLknLpLOsXfj3hCiNMKq/qY1bWRK8F6yuii?=
 =?us-ascii?Q?6Jrn6wuGPum9QWlRkYAlhE/jUNNEnqkTStEn9HmRGtjFBwoNuNGumCj8tgQr?=
 =?us-ascii?Q?xzthtNK8XIIqQuYQGnI9W2Uo8U/bbenZl+4Tx6pt9pbhX4LqVsgXOKs21ZgL?=
 =?us-ascii?Q?13POY8g/07Qasxk40ciPMPO9PqhGABdZXUl80yb/FVYs2WMp7zpb+iZDIUGH?=
 =?us-ascii?Q?rNFXs1pqZY/rcLv+yrG1F/gYwXRqQG/uNG2EPZq0zyQqtLsuAZmwF4PYwvYi?=
 =?us-ascii?Q?iWVgJ5slDP82iubzc5yWJOg2upxUBoKqBXfUNTlVBEAaToN6gBycsg8vLsyy?=
 =?us-ascii?Q?nPu6VM/BELxZvMhXjRd7sWmwQXjCTtagQDqLadNym4CURzhotype7MNufNkx?=
 =?us-ascii?Q?0EZynva4K1AdI/2FeyyYAtfav4U6MxO+h3fDIva6EjgmqY1hWppjFXOU2Mm7?=
 =?us-ascii?Q?Z0gDxMIrB7lu+4uX9rCRs8dEtlS6JDrjwO+UjD0na2u9Ak45XlNBls5KOsjA?=
 =?us-ascii?Q?+7epkMGymB8fMGH+01SlEnC4P8xNIVPmOyYV8T+8euyIpnLcSuB0RqqfpG0u?=
 =?us-ascii?Q?41CiHLcayhNNaomVzVKCRZSnUqBS3ZnVL770919I/LgiCBBxut18utnG8CVL?=
 =?us-ascii?Q?MwYJtmwgps5OhGTaBo9JeZCKYgExXNzkdKEgx1RiZV46FdC+6USDQM9GFmHN?=
 =?us-ascii?Q?JMSdKX01i1bntMPFyZnvdEVNqwRCYeQrQWKIHppcgOUBRftx1jTWui2FVdrU?=
 =?us-ascii?Q?YOU9wq83urHHqGLep4IvnjH3OKQtr25toFOqfoieQU4AYL3ReAQ5Aw8KFo8l?=
 =?us-ascii?Q?AycUH+PxnshXRLVEyJ/35uP3XCJm9BSDsaqbJQDK16t8CkCkjVU43YBUACBg?=
 =?us-ascii?Q?mJW7OuH0M8MqUS6Cal57r/jyJuukQ3CxxVgqFrabasnaifqdRVHuDs+U6u/E?=
 =?us-ascii?Q?T6Q5AuZF2TiotRfNVT0x1eZBXYRs7u90pA0HRT22ArwR6T8W+Ld2oJWbmHq9?=
 =?us-ascii?Q?tQD/6t0pfdHJio/O6IV81Emq9sAw0223vD3XyWvuflWEOTdpqJ4pqsmSZcdP?=
 =?us-ascii?Q?bY2sfqv5OFCrsAPSXgWJ0o0ufwq2etgh5PPVrqfaYHopGlqUrDTU9iGORw/A?=
 =?us-ascii?Q?sRUVslgNujwA4xAMxWFTCN5vZW0DS9eQhA2xdrX3bIfWrzEx1hjUcLHaVOOm?=
 =?us-ascii?Q?W/r6VK3JH3pMCmk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5144.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qPy30A25y+fEg3uG7QqI7DshoVZw4tMzgJ/EXBdts0rC6sYHHxj6EUBEe2ta?=
 =?us-ascii?Q?b8NNgwLR7PfWiUnzUaqb9gAFkniALllU84zI8AHyBg6TqGm3mfqTs2FxQfBE?=
 =?us-ascii?Q?Cd51sUSvZIA3hUi2Zq/QEkvAluWW9e7SHbyjkYTG6Tx1HD245cwQrX0+IjGO?=
 =?us-ascii?Q?7mhhXq7W74EOVio8nOD+PifLuvs4eMssDy5uLYigGpzBqLfFNJMWIXpzAdWt?=
 =?us-ascii?Q?so1N4MjsxGQD5UuhpzjEO0TBrJ2j9r8MZEo21ek0KNPvBmsCpceyckkxuxvW?=
 =?us-ascii?Q?7GDMKCyDgpXdGwbW6WRyr86Kv24gaPhokjhc3GOKyieYeNwQ2MYUC+xGsAs9?=
 =?us-ascii?Q?tcFFJVAYDYWzVnRDJ70nE5MDczx86q91ihZ6zf4pg+ksYy4/nD4XhV9OCOIO?=
 =?us-ascii?Q?61WhHBnN97c5bMybadAxTkldxizaAZEr6tTAelqiGjDrg1c/H+goClUcxFuw?=
 =?us-ascii?Q?P6EM08cY6G38IsSpVYhFQvmT7kDTNRkEy9eD39a3I5QFPlNuev+lflmHmpXN?=
 =?us-ascii?Q?fG18Di/YaJRYx1ZqnzsW/PpRBJUJ7ehrM9tZldC2/Y4HMfhBJKG5MubJJ6gh?=
 =?us-ascii?Q?JcR+XoycWwUNFnekcSVSJhD6RxKCU/UusRVXbb/NPSqwolMAhvSuvxnA1drx?=
 =?us-ascii?Q?bbxfZj+EChtnh9wk6jj49PjhstKSx1RrKE5oer/eTKGvzLxpjkA8lQFVkWZT?=
 =?us-ascii?Q?BM6vSjTQLm6pakrUsHGx+evACCcU7TqsGLQBZ0En8jzjeP6Rm0GqyhXiECw+?=
 =?us-ascii?Q?9fc6g77EDX5t6Fk+gxuEq481oWgOKaP1+Fx9N6njCm9NsYGKzp0g0nv9d7DV?=
 =?us-ascii?Q?Q6CBXazW/qD3XS5wOTy0Fjlmx7vLLQp9IoKb0Y7A5os/XUGj+k+uRFI1gMCC?=
 =?us-ascii?Q?FWwGvRE+nRHNs7Ljotuob2GLqAVhfi6AC9hha7CajNJTBxehGR0ff+lVGet+?=
 =?us-ascii?Q?4Eu6XuQR/sGthTnT9Alub5CASPwJXpPrXr2tTeLuLShuoYlxb/qN5nVgl6Om?=
 =?us-ascii?Q?e7aYSmdZIfMPP5kqCnaYd9gHxw4rqEjbm2kNELBCRcbRLSqQnLHlpHJGIaAh?=
 =?us-ascii?Q?hXTkgTTPeJzTZtHBKWQYd23lvEn4dH79oQZ5JfOefwq/0aV7jn3WCwsx+4OG?=
 =?us-ascii?Q?jG0Mi+5efSAU8Npdzh+qUBxwHCAEiocCjCcnx6BjGdVEHKUdmKCRMwXx027S?=
 =?us-ascii?Q?MEqfwyaUTTMRkkfYgf5CVo88MBfa2fpar0wtNiJ66SxS1+dWgkgv/gqof2qC?=
 =?us-ascii?Q?L4H6/4TmavYnsHVCa3KY6LsnYut6VdQqXmRtZON59lGlT2WOyL0NU5vGVKNE?=
 =?us-ascii?Q?zfTtWgpOu+Qm3f6ECjiGuPe1cTFW9D82WXjNqP3TkkX5FqjykyDyAWvG3p6t?=
 =?us-ascii?Q?VpsSuCzlsRGqsgbDQzMbfjHWMlXKqbMEcJuwRIwjYzcdiwH/reWx0hcoDJQG?=
 =?us-ascii?Q?TOHrgTlA0KwTT1cOQ/PjsHv5IaZNSQidf8QC3C6xNaoPM77UYj0xOHaLMh74?=
 =?us-ascii?Q?W9vSjFzMSmx+GyQf06bwNIxq53kYdx1KflhcleSts/uO5+TLDi3vaZT3mcBW?=
 =?us-ascii?Q?vQJWiX1paUPYue4BpTM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9765f691-b1f9-4834-c96a-08dd9eef0aea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 20:26:07.3877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 E8kYQugYdA2POk/d8Z+Qjo4T2TbGltynEUpB+AWo74NtTp0dJVewxyCSPjCHil9ozHilEFE3+76Yxf8/J5osSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
Message-ID-Hash: NS7OXYSWSB7UPDZMAC25WE2XN5SSWVED
X-Message-ID-Hash: NS7OXYSWSB7UPDZMAC25WE2XN5SSWVED
X-MailFrom: Alexander.Deucher@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLR2AMSNMMXWENEI2X4W2KOLDNLY7CFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[Public]

> -----Original Message-----
> From: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Sent: Thursday, May 29, 2025 1:38 AM
> To: perex@perex.cz; tiwai@suse.com
> Cc: alsa-devel@alsa-project.org; Dommati, Sunil-kumar <Sunil-
> kumar.Dommati@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; linux-sound@vger.kernel.org; linux-
> kernel@vger.kernel.org; Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Subject: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio
> controller
>
> Add new pci id for AMD GPU display HD audio controller(device id- 0xab40)=
.
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Is there a way we can just add a default entry for all ATI HDMI HDA endpoin=
ts?  It would avoid then need to add an entry every time we release a new e=
ndpoint DID.  Either way:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  sound/pci/hda/hda_intel.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c index
> 512fb22f5e5e..3f8b2bf6eab5 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2715,6 +2715,9 @@ static const struct pci_device_id azx_ids[] =3D {
>       { PCI_VDEVICE(ATI, 0xab38),
>         .driver_data =3D AZX_DRIVER_ATIHDMI_NS |
> AZX_DCAPS_PRESET_ATI_HDMI_NS |
>         AZX_DCAPS_PM_RUNTIME },
> +     { PCI_VDEVICE(ATI, 0xab40),
> +       .driver_data =3D AZX_DRIVER_ATIHDMI_NS |
> AZX_DCAPS_PRESET_ATI_HDMI_NS |
> +       AZX_DCAPS_PM_RUNTIME },
>       /* GLENFLY */
>       { PCI_DEVICE(PCI_VENDOR_ID_GLENFLY, PCI_ANY_ID),
>         .class =3D PCI_CLASS_MULTIMEDIA_HD_AUDIO << 8,
> --
> 2.45.2

