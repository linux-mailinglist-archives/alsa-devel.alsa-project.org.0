Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469047475AB
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 17:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA79847;
	Tue,  4 Jul 2023 17:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA79847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688486035;
	bh=ivKX6RuIxeq0etr7HgdGFmH4BVYDuWKLCDXFJNEYETw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NnZCJrDvwlRIFnTaAnM+ngmou5/2mqUgCpZo0xCgBZ5WNHuvR9ccKU5ZcYlMpYcUq
	 srfO+sQHJFxSnOU/kAWafusuUIksR7+3BgDu7wxrEPEKZOm+i96i0yN5aNXHGCEzTR
	 44lJTShHYO8OXRq/vest1/8UrS6lLpI9yYbJn9yU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09A63F80557; Tue,  4 Jul 2023 17:52:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D7AF80544;
	Tue,  4 Jul 2023 17:52:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83752F80125; Tue,  4 Jul 2023 11:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B007F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 11:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B007F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=FaCXcMVS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arQqTawqiEmE4uRI25AB8hLGaq5wFfIUv/LUbMsJxD0Du41JNeRiO38TMU20ZkmHITmCXYsXvgfMihlN6Z/dEpkADsg5I68ot/ZSKY+qVPjfO+AfKPzMUJMOa46Wtf+NLk1nLa7gjUyQzz+TSOXuBWUVodpX4zHGWttLpDwWb1BfPLlKpYagBMhW9kaygfXeshu+oO8aX+yfPdPV4fxiNb3GbBAYTLTL4QB1itVOxBICXZFf3E1vk/ZxiNGHgm86V6+7VWIyqfkq3ZOXJe4QlbUNM6dSstSbM6C7g2d7XW1PGzop87MJEUhqp7xTQXr6/aGvKo0zZuPjX0AqSd5dZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivKX6RuIxeq0etr7HgdGFmH4BVYDuWKLCDXFJNEYETw=;
 b=mK2pMVTEafPDPDwCTxsSNzpoRcoSzdOLWQyFR6Q2D1mbyyjd7Fs4yJi/irI8B50xx6yXkY9t3iBJRThJE7rJd++ch7XrW6MtolDl4gL/webEfaLk8/CCTo4QXf8yz7oKAQKDAjmJEATO3YPDLqvPtVZVddV/4jAnF6a49dGVVEWfCFaEofRmRdgXDMOQCK9V7ktUNXcUsksC1MiOnsrKk9/+mRGF0m0R0tEo+R/t0brLPxfWCulUH+HTSnZaptGfmQhFhVYxJW+w5fIco6Hd4+4SynBbg6dhqfyvY+YyZw9X2XulTAOaIEtjNP2+a/UGcFIzqvhaysvH/rxuea3GYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivKX6RuIxeq0etr7HgdGFmH4BVYDuWKLCDXFJNEYETw=;
 b=FaCXcMVSYrN6ENxQXIYmlM152hawvpG3K2twIWOG6eJJs0LHOfsGH1B7r6TT3TjS0bARhPt8tIOKM+cBDTjzsHItIrA/5Tv2Xd7cJfQ0YpbRiejEkafKNKtF1o1hAJB2/Bk6PhvIld3ivO7eMV2/9tvLS9RnnfLHa7N7JcNc21k/WMBiE6AHxN4OXivcW3qaM/URYUmJBXIW0S+JcRDZxSe3qdyxzPUwkbRmbVlbllZYTqF4vWa6jXKEsBCGwhuhBUStP4/A+eICN/raXY2l4qSNR7sesk6emrdKvciOj0VMASKAaMR81zX8lj8hkcx//v5VwgMRvLLrzR+5KCyFVA==
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 TYZPR06MB6190.apcprd06.prod.outlook.com (2603:1096:400:33f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 09:39:46 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::c2b:41ab:3b14:f920]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::c2b:41ab:3b14:f920%6]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 09:39:46 +0000
From: =?gb2312?B?tsXD9L3c?= <duminjie@vivo.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>, "moderated list:SOUND"
	<alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
	opensource.kernel <opensource.kernel@vivo.com>
Subject: 
 =?gb2312?B?u9i4tDogW1BBVENIIHYxXSBzb3VuZDogcmlwdGlkZTogUmVtb3ZlIGR1cGxp?=
 =?gb2312?Q?cate_judgments_code?=
