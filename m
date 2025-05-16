Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B0ABA45B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 21:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB7260196;
	Fri, 16 May 2025 21:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB7260196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747425053;
	bh=zBSXFT/na1PldzL/61KTlImxFrSdbWlsqfiQT1V+h/g=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MxcTE5tOTqkzNjS/kXmREaeNb//E1LBCRRDneHuySANDViU/DpFVOQ6pslk71Qfoh
	 j4d4oPb3mr55y91VXFKW1ueBAEjjjm9ag/TErNa6wau91pD7E2Aib+l1R25VnCHldq
	 +lc9LDTnJqrTosTp+xbxykGlX0RN/DFy6NNq5QYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E61BF8027B; Fri, 16 May 2025 21:50:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15BBEF80162;
	Fri, 16 May 2025 21:50:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79CD8F80134; Fri, 16 May 2025 21:50:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,T_SPF_PERMERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 811BFF80075
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 21:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 811BFF80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=palmerwirelessmedtechcom.onmicrosoft.com
 header.i=@palmerwirelessmedtechcom.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-palmerwirelessmedtechcom-onmicrosoft-com header.b=MzIfhOP+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lhe+lfJo1rr5c9EVfbHmOAdNShlVIxqOJ6dbPpjA9T6R2T4Xb5t17C8oGEs8HYDHbWUxu5GqqLPv/C9YuokIaqV8qrwXVbvlj99HZka/cdmPRzqhzWh6+q8bFXd8nVxFQpgNYVUQ4ZaC3z0EZacbn8WspkNEYYV3Qvq+++bFLv5lU7S9Ee45CM4hs7LIuIHppkhGMmSqx9PE9rtC0Khz8kkYKC1TSEiOlTcPxATlvpX20skszxPhU9bM8KDDYMdbXpsvQnFgVRXZKq/8yXcnkDCJX3y/0MblJK82wtClbyKc2/iYDzp16VJO74xyKkUa7uWCuV6tRDsM8vcsIbqKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIKKREoH0ev2AUuy0xeN6HtprM/QUypBCH5MNbC3EME=;
 b=gLDYZwOSM6fV1hUQEbpepi9z2oPYIygE5P1b7VM1DbF/Lt14CKRGPA0/Rnw+xgzF1iv5zRa+MYOUt9fpTJ8fppRjkzBSc7w3suw1+FrcSfAlAUTqGyA6w9q3np0d6ZKb5GASQtn+8b1iXdqaFZow9/7vpJ7/5+7LIyqDYPzqQlIuUlmtaQiXK5WpCM3TsTNLkauwS33TBRypFD66JLspuFgs0dolw9IMnibzZ94dKjgH7qbmlCSGZEiX5uec148Q+ShUHj+JQhWxYPP2ggsAQpjZXAHGgiZdJJvmbc0NKoUkVbliBrkM11K/Ils1cmaW3V13IHGMJUL9k53GLC3jEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=palmerwirelessmedtech.com; dmarc=pass action=none
 header.from=palmerwirelessmedtech.com; dkim=pass
 header.d=palmerwirelessmedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=palmerwirelessmedtechcom.onmicrosoft.com;
 s=selector2-palmerwirelessmedtechcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIKKREoH0ev2AUuy0xeN6HtprM/QUypBCH5MNbC3EME=;
 b=MzIfhOP+fmRkV+aeLml3WZy2XcZ67qctGNxLVHXUXfqcPNnGqucp8Xxdo1xI7eGBTJxBpVXHejKiyNjMgnQppm1GObpiu5kwvhNfXBwyAd6L9x4MZ1RUsTWb0TwpZtKfAN73xdL6lfSOH0b8S7QXXfuQKSMNmBkz3VIlyflq7jE=
Received: from IA1PR15MB6008.namprd15.prod.outlook.com (2603:10b6:208:456::5)
 by SA1PR15MB5047.namprd15.prod.outlook.com (2603:10b6:806:1da::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 19:50:06 +0000
Received: from IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e]) by IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 19:50:06 +0000
From: Steve Broshar <steve@palmerwirelessmedtech.com>
To: "lars@metafoo.de" <lars@metafoo.de>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Request for help: How to upgrade a sound driver from kernel 4.14 to
 6.6
