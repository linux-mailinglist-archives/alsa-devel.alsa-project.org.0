Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A60758F1A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 09:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D940100;
	Wed, 19 Jul 2023 09:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D940100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689752158;
	bh=uoWuUnVVl8lUCX0gLLaVUfClSJyrGloL6ya0FvkjM/k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XMNgHi1hgV8FRnEEZKLLJVVfvxo3sPnlNJFLRYHv9WWlnBbBQY769OSOvGROFpmAW
	 2+6VY+1B+C+Xvm2Z4d/5oHpix6hSMiqklnK0xt4zo/fyHm2SNuseauQe6ljexvKJj2
	 wJCKsooW2SdFYoSs5Rovk3xjvx2TjfgS9kVKSGU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F2EF80527; Wed, 19 Jul 2023 09:35:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93713F8032D;
	Wed, 19 Jul 2023 09:35:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00088F8047D; Wed, 19 Jul 2023 07:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8017F80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 07:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8017F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=H8KgYzou
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiVri3//F4QC1eGI0ENKTPzLsjDQixqoVjew9IrZxhWLXPqZa+ObnvFV8zVPaMehhHfwcR23H5Emu7ViB9hb/82DMqUH3vOpYJhcH0+O5D5WKus1wKQbAntaUYygEZ5IVk/xF2t4zPQSpzzL2NBBrSVmlpkelDw6iN+0cEZpLjrqgj4cTOkVvdeBba7Ojq853TbnW+SxUN2F0lQBnh3jSRr5FN77bl908cwd4CqK3zMl1p7YoGHD8f038SE4bYcbTTb5yPbRkuT9tbTqn6ZczAsWlm+LWQrpE97teDvm0VqvuGmguZyFjVESioIlCOVOXW7+mGyP1b/aBh0/jw2gPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoWuUnVVl8lUCX0gLLaVUfClSJyrGloL6ya0FvkjM/k=;
 b=ZrDijd8Bd6itPS2BNfdaqpXdTWTly7aVc8awYWihOyjMzDkavFdCXYFO5ZMqFz4du+fLNCEOntS1xjUlwacFEgCqsSl3LySbT+pqU40wkMdaUaeY4jJmJ8fZunCyoOOETkknvnphuDTRJuLSG7hOHyMFl4IkkoyMoOe3cGGZ5wHOWcvjX2VIqHTAQ26qm1xEaQCAsYgJjLenmMOKl55HhlfTIcMe0IlPBoQND4E7l29oX5AMP7gJLOCNW3/SZ52Sqt7V254JZakIaRZzt3x1tpJcrxO0agP08NLg+PL2lzxEdfE753Gbi69t0FTBdgg9jYG1HDNoZLOiFN+yQKK4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoWuUnVVl8lUCX0gLLaVUfClSJyrGloL6ya0FvkjM/k=;
 b=H8KgYzoucx+X+RU3n/L7TLuwKPTXsCqbwPNMo0OL8RclW0qxzqknqq6Mjf563M0+GOs+69FmaBll8iwmzSxybFTKlFrQzHoPfDdxhHGGWK3/p3lcCO5QA1id33c6ln2YnxKl77VCCoRf5hlfjmFEvvLRWBGfpUjgE4QB64ENEcT1oYoNg3JpjaKJ/5GJv7Hvbx6HniYcZ17wFRdoTF4mwXO6XmlZYBwwi4mnY/SQh3cZ8o9ZgnHYxw/tZ2SvoA+43Sx+Bv5IDMGvlSj2325FIoLN5GqichIuESwWm9H++e+8Zxs5Qpsp4NJf2n7Xc/C/KzKaCOrOyocKs79PHW82Tg==
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 TYZPR06MB4190.apcprd06.prod.outlook.com (2603:1096:400:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.23; Wed, 19 Jul 2023 05:11:00 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 05:11:00 +0000
From: =?gb2312?B?zfXD9y3I7bz+tdey47y8yvWyvw==?= <machel@vivo.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: opensource.kernel <opensource.kernel@vivo.com>,
	=?gb2312?B?zfXD9y3I7bz+tdey47y8yvWyvw==?= <machel@vivo.com>
Subject: [PATCH v1] slimbus: Use dev_err_probe instead of dev_err
Thread-Topic: [PATCH v1] slimbus: Use dev_err_probe instead of dev_err
Thread-Index: Adm5/2iP9hPDCwp270Km/EPTvXx3DQ==
Date: Wed, 19 Jul 2023 05:11:00 +0000
Message-ID: <20230719051049.4018-1-machel@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR01CA0219.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::15) To SG2PR06MB3743.apcprd06.prod.outlook.com
 (2603:1096:4:d0::18)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3743:EE_|TYZPR06MB4190:EE_
