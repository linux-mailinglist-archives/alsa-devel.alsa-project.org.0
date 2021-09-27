Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D535419871
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 18:03:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE1216AE;
	Mon, 27 Sep 2021 18:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE1216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632758580;
	bh=PGaqkP+PD+HFpwRWZKWdjDSrGbFdjQrxWbxALlSE/6k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwq4MzkjwDsyHymV+/vzntKG/FS9X9FdUoWeQKxplEEascp13tH1Cc7pgBzFRuATt
	 3TSypyUMZFN2nwaYa+RAwYAE7yGANuRPKUzHhsazoftICyh3K9etnwxyRfPnACY0OD
	 F4q522aYGGBgu5r+ToriKq1Xt5wSA9SFvBowMfLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1887BF80147;
	Mon, 27 Sep 2021 18:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0A6EF80227; Mon, 27 Sep 2021 18:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2124.outbound.protection.outlook.com [40.107.92.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCED1F80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 18:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCED1F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="GOTs4y5v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uf/4bJ5CFKgcCA+fdz2pBU+fwPdMteombG36R1LHJUgAJsxkiZ5ijlvCvZu2S+zrMY1o1ETOc0Z/DgJKWL91ggnV6tgKeQmtk+LQXUftMQTC/yyr8pOkDgU++xsyunQS2Ty0IbfDhhsbsWTuEyidAhmOdLbm2R7q9QUwc0hrH2mK/9CyGPO5FmKVazLL0XaP4KSNg/5zzRfKlTANgacuZ5a3EfMpDimOdFPxbVUZ2WVv85LR3D43FrsD45uiSJGO903bbBmZZu4wpY2DO54cU2dumEnnlw6+stvIbstIj1Evx2ZfqqocJ0r45+uu8EqVV1h+chnSAoSOlMjLPZ8jRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PGaqkP+PD+HFpwRWZKWdjDSrGbFdjQrxWbxALlSE/6k=;
 b=hqEYXWuHyqm4vh1ypIis+eaEP3n+NWzznNod3HVkhkWitX4BAUfe44jkA9CP+vW+ei5wMPbInMI0lHk0blvqrx/HBE4KFybNadBi0xlMtFw5Aypt00THSI2LxjEQNPhoww89spbproOaSDbc44T2Ih8XM8WnH/1tiICZHHu+r+XJ44CP7siJzBEWFK81Jje7BjIV88M73RjWSO0lKi13LjyVDakr8bGaCzpO0h8M+pJG5i+cXt88qBFfa0jV3+Rvj/xjxDRgWzENykD2iMnSrZlM92Hia4YOQhASoFniwYi4pdnJa/UOjuk+EzvdYnDgYYzGTo5TtT7jjF9PSizSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGaqkP+PD+HFpwRWZKWdjDSrGbFdjQrxWbxALlSE/6k=;
 b=GOTs4y5vbhIr5XliotDvcXwT9pdfilPNHl/vjdSopx3aBd5UzQvKDHTJFK3wCsPlcTS3/fC07eXICInyuh314uLMoBRsp6QxFbpfmmaqkhXEatnXavS83k206ezF+KS5mP52hkkRucNNRGXIkHf8z8e2J8EAY68NrzhYzPT+1mQ=
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 by SJ0PR11MB5677.namprd11.prod.outlook.com (2603:10b6:a03:37e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 16:01:25 +0000
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178]) by SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 16:01:25 +0000
From: Ryan Lee <RyanS.Lee@maximintegrated.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "yung-chuan.liao@linux.intel.com"
 <yung-chuan.liao@linux.intel.com>, "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Index: AQHXsZF45/jZbOMADUKIjx+r35kUIKu3/BEAgAAPiFA=
