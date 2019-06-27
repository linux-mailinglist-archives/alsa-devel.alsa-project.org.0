Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE557E2A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 10:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B10D1717;
	Thu, 27 Jun 2019 10:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B10D1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561623736;
	bh=hS3aGgN52mQDjwHOxcFGCdgoU54Q0R5lfcb6NNAW5bc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KME6ILg0+DYXCdompL0bjQhBRJC+o3nuj8LxyvucBrJEmrFz5/mm5E4+M4Pd1Kngl
	 oeliUh+/uMijJuJjNUrA3ZqR/1R0CWkW7VgFjKynGRcioi8JdJSv+n1R/LJWDcuXC/
	 LnNflNHx1xlknEhXJF34VVjV/EyAzQ3rOAoJoy5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22017F896F6;
	Thu, 27 Jun 2019 10:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5198F896F6; Thu, 27 Jun 2019 10:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60A86F806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 10:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60A86F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="wKBTbXZO"
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="39117680"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2019 01:20:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 01:20:20 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 27 Jun 2019 01:20:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkL6zWpmY911NG+tqbCIXuohHStFLvKwkg/0HQXqGG0=;
 b=wKBTbXZOpNY0XLnSr4+DN4sq38KbEUkhzFTx1bYQkZZXVOMPil+DOJsRg1qBthfe/7FOJYxoANP8PWcbn6nHXP/2DcmKT8cs7Ca1CzKTW5fRLRtY5FG2NN9PmyWZ0Bz6dttOk8SkT8xc9HqHyPkT0bS1lVsIWUq8PVSuwDEmBr8=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB1684.namprd11.prod.outlook.com (10.173.28.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 08:20:17 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098%2]) with mapi id 15.20.2008.017; Thu, 27 Jun 2019
 08:20:17 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <amadeuszx.slawinski@linux.intel.com>, <kuninori.morimoto.gx@renesas.com>
Thread-Topic: [alsa-devel] [PATCH 01/23] ASoC: atmel: atmel-pcm:dma.c: use
 devm_snd_dmaengine_pcm_register()
Thread-Index: AQHVLLu+CoU573nKOUCrYBRlMUVc3aavJl6A
Date: Thu, 27 Jun 2019 08:20:16 +0000
Message-ID: <e6327e0c-a657-4fe5-4513-562835783eb0@microchip.com>
References: <8736jvkcy1.wl-kuninori.morimoto.gx@renesas.com>
 <871rzfkcxb.wl-kuninori.morimoto.gx@renesas.com>
 <20190627094316.35057063@xxx>
In-Reply-To: <20190627094316.35057063@xxx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0002.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::12) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [79.115.178.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f96ea2b-d951-4e76-61c6-08d6fad84924
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1684; 
x-ms-traffictypediagnostic: BN6PR11MB1684:
x-microsoft-antispam-prvs: <BN6PR11MB1684716C38093E5D7FED367FE7FD0@BN6PR11MB1684.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(316002)(68736007)(86362001)(3846002)(6116002)(2906002)(446003)(486006)(66574012)(31696002)(5660300002)(11346002)(2616005)(476003)(256004)(14454004)(478600001)(53546011)(110136005)(102836004)(76176011)(6506007)(8936002)(81156014)(73956011)(66946007)(66446008)(52116002)(66476007)(64756008)(66556008)(54906003)(31686004)(36756003)(53936002)(6486002)(6512007)(305945005)(99286004)(25786009)(4326008)(229853002)(186003)(72206003)(7736002)(14444005)(71200400001)(71190400001)(6436002)(6246003)(81166006)(386003)(26005)(8676002)(66066001)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1684;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dC03t4X7q1h6Fv6W9hFuN4PQINxnGXlr5tKdpZN4Mn8MJve/3GpvX4Eu3AEZw/TdtmVMJz5oh4e+dD/sjFXXq7NJ16vrFXFicdNFCv+8V06ucOSxhxhVhjoOctjC5zpeF4B2Iauk35M1vM+qTt/elxtMmVg3HiB8IkwFjaJ/1Xq2Gu5X5UM0fBOYPpRCPTNNObHH8lzLk6Ff0E+/W7nQaGHCF3qgf9eT6j+FYKfs0MpX6dmo01o6kEn58JTKW47cJV/XowvsM0l/BoV0DEJChy+hUzIltN+1Lt0qjQoT0HeScz4yeN701ydp3z1z4vTMjVT4W+x6Tf7ksiJq7vszl5xuJzPQEMS3rFMNLGXc9QpENICTmiYqBHYQPfLci87NAHpbFrIDf+pigvAjcMalZhAIod4x81MBh2c1BP2pMHc=
Content-ID: <CCC201A28C074040BA6EDCE333FA7EEE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f96ea2b-d951-4e76-61c6-08d6fad84924
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 08:20:16.9623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1684
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 01/23] ASoC: atmel: atmel-pcm:dma.c: use
 devm_snd_dmaengine_pcm_register()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMjcuMDYuMjAxOSAxMDo0MywgQW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6DQo+IEV4dGVy
