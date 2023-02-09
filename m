Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C55690356
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 10:21:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8892386E;
	Thu,  9 Feb 2023 10:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8892386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675934477;
	bh=VyhYH87xHSUr/B/1sBDuMTVZKZn/N2mQMsvqqDO2Swk=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=up08j1eBVRRXYvsLaH3W+qdEUo2D3s85iVoWhRpEwbeBsfJLw+I4ZpDNLrFXtV2z7
	 1czZ9gAj+P38HzxDemMc9jEW3lFSNbYm650piKkcN0HPtr4GbtsIJKLgTN6N52rOoD
	 S+gfNEcGdW11RyasuqatB2TvUasFTQ9eknYrvG9g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72418F800B8;
	Thu,  9 Feb 2023 10:20:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 027ADF800E4; Thu,  9 Feb 2023 10:20:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37F5AF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 10:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F5AF80094
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m29ne5BfSrijVX2ycHPaWIsqxwjqsXI8Vu76MWVQWZ8a/bCfM2WUA+HzX8/dwRwrrX9clz43Gf60bdTfRCf1mr5KnZSM25vYjcB0f1Q0qFzYQvKAyiVhvBtuv/Bcv66B7zVFHRl2+br/LEtqciQnyXh9A0PGM2Ij33OEAkJUZlVpUZ8vO33CpzJXAWBPpKCEEDoCYKd9MjkfEkXBp2/Y1bLUY+9t+EnFzWsJTOzSnlZ+BWFrCF0mGkK+/kfawh1gpKSQqMIAiGONIkstc5pmMdAQr4UdZm2sDdnDk3DybfxhNghGt+f05IV2ANHpeaCxuwYy79iAyRrMYh1mfF5ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyhYH87xHSUr/B/1sBDuMTVZKZn/N2mQMsvqqDO2Swk=;
 b=adnaNCGvXKZNNwNP5dkVa1+Vtb96y8fofLlcD7sPiPpmJ5fhfWEJ4dcYKWsO/pGjuD92+j/DpEPR5oefkjP43SGY/Xx73w74MyaErbua9d8I3lX7dJezGTObAKYXH0+IDJmTWNF2lbgoy9fvrQtRO8Kwd1g2y0wYayu7F2NPm60VMffUiB3rTEOL+8u/WU2aRFgin4xByqHM9Z/Ygi+jhHnUmu4QOeXc84lXM8XuZB82WVx4yxcyFjhmCr0ywcK6zpbkAZ8FtHp2EfLvDxrBsnArfUYHrH/RGX6rtjgt+5STeB1YdeP9rgLfBH4EBOejWrcxO2m/lAMw3u2VNBSv0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1423.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ce::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34; Thu, 9 Feb 2023 09:20:06 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a%9]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 09:20:06 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Thread-Topic: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in
 devicetree
Thread-Index: AQHZPGNzHE3k8owPakG50LXf9xOb+67GT4GAgAAB/jCAAABrAIAABLSQ
Date: Thu, 9 Feb 2023 09:20:06 +0000
Message-ID: 
 <SLXP216MB0077E5E2FC4A8CAA3B9D8A4F8CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
 <da3e7391-ee89-3089-8501-91e9411161a7@linaro.org>
 <SLXP216MB00777BF2377ECE2366F694228CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <e5bcad37-c7d3-9c3c-4947-d3f2f6d9fc60@linaro.org>