Date: Mon, 27 Sep 2021 16:01:25 +0000
Message-ID: <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
In-Reply-To: <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed266236-4eed-4eef-35d1-08d981d00ee0
x-ms-traffictypediagnostic: SJ0PR11MB5677:
x-microsoft-antispam-prvs: <SJ0PR11MB567755747F64A743F43CA0C8E7A79@SJ0PR11MB5677.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1/UZFHd7HipX4asF/cVJts+MzZRZoAFSISXpfMsyu0oh4gTq4aDikbfrY3yXeW6KoltwpQmeLO22Jvsen9xYnZLXHsVjvI/RC1S/KM/5TXoYgh3xAWvKsL5G844PMeOXS4CDv0/tX50dDR0WaSls4C0Umfye3zotjT8NF8Xt1ystRtUJ/zQ+3H2j+mRIvdsLS/mm1QDQTKaDhZcCb9q6vOzDhcPqe15YQuVltKHxGwD+kN4V5kMN6vnPSutpyN6v6o4PK+SqYg0lGyh7mNFQmVA5mO22dpKWbthcUUTqYPCn7NTYefqbO9/NX+aEkUFWEKVbF0rMXwH1jUBDZMZPC0GQI79Okltf3Q+MPRtqiaGnXoYX/urwiHqzpFwF7LlTEIrd5PmqaY2Wxtt4n1RxUHKsAzBaOcxthxsFaNZJEtOF89ASPzI3CuUf07FlC7m2zfdtd6lIddEdShi0ltf/de8Dd1g7JSVOPpEjzZAe0nJRNboOmGPJ0EDsrIS8sR7qyemXSVYwEo7jO2RmlloPL2D2IYO5b9GJs6eCjjml8CPuBm7XhEbagoWgLEe/g7J2IUH7lG4+ANh6ji8jJAJgCcqPkIwwGAmJAWsM73QzOUrQOnwstZjHkT9JLakljpjlFWtsphlb5+OCNpS0cd/Xpr9gi45O0o5XnEzPN18cvUStoJaFguZDJri8cZR37JlLD1llq0/3twZ9RFwyYFyvQInCfn/25X3RMHQ84WZ8kuWIO4v9CvWsVOqtuyaMBfzq8uZ/aqGYFsHcHtMD7Vr9MXXGXo1bEraJ8AKhsZA3YYpHDRPi1MiqZ6mBKkMxPk7M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(8676002)(52536014)(7696005)(66946007)(33656002)(508600001)(5660300002)(8936002)(26005)(186003)(316002)(4326008)(76116006)(122000001)(38070700005)(71200400001)(54906003)(83380400001)(55016002)(9686003)(38100700002)(53546011)(6506007)(7416002)(86362001)(66446008)(64756008)(66476007)(2906002)(66556008)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VytaNksyVkQ0eDBPTE44VUtTbnRtbW9YVk8zWllPalk3NmxCWURWQXdiSEZ3?=
 =?utf-8?B?bkI1ZlFMQUxINm4zdTZuNlc2bjBFdXVXOHpGY2w5cEJmaVBzU2thUjErcnhQ?=
 =?utf-8?B?Smd1clc1VlJoSThWeUVqbDFLMGxnTFV5RnU1VFZUc0JFbk1TTnZwMUpibFR4?=
 =?utf-8?B?R1FHeTIwbnBsS3hxdFRLODR5TWlzL1FsSzFJTHl1RU1UaG8yVW8zR3VQU2ly?=
 =?utf-8?B?Y2MrMlNma0hSWlhPVHErYzNoNnp4dzh0TVkvcmdxdFFJclFWMWxBMFVqRWdU?=
 =?utf-8?B?NVg5NkM0TVk5V3F3MnlLd2E5RGhobTdNZGlCWVNTOVpQWGFObUtxV3NDNUR5?=
 =?utf-8?B?UkYwSUEvcHFneE8rOUZQTkw0M1p4WmpQUG85MkZhR1R4NFlrRUhDQlgzcHJ1?=
 =?utf-8?B?dWhRTHhGY21TcHpsSHdxMXlMTjkveXZCMGtscTRrU3FoYTVGTnFhcmlGTHR3?=
 =?utf-8?B?cVFtd2RxMFpad05tcHhzR2w4Q0Y3cGtCK0NHbVUwVHJRMkV6VnkrZTRyQWhx?=
 =?utf-8?B?RWJEOTA2a0doclNYeW5OYlNzYUVEV3BrWlQzdmtlVnUxMnZWUk1yT1h2TmlK?=
 =?utf-8?B?bmJ3OTh1aHNiL0RuelBCVEx3QjNTTzIvWFJPcHlWeEhkOFFSWDhZV2hhMCsy?=
 =?utf-8?B?bTlRQlhyRFJ6Q3duOFdrZW4yZzd3a0RqYTdRbHM2dGFvRFpIT1dvb0xtWldZ?=
 =?utf-8?B?RFVqZ3BiZjZIc1ZSNnFLUEJFQ1NnWHlYcjNxbmpzZzdDWnRrbURERSthUGJL?=
 =?utf-8?B?N01tUEIrdlVxRUFkWnBES2IrWHQwN2UyS0dUNkU3ZUdvbG9XaXBnL1FWOXMw?=
 =?utf-8?B?R3p3VVBncnNkN1NwajB1UWZJVVQxL2xwWld4MlB6L0ZxdjlEZlp6ci82VDR3?=
 =?utf-8?B?NTdId1VtQWRDbkthQUs4TWJ2N0c3bGs5NGpsVzVpdWhNR1IrWUpab2JZdVdB?=
 =?utf-8?B?L0pCeVJTTFpEajRPL25hTm50K2VXSXl2a1NuM2U1T0tzeUJpajUvcjM2Ni9K?=
 =?utf-8?B?dUI5N3BXY2R6Zzd5YWFzWENGdlBKVUc2ZmlHWHBLbWdRc1RTQTZKVnltdjhh?=
 =?utf-8?B?UkJHelBMS1BuZ2Z3T05OSzJ5MlhSLzBCRXRUT20zaCsvUU5oUnJuVFBhNTJv?=
 =?utf-8?B?UHVBMkdxZ0N6ZFdXUmlIME42TjFuaHBQM2JaL3VTRmU3ZUZXbW03QUVGZ2k2?=
 =?utf-8?B?V3lhUXpCNVBYbllTVU1ETERpd2NtQTVoNnRIRGJITXZNM3ZwOWdRNG02dnhw?=
 =?utf-8?B?aFRVeFJhcXp4U3ZWRzRnbHpvTWJ5aEVvQzJLRFk2Q2dpOHNxTVpEUDMxMkFP?=
 =?utf-8?B?b1hDSmVGQ29PMUNHb3VpMWl5bTRyK1UzL2tINlh1SElET0kwUUV3aldMd3pk?=
 =?utf-8?B?bjlUVk1XZzdmanFZWjUxMnJOVFBYalkzeEk1Z3I4Tyt5dUVIMDlkR1huNzNZ?=
 =?utf-8?B?cHhJRFBod0g2VlBUYmVRRnFTOVFqYUp4djdzZk05U0haWDBaNVlyZTAxVExl?=
 =?utf-8?B?OU5uU1ZNSWcvRkFWRU93am5sS1ZZSmJTUGZaZXdlWnM1bjBjeEZHLy9NSFFU?=
 =?utf-8?B?Y2tWSDl1bGIvTEJEK0JkcTBkd0RSYXlVaW44ZGN4K0lmMkxUOG80ZFFRL0NP?=
 =?utf-8?B?UmxiUy9xV3h4YUVmM1VwelMzUUNBeTBhdTV2alpnbDR4bk1haVk4VmprLzlT?=
 =?utf-8?B?Y2s1dnVaUWM1REZUL0F2NFZqMEJvK2VXUTlvSVB1ZHlaMUVrdFQvdFI1NWFw?=
 =?utf-8?Q?lIYt6ZTmlEsdwJSJSh65l0d+QRt2qZxpq8JmiWw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed266236-4eed-4eef-35d1-08d981d00ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 16:01:25.0449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LaCr4l3YzbtLfQSHb3weu614yhz74+VphY4/CJPldrx9zDue3bb25MDuoxhFxP1YEK+Ok17rAWQPEOO1ZQ1Z+qRRXh1aZ1kqDMHY5O2pFY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5677
