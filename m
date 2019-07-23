Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6771978
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 15:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7154B189E;
	Tue, 23 Jul 2019 15:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7154B189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563889117;
	bh=i9awd142FZR6TUtfdaWHRkooicccewdtlInqlcVheH8=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctd7tV3vwpsEJVX/wpXOrY6nZE4Q6P7Q8at8zNrEsacEtNnmBDXkRxO4lrIgK+Bin
	 Dmw6nyQ6pAc6xngaFFmL1l4XIPhZxZSUpOhZkIcEGJklY44bwnsQP6dstfvbuHF8LL
	 saOqRnLtdCKW6ky818YV8VkYKi5f1UFFuNJHsz6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90260F80447;
	Tue, 23 Jul 2019 15:36:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2048FF80447; Tue, 23 Jul 2019 15:36:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2403F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 15:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2403F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="rOnJ4fVq"
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
IronPort-SDR: p5F/sA7YdHLM8clAfnHRWaQPNxjcz5d0OwSbLzMzTXF3La1yMXFfK3tB5hTR/0GQVdJ5qbOyxL
 RlFGcQKR0PfZJNha8IDoN287TScTPRYDkdDPP54Iv1AM7Fz80pthSZETT1s6CXyKfuuHuTZjBb
 d5/HATwUAq0kOm71iw33b9gdy3Nu/1m4yud3NrMMvVFffSJqPHBU9VweYBnX5jXJsEQxAJc8mG
 5QxIKtQi5h1I0nHnvqIMuL9LtYvW6ZejUiptZ9DUiAggTrCCWD1FxhCp1RtYKaFGMEhR9OG63P
 ZZc=
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="42407943"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jul 2019 06:36:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 23 Jul 2019 06:36:40 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 06:36:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJXRfHQUysS26bTKTGA98cbu0msoXNnX4+uRXbtKE2/F3zBrR30Mz0Vg8Wd7z/qNLYVi+kuZUMoyvDweSdsUaXVJr2mSihk8dM1prvTNsckkPUk/oA1h+0coz+++X7C3AB8BiiVmCv3DNKLpE7+RP+79KtS/JayLngIWJz6UNnWi2narAXbalV1+hm59DVUi9dWM6F2aHpI5LaIVFiuEWC6sZjLKLuKrgK8XqsLPP7W4HMIHF5NR2dywNCtbu+FMMmdqoq77dqfi4Djyzj2RTKXNHtFEqsvtUHTIdSWgOSLbiXIhcbe8AC1cWWM3c0zM/M6LWfLezS1IqVenrer/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFrqDHawLb/trzU20SMx+AQ27k7rKs/uM2NS03dwJxg=;
 b=ezfCimUP9GLNq9rROp4jg2GidinfjPjEuKF70DFPYXe6r54lbnFFsFNWMMvYST4PI81fQlWnncRT2SIUIPnOMBrYzx10D65TtaR6G5kavAqLF4yR1uRW3712AGdwXOFNhviOXIDGncI9cNT2jfIW0h96MGaVPMkn/K2A0z8LHQD2PAIMz44ayjMCfetJNjZ5xozW9UipIhNEKT/awMEvA+hQshCrS7DoCZniNeIvzFC+PEiCSR0APF2ZfvjVPtdhk6YGVR+6Y5LTL2GgRbUB9PrDJ0uJ36gdkBsdcrRRSNiRobG+2eFA5QJ4J6JG6Kgw3GY613H+p0y5MXR89kz6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFrqDHawLb/trzU20SMx+AQ27k7rKs/uM2NS03dwJxg=;
 b=rOnJ4fVq8bP8B5BbiMm1Pt6HsMCoSK7LDOCbt5MohbWUqMk1yjNU17/zSIpV20Pn/NhpLK4BmGa2z6NFklsiKgDvHw19bs9qmmA5EFz/jAKfd1UHFAhDgNNw0aG6YgiYIE5mUJx5c3WmWbF8KTS04eeGV05p/H2swqM+XIoM3d4=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 13:36:38 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2%3]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 13:36:38 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>, <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in Kconfig
Thread-Index: AQHVQLssYvZ9YoKrUEmAJfgllXwkpabYNckA
Date: Tue, 23 Jul 2019 13:36:37 +0000
Message-ID: <1f3a4256-58de-27a4-8095-54fc6baa6d89@microchip.com>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0234.eurprd07.prod.outlook.com
 (2603:10a6:802:58::37) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44f1a542-b886-4207-98ef-08d70f72c95e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB0051; 