Thread-Topic: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
Thread-Index: AdvGm2GwhjF7ALRDTa6EaezGwRm8Lg==
Date: Fri, 16 May 2025 19:50:06 +0000
Message-ID: 
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=palmerwirelessmedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR15MB6008:EE_|SA1PR15MB5047:EE_
x-ms-office365-filtering-correlation-id: 3c6086dd-fb56-4d6f-faa8-08dd94b2db8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?huEOkSCE4HpdwZWe20h1wgcwKaH7hHHlMQbyWU/fvFugfpfuE4xChAFY2zm3?=
 =?us-ascii?Q?+ToGws6G4olyFKhqGTmziUBA7klSgOx4ywVSe3D5yjsnKk3HFQ8bwDzQ+2pQ?=
 =?us-ascii?Q?QvwxXoM5CfglkpAIzBnUnTAGKyOnvfSyc095n3uikUyaoJkcPlGBnMcko+7t?=
 =?us-ascii?Q?ThQb+Zof5z/qO0S6WTeuXvwedaMk1XM4ibABDDylDsgl8TN6faApVJ+ESYvU?=
 =?us-ascii?Q?GT3iG3DjfkAnmedZGB5Z+2g0HjACU96u9yqoBrvQeY/M6e8fo3JYZAC0Uf7f?=
 =?us-ascii?Q?YntEE/Z+wzB6grPTAhaHQesgeMZqhRJHfAdx5eOMaz21W/WRTh/h9UPPZ9G/?=
 =?us-ascii?Q?arsdG/kfcQtr23aAPRg7PhbTWJoUDdu82s2tw/yl7pgdH+2KHKDDXnGfN59N?=
 =?us-ascii?Q?LLVHeaRAojcV4h/42BNz54muDecTA7leq7rKuyAV5tK5I/IW8RrKBPRUlBvi?=
 =?us-ascii?Q?NOUKIAuikeJMQpzPGVamrhwjMjarUVZgOFVx5idzYjGpJkqx34PUz3iDixL9?=
 =?us-ascii?Q?sQ2hAZk2xp42DMxd1VpXkUltZALze2a98pM/WzPawzTCEP1tdNs93xflJOOd?=
 =?us-ascii?Q?5I/xzg8BhxdGDrhh19XsrBPMnMRMRPi9R0MM5kI4fGTtiToFF9rUrCaclsup?=
 =?us-ascii?Q?i1Nkucye/uxdhqnFVwrSG+dvttyW9H7jM4aIMwDjW18Q37HPQsZgkFXzN1Zu?=
 =?us-ascii?Q?sG6ufRN6yNL4kPWsti6nlA+QIIgouumgBVeoa1aR0tPw4kVcRE8hp5LbsDxq?=
 =?us-ascii?Q?LEDR+bC2tff1+lAx1rXmHJX9wDYpITIo9Z62sw90/UtmLfTnSAUhojgTtnE9?=
 =?us-ascii?Q?rAO0n52ca3Z2h4R5tL5AH4DaPTdO6reyjtNemyzhEBqRh9/uzwg3rqhynEMI?=
 =?us-ascii?Q?cSzt+UxMcVfHkojhMexxxMM37jkATJYuztHNUZJjrW+vj501XOVHPC7JJuZE?=
 =?us-ascii?Q?JalzYztcd6k61HxzxN3tBV9IhyZhrowARXsQmbaT0eGlO31CGKKbK7KdWb0T?=
 =?us-ascii?Q?vghaIq4mnTqG3KEvgI+vdBKBlErWz73huYwRjIkemKcFzJ4pMqVXAYMGF6KS?=
 =?us-ascii?Q?KQIkeCB+55B7a8ItZaPZm8musbYZMyv/LoHpe3V4LaNZweA5PVp9tFaIrJT4?=
 =?us-ascii?Q?l/EGSIbJcV9wflMywIXrt9N25PxrQHTuFkbLLR4PSVP4zmDBsCdZGM5XMEai?=
 =?us-ascii?Q?w9a0eKzvfTwXC8WZhjrKWSEhzwHqfxfL4dqZR60CdZ8u+Hv/buC3TBA2WuAy?=
 =?us-ascii?Q?7Aumtp/Ot9A2iZhjJESGyp9kWpW5pPQWb9O9YV0OJ6WOojJBdo1q5YrGI3xl?=
 =?us-ascii?Q?9b5JW9QxPPdXz+dvWyBD87XxTH7XVIPN5JwlEC1JpJevv0LMJ3kPynlI242g?=
 =?us-ascii?Q?HEczq3U3OIbkSIHo+D/H+Q2gpw3kpbdjrRpMYx1onSGxb5FV/qa15FS0V/Jv?=
 =?us-ascii?Q?eVbWDtCq6cNmQFPQcYAsW3TUVAYF9+Sm4/pznImSMo0mfMAay/ITsw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR15MB6008.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MWF1oHl5SjFpaN5N5zUJ0b0Tsd322URQfsrvcgKd7CJv5+bXsSRp1GO1fCp4?=
 =?us-ascii?Q?a7rx+u9iJ3Fi8gOtIVvcUO3bikk4JtuWzBIZzShOhuclc6y0eAM3jX8KvE8l?=
 =?us-ascii?Q?o8OHw9By8twv+odAmC/BSMNXAm2+XXQClbSDn1/CJvJ6s91jiZFDo6nSflhg?=
 =?us-ascii?Q?NdWVpF/0WrXTzAD4X8+dRP0fOhYFGNcXVAIt23h79goHiVl/0FNmXsid3QnU?=
 =?us-ascii?Q?d/rHIkA36KhJqhoqyEXGRF0k2lS1lrGFXDSw3NTnRqNcBDkjtMovEllfpOlL?=
 =?us-ascii?Q?at2/2n/9Ld99N7IjUyAMi66u2c+9ExpXkO7+aD232HfVIt6zKlvsRwyapzdg?=
 =?us-ascii?Q?/Y7pJRMDzQ7sLFqvBjRwZegIgEaGpFh7hsXwzN5if2tBJPi8W9rGTmtUpuJA?=
 =?us-ascii?Q?OfwvZquj8bZnuTNqbmWn90EE2eENHMQIkbrgud3Mkt7nGltwmfh82FzD5Pw+?=
 =?us-ascii?Q?aJQUPBFzH4+5mZbC+jrC416eG0snrDhX2a47sfV56G57pMVYP7e1fBAUpFHN?=
 =?us-ascii?Q?D4KgufZFYxxbCO0+yAAD/QhAAqY7k+uavooZreOAnXWxExb1gYhMfgmYdbj1?=
 =?us-ascii?Q?oGRnlXH1FLfHGRAbdVU40eNdAbNToR2i1tWA6b7Sc9Z6yrPWvMq7GdWRbPOf?=
 =?us-ascii?Q?kEY802zTKCmw7dCgMSC9vJ3P765flJ6aLDwhrf0I55GK5GiXez7BDOBua2jq?=
 =?us-ascii?Q?RqhU1xymfmtZ2f5vfrMmTXAUluEei/eBzWY70ynBdS9VaHI2HLWIYGXu0VI6?=
 =?us-ascii?Q?IY62P0QKGa92cwMHRuR1X8SgEbPdNmcXFZvx7Sz0QRj8b/9018itmplHVx8Y?=
 =?us-ascii?Q?3YBxnMVaQDTZjfvnkA+njszhJHpmAieVK9P+ADC+qmbpjuwwmyGcrrHwT+mS?=
 =?us-ascii?Q?Pp+1AlVewulRj+2zsIDC2/rZ1z3l4YOKQlIMbSHJI7atwkXJ+7qWWVEwteBL?=
 =?us-ascii?Q?bRErwQQG2jdkdCOHHHenNrIUfSICXVj56wN4z/7ibeEBWpt5INU6E14rNFkU?=
 =?us-ascii?Q?NRZwRWWO9klVRVHdONrVSqAhzDl11DfryJnMyTJdLT1kln+pa/lXyMDYcRuF?=
 =?us-ascii?Q?u3RjNm2MQKeW71tEvAwSgvxhqE+XX+ogyB99zgAp331C6VRHx6E+/tG/SkSH?=
 =?us-ascii?Q?27zx8Ne3j0CUF7NHc2JJkf7eBpqUm/JuvxZgAyNXJ5MZArL6RHjWZiwuDMmw?=
 =?us-ascii?Q?6UZsyjtLL6xsaxWvLlOG9xfrfD6D3tSV54pGrsOo+KJjlI82LpI8ahZqYjYb?=
 =?us-ascii?Q?Ge3hK6/XwRBxEL16TtW5LW19MuyTyMbnX24Jl4k37wRhGE0S9FBc/MKGscCh?=
 =?us-ascii?Q?3MNvM5Kd0uD6+jQlEhMJAaQRtTtFdWuGiBoG9CHyb/vAm9UYUKtiB3TCJYVL?=
 =?us-ascii?Q?v+Ry6Xp65eRZ5sFpGrdMezwjCqk/jlu3FNX8vo0Gq5MqO9gIXKwfpz19jOQq?=
 =?us-ascii?Q?W8Ikuwnw3POGbjBrPhloei59iegNGlMZDDc2JkaPTJv9iOWm64aaiWyKsTc2?=
 =?us-ascii?Q?QBZwsIfxhSuSjv+50E5yjIPjC0wL9w/KVHJ8c9HdFl8ahKf5L8Np4evqU31/?=
 =?us-ascii?Q?o/9I1vYxDoGfGetN9ae5+plf6bP/bigSoiuuU/cpK0h5rrrRS0S8RA0b6rKU?=
 =?us-ascii?Q?SA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: palmerwirelessmedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR15MB6008.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c6086dd-fb56-4d6f-faa8-08dd94b2db8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 19:50:06.4482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 18187d5c-662c-4549-a9f0-3065d494b8dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 vrhLmauSGgf/DSZWKsIVMmYEThwfqEhVSYh/75T5nYEM1WXOI49xpv4u9pT18xor1c2Sm/ud1tMeA7JT34uTUAcYG7PX57qbImAhD3zpnic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB5047