In-Reply-To: <e5bcad37-c7d3-9c3c-4947-d3f2f6d9fc60@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PU4P216MB1423:EE_
x-ms-office365-filtering-correlation-id: db25a66d-7892-4ca6-2b04-08db0a7ed523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Kj4SD2m0cz31rpblD5+STH5uv3PeFXypmFgq44G1lvSu6GSZrLUFuLNT6P+BClop1L0N5cGMGnrfOSwVfeKdzPYDmge58DMlwvv5jdT9g7buhqhWPvozov4u1Ui0oSk0zFE1zRXd/PPyRaR0ELdaT3rVME3CZrYob+E3AsFBIhD79R8d7e49yIDkIOwdgQiCQKeyL2NH2/8iDepyAfLwMc1mQlar5IvDceItNIrYIXq61HAlk1n5/Zqg6KdzF8gjLVKXxBgC5MLNeu9MInlWCGhG4C5WLXu73jA7IXPLGPBqXj+ZcL0Xd0rEHTXnZmo1FClK/NqJfKlnqtWxaCv1j0S7ngkl0TlvHYZjJD90JHGNJylcfIi28A3vmX7086BB3P8h8KSpbXQGSLF+VKJPATGbWMUpgsuDk9Jz07hGtod1E4RyKf6dEomTFR0WpFXgxxipSX72t+UsfFmD4X96J8tGLOlAqRGhJF3l0guQSAcFM0q/U5hoz7p4VlDlSBJHtM+RpngpbqfOQMglp48DBWS2G1IrDwvupsNAbelLQPjHU9AYcEa8+6ya4ads9pe4ELgng82I7aTg+GUMfQJ5Van3yV41hdrqAvBRrAkNG6dA/AB6Wmnb7pYzkHFBDgjqsXWOyQ5IzMepdpk0Jj0Zz90MMGwtZlFbPp2qOT30QqRrbMVpdNihdIV0UlglqDTpKpBUFhnIAdhe+trg5DSnNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(136003)(366004)(376002)(396003)(346002)(451199018)(66476007)(76116006)(66946007)(4326008)(8676002)(38100700002)(316002)(66556008)(122000001)(110136005)(54906003)(86362001)(5660300002)(52536014)(33656002)(478600001)(66446008)(53546011)(186003)(38070700005)(6506007)(26005)(9686003)(2906002)(4744005)(71200400001)(64756008)(41300700001)(8936002)(55016003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RHg1cWlpTXowc0hxR2ZZQndvNWNwK3FRVG1yWnlYY0ZUS3pPQkc4bzJ2VFpM?=
 =?utf-8?B?aWl2RWdqZ0hvK2dELzRiUVFXTWp1Z0VNMG5vZElsUlYwcnYvQlZWRXp0MnQ2?=
 =?utf-8?B?cUhuTDd2dm9vSXkxUUNMRm4vSFBRUUxBZkViNlRXNk5lc2ZWK3J0M0I1QTB6?=
 =?utf-8?B?NFJqR0ZFb0JqWFg3YVhndnI4NHRMLzcveHdPYmcvSGVpL204a09WcFVUK2pX?=
 =?utf-8?B?bVZJWG05WTRpN1ZRemF2bURVWlVVTVJGcVUySEdrc3VEVUZKQkpDR2dPUVZY?=
 =?utf-8?B?UzdPKzlDdGJvSFd6ZG5VTDdJMTkwVm9IRnExQkJmWGtGazgxYXRUc0VuUkVQ?=
 =?utf-8?B?T2FuNWdYRVowK2M5UHJQVVord2psYkFlK3lIOHlRWFVVaVpGTXFObCt6Y25t?=
 =?utf-8?B?SysrdFkyNXlFVTRjMXAzYWl3NDdVRkVWRGlNY3NKZnRKekZ1N1puZzY2Y2JR?=
 =?utf-8?B?aHkxL0p4TGxLNEF2ak9leTNRK1dVN3MzWUloR0p6RGpGbUxTbDdCRUZkSnpz?=
 =?utf-8?B?OVBIaWdIalFjWFFVM0hGcEFnMmlQWCs1ZzFGcVlieVl4d1o4NEw3Y1h2T21M?=
 =?utf-8?B?UG5jRXpYUlpUOHhHVy9UMWRIOE5Qa01CMER6K2xIdklOVUkycWllZjVUcEht?=
 =?utf-8?B?M1NNWjVDbS9xeXJBUFJHbG56Zm5VNk5MY05KSFhTWHRjeGNBbVU3djlQWXZn?=
 =?utf-8?B?MWFlVC90aU52TVRZa3E5VEFBcnM5RUd0NHY4dS9NMFNqNXV3Z2grLzhjdHVF?=
 =?utf-8?B?NENsWVo1NzA5amY4ZVVmenFodS9aWkU0aFVGc2tCUks5cjhMaVliSitvNFZo?=
 =?utf-8?B?SlZTeHoyS00zZ3ptVU55cmtzL0NzY3RjRzF0dnVqSEkweVN0Z2tsb2NiLzg2?=
 =?utf-8?B?c296bElKL1FNYzhwVC9lZXBxdjYrOVkvbWVzRnZqamswL1VDOVRWaCtIWnlt?=
 =?utf-8?B?ZDhobytrbVU5R1ovRkhRMEZRKzRyd0g5ZnMzSHE3SFBEQzV4dGs0NEhvQ21R?=
 =?utf-8?B?RkZEcTRqM1hITG5TUWVIZU4rRjVNcWhUNmR3T1pnVjB2Y2lRcUh5RkhZVHNW?=
 =?utf-8?B?bFZ4eEhYcnE0UkE0Y3FxbVFyaWNNWE5LY05TS3F1MlZTRS9GWUxrTGtROXVw?=
 =?utf-8?B?cUEzNkFMdjRCSDlleVk4eHVQdmgwZW5sd0RDQ0dEMjFCZElTZjJHNzBNNDFh?=
 =?utf-8?B?bDZXbUVBdHBVZlB1NkJJS05EaC8wZk1lZExlRG4xZHlyOFF2dGJ3MnVQQUtl?=
 =?utf-8?B?WjVVM3FMWm0xZlZEaTFUMjVpVGhyV0REVmVPaDBlKzFaQVJ0eFFhemxTVitN?=
 =?utf-8?B?bEt6N1U0VUJIRVVwM1d5RmJxa1lwdVNwYlBMcWNuNWpZc2NHL2ROOFZ5dlJ2?=
 =?utf-8?B?dVdIVVU3aXNUZE5pdG1lQ1JLN1kySG9MQjlOWUp4d0hrdHEvcGR1eU5UZFJw?=
 =?utf-8?B?eXJETG9aeEJmclJJaDMyRUJNY09xQjJNTWkrNVcrd0ZJbGt3M2RFaEFFTDdw?=
 =?utf-8?B?Z3ZlS3oybkpiZktTakwrVW82T1lONDlWVW1FY2VnRGJsdDNGOG95MFBqcDVZ?=
 =?utf-8?B?Y01xbm1oUlFYMGhLRnpyZk9YOU45a2JCNTRIR3JKaEZ2ZDJ5Rjh3aC9xNGNM?=
 =?utf-8?B?dXpLNEszcllxOHF3ZEJqNkQ2OEovY2d3OEtJeEdZdVYzVitFMWNIZUE1WFpB?=
 =?utf-8?B?ckU5UVpQNnBSVjdDa0VKZytseEgxRk83QmEvQnpaY3dyRzgxZ3VLMHBvU2h1?=
 =?utf-8?B?MTQvVXFLN3ByZHkwK0YxY3dmSVJJcHovcTdURVpNTmVqVHRoblU3MjNTUGxx?=
 =?utf-8?B?U045c2N6dnZhdmI5WVlxTWR1aGl4OUFoWERMNDdYT0t5SUlWVE9aMzJmcDZX?=
 =?utf-8?B?VVIySjRTUTVGUjhZa09rZEoweWJBVXRCN3hqR3ErWm1qa0tMa1lsSlg2Q1VZ?=
 =?utf-8?B?azNhUzJOLzlZNHN5RVBDOUxma3lLZlVZRHVkKzJnZmdiRk9BVkt6M0JiOGdw?=
 =?utf-8?B?WUhLTTQrOU9nMnlBU05KRU8zeDFzT1A3MFdpMnRKTWdsT2pxNHR5QmRiK3lB?=
 =?utf-8?B?OVN5R3UzdjhFMXpkM0YwNVZoVTU5VmlSOGtIb3JwdkIwd3pOVlBRZWZOZFls?=
 =?utf-8?Q?LxXUWYyP02cpb07ZA0ohxHvEh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db25a66d-7892-4ca6-2b04-08db0a7ed523
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 09:20:06.0597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lNkxRzA0wFtyZNJ9AyI+Nch88QYbkZwb0+BvDufFRywQg5hOrlEUjitgvtrOplFWxVc77MxvASXVb8Wuor9CUUbyT3821Bx0R7sUlhxxgow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1423
Message-ID-Hash: BJAGRKQXKAQUUAVYNGNHIDHRE5FB4W2Q
X-Message-ID-Hash: BJAGRKQXKAQUUAVYNGNHIDHRE5FB4W2Q
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOQJEYQMR2F3I5IWHR2N7SJGOTW4ERQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo+IE9uIDA5LzAyLzIwMjMgMTA6MDEsIEtpLVNlb2sgSm8gd3JvdGU6DQo+ID4NCj4gPj4+IElu
IFNNQTEzMDMsIHRoaXMgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgTUNMSy4NCj4gPj4+IFNvIGl0
IG5lZWQgdG8gcmVtb3ZlIHN5c2NsayBzZXR0aW5nIGluIGRldmljZXRyZWUuDQo+ID4+PiB2Mjog
TW9kaWZ5IHRoZSBzeXNjbGsgc2V0dGluZyAtIHVzaW5nIGRldm1fY2xrX2dldCBmb3IgbWNsay4N
Cj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBLaXNlb2sgSm8gPGtpc2Vvay5qb0Bpcm9uZGV2
aWNlLmNvbT4NCj4gPj4+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+DQo+ID4+IFdoZXJlPyBXaGVyZSBkaWQgeW91
IGdldCB0aGlzIHRhZz8NCj4gPj4NCj4gPj4gQmVzdCByZWdhcmRzLA0KPiA+PiBLcnp5c3p0b2YN
Cj4gPg0KPiA+IEknbSBzb3JyeSwgSSBkb27igJl0JyBrbm93IHdoYXQgeW91J3JlIHRhbGtpbmcg
YWJvdXQuDQo+ID4gV2hhdCB0YWcgYXJlIHlvdSB0YWxraW5nIGFib3V0Pw0KPiA+IFNvcnJ5LCBj
b3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8NCj4gDQo+IEZyb20gd2hlcmUgdGhlIHRhZyAiUmV2
aWV3ZWQtYnk6IEtyenlzenRvZi4uLiIgYXBwZWFyPw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg0KSSdtIHNvcnJ5IEkgbWlzdW5kZXJzdG9vZCB0aGUgd29yZC4gOigNCk9yaWdp
bmFsbHksIEkgd2FzIGdvaW5nIHRvIHVzZSByZXBvcnRlZC1ieS4NCkkgc2hvdWQgaGF2ZSByZXZp
ZXdlZCBpdCBvbmUgbW9yZSB0aW1lLCBJJ20gcmVhbGx5IHNvcnJ5Lg0KDQpUaGFuayB5b3UgZm9y
IHRlbGxpbmcgbWUuDQoNCkJlc3QgcmVnYXJkcywNCktpc2VvayBKbw0K