x-ms-office365-filtering-correlation-id: 68ff3ee8-b1d1-401e-198c-08db88168b0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 U4vqDD7nEcbXaGl+Bv2So+IUDprAkC6lIlqM+eCln+Z3Zv5PitQucmHNb1BqS4XWy1mEbnTTzjGtWvuGpiHN1jhqUdwlqXHS3X+gVrfeb9pzOReSgvKoEJIWcM+yMAZKDZi4BlTFOU3AIRZx5L72+L+BAyCzyN3Tzk6jL78aKd1ed8dyofoQuJzcua3GSvmbIpB2TL1IzmSVDH3KxsqDomj06DTN1izwSQZcv6fI1jK1WdnfhTQWAmbwSZRkwaq/mgh7RRo3SrAOu5lKfUbbyvMKbEl48TCknFs+IyWPQ7u1RRC8znIG5g9V2qt7yKo/TB1GokoDKOLHpqF3RCoENkHJZYuwEP25ZzU3PEOcs6Fs+AE5TgS4ieWFEii/AHJMun6+/3d1Rj3UROzklaOJJvI5T7TeaC7f1lsQ6RVapefgTuoVZ/ezPTS3nCqoWtm0BMjBj+r0bBUs3thQNEZy1z9S2jIizck5JDomVjbbjdSzInq0+4EhGX8RIYRVZBF0sr65vyNYkuhjxkOFTH0/GcYqeKW9x0jEyk7Q1u0DMLaE8LtlZId84zv6aSK9yXeAqwjYoymsajb/rh60bFF11i4XN/B/h7XgWQiaWmHjqwCIv+krjV5sFZvTaVwIeYof
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3743.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39850400004)(136003)(346002)(451199021)(1076003)(54906003)(122000001)(110136005)(478600001)(6506007)(26005)(107886003)(186003)(71200400001)(52116002)(6486002)(66556008)(4326008)(66446008)(64756008)(66476007)(66946007)(83380400001)(2616005)(6512007)(38350700002)(38100700002)(5660300002)(41300700001)(2906002)(316002)(8936002)(8676002)(86362001)(85182001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?MUJ3QWZxMjdxbHVvMmpsYVo5MWljVFZRV3g5Y05xajhDQW1mbnU3Q3B1dkV6?=
 =?gb2312?B?OEFwK1VMWSt6eXpUQ2N5N0llNENnOUw0VU42a1Fib2VWYzc0WXI3dlRBR1Iy?=
 =?gb2312?B?RWoyK3ZjclhvQnpuZjNGdWlCUTBXV2lBTlozYmdlYlVWNXU4d2U0ZWRkMXNH?=
 =?gb2312?B?TUF5QldwLzdPTTh4clNPbjE0Y3dzU0wyRy9kZ1AxU3REUWszdGoyM1BhdTJC?=
 =?gb2312?B?ZHEvajBQZXNhM0J6MUhBajJ4UW13UXFaV29mZXhxVVR3V3l2TGpYT0NoOW10?=
 =?gb2312?B?aUdUaUgvcHZ3M3gybnJLVFg1NnBCd05neS9McFlIam9pVityY2R6NEMzdzZF?=
 =?gb2312?B?KzMwY3Y2aENwbjI5WituSi9OeWpTZTBPUW8zZ2hpUXRmeXI1SjdQV20xN2lQ?=
 =?gb2312?B?ekwzaUx5Q3J3a29sbGROMUphTnJIWDh1M0ZlRHE3MDJNeXNXTXJPSE9zQ0Iv?=
 =?gb2312?B?ckdQSExoT2dBQklLYXBGVUVkaUhOOWlPSTdhdys4YUs2VzBYQ2dia0ZIM2Z2?=
 =?gb2312?B?ZTZjTjExcExxTTBLbVd5QVAwV045MEhZUGUydWxmVVJFTlJzOHE3Z1NjSW1S?=
 =?gb2312?B?SHZPbXBlUkowTE1td2JnVTlmOXlkQ0JQRCtTOTVkSUdGdXN1TVRiRU1EMGhG?=
 =?gb2312?B?RzREUytvai8rRHduSlVoSXlyclp0MDFxeVJVdnZPQlg1NEZYa25keWxUUFJw?=
 =?gb2312?B?SWg1Zmg4akN0U2E2UFRtckxnaEk4QUNHQWNldUFUVktmMHN1TXFEMHdoWGkz?=
 =?gb2312?B?bUI4OXUvSjNodWJFaGY1cjVvVGJ2azh0RzNkVExzRnp3UGsvSm4vL0gwODRv?=
 =?gb2312?B?bjlVdUZRRVNGcmpzMy9ObHZpRFEyZys0TktyUk1JWWNjMVVJaTNpQ2g3a0FL?=
 =?gb2312?B?MHBrSGxDNUpPcFQ4NDBmd0xtak13dlBMaWdzYzFKVi9COVJESUswQmJVWHk0?=
 =?gb2312?B?KzRmd1BLblIzdWxpNk1WMUgxN3VCejFzczI2WFhKMG42UE9aMXhCK3JYNFVO?=
 =?gb2312?B?STd0VXNDL0FobGpmbmk0K0hibDZ0akhERzM3Vy9Oc2VjWUNzWXNDQXFZc01h?=
 =?gb2312?B?emg3ZEtWUUQ5OU1jaTdsdXBRRkZNR0xPWmVWK1dNcEp4NnltMDVHL0FmYklH?=
 =?gb2312?B?SGNVYU9MUjAxRWptUFhwK3BtemhZSW5ucG82aytxaDk0VGRhVkE0MkpuOXhR?=
 =?gb2312?B?OHpuaXljd08xbTRqSGh6VWdFK1JoV1FTTVpWQyt5VVlKb3Fkd1pBUkRvOW9P?=
 =?gb2312?B?clNhS05hUzFTZ0p1QVNKRFZLNjBnK0g0RTRpQ041enlja042T01Ga3Q1Wi9T?=
 =?gb2312?B?bnRySWlZeVl6a1dZb0prUEliZ2ZudkEyR3VLZ29yQTNyZzdrVjVwS2gxYTZk?=
 =?gb2312?B?RzFhZ0loRXJRSTZxMWh0ZWpSemNsUDVwVDltcDhjKzh5aitVWk9FRXpoUGtw?=
 =?gb2312?B?ckJDSURKNnhkLzloMUQ3SHUrQWo4am5KazBDOUdpZU1IVHkyRjVQK3NRZnhy?=
 =?gb2312?B?OHJKdzdHUVgvWmxMSU5zTzJaZXBBM29aNjFIczBCNnFxL3JmeUI3eDVyK2pu?=
 =?gb2312?B?Rmlrd1o3bVRyTlJUQjZ0NFkvS1JuWUVFZC9yU3NvWjl0aDVJM01PeEpidUth?=
 =?gb2312?B?ZHI1R3pSbXVuN2IwUG55OWM3M2tpaFRKRjlVSko2clVmREhWbGlRRkNuQWE5?=
 =?gb2312?B?TGxZaUMzci9SRjVFNmEvbU5CM2Vyd1dIMnhaZ1VJemNTVzlrMGRaSUE0VDBo?=
 =?gb2312?B?VFNUYlp4Q1VBZU1wK1NJYlhUeFF3UDhGT3ViUTNZNkprazM4VllEdzZldE1Z?=
 =?gb2312?B?MkdvUGFFZDExK2ZNVUo3NlZLSHNMSEdMSkV0RkczQUtVTFVZYVRwaG9mQ211?=
 =?gb2312?B?VHV6M09JRktvZE1CQWtWcFVUZ0UzZTdMaVhEcU1lalhqOEkwZW84NTM4eklT?=
 =?gb2312?B?d2J4TjE2VjdWZ214cE9aMU91bnlmZnN6UWtHUEp3RWZRekQxWm8vaG9JQ0l0?=
 =?gb2312?B?ZDlac2MrM1o1NHV1eUQyR0ZSU3NwQ1l5ellKYTQ5R0hLVnZ2L0YzMno2dHFQ?=
 =?gb2312?B?dkxwNjZxOU5RcFpxeXdMU3J4ZGJIZkdIaXVzVFVHNmJjNG5EdkZTdjdGaS8r?=
 =?gb2312?Q?Mc3S4M+adgUfS2GMouQwUWvs/?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68ff3ee8-b1d1-401e-198c-08db88168b0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 05:11:00.6210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 G8dArpLx5wxBFoESosPUjnXnDUQD7GOMjeqbVisdPNh2sZe6FEBue1jtxUsoh7JBNEDnOPK9mpF+4trupQWhfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4190
X-MailFrom: machel@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ECWMCRU5HJJS3GSFDCIQB53OTFHZGMAK
X-Message-ID-Hash: ECWMCRU5HJJS3GSFDCIQB53OTFHZGMAK
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:35:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECWMCRU5HJJS3GSFDCIQB53OTFHZGMAK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SXQgaXMgcG9zc2libGUgdGhhdCBkbWFfcmVxdWVzdF9jaGFuIHdpbGwgcmV0dXJuIEVQUk9CRV9E
RUZFUiwNCndoaWNoIG1lYW5zIHRoYXQgZGV2IGlzIG5vdCByZWFkeSB5ZXQuIEluIHRoaXMgY2Fz
ZSwNCmRldl9lcnIoZGV2KSwgdGhlcmUgd2lsbCBiZSBubyBvdXRwdXQuIFRoaXMgcGF0Y2ggZml4
ZXMgdGhlIGJ1Zy4NCg0KU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5nIDxtYWNoZWxAdml2by5jb20+
DQotLS0NCiBkcml2ZXJzL3NsaW1idXMvcWNvbS1uZ2QtY3RybC5jIHwgOCArKysrLS0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NsaW1idXMvcWNvbS1uZ2QtY3RybC5jIGIvZHJpdmVycy9zbGltYnVzL3Fj
b20tbmdkLWN0cmwuYw0KaW5kZXggNzdhYTZkMjY0NzZjLi5kNWMyYTczMmY2M2YgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL3NsaW1idXMvcWNvbS1uZ2QtY3RybC5jDQorKysgYi9kcml2ZXJzL3NsaW1i
dXMvcWNvbS1uZ2QtY3RybC5jDQpAQCAtNjc5LDggKzY3OSw4IEBAIHN0YXRpYyBpbnQgcWNvbV9z
bGltX25nZF9pbml0X3J4X21zZ3Eoc3RydWN0IHFjb21fc2xpbV9uZ2RfY3RybCAqY3RybCkNCiAN
CiAJY3RybC0+ZG1hX3J4X2NoYW5uZWwgPSBkbWFfcmVxdWVzdF9jaGFuKGRldiwgInJ4Iik7DQog
CWlmIChJU19FUlIoY3RybC0+ZG1hX3J4X2NoYW5uZWwpKSB7DQotCQlkZXZfZXJyKGRldiwgIkZh
aWxlZCB0byByZXF1ZXN0IFJYIGRtYSBjaGFubmVsIik7DQotCQlyZXQgPSBQVFJfRVJSKGN0cmwt
PmRtYV9yeF9jaGFubmVsKTsNCisJCXJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGN0
cmwtPmRtYV9yeF9jaGFubmVsKSwNCisJCQkJCQkJIkZhaWxlZCB0byByZXF1ZXN0IFJYIGRtYSBj
aGFubmVsIik7DQogCQljdHJsLT5kbWFfcnhfY2hhbm5lbCA9IE5VTEw7DQogCQlyZXR1cm4gcmV0
Ow0KIAl9DQpAQCAtNzE3LDggKzcxNyw4IEBAIHN0YXRpYyBpbnQgcWNvbV9zbGltX25nZF9pbml0
X3R4X21zZ3Eoc3RydWN0IHFjb21fc2xpbV9uZ2RfY3RybCAqY3RybCkNCiANCiAJY3RybC0+ZG1h
X3R4X2NoYW5uZWwgPSBkbWFfcmVxdWVzdF9jaGFuKGRldiwgInR4Iik7DQogCWlmIChJU19FUlIo
Y3RybC0+ZG1hX3R4X2NoYW5uZWwpKSB7DQotCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZXF1
ZXN0IFRYIGRtYSBjaGFubmVsIik7DQotCQlyZXQgPSBQVFJfRVJSKGN0cmwtPmRtYV90eF9jaGFu
bmVsKTsNCisJCXJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGN0cmwtPmRtYV90eF9j
aGFubmVsKSwNCisJCQkJCQkJIkZhaWxlZCB0byByZXF1ZXN0IFRYIGRtYSBjaGFubmVsIik7DQog
CQljdHJsLT5kbWFfdHhfY2hhbm5lbCA9IE5VTEw7DQogCQlyZXR1cm4gcmV0Ow0KIAl9DQotLSAN
CjIuMjUuMQ0KDQo=