Message-ID-Hash: GHDLHJU6BQL2ZDZXRXF2QZ6QGG2BYRA3
X-Message-ID-Hash: GHDLHJU6BQL2ZDZXRXF2QZ6QGG2BYRA3
X-MailFrom: steve@palmerwirelessmedtech.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OI2UBDEZIM6UY5WNHRHR4QVDUGUYBX25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have an audio driver/module that builds for kernel 4.14, but not for 6.6 =
due to changes in the kernel API.I find that API types (structs) and functi=
ons have been removed or changed, but IDK how to modify my code to use the =
updated API. Further, some of the changes seem less than clean. For example=
, in a couple places struct fields have been removed, but comments that use=
d to precede the fields are still there such the comments are clearly no lo=
nger relevant and are therefore confusing. I have to wonder how many commen=
ts are out-of-date.

My ask is for help fixing my code. I don't expect you to fix directly, but =
I need to know how to go about figuring out how to fix it. What changed in =
the API? Is there an upgrade guide/info?=20

I am going to include more than a little info. I realize that it might be o=
verwhelming. But, I fear that I try to reduce the info too much it will not=
 convey the relevant context.

I'll start with my analysis of my compiler errors that I get.=20
	Seems that the struct snd_soc_codec and struct snd_soc_codec_driver were r=