Thread-Topic: [PATCH v1] sound: riptide: Remove duplicate judgments code
Thread-Index: AQHZrlePKySMijxobUS2eeUkz61I06+pWACAgAABm3A=
Date: Tue, 4 Jul 2023 09:39:46 +0000
Message-ID: 
 <SG2PR06MB5288C3A9C331B71019AA07E5AE2EA@SG2PR06MB5288.apcprd06.prod.outlook.com>
References: <20230704091131.6662-1-duminjie@vivo.com>
 <878rbw2fb4.wl-tiwai@suse.de>
In-Reply-To: <878rbw2fb4.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB5288:EE_|TYZPR06MB6190:EE_
x-ms-office365-filtering-correlation-id: 509f3d37-7504-467d-e803-08db7c729a7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vXbF5R8H10prtHq7yF74BMj67EmRb+emI3ZKrVWv4dfJpjomyMeQXF3Am7Nxs28++suC0Vwx1lHt0J98SWQ6KFiYqKjXi/5FDxuqa0xmRkblSPbFZULxFNMizWsRKSCv+RDIS+baf+PZr5UYRwiHaW7Wr490hm6+V6l+A5iweO+Frd2XFGOjRi9XS+9FrDdq54kuEZ1IUZ+FlYup1pdSXM74mkDGWJrtpVOLeDk7r/l4UzwyB2shHzquSdFEyAY2s9C7O57ufX8bwzHDT1zK9KlmX5KKUh0+RYLNamTNctIou/hMTjYhN8jVOTa3T1+FLjaLjq29h5m+WYtEjbKG+g1gnfuGE9t3GdFteJrFg9ggqNEZhH3tcsTVPDW1LM87dOcgyCWeiEx0uyGtzAGlypi+tfmw5pQlJ4VhiEejxCXq1LLPm9QrktF+Kf3Kv6p3tEguoFm9qRJFb4FunZ08pHh61Xol/pLiLY+X5+f69UF6Lf4zcJVgGxytL2gx91tVVDBv+mtjQDXQ0yO9DKGYHA0vQJPv+yQwrqo9Oc2kEMPlR7Y3v7jDlH+bZ+wbn+abjQVcDsI6cOrZjpCz1QEC9+zZADUmkMesbkj9dVJv00yVpqhaCTRA+Ei2RfDLcWKh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(346002)(39850400004)(376002)(451199021)(38070700005)(2906002)(41300700001)(52536014)(5660300002)(8936002)(33656002)(85182001)(224303003)(55016003)(86362001)(107886003)(186003)(478600001)(26005)(6506007)(966005)(9686003)(71200400001)(7696005)(122000001)(76116006)(316002)(6916009)(64756008)(4326008)(66446008)(66556008)(66946007)(38100700002)(54906003)(66476007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?SE8wMHdtNTI3NGJQMWM4Z0ttbm9GVks2RXpaa1BBMFdKMmJaS0svMUJCWVhF?=
 =?gb2312?B?VWdEWG10VXZhNWlPejNlNVpwUTV6VHN3Ymxjd1FCR3JFOEhTSThhb2RHT2Qy?=
 =?gb2312?B?aGYxSEY3MkJIOE1PUEZiazFoN0trbUtUb0x2b08rVnpIbUJkdzNmakJHQ0M5?=
 =?gb2312?B?Z2I5dmh6ZThHQW53NzdGYU1uR3NzSHNEc1Fjbzlua0UvNzFXZkxmMW5oQ0x2?=
 =?gb2312?B?YzFuVmlkak1jSzBwK3ZZWEVTWlFNRVhlS0N0K2U3OGFrQVIwNzNWb3RGazdI?=
 =?gb2312?B?M2tNZFZHSWVXVWRXVnFQUzRXZ3VYM3NGVkdRbWpaOHRaZTh6c3ZnUnpBUkVG?=
 =?gb2312?B?MGdGRzlqZVVFcDkrQVlXaWpuK1BnYmZtYXNiUHlKUGc5dzVPUHNUSlYvT3p3?=
 =?gb2312?B?YllaMHhMQTVYOXprSTc2YzZRdGIranJKNWVWWU0zNldDd1FBNEFNR0xWZ2hq?=
 =?gb2312?B?NDVnUjZqaWZNT3pTM0ZBd1NaQ0pRd21nTmtBYU9WVitMU3pjT0ZReVR2M29i?=
 =?gb2312?B?VWx0ZVNsMGxvWTNwd2NSbG52T29wblNmWUpYVWlKTEF5OEkzV2lOZ25DUlln?=
 =?gb2312?B?RkNMaXhhL21WYzhSZVVGckYxeURHV3NuaVFPRnRkdnJwQStWazFyaHpzK1FZ?=
 =?gb2312?B?emNLSTJPNE4zMzNDM1BvQ0dnaWFDUjlieGw5Mm5zMWFRTWdlUDNPYU9RdzZ1?=
 =?gb2312?B?VUh4ZHFLRG1YSmQ3SXMxSHMydkEzMHJIdDVQRUVwdkdmb0ZwbVNUa29SK1NM?=
 =?gb2312?B?cjBrWGNyMnYwNTlVWmM0WXJHNzI5SW11Vkt0bWtRdk0yWUVrVlJJeVcrZFVK?=
 =?gb2312?B?STRjK1BSR3gxODNZRUp3ZUYrZC9sTWRoUldBa0ZVdjl6Sjd3ZTlwOUd4eSt4?=
 =?gb2312?B?TTdzMk5kK0s4ZlREQjRYd0hLRVB5UE41UUVwWUU1dVFOOE1oMFl1RmhYZFV0?=
 =?gb2312?B?UEFvK0FnY0U2MnhacWFxVWlqb0ZZYWllVGRrOW5NTEljbk92WEozRDFsWVU3?=
 =?gb2312?B?N2ZGWksydFFOcHl5dGRxTzlONUtTUU1FNEpRY0p6R2lVdmZHRWNTRUxTREJt?=
 =?gb2312?B?NnhNNlFSUlZ5VEFyakVPTFNLQVhTeUZ5dlBab3F2bXlHdzdrbk9TUUd0NFZT?=
 =?gb2312?B?SjV6RWd3enQwdGorUlkxb1lXb3lxQWFLMmpYQ0Fmc2txRUpiWXlLZ1R3d0NC?=
 =?gb2312?B?QVRWOEtIdnptRlp3eVVRWHdHMDdBVWxMYXNlU01oYkM1dWljTGpxcWZRU2Q5?=
 =?gb2312?B?VXJ3Q0Q1c1lNVFVHeWJNcE5KWUpuUENXcitVb0tnd0hhT25YQ285bStLRitC?=
 =?gb2312?B?R2pGOUF3RUVLSEV3bE0wcmFJUC9uOS9xWmpqTytNTE42S3dKNjVES09PK25P?=
 =?gb2312?B?MitjYWdmUStwSXNJdDVlT0dUa3R3cjNkblFGWmo1QlI2aVU3WVFXRERiam9O?=
 =?gb2312?B?Ync2VEtQWGFKWTFMcGtvS1FLdnFCVDdDaXgwUWpNMGszLzJPdW1qNWNkU3JN?=
 =?gb2312?B?ZjFzL1ZCbXJoNjFMM2FhbnlocVVZMmxUayt5TlFNSVFMMHE0U3MzZERScVUz?=
 =?gb2312?B?SldJb01NQzJDVlJuNmltQWxsYzNTOVFJUFBkbk5QZVF5QXR4YnpDaGo4UWcw?=
 =?gb2312?B?SVcyL3prVktYN0lQaWg5U09ZKytmbnNJZEw0S1JoMEdXTngwZElKdWo5TWNZ?=
 =?gb2312?B?TEIxZlJoVDY5YUJ3dFdDcjZ3aDdBaU9KdWh2eVQ5WDZ0WnRJQ1N2RWdrekc1?=
 =?gb2312?B?N3NxMGwzaVVYWHUzOVVYSEoxQUh6K1JyVkVkN2lDUnZ4OHQzbjNNTVBzL1hT?=
 =?gb2312?B?M0RyODRTR1BiMHlaS3JRc0trbUxocTNVVHRVTWJXUk5NVWcxVU15NUNleVVP?=
 =?gb2312?B?YnVsUEhKYm41aTU0TzAwVzNPSDV2MEkzSEs5R1BZblhxdkNHVHRsSHRlR2lx?=
 =?gb2312?B?TEtHaTVVemY2MHF2OFNiVjRsNkhZOHBsNHNIR0prY3dQY0hnbEEyclk1QnVE?=
 =?gb2312?B?NlNiaVJtS0FvaFFzaTh2SVhJcWhqM3UzbzRlWXFOcUZiTG93L0hRZDZDT2Yy?=
 =?gb2312?B?TW5VS2JHQU43QzliU3hmNFBWK0w0ajdPSElqRjJTWk5GejF4aS9acElubk9n?=
 =?gb2312?Q?2b7o=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 509f3d37-7504-467d-e803-08db7c729a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 09:39:46.2654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 +ev/r2H9dmhqJZnmVuNGBhcub0CCc0sTgcAi07lygXsrseWVTOvXxzSf1zoxELdWZO6T9S7WcRwKKWF9Ny070g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6190
X-MailFrom: duminjie@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MC4BE6DCFNCRM2QZGO7FJT3FLFJVVGHF
X-Message-ID-Hash: MC4BE6DCFNCRM2QZGO7FJT3FLFJVVGHF
X-Mailman-Approved-At: Tue, 04 Jul 2023 15:52:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T0ssIFRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4NCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+
yMs6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4gDQq3osvNyrG85DogMjAyM8TqN9TCNMjV
IDE3OjMyDQrK1bz+yMs6ILbFw/S93CA8ZHVtaW5qaWVAdml2by5jb20+DQqzrcvNOiBKYXJvc2xh
diBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PjsgVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNvbT47
IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PjsgbW9kZXJhdGVkIGxpc3Q6
U09VTkQgPGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZz47IG9wZW4gbGlzdCA8bGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZz47IG9wZW5zb3VyY2Uua2VybmVsIDxvcGVuc291cmNlLmtlcm5l
bEB2aXZvLmNvbT4NCtb3zOI6IFJlOiBbUEFUQ0ggdjFdIHNvdW5kOiByaXB0aWRlOiBSZW1vdmUg
ZHVwbGljYXRlIGp1ZGdtZW50cyBjb2RlDQoNCltTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhp
cyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHRpd2FpQHN1c2UuZGUuIExlYXJu
IHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVy
SWRlbnRpZmljYXRpb24gXQ0KDQpPbiBUdWUsIDA0IEp1bCAyMDIzIDExOjExOjMxICswMjAwLA0K
TWluamllIER1IHdyb3RlOg0KPg0KPiBGaXg6IGRlbGF0ZSBkdXBsaWNhdGUganVkZ21lbnRzDQo+
IENvdWxkIHlvdSBoZWxwIGNoZWNrIGl0IG91dD8gVGhhbmsgeW91IQ0KDQpJJ20gYWZyYWlkIHRo
YXQgaXQncyBubyByaWdodCBmaXguDQpUaGUgZHVwbGljYXRlZCBjYWxscyBhY3R1YWxseSBzZW5k
IHR3byBjb21tYW5kcyBzZXF1ZW50aWFsbHksIGFuZCBpZiB5b3UgZHJvcCBvbmUsIGl0J2xsIGNo
YW5nZSB0aGUgYmVoYXZpb3IgY29tcGxldGVseS4NCg0KSG9uZXN0bHkgc3BlYWtpbmcsIEkgaGF2
ZSBubyBpZGVhIHdoZXRoZXIgc2VuZGluZyB0d2ljZSBpcyBtYW5kYXRvcnkgZm9yIHRoaXMgY2hp
cC4gIEl0J3MgYW4gdWdseSBkcml2ZXIgYnkgcmV2ZXJzZSBlbmdpbmVlcmluZywgc28gd2hvIGtu
b3dzLiAgV2UgY2FuIGdldCByaWQgb2YgaXQgaW4gZnV0dXJlLiAgQnV0IGl0J3MgYSBkaWZmZXJl
bnQgdG9waWMuDQoNCg0KdGhhbmtzLA0KDQpUYWthc2hpDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTog
TWluamllIER1IDxkdW1pbmppZUB2aXZvLmNvbT4NCj4gLS0tDQo+ICBzb3VuZC9wY2kvcmlwdGlk
ZS9yaXB0aWRlLmMgfCAxMSArKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9yaXB0
aWRlL3JpcHRpZGUuYyBiL3NvdW5kL3BjaS9yaXB0aWRlL3JpcHRpZGUuYyANCj4gaW5kZXggYjM3
Yzg3N2MyLi45YmY0YjJlODYgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3BjaS9yaXB0aWRlL3JpcHRp
ZGUuYw0KPiArKysgYi9zb3VuZC9wY2kvcmlwdGlkZS9yaXB0aWRlLmMNCj4gQEAgLTk1OCw4ICs5
NTgsNyBAQCBnZXRzb3VyY2VzaW5rKHN0cnVjdCBjbWRpZiAqY2lmLCB1bnNpZ25lZCBjaGFyIA0K
PiBzb3VyY2UsIHVuc2lnbmVkIGNoYXIgc2luaywgIHsNCj4gICAgICAgdW5pb24gY21kcmV0IHJw
dHIgPSBDTURSRVRfWkVSTzsNCj4NCj4gLSAgICAgaWYgKFNFTkRfUlNTVihjaWYsIHNvdXJjZSwg
c2luaywgJnJwdHIpICYmDQo+IC0gICAgICAgICBTRU5EX1JTU1YoY2lmLCBzb3VyY2UsIHNpbmss
ICZycHRyKSkNCj4gKyAgICAgaWYgKFNFTkRfUlNTVihjaWYsIHNvdXJjZSwgc2luaywgJnJwdHIp
KQ0KPiAgICAgICAgICAgICAgIHJldHVybiAtRUlPOw0KPiAgICAgICAqYSA9IHJwdHIucmV0Ynl0
ZXNbMF07DQo+ICAgICAgICpiID0gcnB0ci5yZXRieXRlc1sxXTsNCj4gQEAgLTk3OCw4ICs5Nzcs
NyBAQCBnZXRzYW1wbGVyYXRlKHN0cnVjdCBjbWRpZiAqY2lmLCB1bnNpZ25lZCBjaGFyICppbnRk
ZWMsIHVuc2lnbmVkIGludCAqcmF0ZSkNCj4gICAgICAgcyA9IGludGRlYzsNCj4gICAgICAgZm9y
IChpID0gMDsgaSA8IDI7IGkrKykgew0KPiAgICAgICAgICAgICAgIGlmICgqcyAhPSAweGZmKSB7
DQo+IC0gICAgICAgICAgICAgICAgICAgICBpZiAoU0VORF9SU1JDKGNpZiwgKnMsICZycHRyKSAm
Jg0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgIFNFTkRfUlNSQyhjaWYsICpzLCAmcnB0cikp
DQo+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoU0VORF9SU1JDKGNpZiwgKnMsICZycHRyKSkN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87DQo+ICAgICAgICAg
ICAgICAgICAgICAgICBwW2ldICs9IHJwdHIucmV0d29yZHNbMV07DQo+ICAgICAgICAgICAgICAg
ICAgICAgICBwW2ldICo9IHJwdHIucmV0d29yZHNbMl07IEBAIC0xMDEzLDggKzEwMTEsNyBAQCAN
Cj4gc2V0c2FtcGxlZm9ybWF0KHN0cnVjdCBjbWRpZiAqY2lmLA0KPiAgICAgICBzaWcgPSBzbmRf
cGNtX2Zvcm1hdF91bnNpZ25lZChmb3JtYXQpICE9IDA7DQo+ICAgICAgIG9yZGVyID0gc25kX3Bj
bV9mb3JtYXRfYmlnX2VuZGlhbihmb3JtYXQpICE9IDA7DQo+DQo+IC0gICAgIGlmIChTRU5EX1NF
VEYoY2lmLCBtaXhlciwgdywgY2gsIG9yZGVyLCBzaWcsIGlkKSAmJg0KPiAtICAgICAgICAgU0VO
RF9TRVRGKGNpZiwgbWl4ZXIsIHcsIGNoLCBvcmRlciwgc2lnLCBpZCkpIHsNCj4gKyAgICAgaWYg
KFNFTkRfU0VURihjaWYsIG1peGVyLCB3LCBjaCwgb3JkZXIsIHNpZywgaWQpKSB7DQo+ICAgICAg
ICAgICAgICAgc25kX3ByaW50ZGQoInNldHNhbXBsZWZvcm1hdCBmYWlsZWRcbiIpOw0KPiAgICAg
ICAgICAgICAgIHJldHVybiAtRUlPOw0KPiAgICAgICB9DQo+IEBAIC0xMDYwLDcgKzEwNTcsNyBA
QCBnZXRtaXhlcihzdHJ1Y3QgY21kaWYgKmNpZiwgc2hvcnQgbnVtLCB1bnNpZ25lZCANCj4gc2hv
cnQgKnJ2YWwsICB7DQo+ICAgICAgIHVuaW9uIGNtZHJldCBycHRyID0gQ01EUkVUX1pFUk87DQo+
DQo+IC0gICAgIGlmIChTRU5EX1JER1YoY2lmLCBudW0sIG51bSwgJnJwdHIpICYmIFNFTkRfUkRH
VihjaWYsIG51bSwgbnVtLCAmcnB0cikpDQo+ICsgICAgIGlmIChTRU5EX1JER1YoY2lmLCBudW0s
IG51bSwgJnJwdHIpKQ0KPiAgICAgICAgICAgICAgIHJldHVybiAtRUlPOw0KPiAgICAgICAqcnZh
bCA9IHJwdHIucmV0d29yZHNbMF07DQo+ICAgICAgICpsdmFsID0gcnB0ci5yZXR3b3Jkc1sxXTsN
Cj4gLS0NCj4gMi4zOS4wDQo+DQo=
