Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 183FF9D104
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 15:48:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2657A169B;
	Mon, 26 Aug 2019 15:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2657A169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566827319;
	bh=TGpgHc2BTNto4kM4KXCgCCwBryW2XwKb53791zWh1Hw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M7tzA8lzjmBCG6AvzXrGDaG+kPMEdxm6X4qBsrqP7KOGsuS4HcJtQ8iPt/J182SuX
	 dhejCvq2w+qYKKIh9ZaoQJsyIRhcRavzFq/x5KhdhQCQwUVPKrbEngMsvR7HOOfLqU
	 0zAql1nL2nISv02Ml4qxO1s/kaeSaG4AhJml5XjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EF37F802BC;
	Mon, 26 Aug 2019 15:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D65F8014A; Mon, 26 Aug 2019 15:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa6.microchip.iphmx.com (esa6.microchip.iphmx.com
 [216.71.154.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C16AF8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 15:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C16AF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="UUXwgDI9"
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: EhWV2r5JRWOdo7CAMg5mQpszvR/GJH5tWFVAJkI6xATv3wZ1FRj6TKpejB+hbskPQbEXrsI16A
 FhVk6h2Sfu4B18hVOoQD4qEXyqCh5Dqg+V6qJWstedmeuO6og49DIy1H7X+vzVg7RdKblMpj9Z
 oXFaO78zypn1C/U0H2UOUz47aIvvXtceCHAqmGszWElA0IZCO68JBPPxtGpw1mtnlE6hA8DUVG
 jDuwH+1EnELcLJIa9VrPZaVdLlgOkQfC03mbELgvla6i6do7HsfCk0rpPjHJ5Q9QoLvBcLdMam
 wLM=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="43700175"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 06:45:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 06:45:57 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 26 Aug 2019 06:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGFesGpdl/gCWLpxOJ9b/WvOhK7xMK29I1ZRUErCyajZP9BkrCHpk4qWxjSKVsKbf8QrBVQ/vcOS/C2Xacn0oKEuTLFpt7gsDt9cE0J8K3px/0a/+XLpy4oPrefR8rQTZdzuKl96KYHZ8AC+gR4ia50uzDsstb/oeR5cYOaXsAkZPi+aaM3UrFBdY+Z6X6IbfaiYVHce7+KiyOFreUVKaPH0Z5iVq3gr7Vhhx/u5xiQHgGEdQ2yqesA9ZWKqMjHEtwRpRiBgAPQMUaIGljBbGbd4hGQl/svhJNSrehXFL9xLTof4dS2/Tko2GYJ9ffPxY5IuhXHh6wjfUvS4nxK8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64aqOb3qDwGcygfZFYtZSl3K8m9rWCTQMcYUNwyGdHM=;
 b=GWgpgJeOcYXtmuT/9PLsQw4mVYVp11d5dHlpPryj5J+pn+kz2kn9qg9VzwBTUEfVgGx2zF/42B8IvDXx9w0UhlvFWBNZE6x3949L32+mehdYEPBYC7zzFbWnZre6LBiPI0NV80imZGtoJOkowXhbOOhLyhKj/pDaOBskkiyYdTEurs2Yp7uipWoEJ43DNTnpQ1NKFz1k/dqqykkZVSW7f3HEzlkp6VgRjPvSpmxCznbnjupd6MGf5ukWSz2/bYDTuPs+rF/+303LzmVka3NweWizM1cYjW57aZU1wnn3NVSGVLSJKDPDB7yAA513j4iqkwQW1nkIvy1KyWAR+IgnpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64aqOb3qDwGcygfZFYtZSl3K8m9rWCTQMcYUNwyGdHM=;
 b=UUXwgDI9vQShlX2A9H3sh2h+YvXn9ins/FJ9CoBwjWk9V3XYFqarRhOKbjlfdb4D3B6GlBv67R0cJFtiqBTCr3eGCYeG/M+0elAPtHJ04LGgWC/4qRqPWSHUnjTEdvC36Ej4Q6zzXL/uSSGbizQK7NYfiI3RLZYvssd0ex+zRKU=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4181.namprd11.prod.outlook.com (10.255.162.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 13:45:56 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 13:45:56 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>
Thread-Topic: [PATCH v2 1/6] ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA
 in Kconfig
Thread-Index: AQHVWrpMB5SfcuBicUqn8zHcvguU4acNc6mA
Date: Mon, 26 Aug 2019 13:45:56 +0000
Message-ID: <2afbf219-9c2d-566a-511c-2bc332479f98@microchip.com>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <233d5461f4448df151755de7b69a0cd3ad310d5c.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <233d5461f4448df151755de7b69a0cd3ad310d5c.1566677788.git.mirq-linux@rere.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::11) To BY5PR11MB4497.namprd11.prod.outlook.com
 (2603:10b6:a03:1cc::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33b66457-92a4-4b01-f1be-08d72a2bb88d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR11MB4181; 
x-ms-traffictypediagnostic: BY5PR11MB4181:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4181D4D7EE22153FDCFD14E4E7A10@BY5PR11MB4181.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(346002)(39860400002)(136003)(199004)(189003)(102836004)(486006)(81166006)(476003)(54906003)(186003)(26005)(2616005)(81156014)(31696002)(53546011)(2906002)(6116002)(3846002)(478600001)(305945005)(110136005)(71190400001)(8676002)(446003)(76176011)(11346002)(7736002)(86362001)(6512007)(64756008)(66476007)(66556008)(66066001)(66446008)(66946007)(2501003)(6506007)(386003)(229853002)(256004)(36756003)(316002)(71200400001)(6436002)(14454004)(6486002)(31686004)(52116002)(8936002)(4326008)(5660300002)(99286004)(2201001)(7416002)(25786009)(6246003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4181;
 H:BY5PR11MB4497.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DcKaQCVCd9u7bB9fUFTw+GwE5FNeglPZA9Dk85bBgrrH6ZcNEQ9it/SRqgR3M0GlIY8BSBl3SqnPIzUIBZDLkb+aBzraVBF7t1qNNjaZXN0rVcIFNPB02REEX9TcM6yQGz5L+0qkyIJ5Fw7HQjEbzBJFxQGTvv99gsU88pI13FaQT899inXhGOCZ6gTeax4u9DgOt+T6jQcOwAX9yo0FUJzaaYUaMKfGMMqkwyxFIAmJpFrqtinR5+Hpj4Vzjnj9I4qn52TljL6a0JF/s3tP9tTCXUjFTGjfxOZBqPsTZ/p6yKb+3j3NQFS+MFVaAXoSIvU5hSrd6uLEJkhGKPOnX9NbvnXL9fO+Q+txTir6jr6QjUXG9nEALK3xGxehHVVUa5QTjds83i+TruhQwmp60WsaejKeXuiABfIGDfosRMs=
Content-ID: <E0A8CDA29785994B80CF66D3605A800D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b66457-92a4-4b01-f1be-08d72a2bb88d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 13:45:56.6493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAoDs5E3tlWQb9TqUSHHKGmJFf5OUvjOrMHC3HeVfNcbjsrcm3hs7Fi12US/qw3AQWeVO0b+tFCQAW1HMGrDYH20RqfcaIiG+dpPR81bTe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4181
Cc: mark.rutland@arm.com, alexandre.belloni@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, lgirdwood@gmail.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org, 3chas3@gmail.com,
 robh-dt@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/6] ASoC: atmel: enable SOC_SSC_PDC and
 SOC_SSC_DMA in Kconfig
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

T24gMjQuMDguMjAxOSAyMzoyNiwgTWljaGHFgiBNaXJvc8WCYXcgd3JvdGU6DQo+IEFsbG93IFNT
QyB0byBiZSB1c2VkIG9uIHBsYXRmb3JtcyBkZXNjcmliZWQgdXNpbmcgYXVkaW8tZ3JhcGgtY2Fy
ZA0KPiBpbiBEZXZpY2UgVHJlZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PF
gmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4NCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVi
b3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KDQpUaGFua3MhDQoNCkJl
c3QgcmVnYXJkcywNCkNvZHJpbg0KDQo+IA0KPiAtLS0NCj4gICB2MjogZXh0ZW5kZWQgdG8gUERD
IG1vZGUNCj4gICAgICAgcmV3b3JrZWQgYW5kIGZpeGVkIEtjb25maWcgb3B0aW9uIGRlcGVuZGVu
Y2llcw0KPiANCj4gLS0tDQo+ICAgc291bmQvc29jL2F0bWVsL0tjb25maWcgfCAzMCArKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVs
L0tjb25maWcgYi9zb3VuZC9zb2MvYXRtZWwvS2NvbmZpZw0KPiBpbmRleCAwNmMxZDVjZTY0MmMu
LmYxMThjMjI5ZWQ4MiAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2F0bWVsL0tjb25maWcNCj4g
KysrIGIvc291bmQvc29jL2F0bWVsL0tjb25maWcNCj4gQEAgLTEyLDI1ICsxMiwzMSBAQCBpZiBT
TkRfQVRNRUxfU09DDQo+ICAgY29uZmlnIFNORF9BVE1FTF9TT0NfUERDDQo+ICAgCXRyaXN0YXRl
DQo+ICAgCWRlcGVuZHMgb24gSEFTX0RNQQ0KPiAtCWRlZmF1bHQgbSBpZiBTTkRfQVRNRUxfU09D
X1NTQ19QREM9bSAmJiBTTkRfQVRNRUxfU09DX1NTQz1tDQo+IC0JZGVmYXVsdCB5IGlmIFNORF9B
VE1FTF9TT0NfU1NDX1BEQz15IHx8IChTTkRfQVRNRUxfU09DX1NTQ19QREM9bSAmJiBTTkRfQVRN
RUxfU09DX1NTQz15KQ0KPiAtDQo+IC1jb25maWcgU05EX0FUTUVMX1NPQ19TU0NfUERDDQo+IC0J
dHJpc3RhdGUNCj4gICANCj4gICBjb25maWcgU05EX0FUTUVMX1NPQ19ETUENCj4gICAJdHJpc3Rh
dGUNCj4gICAJc2VsZWN0IFNORF9TT0NfR0VORVJJQ19ETUFFTkdJTkVfUENNDQo+IC0JZGVmYXVs
dCBtIGlmIFNORF9BVE1FTF9TT0NfU1NDX0RNQT1tICYmIFNORF9BVE1FTF9TT0NfU1NDPW0NCj4g
LQlkZWZhdWx0IHkgaWYgU05EX0FUTUVMX1NPQ19TU0NfRE1BPXkgfHwgKFNORF9BVE1FTF9TT0Nf
U1NDX0RNQT1tICYmIFNORF9BVE1FTF9TT0NfU1NDPXkpDQo+IC0NCj4gLWNvbmZpZyBTTkRfQVRN
RUxfU09DX1NTQ19ETUENCj4gLQl0cmlzdGF0ZQ0KPiAgIA0KPiAgIGNvbmZpZyBTTkRfQVRNRUxf
U09DX1NTQw0KPiAgIAl0cmlzdGF0ZQ0KPiAtCWRlZmF1bHQgeSBpZiBTTkRfQVRNRUxfU09DX1NT
Q19ETUE9eSB8fCBTTkRfQVRNRUxfU09DX1NTQ19QREM9eQ0KPiAtCWRlZmF1bHQgbSBpZiBTTkRf
QVRNRUxfU09DX1NTQ19ETUE9bSB8fCBTTkRfQVRNRUxfU09DX1NTQ19QREM9bQ0KPiArDQo+ICtj
b25maWcgU05EX0FUTUVMX1NPQ19TU0NfUERDDQo+ICsJdHJpc3RhdGUgIlNvQyBQQ00gREFJIHN1
cHBvcnQgZm9yIEFUOTEgU1NDIGNvbnRyb2xsZXIgdXNpbmcgUERDIg0KPiArCWRlcGVuZHMgb24g
QVRNRUxfU1NDDQo+ICsJc2VsZWN0IFNORF9BVE1FTF9TT0NfUERDDQo+ICsJc2VsZWN0IFNORF9B
VE1FTF9TT0NfU1NDDQo+ICsJaGVscA0KPiArCSAgU2F5IFkgb3IgTSBpZiB5b3Ugd2FudCB0byBh
ZGQgc3VwcG9ydCBmb3IgQXRtZWwgU1NDIGludGVyZmFjZQ0KPiArCSAgaW4gUERDIG1vZGUgY29u
ZmlndXJlZCB1c2luZyBhdWRpby1ncmFwaC1jYXJkIGluIGRldmljZS10cmVlLg0KPiArDQo+ICtj
b25maWcgU05EX0FUTUVMX1NPQ19TU0NfRE1BDQo+ICsJdHJpc3RhdGUgIlNvQyBQQ00gREFJIHN1
cHBvcnQgZm9yIEFUOTEgU1NDIGNvbnRyb2xsZXIgdXNpbmcgRE1BIg0KPiArCWRlcGVuZHMgb24g
QVRNRUxfU1NDDQo+ICsJc2VsZWN0IFNORF9BVE1FTF9TT0NfRE1BDQo+ICsJc2VsZWN0IFNORF9B
VE1FTF9TT0NfU1NDDQo+ICsJaGVscA0KPiArCSAgU2F5IFkgb3IgTSBpZiB5b3Ugd2FudCB0byBh
ZGQgc3VwcG9ydCBmb3IgQXRtZWwgU1NDIGludGVyZmFjZQ0KPiArCSAgaW4gRE1BIG1vZGUgY29u
ZmlndXJlZCB1c2luZyBhdWRpby1ncmFwaC1jYXJkIGluIGRldmljZS10cmVlLg0KPiAgIA0KPiAg
IGNvbmZpZyBTTkRfQVQ5MV9TT0NfU0FNOUcyMF9XTTg3MzENCj4gICAJdHJpc3RhdGUgIlNvQyBB
dWRpbyBzdXBwb3J0IGZvciBXTTg3MzEtYmFzZWQgQXQ5MXNhbTlnMjAgZXZhbHVhdGlvbiBib2Fy
ZCINCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