emoved.
	Seems that snd_soc_register_codec() and snd_soc_unregister_codec() were re=
moved.
What replaces these things? What do I need to change to accommodate the rem=
oval of these?

FYI, here are my compiler errors:

<build-errors>
$ make -C ../../.. M=3D$PWD
make: Entering directory '/home/steve/code/compton-kernel'
  CC [M]  /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_=
i2s.o
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:110:=
38: warning: 'struct snd_soc_codec' declared inside parameter list will not=
 be visible outside of this definition or declaration
  110 | static int codec_driver_probe(struct snd_soc_codec *codec)
      |                                      ^~~~~~~~~~~~~
In file included from ./include/linux/device.h:15,
                 from ./include/linux/platform_device.h:13,
                 from ./include/linux/of_device.h:5,
                 from /home/steve/code/compton-kernel/drivers/compton/dep-i=
mx8-i2s/dep_i2s.c:7:
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In =
function 'codec_driver_probe':
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:112:=
19: error: invalid use of undefined type 'struct snd_soc_codec'
  112 |     dev_info(codec->dev, "Entered %s", __func__);
      |                   ^~
./include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_prin=
tk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
     \
      |                         ^~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:112:=
5: note: in expansion of macro 'dev_info'
  112 |     dev_info(codec->dev, "Entered %s", __func__);
      |     ^~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: At =