bmFsIEUtTWFpbA0KPiANCj4gDQo+IE9uIDI3IEp1biAyMDE5IDExOjAwOjAxICswOTAwDQo+IEt1
bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4gd3JvdGU6
DQo+IA0KPj4gRnJvbTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJl
bmVzYXMuY29tPg0KPj4NCj4+IFdlIGhhdmUgZGV2bV94eHggdmVyc2lvbiBvZiBzbmRfZG1hZW5n
aW5lX3BjbV9yZWdpc3RlciwNCj4+IGxldCdzIHVzZSBpdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+DQo+
PiAtLS0NCj4+ICAgc291bmQvc29jL2F0bWVsL2F0bWVsLXBjbS1kbWEuYyB8IDQgKystLQ0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWwtcGNtLWRtYS5jDQo+PiBiL3NvdW5k
L3NvYy9hdG1lbC9hdG1lbC1wY20tZG1hLmMgaW5kZXggMDQyZTU5My4uOWFiZjA3MiAxMDA2NDQN
Cj4+IC0tLSBhL3NvdW5kL3NvYy9hdG1lbC9hdG1lbC1wY20tZG1hLmMNCj4+ICsrKyBiL3NvdW5k
L3NvYy9hdG1lbC9hdG1lbC1wY20tZG1hLmMNCj4+IEBAIC0xMTEsMTMgKzExMSwxMyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNuZF9kbWFlbmdpbmVfcGNtX2NvbmZpZw0KPj4gYXRtZWxfZG1hZW5n
aW5lX3BjbV9jb25maWcgPSB7DQo+PiAgIGludCBhdG1lbF9wY21fZG1hX3BsYXRmb3JtX3JlZ2lz
dGVyKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+ICAgew0KPj4gLQlyZXR1cm4gc25kX2RtYWVuZ2lu
ZV9wY21fcmVnaXN0ZXIoZGV2LA0KPj4gJmF0bWVsX2RtYWVuZ2luZV9wY21fY29uZmlnLCAwKTsN
Cj4+ICsJcmV0dXJuIGRldm1fc25kX2RtYWVuZ2luZV9wY21fcmVnaXN0ZXIoZGV2LA0KPj4gKwkJ
CQkJJmF0bWVsX2RtYWVuZ2luZV9wY21fY29uZmlnLA0KPj4gMCk7IH0NCj4+ICAgRVhQT1JUX1NZ
TUJPTChhdG1lbF9wY21fZG1hX3BsYXRmb3JtX3JlZ2lzdGVyKTsNCj4+ICAgDQo+PiAgIHZvaWQg
YXRtZWxfcGNtX2RtYV9wbGF0Zm9ybV91bnJlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+
ICAgew0KPj4gLQlzbmRfZG1hZW5naW5lX3BjbV91bnJlZ2lzdGVyKGRldik7DQo+PiAgIH0NCj4+
ICAgRVhQT1JUX1NZTUJPTChhdG1lbF9wY21fZG1hX3BsYXRmb3JtX3VucmVnaXN0ZXIpOw0KPj4g
ICANCj4gDQo+IERvIHdlIG5lZWQgdG8ga2VlcCBlbXB0eSBmdW5jdGlvbj8NCg0KTW9zdCBwcm9i
YWJseSBub3QuLi4gS3VuaW5vcmksIGxldCBtZSBrbm93IGlmIHlvdSB3YW50IG1lIHRvIHJlbW92
ZSANCmF0bWVsX3BjbV9kbWFfcGxhdGZvcm1fdW5yZWdpc3RlcigpIGZyb20gZXZlcnl3aGVyZS4N
Cg0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