Cc: "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2Fy
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXks
IFNlcHRlbWJlciAyNywgMjAyMSA3OjU1IEFNDQo+IFRvOiBSeWFuIExlZSA8UnlhblMuTGVlQG1h
eGltaW50ZWdyYXRlZC5jb20+OyBsZ2lyZHdvb2RAZ21haWwuY29tOw0KPiBicm9vbmllQGtlcm5l
bC5vcmc7IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNvbTsgeXVuZy0NCj4gY2h1YW4ubGlh
b0BsaW51eC5pbnRlbC5jb207IGd1ZW5uYWRpLmxpYWtob3ZldHNraUBsaW51eC5pbnRlbC5jb207
IGFsc2EtDQo+IGRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcNCj4gQ2M6IHNhdGh5YS5wcmFrYXNoLm0uckBpbnRlbC5jb207IHJ5YW4ubGVlLm1heGlt
QGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0hdIEFTb0M6IG1heDk4
MzczOiBNYXJrIGNhY2hlIGRpcnR5IGJlZm9yZQ0KPiBlbnRlcmluZyBzbGVlcA0KPiANCj4gRVhU
RVJOQUwgRU1BSUwNCj4gDQo+IA0KPiANCj4gT24gOS8yNC8yMSA1OjEzIFBNLCBSeWFuIExlZSB3
cm90ZToNCj4gPiBBbXAgbG9zZSBpdHMgcmVnaXN0ZXIgdmFsdWVzIGluIGNhc2UgYW1wIHBvd2Vy
IGxvc3Mgb3IgJ0ZvcmNlUmVzZXQnDQo+ID4gb3ZlciBTb3VuZHdpcmUgU0NQX2N0cmwgcmVnaXN0
ZXIoMHgwMDQ0KSBvciBIV19SRVNFVCBwaW4gY29udHJvbA0KPiA+IGR1cmluZyB0aGUgYXVkaW8g
c3VzcGVuZCBhbmQgcmVzdW1lLg0KPiA+IE1hcmsgY2FjaGUgZGlydHkgYmVmb3JlIGF1ZGlvIHN1
c3BlbnNpb24gdG8gcmVzdG9yZSBleGlzdGluZyB2YWx1ZXMNCj4gPiB3aGVuIGF1ZGlvIHJlc3Vt
ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gTGVlIDxyeWFucy5sZWVAbWF4aW1pbnRl
Z3JhdGVkLmNvbT4NCj4gPiAtLS0NCj4gPiAgc291bmQvc29jL2NvZGVjcy9tYXg5ODM3My1zZHcu
YyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL21heDk4MzczLXNkdy5jDQo+ID4gYi9zb3VuZC9z
b2MvY29kZWNzL21heDk4MzczLXNkdy5jIGluZGV4IGRjNTIwZWZmYzYxYy4uYTdlNGE2ZTg4MGIw
DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9tYXg5ODM3My1zZHcuYw0K
PiA+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvbWF4OTgzNzMtc2R3LmMNCj4gPiBAQCAtMjU5LDYg
KzI1OSw3IEBAIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQNCj4gbWF4OTgzNzNfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICAgICAgICAgICAgICByZWdtYXBfcmVhZChtYXg5ODM3
My0+cmVnbWFwLCBtYXg5ODM3My0+Y2FjaGVbaV0ucmVnLA0KPiA+ICZtYXg5ODM3My0+Y2FjaGVb
aV0udmFsKTsNCj4gPg0KPiA+ICAgICAgIHJlZ2NhY2hlX2NhY2hlX29ubHkobWF4OTgzNzMtPnJl
Z21hcCwgdHJ1ZSk7DQo+ID4gKyAgICAgcmVnY2FjaGVfbWFya19kaXJ0eShtYXg5ODM3My0+cmVn
bWFwKTsNCj4gDQo+IFdlIGFscmVhZHkgZG8gdGhlIGZvbGxvd2luZyBzZXF1ZW5jZSBpbiBtYXg5
ODM3M19pb19pbml0KCkgd2hlbiB0aGUNCj4gYW1wbGlmaWVyIHJlLWF0dGFjaGVzOg0KPiANCj4g
ICAgICAgICBpZiAobWF4OTgzNzMtPmZpcnN0X2h3X2luaXQpIHsNCj4gICAgICAgICAgICAgICAg
IHJlZ2NhY2hlX2NhY2hlX2J5cGFzcyhtYXg5ODM3My0+cmVnbWFwLCBmYWxzZSk7DQo+ICAgICAg
ICAgICAgICAgICByZWdjYWNoZV9tYXJrX2RpcnR5KG1heDk4MzczLT5yZWdtYXApOw0KPiAgICAg
ICAgIH0NCj4gDQo+IEkgZG9uJ3Qgc2VlIHdoYXQgbWFya2luZyB0aGUgY2FjaGUgYXMgZGlydHkg
b24gc3VzcGVuZCBtaWdodCBkbywgd2Ugd2lsbCBkbyBhDQo+IHN5bmMgb25seSBpbiB0aGUgcmVz
dW1lIHN0ZXAuDQo+IA0KPiBJSVJDIHRoaXMgaXMgYSBwYXRjaCB0aGF0IHdlJ3ZlIHNlZW4gYmVm
b3JlIGFuZCByZW1vdmVkIHNpbmNlIGl0IHdhc24ndA0KPiBhbGlnbmVkIHdpdGggYW55IG90aGVy
IGNvZGVjIGRyaXZlci4NCj4gDQo+IERvZXMgdGhpcyBhY3R1YWxseSBpbXByb3ZlIGFueXRoaW5n
Pw0KWWVzLCBpdCBkb2VzLiBUaGVyZSB3YXMgYW4gbXV0ZSBwcm9ibGVtIHJlcG9ydCBkdWUgdG8g
YW1wIHJlZ2lzdGVyIHJlc2V0DQpkdXJpbmcgc3VzcGVuZC9yZXN1bWUuIGFuZCB3ZSBjb25maXJt
ZWQgdGhhdCB0aGUgbW9kaWZpY2F0aW9uIA0KaXMgZWZmZWN0aXZlLiAoaHR0cHM6Ly9wYXJ0bmVy
aXNzdWV0cmFja2VyLmNvcnAuZ29vZ2xlLmNvbS9pc3N1ZXMvMTk0NDcyMzMxKQ0KVGhlIGFkZGVk
IGNvZGUgaGVscHMgdG8gcmUtd3JpdGUgdmFsaWQgdmFsdWVzIGluIGNhY2hlIHRvIHRoZSBhbXAg
aGFyZHdhcmUNCndoZW4gYXVkaW8gcmVzdW1lLiBTYW1lIGNvZGUgd2FzIHRoZXJlIG9uIGkyYyBk
cml2ZXIsIGJ1dCBub3Qgb24gU291bmR3aXJlDQpkcml2ZXIuDQo+IA0KDQo=