top level:
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:116:=
21: error: variable 'codec_driver' has initializer but incomplete type
  116 | static const struct snd_soc_codec_driver codec_driver =3D {
      |                     ^~~~~~~~~~~~~~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:=
6: error: 'const struct snd_soc_codec_driver' has no member named 'probe'
  117 |     .probe =3D codec_driver_probe,
      |      ^~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:=
14: warning: excess elements in struct initializer
  117 |     .probe =3D codec_driver_probe,
      |              ^~~~~~~~~~~~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:=
14: note: (near initialization for 'codec_driver')
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
6: error: 'const struct snd_soc_codec_driver' has no member named 'componen=
t_driver'
  118 |     .component_driver =3D {
      |      ^~~~~~~~~~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: error: extra brace group at end of initializer
  118 |     .component_driver =3D {
      |                         ^
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: note: (near initialization for 'codec_driver')
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: warning: excess elements in struct initializer
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: note: (near initialization for 'codec_driver')
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In =
function 'platform_driver_probe_':
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:153:=
12: error: implicit declaration of function 'snd_soc_register_codec'; did y=
ou mean 'snd_soc_register_dai'? [-Werror=3Dimplicit-function-declaration]
  153 |     stat =3D snd_soc_register_codec(&pdev->dev, &codec_driver, &dai=
_driver, 1);
      |            ^~~~~~~~~~~~~~~~~~~~~~
      |            snd_soc_register_dai
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In =
function 'platform_driver_remove':
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:166:=
5: error: implicit declaration of function 'snd_soc_unregister_codec'; did =
you mean 'snd_soc_unregister_dai'? [-Werror=3Dimplicit-function-declaration=
]
  166 |     snd_soc_unregister_codec(&pdev->dev);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
      |     snd_soc_unregister_dai
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: At =
top level:
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:116:=
42: error: storage size of 'codec_driver' isn't known
  116 | static const struct snd_soc_codec_driver codec_driver =3D {
      |                                          ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:243: /home/steve/code/compton-kernel/d=
rivers/compton/dep-imx8-i2s/dep_i2s.o] Error 1
make[1]: *** [/home/steve/code/compton-kernel/Makefile:1921: /home/steve/co=
de/compton-kernel/drivers/compton/dep-imx8-i2s] Error 2
make: *** [Makefile:234: __sub-make] Error 2
make: Leaving directory '/home/steve/code/compton-kernel'
</build-errors>

My code (for 4.14 kernel)
---------------------------------
Here's my driver code. The macro INCLUDE_PROBLEMATIC_CODE is used around ea=
ch chuck that fails to compile. If not defined, the code does compile, but =
of course is missing important parts.

<my-code>
#define INCLUDE_PROBLEMATIC_CODE
/*
 * Audindate Dante Embedded Platform (DEP) I2S Codec (ALSA SoC) driver; Lin=
ux module
 * Supports sample rates, bit depths and TDM modes for Dante devices.
 */
#include <linux/module.h>
#include <linux/of_device.h>
#include <linux/clk.h>
#include <sound/soc.h>
#include <sound/pcm.h>
#include <linux/printk.h>

#define DEP_I2S_PCM_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | \
                       SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 | \
                       SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000)
#define DEP_I2S_PCM_FORMATS (   SNDRV_PCM_FMTBIT_S16_LE |  \
                                SNDRV_PCM_FMTBIT_S24_LE | \
                                SNDRV_PCM_FMTBIT_S32_LE )

// for future use
struct instance_state {
    unsigned int dummy_holder;
};

static const struct snd_soc_dapm_widget widgets[] =3D {
    SND_SOC_DAPM_DAC("DAC", "Playback", SND_SOC_NOPM, 0, 0),
    SND_SOC_DAPM_ADC("ADC", "Capture", SND_SOC_NOPM, 0, 0),
    SND_SOC_DAPM_OUTPUT("LINEVOUT"),
    SND_SOC_DAPM_INPUT("LINEVIN"),
};

static const struct snd_soc_dapm_route routes[] =3D {
	{ "LINEVOUT", NULL, "DAC" },
	{ "ADC", NULL, "LINEVIN" },
};

static int set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
{
    switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
        case SND_SOC_DAIFMT_I2S:
            // supported
            break;
        case SND_SOC_DAIFMT_LEFT_J:
            // supported
            break;
        default:
            // all other formats unsupported
            dev_err(dai->dev, "Invalid DAI format: DEP I2S only supports le=
ft justified and I2S, got 0x%04X", fmt);
            return -EINVAL;
    }

    switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
        // codec as bit master and frame master (or external clock generato=
r)
        // note that jumpers on DEP-EVK-IMX8 must be set correctly
        case SND_SOC_DAIFMT_CBM_CFM:
            // supported
            break;
        // codec as bit slave and frame slave (ie clocks driven from SOC)
        case SND_SOC_DAIFMT_CBS_CFS:
            // supported
            break;
        default:
            // all others unsupported
            dev_err(dai->dev, "Invalid DAI format: DEP I2S only supports CO=
DEC as bit and frame clock master, got 0x%04X", fmt);
            return -EINVAL;
    }

    switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
        default:
            // support bit and frame inversion
            break;
    }

    dev_info(dai->dev, "Set fmt to %u", fmt);
    return 0;
}

