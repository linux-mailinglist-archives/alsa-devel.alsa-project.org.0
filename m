Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192794FE22
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 08:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E48082318;
	Tue, 13 Aug 2024 08:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E48082318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723532176;
	bh=b10+KtqaV11OZhhteb1ZjAmzCWmVtHD2wJLJhtl8BN4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r1LGkMKGZ9/IMue71pSkvIZqJVZJZhfZTd+PS//ljiLnU/1sHmz2TGlxSyPdSL+YO
	 Li5y2csM4danb371nwtWWM8TTs8lYSHnNE/gYLjRB665hrMaj5CFbkQGwDYaCN4537
	 xZUkOVq9E5ka1Q9DVhwmnh9DXmKNbJFWb/MiXRJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4782F805B4; Tue, 13 Aug 2024 08:55:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5477F805AB;
	Tue, 13 Aug 2024 08:55:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A66F80423; Tue, 13 Aug 2024 08:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 088D4F8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 08:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088D4F8016E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0xcTZkIma0ufl5YORdzNLb32IzRf/esmiAYydpTJNgMGchzkorNKX9IGZ466IG9PrhirPQR1VMvshavsOnN8rpr/WfVRhNLhLnzJddGYhsKcfsIhUCBpPxlC2+d6yAYI7cevEVeB5e0LqmeKyyeIEbLL/tzm490Y8nerQYW26WP0Vh3B96nHIEfI8ssP7Cs24Kc08vWQ/J54JLIQrSxPNJhu3NvQ2tkYEV9b3A7KfrT7rRsKNyfHntlAbXwId7j81MeKb95HANsdJaykvF1mHlyzMNCXsnQRhQ2IfRPhOicD+Ck4lFnt0vwl7SuFsqjfUUNBmxVWgAXqwoRxHoJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b10+KtqaV11OZhhteb1ZjAmzCWmVtHD2wJLJhtl8BN4=;
 b=D2GR6EEiXhu2N/AkapUABk2mm0egCbzs8Po68Q5YxumFyR2AplzQND6Q2bUS4n80IR19Bl4cFEBHNEWZj9KWQcoICryEJkV0k7CqPdCxfMHqRclmsTNSFOu4BYQZU+FtNN0QTgH9ZByFzzDVxJqwPNTwKwAYTXsldJDzZOrIGgVFm2iAGWFhgQdYLJFRoVQnn3pd46r0paoiuJh45+82UdxgWG2E+Vszrrv2jFdjfhgJ1TWFUBmsrqoJi1KS9T2l/XmZzXbRVhXXGVzKKuTiOMFoDAMYWbzlwZ2oGTvAc1O+EwOqz1sIXj5nEsFfa88tL2Sc44UzKkCWU6IhnpLXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE2P216MB2875.KORP216.PROD.OUTLOOK.COM (2603:1096:101:289::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 06:55:32 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 06:55:32 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: sma1307: Add bindings for Iron Device SMA1307
 amplifier
Thread-Topic: [PATCH 2/2] ASoC: sma1307: Add bindings for Iron Device SMA1307
 amplifier
Thread-Index: AQHa7UFUsc5xrfbh/UOmAKqmkHIGiLIkvyYAgAAB6xA=
Date: Tue, 13 Aug 2024 06:55:32 +0000
Message-ID: 
 <SL2P216MB23375350680309571A52F1F48C862@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240813052609.56527-1-kiseok.jo@irondevice.com>
 <20240813052609.56527-3-kiseok.jo@irondevice.com>
 <3eceaca8-9c12-42b3-8470-5862a9e908b3@kernel.org>
In-Reply-To: <3eceaca8-9c12-42b3-8470-5862a9e908b3@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE2P216MB2875:EE_
x-ms-office365-filtering-correlation-id: d6205d29-a27f-4b57-837b-08dcbb64ed1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Sk96T0dwclRncEhrbUs4eXVoYlNraSs1WC9Yb2F6N2c3N3BTVXhZU1pBVFc0?=
 =?utf-8?B?QjNXWUFVSitjWXdaajlaTXpJVUkvcmRpNWNyU2Y2OXdvY1lyUkZPU0Vxd3J4?=
 =?utf-8?B?d2VIcXYrRTYzSGhaQk1nTldRK3dYaHBvMXlLRVIzUjhIVXppUkhvMDUwOVEv?=
 =?utf-8?B?UEFFZWZSR05yVWhFdHdoa0hDSS8zU1hiZURiNVdNbXJwZ2kzS3h6YXU0RDZG?=
 =?utf-8?B?ZnpBa2ZSUnRTUERpR0pXcFVLVUFZZk52aHNNUzhuc0hZWVJaZUVucmRYZXlF?=
 =?utf-8?B?am8yTVhKMEVQMjBwSlVzVTgxdDdnSFZOR1htSk9WWWVibXh0T1d0SWY0eHA3?=
 =?utf-8?B?TUlkN0ZxYkZSU2FQcnkwaXJUTGdXeVl0TWs3eGtQVitpN1NUb3dIbVgzMXBZ?=
 =?utf-8?B?RjdIK0I5dHcreEVnUC9ITDIwZCsxbXI2Wlc0R2ZWM2llcGN1d1ZyU05BZlRy?=
 =?utf-8?B?b1Y3MjlBcE04Vzc1UDYxaEtzazJFQ1JObEVYWkUyM2dxQ2dpUnRTSy9vWmd1?=
 =?utf-8?B?NzkyVEhVWDBiWlc1RnRDZzM3QVpZR1VGVHBqY2pmd1JnL0RYbWJGMW4xMGpQ?=
 =?utf-8?B?Rk1CcGJxYUhJb092YXd3YUFGdGZYQTVoeXU5TWVRWWpja0FNSUI1WVVxc0I0?=
 =?utf-8?B?WVROSEdvRnRkVWxxOWxyRzhQMEhvY0lnSmhkeVFzcml5bzFBR2N0NDNDZXVp?=
 =?utf-8?B?NFZ4UXFHVXFqSmxCV3YrZkZ4SkdRVnJiU210TEVNZG4wZGMvSnltUU1Beksw?=
 =?utf-8?B?SEx6ZXAzeStKaG9hdG5kQ3d5V0hLbHV5TVRIdXQzOVJpQWVtSG95TTkzZktv?=
 =?utf-8?B?bkU3bGh2WFc2bkRWRXpuc1B6ZXRUazdJc2Yzc0dPK2MvL2JuV1lIMjFjQjN6?=
 =?utf-8?B?R1VMMy9WeXZJRWtrRUhXZ055U0M4YXhFdCtVUnVMdG94VDhKcDcvWEsxTk1h?=
 =?utf-8?B?R1VvVWw4S3hOaUZNSTBtMzNkUmpSYzZtU0w1aTdvQjl1V083a1ZpMTd1RFNu?=
 =?utf-8?B?M2tpUzYvY003NmFIbldtV2lKSEczZGIxaTdLdGMrSG5JcDB3SG8ycGtxazRR?=
 =?utf-8?B?c1lXdlMwU1FmYVZSaTJWNjFXVHNRT2UxS1kxR2haUEQrdW14UU5MTTVYZ1pH?=
 =?utf-8?B?Yy8vVElWamFFOFhGTlJiWHYxNVF1M2RVbCtBcURWTFdDM2FyR0lPd2x4MGRR?=
 =?utf-8?B?aEhJeG5vZlYzYnJxYU16YkJPc3p6U0lMMi9uWXh3N0NSNlVGeEkrajlzWEV0?=
 =?utf-8?B?WjVNQnlKaFl0Wk5VRlRLUTB4K3V4TzlJSUpvR01zT3gyODI0Z3o4cTBnc3NY?=
 =?utf-8?B?MG12bUxWeWlHdmdrajFyc1F5WjBEYnR4bmFrKzl6cmxGZnNBTHg3MUhYT05N?=
 =?utf-8?B?US9DbjNDOWY0ZFlPNnRmS2J4NnBzOVZCQklzRWdPanFYdzVFc01yM2Y2Ullo?=
 =?utf-8?B?NUY2a2J3bVI3RmEzWittdStMV1QrMnk2djNkMDdSSmpDaHhtU0tSUU9INVdM?=
 =?utf-8?B?SVk1ODgrT1JQSGo5d0VqWk9VMVhFc2F4VnRPU2ZMVS8zRTFPOFUyNHNxQkpI?=
 =?utf-8?B?RmlVQTZGQkY2U1JhVHhXRmpBTlNLc1lueXQ2dktHVkNpczRRNWkvWUhhMTFS?=
 =?utf-8?B?OEVXNGNvMHpKMks0OGQwSk1nR2FabU9WZEdSQ0U4a0hZL0ltTjdRRkN5NENI?=
 =?utf-8?B?QTZ6OTZrOUx5M1RiNXdjbXdZZGFkVlk3a3dCdVV3UjhuU3I3bmlabnE2V1lF?=
 =?utf-8?B?YkNVN3FaNDRFS0h6a2tyT29RdG9SYkVxSXNIWkV2QXJiUUhZTTJWdVJOY3pZ?=
 =?utf-8?B?cE4vMFZaVkFIWXJ3RXZDT1Y5aUdUZ3BhdXBXZTZ1WDdMT3o5cS9IOHpxSWcz?=
 =?utf-8?B?VVFZenNpSEJDOXhqeUFReU51bHNOWW9xSUxHWWc5cXRmNXc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V1czQWtUVldKdDJ6NGNYaVQybGhOYlJxeEVUcnNzejNHNzArQWFDQmNzcitU?=
 =?utf-8?B?a0wwcFV6Zi9CT21ZaWNrOU5mbHdxbjNaN25EQ1R0dDVoVnVnMW9hc3diWk9l?=
 =?utf-8?B?cVVzYkxWdDhvNy96cWUzcXlSZjZUbFN5SHhydzh1WFJCcHVzN01wUjVkMlla?=
 =?utf-8?B?UWZIcUptU3ZwTHhsVlR1S1RBVnluNkVkRHVzV0Jhc3Y4c3QycXF6MEc2aDJC?=
 =?utf-8?B?VjNVU2pFVlRrd0Ywa0ttYUFmRzhJQk1zaCs2cmtTdFk3RzdlRkRwNW1KVGsy?=
 =?utf-8?B?M0x5RUl3UWVxYWhEZC9tQ0ltVDZBeDVkcVBzMDlMQnZjcTFpT28ycW9wUVBR?=
 =?utf-8?B?TUw1WG1LdzNFd0wxUm5Wby9EdHozMHZGZW9heUxhZ2dVemwzdlZrOGU4bFZi?=
 =?utf-8?B?R2Z5TENGR2VKLzVBaW9mSnYxRTRaSlR3Y0E3VVRHWUg4OHpkOFdNZ25KTCtG?=
 =?utf-8?B?aFpQWWJ4aEpzMjBPS1JXTC9JRDdJMG14R2hZdHJ1SnVwT3lqeEhhVFkzSXhS?=
 =?utf-8?B?cVBjY2IrMVFZS3ArNVFIL1dsNjFUUTI2WllEa0dHU0k0NTM4OXVpcUZZSEZQ?=
 =?utf-8?B?akErOTBpejRDZDRxM1FZd2kzaGNGRG5FSndVMFRrdkJvQVg3Nkg5YjhnWXdh?=
 =?utf-8?B?Z216RE1iNjVERWd3SEswUWJTaGNSMjQraXdoQVJmNlVRcmw5L3E2am4xaGR5?=
 =?utf-8?B?R2l3MnBjQ3RhWXBkZzV2NTJsUzhLbnZMNXlEM05taHR5ZmpUWkFSUkN3VDlZ?=
 =?utf-8?B?YmRNaUV3MUEvMVNXTCsvVUo4dkt2TXFDS0hvTW5tK09CUld0MXIwNEprQUhm?=
 =?utf-8?B?NFJoWkxsVFYrMWZCOWxWTDBHMUUwQUNNOFMwdmNGSTNmWDlMZWl3QXFxM3pJ?=
 =?utf-8?B?RDlPSkNHYlNBQThtbEZ2OWIycjdZeHZ5TVhKdWxmZ0t0dWNsUjJuVUY2VDhD?=
 =?utf-8?B?OXYrOXFzbThaQWlFWlduOXVROWt3dU9RVVZMKy80MmN6aGVBWG9HKytSc0RJ?=
 =?utf-8?B?R01TbFRlcmdYbld0NGJOOXQ2TU9oMEt2a0hEYnJwOGxwVEx3czFmL05PZ2E0?=
 =?utf-8?B?bkxrT3ZLYXhZUU1DS3pJOFhtRmhWS0kvdXQ4a0pWQmNZeHpxeElFY005MXVM?=
 =?utf-8?B?cTZFM1djdFhCbHViZkJqaTRrUG1Md2pqREhFZTgrYUMyYkFLeitSQkx4Sys4?=
 =?utf-8?B?QnF4Z3NoZ1p3ajA1alFDMmNQUHZjQXRLWXI4by9rNFVjV3VzYUxIYXc1NFo4?=
 =?utf-8?B?OWJVeUN0ZmlRZHBvcklYTEJwanpxNXVBYStqRllzRFBhVlFZc09OQm9HUjk5?=
 =?utf-8?B?VElNUWE3Mk5MZ0M0VXRMRUlpUGsyZnkrRnFtckJmcC9oZUpMMVZTZ2ZIc3VZ?=
 =?utf-8?B?MUc1THhXQnlSL2pLR2ZHT3JvWGhuOTZzaDhqRVkxYno5b3c2WC9BalFjK3Zo?=
 =?utf-8?B?eDBCcnlqdDV4MjAvbktxWm1MY3NkNHM3VTludHRBNjNlMXByMHU4dXJSdVBV?=
 =?utf-8?B?MWxzVGZXQW9JeG1yZkt6S3VjU3FUNE4xMWZnMkczeEVPaFVBTDB0WUgyRUVo?=
 =?utf-8?B?Wm5OWUNhQTZYeDA1YWJtNFc4VFhvTjd0VExDMkE2OCtiRm5nZkRhMGc0a0gz?=
 =?utf-8?B?UXRzdTZYeUs2N2MxRVFDaWxlTGhEemtna2Y0S2hZUE51cW1BSGRyVjFKMEdD?=
 =?utf-8?B?bEM2RlU3MzM0VTNleTB5eW84SVhVQjh2TFhUbUM2bDJibmoxc1BQeGFoVEZv?=
 =?utf-8?B?MEJSNy8wZllEam1XRHZTMmhIYVhSbHJ6bkhPNGtPQTF2d0NYME1lbk1XUC9N?=
 =?utf-8?B?ajhvTlV4Qi85TG9Eamd6VWl6ekIxNjZPSTdDY0tPcmVEbmtuZFM3eXBQZXEx?=
 =?utf-8?B?MDF3aDgxenRxajN4aFRnN3FwdElQNzk3eHMrQlc2SENoOTh0NW5YRVl0QXdh?=
 =?utf-8?B?azhyT2hQZk4wYVVrUEY1U05seGlQZGZkNWU2allKR2E5bnZRZ1RxZkpQUkdY?=
 =?utf-8?B?TFgwMlBoSEdPR1preUFVaTZUeWduTWNkd1VCU2tlcFU1RjJNUSsvbXlrallw?=
 =?utf-8?B?R3Y1TjEzcHNoSVNRMVFPRTdwZVBXVXAwUzExZ3NRZFR4S1UyUlFJZlo3UEdP?=
 =?utf-8?Q?alUL/zysKEBFZI5J3rSGLhJDy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6205d29-a27f-4b57-837b-08dcbb64ed1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 06:55:32.8528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 N036RRfuFAcnaRtRpqWDmlUXA1o3G6Qe9gRbW4K9MW0taum8M6p+7O5gujAfBVWtlgsRk+c3jcGmP3BRL4h68GBCtiPIruJs0tIEwFhgMxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2875
Message-ID-Hash: T63YHVDGVVGYTNSTWFWI6CIBSACUH5Z5
X-Message-ID-Hash: T63YHVDGVVGYTNSTWFWI6CIBSACUH5Z5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCNKOOFGLXTE7PJN647IGFML6KMLCG7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpUaGVzZSBjaGFuZ2VzIG9ubHkgaW5jbHVkZSBvdGhlciBtb2RpZmljYXRpb25zKGFib3V0IGRl
ZmluaXRpb24pLiBUaGUgZmVlZGJhY2sgeW91IHByb3ZpZGVkIHdhcyBzZW50IGJlZm9yZSwgc28g
aXQgbmVlZHMgdG8gYmUgcmV2aXNlZCBhZ2Fpbi4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNl
bnQ6IFR1ZXNkYXksIEF1Z3VzdCAxMywgMjAyNCAzOjQ5IFBNDQo+IFRvOiBLaS1TZW9rIEpvIDxr
aXNlb2suam9AaXJvbmRldmljZS5jb20+OyBMaWFtIEdpcmR3b29kDQo+IDxsZ2lyZHdvb2RAZ21h
aWwuY29tPjsgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPjsgSmFyb3NsYXYgS3lzZWxh
DQo+IDxwZXJleEBwZXJleC5jej47IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5jb20+DQo+IENj
OiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9y
ZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAy
LzJdIEFTb0M6IHNtYTEzMDc6IEFkZCBiaW5kaW5ncyBmb3IgSXJvbiBEZXZpY2UNCj4gU01BMTMw
NyBhbXBsaWZpZXINCj4gDQo+IE9uIDEzLzA4LzIwMjQgMDc6MjYsIEtpc2VvayBKbyB3cm90ZToN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLaXNlb2sgSm8gPGtpc2Vvay5qb0Bpcm9uZGV2aWNlLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3NvdW5kL2lyb25kZXZpY2Usc21hMTMwNy55YW1s
ICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKw0KPiANCj4gSSBkbyBub3Qgc2VlIGltcHJvdmVt
ZW50cy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
