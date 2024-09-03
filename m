Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B19969729
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 10:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F8FCA4D;
	Tue,  3 Sep 2024 10:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F8FCA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725352473;
	bh=z5fAYwNJ6IWgtOrRpOWzsjf5y77NlyOrGpfYeWLx93I=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NoY9nklu2UX+crimGddWnr2GSg8NQQJtbP6JHw4KPVwgM1IAlL06aRBhz0aol0F8P
	 4xHfjyA5aw7MJvoxVrj7pnFLFxR6ofrkfKq/iHoneRD1S0NHd26Jo8bvVHI6Z//Z7z
	 iPDTrWxPG2mWzrP1rQRV53HahB2BV/PpDwK80erY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0E14F8016C; Tue,  3 Sep 2024 10:34:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E74FF804F3;
	Tue,  3 Sep 2024 10:34:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5AFFF80199; Tue,  3 Sep 2024 10:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from SE2P216CU007.outbound.protection.outlook.com
 (mail-koreacentralazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A682DF80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 10:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A682DF80107
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjIn8dane+ChckGnHAelpKRwhbSXCfihV5MnCjBNY2vty4gRLi+LqMHOi5M4UqrYE/9gA9JofPEsDpE/ZF2xCmPLrMGOUfeoIO7RXiGOcW88ggtBbI/eJMuk0ke5uCi+DdcRUjbYQ/Kz5Y0WNP+hofF8+/4ZODR4oXS6osbpCWS1zov85VjqJrQZQmoJL792vpAYHJv0hdmspdt6QVRRK87CSDGvZDTYoagfaR1W0WDxwuyXzToIBsJPYjiLwmreAZpzEPUttayyxygWyA3/8SDSbuJ+xaHrVZdus484HAeglTlCBHfGm90Z6ZM3i7n9vp+xq0rYpsUVjV4vI6Y/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5fAYwNJ6IWgtOrRpOWzsjf5y77NlyOrGpfYeWLx93I=;
 b=PCqV0HnsVtPnsq+X9mUMoAsrxt8+HRP5zrz2/fsbCoU6LBWi9wEjZHUmGcXES8AAbyvFExdAWEaaBoMoB4MRBaLFeHYuC/NqH7BjbkdlG7L/rKKBvwWSrkxed4FeC4k3dSt3WRuhiyWL1bUEnHTt6t5sjXj6bs3/8jx6hQYXI3KwDfiF9k8DxgOC6R5JiQki1D9vl6zfjgoNqcq8mmesvp3PBqCsXH3B0+ks3UwWDuef9y9NaCIHhj893ZredsBtcqgZP+Kq2LNG9wIFSMC4QlcsZtw1tetISWNS6GeyU2281KatnM2bDsu9XxryC83b3tQZ99lRzwB6dWub0AD8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SL2P216MB1563.KORP216.PROD.OUTLOOK.COM (2603:1096:101:31::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:33:44 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:33:44 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Application <application@irondevice.com>
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Topic: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Index: AQHa/cRjERJUfF8g1keevq2iDIPRt7JFoWwAgAAbBXA=
Date: Tue, 3 Sep 2024 08:33:44 +0000
Message-ID: 
 <SL2P216MB23372552D5345013CDEB43318C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
 <3gu6u7euavq272kaf2znmyn5p3rd3vupvqldvfxnq7nh5ul6jx@apwfcxvgkoyj>
In-Reply-To: <3gu6u7euavq272kaf2znmyn5p3rd3vupvqldvfxnq7nh5ul6jx@apwfcxvgkoyj>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SL2P216MB1563:EE_
x-ms-office365-filtering-correlation-id: 858220a3-e3ad-45b3-a024-08dccbf31fa9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VS9jMUR6WEljUTh6MkhpM0dmdVVLbWlEWUZJNHk3SWZ1R0VhQUpZTG9KT012?=
 =?utf-8?B?N3hjZlA2YU1WTWY3ZWpIZ0lrS1JFMXB2S3QrbXhhZ08zL0ZLU3dtSnVvOHdv?=
 =?utf-8?B?S25jbFlzcG0wMnVnckpHc3RROEJDQVNuaEpHMVB3cmxHMWhsSTFBK1kwVmR1?=
 =?utf-8?B?ZmZvcHdmWTFLZlpxdG9vc0xWSFRBZzgyZGczUDV3NEEvclhkSEJYdW9CQ2lV?=
 =?utf-8?B?eW03bWtsUVlBZWEwUE15UUlyT1Erb25VamZ3NjAvdmxObThZZ2xseWtQQUIy?=
 =?utf-8?B?SWdsWjl1d2lqRHF5U29FbG12c2paclNKb0M4S1QvZTE5VmJ6d0Y4L1Iwai9l?=
 =?utf-8?B?RHpFZjZqVUxmRWJRZ1hRbk5tWHd2L2drN2pCYkk4UVdkY0xpMGtPNDJHZTBH?=
 =?utf-8?B?SXVCalR4eURyR2d6Q2I4TjE0L0JSYytNWk01Wk5zZnJlVWc0emt2S3cxME0v?=
 =?utf-8?B?R25OcjI4S0RTbjBSd1JpVVlzMkIxeW5vTmpQMTl3NWx5YkxJVGQ1NU8rbVY5?=
 =?utf-8?B?SVhCdVFnYUNCM2tDYlptcVlNUkVvb1VHUE14UFVWdHU0L1BuWXBlVVA0ZHVt?=
 =?utf-8?B?Zm44ck5PeW9wUXBDcWxFb0JlUG5QU3hZem1yZzdQMFRLVjlSamYySitJNTRC?=
 =?utf-8?B?ODYvQnpHaFZuQmxadk8xVVhpWGNCWXBqWHF5ZGM4R2VLT1BUWXBackZYaktk?=
 =?utf-8?B?M0NrQUFUTEIzUS8rWVM1Y1RpbitsaVE2MEl1V0MvNWFhVURnWG8ySWlmS2w5?=
 =?utf-8?B?MlZ0MjJwRTdLVmZCVjh4MEVqRTJ6MkhvSVI4SmhacEp5NTFrbjc1Y21MNXQr?=
 =?utf-8?B?UHAwNzc2Qk9yV3l6QTdvVkRKOHRTdkhrajg5ZVhNNHJ6OEdBRkNpVHgvQlVk?=
 =?utf-8?B?KzA3eVYzQzBQVkJEamRIb21TQkF6OGFvajlTeGUwZ0hDaHhDVW9zZnc3cGxy?=
 =?utf-8?B?Ym9ibU1TYkFTZUp4VW9YTWZFQUlWRzYvTGdWN3BQaHBybXZGMXZockExUkdF?=
 =?utf-8?B?bloxbVFUTHY4SkkrZGZkc2p6aE05eGhVV2QvQkZtRVhMakxFaFVsd2xlYi9s?=
 =?utf-8?B?d0ZoODZmRmZTUzNxN0tjUjY3WVY4WE52a0xQYitvdHhPN2JwZ2xZcksyalp2?=
 =?utf-8?B?Vm95cHRLbzRobjB4NzVvRXZrd25qbngrcTZ5RHRlVCtkSFBHK041ekV3ZEFB?=
 =?utf-8?B?RmJVSG5GcFB6TWxkd2R5S1hSYVpabjVINGpJTHNJMkwyMml2SlZZNS9WdGh3?=
 =?utf-8?B?OFdFV2c4YzBseTNvSGcwM1Z4Yi9vUHF4aFJUcGFkeEFleEI2WHhUaEVWRHdS?=
 =?utf-8?B?UHpCRlNrNUJWdnk0Z3hLYXpTUDZhbWVHVnpxbnZFK0RDSG5xemd1ZnIxTnRP?=
 =?utf-8?B?dSs4SXREblE0S20rZXZwZnJiSm5HUCt1WjJ1NVQyeHhjdkhZYm9OWnRyNzh6?=
 =?utf-8?B?VlJVZ1VaNlN3MWZ4cnZIL2R1ZWNBZiszSXMwK09yc2ZYclFMSERhLzZNdkJC?=
 =?utf-8?B?OGhtcm1SU1U0TVV5WmdwTzVTRnVsSWhidWh3YVk4R2xiWlNkOStJZDBTQVhY?=
 =?utf-8?B?S2wyWkpXUWlCSTRnTG9VSmdhU3N0SUNxcGdlbSt2NFE5Tkw2eGpxbUFSR1dt?=
 =?utf-8?B?aVJXUGpsTDhIeHRsSkVFbE9DSFN3VzVFUE5JQTJFU0xzRS95OEthM01VYmpu?=
 =?utf-8?B?RnU3NndoYlZybjRpdlgrYkVsSzhtOEtUTFdESENFZGdBZlRhWlFvbTB3NW5i?=
 =?utf-8?B?UkdKbGlrNjMyMUU0T3VUTEZCVUdaVld3cFNrRkp1WVNqWUFkQXNFMWJrLzJV?=
 =?utf-8?B?MTR1U2hkUTNqaGk0WCt6UEV4RHBTSGZBa3JHS0U1N0xTbVNmSDhDMzBCby9m?=
 =?utf-8?B?d2VuYjNGOUc2ZG9XcTZlOGl0MnRoRUl0ZzRPOEQ5eEVTR2c9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZTl4NWUrSEt3ajBwNlRlRFFhamozSEgwOUdSS1NqU0hoSy9IckJMZUo3N2Rl?=
 =?utf-8?B?cFVEaGZGbllxZkN4czNYbEhoWnNvclNOdDdNaEltck54QXR5WWE0N3k2Mkdy?=
 =?utf-8?B?UFkwVFQyb0JyazZSNFUzNHZnaDVCWGpJZUpNeG1GNTBxSWtzUHdtME13d0xI?=
 =?utf-8?B?N0JaREt2b3JKenMwR2RwamhqZWhmSmV3dm9oL0x6Nk1jT0lYMXdiZEtwUXUw?=
 =?utf-8?B?ZlJBVHFzUytHUHFYdUZpTlA3M3gvbDhSamFJTldoUGszOVpra1ByT2pNNXdZ?=
 =?utf-8?B?ZHN2Nk9zdE8wVjY4SEZMcUN6ZUNnUk04TFcwSXRUdVBvUE9SczBzblUzSnhW?=
 =?utf-8?B?bFFDK1NaK2xkcHpGUEFjVGdHakNQbmo1MzJ6blV3K0FFV2tKZUYxRFdvc3B4?=
 =?utf-8?B?Z1pGVzlQbFFkRHY2NXF4THJPVnFIY0d0NnVVOEo4eUdwT2pEd0JVWGFHTVJ0?=
 =?utf-8?B?ZnptRjlTQUxHeTQ5Zittd0s5RXMrVGI4VWt1Z3JFYlVjVXhSUXRmNGpGQ0NH?=
 =?utf-8?B?TjFJWmtZcWs4WHdNcVIvMVk2UEpGSnp3YUFzNS9sYUpkdFRRYWFCTFJMWXpu?=
 =?utf-8?B?aFhoUG01ZVRaMFZTWU5YRmdUSnFHUjdLZkFpUFoxWEdEc0RkK01LRXZpMHJG?=
 =?utf-8?B?Q3hUazZFa0pHdzlvcmlXbWxydkNoTDZjVitqWGhoL0RIcXdNOUxkR0xoVFVv?=
 =?utf-8?B?TDJEZ0tvUGtIZS81bENWNUlxYXlKOHVwdXBTMDg5OE1iZzJPMER0dkdvVGRm?=
 =?utf-8?B?MlliV3FRd2dUTHlhQzVhcmMyUjl3ZTVPUHlNUGJCdnh5bGQyUG0rdDBKNVNq?=
 =?utf-8?B?OWRXbTljdERsVklBVXg2dk4yWDduRGdxdXM2THU4T0ZSdzI0SS9ZQ2JHRndF?=
 =?utf-8?B?ajRGWHZwU2d4NzBVd1FQVkI1THhmcmVuMTloczg3aWxhc0ZLVFlueW1JRE1R?=
 =?utf-8?B?V1ArRU5yYm0zQzhjOHRGNlovL1MyaFFCc2xLOVdZMEtLNVRrVTl0V0R6dklG?=
 =?utf-8?B?dFpoTlQwU1NMOTNNcExhdWc1OFRUSHRCWFVvd0lNK3daRGs3cjgvbXFOY1RG?=
 =?utf-8?B?S1o2NFg5VEhEd080eUdsUDdnMU9mVG9VNmlSTzR6SW9xV0xkTWZOWkVFdjRX?=
 =?utf-8?B?R2hqUWhhLzhQU1ZxWmxmSktyUXN4SThTc3BrTFFBQS92dm5tR1hzeCtyS0Fz?=
 =?utf-8?B?N25IV1UvNmVaL2VERVJaSjNFYis2cllCeUh1a0k5N3NsYVRCR2lacHdrNlox?=
 =?utf-8?B?bjRYblRJMGMyUlVxUDIrcVNkVURSMXpRM2pURXpoQlUrUWkyU0JXUHJkZ0JC?=
 =?utf-8?B?TEQ4QlZNYTEzeHFPUG0vRHpDRTNFb2N5azJvNldSMVkzYWpSekJGenlONlJR?=
 =?utf-8?B?L1U5OGVqRUZBcUlQSStGODkxK1VTbXpBWE5PMVdRVVY1Qms0TjA1S0VPa1p1?=
 =?utf-8?B?NmN4Y3QxZHZhSzh2SkxlUWs4OHd1NG04UUtvUGtFU2VwUkhETmhUNE1yS1NP?=
 =?utf-8?B?cUdGd1lMeStOT3p1cXNtNjg5eEpIdUdZdWlsZXlua0VSMC9sUXhRY0htQmlJ?=
 =?utf-8?B?Y01rcmpMV0d5TnpqdWdpbzIyR1dTN0JlM3k3U1FHSXI4TmlMVGVaMUdGVmNF?=
 =?utf-8?B?OHJDVDRpNmEwWFBJZWYvd2JNTkl1eVNKUXRzc0xJOExiVDZaQm9hK3dwcERP?=
 =?utf-8?B?YW95ZitkY3hPeHpDdDM1UUh3alkwV21QdUtqZUVHNHhURERFYk1PTUdNeUV1?=
 =?utf-8?B?NnNQWUFic295cFhaTUhVUDN6d3VEQWZUKzJjeXdvQWZsUEpLSGliaTJxeHVs?=
 =?utf-8?B?N0V6dTVvbWRHTE1hN0lZWnJrMUFYSkV2b2JMcWc3LzFJUU83MjlSZ1RTTDcv?=
 =?utf-8?B?UktqSTdsSVZ1bDlmL0N5aVEvTTcvR0tBRnRPR2dOM1BHWnhHVTN1RVp6SnhU?=
 =?utf-8?B?OG9VN2pSRWlWNHVnd2JML1M2OHg5bHYvNlZ0TUMyTHVPTXRFVXR0RkdUVmlG?=
 =?utf-8?B?eW9KQTAxTTdsQmNpMDhneUlpSFU0MnRLQndOR1M5ZHg0cWYxcGxta3VIVEV1?=
 =?utf-8?B?OUFaV1B4VnhXRjlNS0dQUU5jTHl5cStuZGlHRktXVENsSVNSelNPZGJ4bnBo?=
 =?utf-8?Q?0F0ZtKD1O9pQzClWywXHoei0C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 858220a3-e3ad-45b3-a024-08dccbf31fa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 08:33:44.8296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6kpRJB7PJxebQztIXAqbARs4CVNY5aAo73bRhNecF/JSsh8PegAl8/3yMJSQ73fA2/AIPBM2BULKI/tB3yAuxFTLr1VxT/v7VAyXo+FuIrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1563
Message-ID-Hash: HF65K6WGHTYSXOEPNAFSVFZ2QFGCCPOC
X-Message-ID-Hash: HF65K6WGHTYSXOEPNAFSVFZ2QFGCCPOC
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVR35PPUO2ZRNVVKSD7P42SX34TTUEWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiBPbiBUdWUsIFNlcCAwMywgMjAyNCBhdCAwMjo0NDozM1BNICswOTAwLCBLaXNlb2sgSm8gd3Jv
dGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogS2lzZW9rIEpvIDxraXNlb2suam9AaXJvbmRldmljZS5j
b20+DQo+ID4gLS0tDQo+ID4gIHNvdW5kL3NvYy9jb2RlY3MvS2NvbmZpZyAgIHwgICAgOCArDQo+
ID4gIHNvdW5kL3NvYy9jb2RlY3MvTWFrZWZpbGUgIHwgICAgMiArDQo+ID4gIHNvdW5kL3NvYy9j
b2RlY3Mvc21hMTMwNy5jIHwgMjE5MQ0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICBzb3VuZC9zb2MvY29kZWNzL3NtYTEzMDcuaCB8ICA0NTQgKysrKysrKysN
Cj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNjU1IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNvdW5kL3NvYy9jb2RlY3Mvc21hMTMwNy5jICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gPiBzb3VuZC9zb2MvY29kZWNzL3NtYTEzMDcuaA0KPiA+DQo+IA0KPiBXaGF0IGFyZSB0aGUg
ZGlmZmVyZW5jZXMgYWdhaW5zdCBzbTEzMDM/IFdoeSBpdCBjYW5ub3QgYmUgbWVyZ2VkIHRoZXJl
Pw0KPiBZb3UgaGF2ZSBlbnRpcmUgY29tbWl0IG1zZyB0byBleHBsYWluIHRoaXMgaW5zdGVhZCBv
ZiBqdXN0IHNlbmRpbmcgZW1wdHkNCj4gY29tbWl0Lg0KDQpJIHdpbGwgYWRkIGEgY29tbWl0IG1l
c3NhZ2UgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0Y2guDQoNCg0KPiA+ICsJdW5zaWdu
ZWQgaW50IHRzZHdfY250Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBzbWEx
MzA3X3BsbF9tYXRjaCBzbWExMzA3X3BsbF9tYXRjaGVzW10gPSB7DQo+IA0KPiBjb25zdA0KDQpP
a2F5ISANCg0KPiA+ICsNCj4gPiArLyogREIgc2NhbGUgY29udmVyc2lvbiBvZiBzcGVha2VyIHZv
bHVtZSAqLyBzdGF0aWMgY29uc3QNCj4gPiArREVDTEFSRV9UTFZfREJfU0NBTEUoc21hMTMwN19z
cGtfdGx2LCAtNjAwMCwgNTAsIDApOw0KPiA+ICsNCj4gPiArc3RhdGljIGludCBzbWExMzA3X3Jl
Z21hcF93cml0ZShzdHJ1Y3Qgc21hMTMwN19wcml2ICpzbWExMzA3LA0KPiA+ICsJCQkJdW5zaWdu
ZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHZhbCkgew0KPiA+ICsJaW50IHJldCA9IDA7DQo+ID4g
KwlpbnQgY250ID0gc21hMTMwNy0+cmV0cnlfY250Ow0KPiA+ICsNCj4gPiArCXdoaWxlIChjbnQt
LSkgew0KPiANCj4gU29ycnksIGJ1dCB3aHk/IFdoYXQgaXMgc28gYnJva2VuIGluIHRoaXMgaGFy
ZHdhcmUgdGhhdCBpdCByZXF1aXJlcyBzdWNoDQo+IHJldHJpZXM/IE1heWJlIGp1c3QgeW91cm8g
Ym9hcmQgaXMgYnJva2VuLCBub3QgdGhpcyBjb2RlYz8NCj4gDQoNCkdlbmVyYWxseSwgaWYgdGhl
cmUgYXJlIG5vIGlzc3VlcywgcmV0cmllcyBzaG9sZCBub3Qgb2NjdXIgYW5kIGl0IHNob3VsZCBl
eGVjdXRlIG9ubHkgb25jZS4NCkNvdWxkIHRoaXMgYmUgYSBwcm9ibGVtPw0KDQpJIGluY2x1ZGVk
IHRoZSByZXRyaWVzIGJlY2F1c2UgdGhlcmUgbWlnaHQgYmUgaXNzdWVzIHdpdGggdGhlIGNvbm5l
Y3Rpb24uDQoNCg0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgc21hMTMwN19yZW1vdmUoc3RydWN0
IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpIHsNCj4gPiArCXN0cnVjdCBzbWExMzA3X3By
aXYgKnNtYTEzMDcgPQ0KPiA+ICtzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25l
bnQpOw0KPiA+ICsNCj4gPiArCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc21hMTMwNy0+Y2hl
Y2tfZmF1bHRfd29yayk7DQo+IA0KPiBXaHkgZG8geW91IGNhbmNlbCB3b3JrIGluIHR3byBkaWZm
ZXJlbnQgcGxhY2VzPw0KDQoNCg0KPiA+ICsNCj4gPiArCXNtYTEzMDcgPSBkZXZtX2t6YWxsb2Mo
JmNsaWVudC0+ZGV2LA0KPiA+ICsJCQkgICAgICAgc2l6ZW9mKHN0cnVjdCBzbWExMzA3X3ByaXYp
LCBHRlBfS0VSTkVMKTsNCj4gDQo+IHNpemVvZigqKQ0KPiANCg0KU29ycnkuIFdoYXQgZG9lcyBp
dCBtZWFuPw0KDQoNCj4gPiArDQo+ID4gKwlyZXQgPSBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfY29t
cG9uZW50KCZjbGllbnQtPmRldiwNCj4gPiArCQkJCQkgICAgICAmc21hMTMwN19jb21wb25lbnQs
IHNtYTEzMDdfZGFpLA0KPiA+ICsJCQkJCSAgICAgIDEpOw0KPiA+ICsNCj4gDQo+IERyb3AgYmxh
bmsgbGluZQ0KDQpPa2F5LCBXaGVuIHVzaW5nICdMaW5kZW50JywgbGluZSBicmVha3MgbGlrZSB0
aGlzLg0KSSdsbCByZXZpZXcgYW5kIGZpeCB0aGlzLg0KVGhhbmtzIQ0KDQoNCj4gPiArDQo+ID4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBzbWExMzA3X2kyY19pZFtdID0gew0K
PiA+ICsJeyAic21hMTMwNyIsIDAgfSwNCj4gPiArCXsgfQ0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAr
TU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIHNtYTEzMDdfaTJjX2lkKTsNCj4gPiArDQo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNtYTEzMDdfb2ZfbWF0Y2hbXSA9IHsNCj4g
PiArCXsuY29tcGF0aWJsZSA9ICJpcm9uZGV2aWNlLHNtYTEzMDdhIiwgfSwNCj4gPiArCXsuY29t
cGF0aWJsZSA9ICJpcm9uZGV2aWNlLHNtYTEzMDdhcSIsIH0sCS8vQUVDLVExMDAgUXVhbGlmaWNh
dGVkDQo+IA0KPiBEcm9wLCB1c2VsZXNzLiBBbHNvIGRvZXMgbm90IG1hdGNoIHlvdXIgSTJDIElE
IHRhYmxlLg0KDQpUaGUgU01BMTMwN0EgYW5kIFNNQTEzMDdBUSBhcmUgZGlmZmVyZW50IGNoaXBz
IHdpdGggZGlmZmVyZW50IGRldmljZSBzZXR0aW5ncy4NClRoZXJlZm9yZSwgd2hlbiByZWdpc3Rl
cmluZyBpbiB0aGUgZGV2aWNldHJlZSwgSSBpbnRlbmRlZCB0byByZWdpc3RlciB0aGUgc3BlY2lm
aWMgcHJvZHVjdCBhbmQNCkNvZmlndXJlIHRoZSBkZXZpY2Ugc2V0dGluZ3MgYWNjb3JkaW5nbHku
DQoNCkkgc2V0IHRoZSBJMkMgSUQgdGFibGUgdG8ganVzdCAnc21hMTMwNycgYXMgc2hvd24uDQpT
bywgc2hvdWxkIEkgY2hhbmdlIGl0IHRvICdzbWExMzA3YScgYW5kICdzbWExMzA3YXEgaW5zdGVh
ZD8NCg0KPiBBbnl3YXksIGJpbmRpbmdzIGFyZSBiZWZvcmUgdGhlaXIgdXNlcnMuDQo+IA0KPiAN
Cj4gPiArCXsgfQ0KPiA+ICsvKiBTTUExMzA3IFJlZ2lzdGVycyBCaXQgRmllbGRzICovDQo+ID4g
Ky8qIFBvd2VyIE9uL09mZiAqLw0KPiA+ICsjZGVmaW5lIFNNQTEzMDdfUE9XRVJfTUFTSwkJCSgx
PDwwKQ0KPiA+ICsjZGVmaW5lIFNNQTEzMDdfUE9XRVJfT0ZGCQkJKDA8PDApDQo+ID4gKyNkZWZp
bmUgU01BMTMwN19QT1dFUl9PTgkJCSgxPDwwKQ0KPiANCj4gVXNlIEJJVCgpIGV2ZXJ5d2hlcmUu
DQo+IA0KDQpPa2F5LCB0aGFua3MhDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
