Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4F192BC5
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 16:05:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A64D166F;
	Wed, 25 Mar 2020 16:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A64D166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585148730;
	bh=xagPh31+B75x1pdbi0jhQhC0iACfTr7CqS6WXcz6hwM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xq2EzGCdT2kmu5QDtC5X93Ng6gvTQCZMDUHCH3g06Z/qXtOS8coWRET/5kwgDGvP5
	 4D0I+ftCfz00OrGbpaBVT4IZgigTePEKgF43C+QFRWEyinQJaqcov3+dAzz6gfUrhf
	 XEctgHFtNSLy9dUlpJBya/Fm/ErdtQaOiTqMOZNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C39CF80147;
	Wed, 25 Mar 2020 16:03:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E072F8015A; Wed, 25 Mar 2020 16:03:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7170F800EF
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 16:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7170F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="s2xSwASh"
IronPort-SDR: +tq5UOjQLY5dJ8neMc3qlSoThvBTrjEXQDHC13N+Oe0n5JP4vM0ZySZ2ByzTdvbgsz6P+4W6KA
 FzfrrZrMZsf77HtJrnD5gDuOZ5Ks/xFZ0mKe1mfxFuS9587J5AGB3gDY/Zu8IW9aPYMsRP0uYT
 9O8obwpwk6tf/2FUnUSuX/jRYH+3MYtD2C+XHOJ3dGqUgaL98ci0KAV9phnpSZP/N3aiwwMN72
 0HgcnxzudFq5VXAZ58dI/+LHR2vNRZ6Ex68KKMT9lfc8PtSsFzeuSBaFF3y/OGEiUt+1dsj55d
 tmY=
X-IronPort-AV: E=Sophos;i="5.72,304,1580799600"; d="scan'208";a="68350373"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Mar 2020 08:03:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 08:03:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 25 Mar 2020 08:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjkGGz8ABvkMbhnie91nUi+0AKxsW/rGUSqT+JWGoXVW/ldHYWxCF9DOfinkU2nWi1A0mAJ0DXVpBanEbdsSzrW8ZPrjFZU4tXxDkpYOS0WlbAnD0ptAaw4rT9Ybi7rJWLoPzdf+JfH1gjeb/1VUYCF9IbvO9VGkLPSm1VBFG+Ru6cWcZOFQt1spJCnnZjiBQLRJVzI/Q/Ov/HajKAU9RTBv0WULboNMsndOu8tu+UN0ekzKElhy/I90AHZoFAoaQXWZFymuEauqpc/LFUd+2ZWXKs+vz/jVXrQ7fgbIFIHpsoG5DSfS4vYQE5mq4+MG74MHQE8+r+uJezB6tWoN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xagPh31+B75x1pdbi0jhQhC0iACfTr7CqS6WXcz6hwM=;
 b=KSRrqRxq9DZmt8lAexEf7hjPVVsprCLDpYRX1VvvsROcQwvlxAHimR84t4lmhzZ16WAOk46z2Ukfj6TrR1+298LuFcSQneE444Nd3TJdt50wYt4hw2bVT+QR/mSZTWnXDdAWSsqB0sTo2lOP0EC/UimtCptnsF74qel0LZQsRZiyoQgFU6YgqDLKRLaxGvmUTaYiByCXDX70RiOX3J8tybYzAT3k5bv1vF7CQyXqc47pVsq7L9xdHHUhQXA83pFU39beUqj4eBIb500bw8vCHfqxedVEIc/QKM9lslBHzC1YalU2dN/ecDy2h1zquYZUtteYcvloG6QxvZr2Lb4sYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xagPh31+B75x1pdbi0jhQhC0iACfTr7CqS6WXcz6hwM=;
 b=s2xSwAShAVQVydIDkF5++edGSdEz7u2LaPMq9aKDz+lQk53gCV4ERJq88x63Tt/qS7d+mqenpfC4S7J3JuVRYoMYoU5xkz48LUATHalwJSB+Ahk8Y8dUh4fvvtBt8Eh6i+WOTrs4XPR206ixSI++Q2c8WygOiZb8PpVUwABNibw=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28)
 by BY5PR11MB3943.namprd11.prod.outlook.com (2603:10b6:a03:185::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 15:03:33 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::114b:fdb3:5bf5:2694]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::114b:fdb3:5bf5:2694%5]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 15:03:33 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <colin.king@canonical.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned
Thread-Topic: [PATCH] ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned
Thread-Index: AQHWAqluo8Epior2o0KE9euqviFOj6hZZ8YA
Date: Wed, 25 Mar 2020 15:03:32 +0000
Message-ID: <130efce3-5a04-a813-062b-79f8b4284db8@microchip.com>
References: <20200325132913.110115-1-colin.king@canonical.com>
In-Reply-To: <20200325132913.110115-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Codrin.Ciubotariu@microchip.com; 
x-originating-ip: [86.121.14.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b0ea2b4-cf85-4e6d-0945-08d7d0cdafb2
x-ms-traffictypediagnostic: BY5PR11MB3943:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3943972DCDD95D7D52C02C24E7CE0@BY5PR11MB3943.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(366004)(136003)(478600001)(6512007)(8936002)(81156014)(81166006)(6486002)(6506007)(8676002)(53546011)(4744005)(36756003)(2906002)(2616005)(31696002)(26005)(71200400001)(91956017)(76116006)(31686004)(66476007)(66446008)(186003)(4326008)(54906003)(110136005)(66946007)(64756008)(7416002)(316002)(5660300002)(66556008)(86362001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB3943;
 H:BY5PR11MB4497.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Rs4zLEOPKiRryYJdqSh0/9ucEe1Q3WTw/84CfyhUce+6iy6avIGURAq/u/RAcjQlcpqSlLpQFpwJ4px74RiBDQ70UD9RsKTAWkeHm0j717L2MoyeBUQMw1QEoAJSv0w+MrK150oKHEiiyCYi43dj21M7tVH2krcigjaD8wjozfR3l8h7hwIBLD/Tpq9JCOnWNONXoDWRe9DKphJKZUB39l5LNZbCf0N2jyM1LZnAD1331edx3p7MddvBxe7u4Hj83Oksjtz21eTYMhtgi1BODA5/z5y5ZMt0XfX2dWQc/6KeVj3x1MKpaouZ3wHeqafaMJh+HN3l759o50O8vaFZ3KuykMjvyTR5LshhYoCxT+AW6+B/HkFPrxFNkyZd/RCZ4ACGAOUJPIdmvGPzMHiqHgGag3MyGYXzdNDVAir/bj83NaR7Lu5csfB3thIR7rVtMUsQ2Rdi9XNyBnhYXl8dwCzAkwg+mVr05+QQWU+PXmBcNhCfx4OxFZdxFBHnTAG
x-ms-exchange-antispam-messagedata: YepDUms8wh/4mTrWnG1OGtrx0ncT/P8OeSwiwvL/TvB+A1iLMWixZi5lZ4/OtZOFVeBPbuq9OIS7Qky3ue0D/yVICnB+k4SnR7s2b8QUlQq9YFKWoZcuttCyOptYg6HXImXahPZiwTRKKrSJnT9aOA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <35594FF49A90AA4DA6C85EB2FDC5F5D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0ea2b4-cf85-4e6d-0945-08d7d0cdafb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 15:03:32.8869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: piFdO9lOTY66XuOgBot0jcDzYLW29jeqxGwg5vm3cz4qZL3enTiZUryXFV5DVpo56Nu6hNld5kQUuCi0MT0PfsKnnOi7Ekor+8nVqSrmY+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3943
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gMjUuMDMuMjAyMCAxNToyOSwgQ29saW4gS2luZyB3cm90ZToNCj4gRnJvbTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4gDQo+IFRoZSBzaWduZWQgMSBiaXQg
Yml0ZmllbGRzIHNob3VsZCBiZSB1bnNpZ25lZCwgc28gbWFrZSB0aGVtIHVuc2lnbmVkLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBt
aWNyb2NoaXAuY29tPg0KDQpUaGFua3MhDQoNCj4gLS0tDQo+ICAgc291bmQvc29jL2F0bWVsL21j
aHAtaTJzLW1jYy5jIHwgOCArKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVs
L21jaHAtaTJzLW1jYy5jIGIvc291bmQvc29jL2F0bWVsL21jaHAtaTJzLW1jYy5jDQo+IGluZGV4
IGJlZmMyYTNhMDViMC4uM2NiNjM4ODYxOTVmIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRt
ZWwvbWNocC1pMnMtbWNjLmMNCj4gKysrIGIvc291bmQvc29jL2F0bWVsL21jaHAtaTJzLW1jYy5j
DQo+IEBAIC0yMzksMTAgKzIzOSwxMCBAQCBzdHJ1Y3QgbWNocF9pMnNfbWNjX2RldiB7DQo+ICAg
ICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmFtZV9sZW5n
dGg7DQo+ICAgICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
ZG1fc2xvdHM7DQo+ICAgICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjaGFubmVsczsNCj4gLSAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2Nsa191c2U6MTsNCj4gLSAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2Nsa19ydW5uaW5nOjE7DQo+IC0gICAgICAgaW50ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHR4X3JkeToxOw0KPiAtICAgICAgIGludCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByeF9yZHk6MTsNCj4gKyAgICAgICB1bnNpZ25l
ZCBpbnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2Nsa191c2U6MTsNCj4gKyAgICAgICB1
bnNpZ25lZCBpbnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2Nsa19ydW5uaW5nOjE7DQo+
ICsgICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR4X3JkeTox
Ow0KPiArICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgICAgICAgICAgICAgICAgICByeF9y
ZHk6MTsNCj4gICB9Ow0KPiANCj4gICBzdGF0aWMgaXJxcmV0dXJuX3QgbWNocF9pMnNfbWNjX2lu
dGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQo+IC0tDQo+IDIuMjUuMQ0KPiANCg==