static struct snd_soc_dai_ops dep_i2s_dai_ops =3D {
    .set_fmt =3D set_fmt,
    // add mute here
};

struct snd_soc_dai_driver dai_driver =3D {
    .name =3D "dep-i2s",
    .playback =3D {
        .stream_name =3D "Playback",
        .channels_min =3D 1,
        .channels_max =3D 16,
        .rate_min =3D 44100,
        .rate_max =3D 192000,
        .rates =3D DEP_I2S_PCM_RATES,
        .formats =3D DEP_I2S_PCM_FORMATS,
    },
    .capture =3D {
        .stream_name =3D "Capture",
        .channels_min =3D 1,
        .channels_max =3D 16,
        .rate_min =3D 44100,
        .rate_max =3D 192000,
        .rates =3D DEP_I2S_PCM_RATES,
        .formats =3D DEP_I2S_PCM_FORMATS,
    },
    .ops =3D &dep_i2s_dai_ops,
    .symmetric_rate =3D 1,
};

#ifdef INCLUDE_PROBLEMATIC_CODE

// Dummy probe
static int codec_driver_probe(struct snd_soc_codec *codec)
{
    dev_info(codec->dev, "Entered %s", __func__);
	return 0;
}

static const struct snd_soc_codec_driver codec_driver =3D {
    .probe =3D codec_driver_probe,
    .component_driver =3D {
		.dapm_widgets		=3D widgets,
		.num_dapm_widgets	=3D ARRAY_SIZE(widgets),
		.dapm_routes		=3D routes,
		.num_dapm_routes	=3D ARRAY_SIZE(routes),
	},
};

#endif

#if defined(CONFIG_OF)
static const struct of_device_id match_table[] =3D {
    {.compatible =3D "audinate,dep_i2s"},
    {}
};
MODULE_DEVICE_TABLE(of, match_table);
#endif

static int platform_driver_probe_(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "Entered %s", __func__);

    int stat =3D 0;

    struct instance_state *instance_state =3D devm_kzalloc(&pdev->dev, size=
of(struct instance_state), GFP_KERNEL);
    if (instance_state =3D=3D NULL) {
        return -ENOMEM;
    }

    platform_set_drvdata(pdev, instance_state);
   =20
    dev_info(&pdev->dev, "Codec probe pt 2");

#ifdef INCLUDE_PROBLEMATIC_CODE
    // 1 =3D=3D number of DAIs, might need to be 2 for dual direction, or f=
or 2* sai?
    stat =3D snd_soc_register_codec(&pdev->dev, &codec_driver, &dai_driver,=
 1);
    if (stat < 0) {
        dev_err(&pdev->dev, "Failed to register codec: %d", stat);
    }
#endif

    return stat;
}

static int platform_driver_remove(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "Entered %s", __func__);
#ifdef INCLUDE_PROBLEMATIC_CODE
    snd_soc_unregister_codec(&pdev->dev);
#endif
    return 0;
}

static struct platform_driver platform_driver =3D {
    .probe      =3D platform_driver_probe_,
    .remove     =3D platform_driver_remove,
    .driver     =3D {
        .name   =3D "dep-i2s-codec",
        .of_match_table =3D of_match_ptr(match_table),
    },
};

module_platform_driver(platform_driver);

MODULE_DESCRIPTION("Audinate DEP generic I2S ASoC codec");
MODULE_AUTHOR("James Stuart <opensource@audinate.com>");
MODULE_ALIAS("platform:dep-i2s-codec");
MODULE_LICENSE("GPL");
</my-code>

Steve Broshar
Palmer Wireless Medtech