x-ms-traffictypediagnostic: BN6PR11MB0051:
x-microsoft-antispam-prvs: <BN6PR11MB005106BCBE9057A8965983D6E7C70@BN6PR11MB0051.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(366004)(189003)(199004)(51444003)(66066001)(486006)(31686004)(66476007)(4744005)(66556008)(64756008)(76176011)(68736007)(31696002)(52116002)(36756003)(66446008)(66946007)(6506007)(386003)(86362001)(6486002)(53546011)(478600001)(6436002)(102836004)(71200400001)(71190400001)(26005)(99286004)(229853002)(6512007)(11346002)(53936002)(4326008)(305945005)(54906003)(2906002)(256004)(6246003)(25786009)(110136005)(81156014)(316002)(81166006)(6116002)(3846002)(14444005)(14454004)(476003)(2616005)(5660300002)(2501003)(8936002)(66574012)(446003)(7736002)(186003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0051;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N5sQ0QhhKvcufi39b7dFrGgS76dvoYJUH6J7QK4fafCsj+CaVaxX4QT6Ho5d8fltuxZg1KIOSPAwTXqhRjlCgl4VlxqEprT4PmB7fYiP77D7bIoRno6b9jmnBlkFW0fVnILVO7pBd/PzJ5denPnFayYyYKlWqJSj7sSAZ1Q9qViah+OF9Zp7KEWeG5aauNR9YXtR38SOrKmQ/vhegkqqXrU+XPWLxLSWBsOpyjyyo5YJO0FkIZBUM91JiUUET3p1ArQF/8lkHSqLdTHWbxQHYhmab68BYC02c7Z+aXsFs0LHOGz0u5zncSFpPjhX9j4EspAVHzEVHzqqrREaI/uVUivWy+8GXyLeT6AXgBnYvVGYc8kNZ15rNkTfbJHjX6+aXC+IGLnGdNCEjJ84dHWjW3KSFJSd0VjT0VH1O3GY84I=
Content-ID: <387EFE8C7473E549982BFE82668C5F94@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f1a542-b886-4207-98ef-08d70f72c95e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 13:36:38.1399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0051
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 Nicolas.Ferre@microchip.com, tiwai@suse.com, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in
	Kconfig
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

T24gMjIuMDcuMjAxOSAyMToyNywgTWljaGHFgiBNaXJvc8WCYXcgd3JvdGU6DQo+IEFsbG93IFNT
QyB0byBiZSB1c2VkIG9uIHBsYXRmb3JtcyBkZXNjcmliZWQgdXNpbmcgYXVkaW8tZ3JhcGgtY2Fy
ZA0KPiBpbiBEZXZpY2UgVHJlZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PF
gmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4NCj4gLS0tDQo+ICAgc291bmQvc29jL2F0bWVs
L0tjb25maWcgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL0tjb25maWcgYi9z
b3VuZC9zb2MvYXRtZWwvS2NvbmZpZw0KPiBpbmRleCAwNmMxZDVjZTY0MmMuLjllZjlkMjViYjUx
NyAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2F0bWVsL0tjb25maWcNCj4gKysrIGIvc291bmQv
c29jL2F0bWVsL0tjb25maWcNCj4gQEAgLTI1LDcgKzI1LDcgQEAgY29uZmlnIFNORF9BVE1FTF9T
T0NfRE1BDQo+ICAgCWRlZmF1bHQgeSBpZiBTTkRfQVRNRUxfU09DX1NTQ19ETUE9eSB8fCAoU05E
X0FUTUVMX1NPQ19TU0NfRE1BPW0gJiYgU05EX0FUTUVMX1NPQ19TU0M9eSkNCj4gICANCj4gICBj
b25maWcgU05EX0FUTUVMX1NPQ19TU0NfRE1BDQo+IC0JdHJpc3RhdGUNCj4gKwl0cmlzdGF0ZSAi
U29DIFBDTSBEQUkgc3VwcG9ydCBmb3IgQVQ5MSBTU0MgY29udHJvbGxlciB1c2luZyBETUEiDQoN
CkNvdWxkIHlvdSBwbGVhc2UgbWFrZSBzb21ldGhpbmcgc2ltaWxhciBmb3IgU05EX0FUTUVMX1NP
Q19TU0NfUERDPyBBbHNvLCANCkkgdGhpbmsgdGhhdCBpdCBzaG91bGQgc2VsZWN0IEFUTUVMX1NT
QywgdG8gYmUgYWJsZSB0byB1c2UgDQpzaW1wbGUvZ3JhcGgtY2FyZCB3aXRoIFNTQy4NCg0KVGhh
bmtzIGFuZCBiZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCg0KPiAgIA0KPiAgIGNvbmZpZyBTTkRfQVRN
RUxfU09DX1NTQw0KPiAgIAl0cmlzdGF0ZQ0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
