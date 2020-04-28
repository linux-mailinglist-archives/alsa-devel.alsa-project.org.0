Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0FD1BC6D4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 19:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13D4168F;
	Tue, 28 Apr 2020 19:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13D4168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588095074;
	bh=UgOwVG4MVUnA9SKhbaMo8mlvmPGEFkhuV/AWRFnGvlo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vrIXyxUgancK/ncec2BPpTCM0BMDJcooba7f0Xr5lCrbuOsPyu02xmmJ2FWg6d0JR
	 JMtML9BdUMaiVsMJ/uOVgAV+Cc5yPnCvEu8DhlZreNnv++hg6Y8DixO2pJlirgrlM7
	 0d2yEahUM+pLKfrarX8CKRE9eHCsRq7fYqV37H54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C063F800B8;
	Tue, 28 Apr 2020 19:29:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFC59F801DB; Tue, 28 Apr 2020 19:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA5B1F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 19:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA5B1F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="o2L95dSg"
IronPort-SDR: cmuhnKfORCtb5SlZVFUyV8iW/7fU9hW1RuPsCHE+aWJR9fI5T+I7vZoyfmRIiZ+yGd3y6Bkx/O
 hV2Q5LQNk+BA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 10:29:17 -0700
IronPort-SDR: YAPcPEdbQc+Gb7FcELvHmj3R9QtJgAGc/iaX2bCs1XcQ4FDIzQ4EaCpkwwzR4yqF6fGtxTGN3e
 seeL6jPFWInw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="293928944"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2020 10:29:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Apr 2020 10:29:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 10:29:16 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 28 Apr 2020 10:29:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Apr 2020 10:29:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSCB87zbIJZqJXfdnBnDtcNFZeRrmR+5zLOl5tE1CHBTUR5g+++rwzvy7Q0x3Tfr9qDk5ThyBdCEjyWzM7FjGMOj4bPeJ1Joxt4VxkhHiQKYGJSYEYO9NNDF/Ne2WtOJvA802DthtOelyargGRBkoo+iqRG3GB4ahmxbVWAdYyF6pz45f8qFFY0ewFKlWjnSDzuiE12qGHMOEBOkNk8mvoIB3sKSlmcHGeqwWEX/xjYdx4E51b4i9Br6olRHFWo61mEu1INcGi/KHvzkhY3nJBmwtZ0L13Xa2RGMMe3XQCgF5Ow93hzfC5BKRcImWvaHJYA9Iuw1N6rfI1tn9eSiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgOwVG4MVUnA9SKhbaMo8mlvmPGEFkhuV/AWRFnGvlo=;
 b=XIro00H6F/OJxfjTHhfDxlBBpjaLZV0abOdiHcq+95UWsbADJl6+tdbJxdI/SWEJ5TMWgCV7z3/22eVp+1uYeZeGh3iUHdnEubu2/WBrNSZoRTDSv7k+4/vD5K0inh/+jmVT5FnG38xUhsamiZGLrehSYn86nUhOm0m0PibrgGGvJTw+DcSrRBOUJwN6vKHYxmEajYF2cbmqWKgVFZAK+tFOAAY859jQTR4iYAN/W4671G9YYmycebl5QKbQXAsF3mj1iwYW4dUYofbimG4eoxR2GOo8JLAlk4CiZaHWN9J4aatIkGzKwddc43k99bAsb8DiodKMbivKkHSIfXMOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgOwVG4MVUnA9SKhbaMo8mlvmPGEFkhuV/AWRFnGvlo=;
 b=o2L95dSgQvkn1ERBdLQ4wbbKkwIr0hddfYKwKpAd01GAANvzrl/qM0HLE3nn7JC9iXxlZOj+Lr92/IcazvZapE8QrKnVcWXiNF7Q9mZ+I2HJgA/nzUWytZbYm9iXRAJFvPBBARVHjuRJGM1pyWRG22AcjK4ho/NHjuOA1I3PjoM=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2242.namprd11.prod.outlook.com
 (2603:10b6:405:58::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 17:29:08 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6%11]) with mapi id 15.20.2937.026; Tue, 28 Apr
 2020 17:29:08 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, "Rojewski, Cezary"
 <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Topic: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Index: AQHWDxGPcERmvVi2FUaZ0GDzXVeqv6h4uesAgAAAnRCAAFQWgIAEY1sggAkDsACACG0YUA==
Date: Tue, 28 Apr 2020 17:29:08 +0000
Message-ID: <BN6PR1101MB2132D23B042284DDA667642A97AC0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
 <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <5e84c48c-a5d1-b2ff-c197-5efa478c5916@linux.intel.com>
In-Reply-To: <5e84c48c-a5d1-b2ff-c197-5efa478c5916@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.209.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e697d8a3-4bfd-4b8d-0098-08d7eb99a87f
x-ms-traffictypediagnostic: BN6PR1101MB2242:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB2242E09934E435DCEA44C09E97AC0@BN6PR1101MB2242.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(39860400002)(136003)(396003)(376002)(366004)(55016002)(9686003)(8676002)(2906002)(66556008)(7416002)(26005)(8936002)(186003)(52536014)(64756008)(66476007)(76116006)(478600001)(66946007)(66446008)(316002)(6506007)(7696005)(54906003)(110136005)(5660300002)(86362001)(33656002)(71200400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opOEUjMhcqXmoELYVJWLX0FEXrq/C4t3ne7YTQ4s4RGYmqflmVLGOOz/PJNdiHet0CfibtKUk90R5onxNnWeTjcaomtnA1lCHNOipY3K52/XuquxCWd/vl2m6qyAzocPHb0OECqo3Ytbw+kG0Mr8zK6dp5cqnhEPhH/VyeF7gpivvCnYmIe981YDDrHLGg0WX9MFNLLIxQxwty0gMtJkGf6ubajrPdRcbpdL9ho8EfWSjLrWw9xhSYpkSJ21zazxP6ygoc4gZemS47nnRhqhfFBRwnT1piwlBrelxIvO0TFGza9JdghauE2uqs3iRroPIBhwU4UvYqBnOi1e5+1wR6/YgJ8+h+YPKO/w3WOmTwj1zw9nVL8hgEq+L/RgJgS1So5PbQ6NhJkGQdi/uO9ZNL7iFYS7bpFnfNXxNMNlD+s3VOlzwPN/VWQ1V1ZmPBu3
x-ms-exchange-antispam-messagedata: JqUIoj8SO3e1HfISpnf045IDgi5AgPP0AIYNqAAFO6Lr8zT04QzSooWIlmcoZsi9b6ZmUPunIRG+JJw2kNX5G7npDwG3rTC7aye+wUhT0I1O5xtpUV2xOXXMyy+oLK+8neGTGseBvPezB51+gN/G6LHJ8cZJyKcCb2w8j/rAVzCcVw4Cx/LtBLmX8ikpGq5Hlxj4IchC4HU9UU3sK70oZAI6Hv9jCt2pBlHr3S97JQhqY66/0490xnA7Gw20r1wNpfHuntwv0WDELEHidAPpNhGcqypP/r32qn1N/KIzsED6fyNgJ/wwiCra7OeVq1WliSo+QoX0qkp11OjA8ZyAxnJh0xF2R008RKj4MgYSYamDThWrXPBkvUTDRXVR0IkWi6viG9hvQG9HXC/WsNvWgsNw1PliKYDx3iChIskXoQgbApUBmb8LHm9lAStHEB8ysrEqRPiqgaSSALyuiZhW9c15Jc91p84ptbwMAiSEzL5r3cXImikSgI2ujXTQBnJ/lJQEESQg1VYrcniiHMLeZWsD2g4+roNhSBm/gc9vgx8af4Jfqwt5mPzEMVvGH9FheEqyXsZX993uqJo8GxC24CRabi6I5B8QO/64yX7c9BxvIWHJ5Av8pfIu7PEpxq1FkeiunlA/bfH21t70WfjJYxb6e0N0NaCGoPKbPLJLj7D/LmcnFMEwHMxMDPc6m5DwN+rt032z5cpRXy99RGJdGfqe7iZSdEA+X9OAFOJqd5sK6fHVEQiQaPPMRh7CuFauVb+xMbNnx+gb5H03JdtqJmfhaxXx89r/FiOjEMBePc8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e697d8a3-4bfd-4b8d-0098-08d7eb99a87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 17:29:08.2415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o7P5bVa/EKEE8Py/C9lHSLJ7Sk8tFtzWB/ImguGcFdaHYL79hG60BAP/4KeX3qtzAEKzfv+Ri0AyyiXLtS5EJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2242
X-OriginatorOrg: intel.com
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jie
 Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

PiANCj4gSSd2ZSBsb29rZWQgYXQgdGhlIGNvZGUgYW5kIGJ5dF9pc19kc3BfYnVzeSBzZWVtcyBz
dXNwaWNpb3VzIHRvIG1lLg0KPiBDYW4geW91IGNoZWNrIGlmIGZvbGxvd2luZyBjaGFuZ2UgZml4
ZXMgcHJvYmxlbSBmb3IgeW91Og0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9i
YXl0cmFpbC9zc3QtYmF5dHJhaWwtaXBjLmMNCj4gYi9zb3VuZC9zb2MvaW50ZWwvYmF5dHJhaWwv
c3N0LWJheXRyYWlsLWlwYy5jDQo+IGluZGV4IDc0Mjc0YmQzOGY3YS4uMzQ3NDZmZDg3MWIwIDEw
MDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvYmF5dHJhaWwvc3N0LWJheXRyYWlsLWlwYy5j
DQo+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9iYXl0cmFpbC9zc3QtYmF5dHJhaWwtaXBjLmMNCj4g
QEAgLTY2Niw4ICs2NjYsOCBAQCBzdGF0aWMgYm9vbCBieXRfaXNfZHNwX2J1c3koc3RydWN0IHNz
dF9kc3AgKmRzcCkNCj4gICB7DQo+ICAgICAgICAgIHU2NCBpcGN4Ow0KPiANCj4gLSAgICAgICBp
cGN4ID0gc3N0X2RzcF9zaGltX3JlYWRfdW5sb2NrZWQoZHNwLCBTU1RfSVBDWCk7DQo+IC0gICAg
ICAgcmV0dXJuIChpcGN4ICYgKFNTVF9JUENYX0JVU1kgfCBTU1RfSVBDWF9ET05FKSk7DQo+ICsg
ICAgICAgaXBjeCA9IHNzdF9kc3Bfc2hpbV9yZWFkNjRfdW5sb2NrZWQoZHNwLCBTU1RfSVBDWCk7
DQo+ICsgICAgICAgcmV0dXJuIChpcGN4ICYgKFNTVF9CWVRfSVBDWF9CVVNZIHwgU1NUX0JZVF9J
UENYX0RPTkUpKTsNCj4gICB9DQo+IA0KPiAgIGludCBzc3RfYnl0X2RzcF9pbml0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IHNzdF9wZGF0YSAqcGRhdGEpDQo+IA0KPiBXZSBzZWVtIHRvIHRy
ZWF0IFNTVF9JUENYIGFzIDMyIGJpdCByZWdpc3RlciBpbnN0ZWFkIG9mIDY0IG9uZSwgd2hpY2gg
bWF5DQo+IGV4cGxhaW4gd3JvbmcgYmVoYXZpb3VyLiAoU3BlY2lmaWNhdGlvbiBzYXlzIGl0IGlz
IDY0IGJpdCByZWdpc3RlcikuDQo+IA0KPiBUaGFua3MsDQo+IEFtYWRldXN6DQoNCkhpIEFtYWRl
dXN6LA0KDQpUaGUgcGF0Y2ggZG9lcyBub3Qgd29yayBidXQgSSBtYW5hZ2VkIHRvIGNyZWF0ZSBh
IHdvcmthcm91bmQganVzdCBmb3INCnJlZmVyZW5jZS4gU3RpbGwgZG9uJ3Qga25vdyB3aHkgZmly
c3QgcmVhZCBpbiBzc3RfYnl0X2lycV90aHJlYWQgcmV0dXJucw0KaW5jb3JyZWN0IHZhbHVlLg0K
DQpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2JheXRyYWlsL3NzdC1iYXl0cmFpbC1pcGMu
YyBiL3NvdW5kL3NvYy9pbnRlbC9iYXl0cmFpbC9zc3QtYmF5dHJhaWwtaXBjLmMNCmluZGV4IDVi
YmFhNjY3YmVjMS4uNTZjNTU3Y2I3MjJkIDEwMDY0NA0KLS0tIGEvc291bmQvc29jL2ludGVsL2Jh
eXRyYWlsL3NzdC1iYXl0cmFpbC1pcGMuYw0KKysrIGIvc291bmQvc29jL2ludGVsL2JheXRyYWls
L3NzdC1iYXl0cmFpbC1pcGMuYw0KQEAgLTEyLDYgKzEyLDcgQEANCiAgKiBtb3JlIGRldGFpbHMu
DQogICovDQoNCisjZGVmaW5lIERFQlVHDQogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQogI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+DQpAQCAtMzEz
LDcgKzMxNCw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzc3RfYnl0X2lycV90aHJlYWQoaW50IGly
cSwgdm9pZCAqY29udGV4dCkNCiAgICAgICAgc3RydWN0IHNzdF9kc3AgKnNzdCA9IChzdHJ1Y3Qg
c3N0X2RzcCAqKSBjb250ZXh0Ow0KICAgICAgICBzdHJ1Y3Qgc3N0X2J5dCAqYnl0ID0gc3N0X2Rz
cF9nZXRfdGhyZWFkX2NvbnRleHQoc3N0KTsNCiAgICAgICAgc3RydWN0IHNzdF9nZW5lcmljX2lw
YyAqaXBjID0gJmJ5dC0+aXBjOw0KLSAgICAgICB1NjQgaGVhZGVyOw0KKyAgICAgICB1NjQgaGVh
ZGVyLCBtYXNrLCBvbGQsIG5ldzsNCiAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCg0KICAg
ICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmc3N0LT5zcGlubG9jaywgZmxhZ3MpOw0KQEAgLTMzMiwx
MCArMzMzLDMyIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzc3RfYnl0X2lycV90aHJlYWQoaW50IGly
cSwgdm9pZCAqY29udGV4dCkNCiAgICAgICAgICAgICAgICAgKiBwcm9jZXNzZWQgdGhlIG1lc3Nh
Z2UgYW5kIGNhbiBhY2NlcHQgbmV3LiBDbGVhciBkYXRhIHBhcnQNCiAgICAgICAgICAgICAgICAg
KiBvZiB0aGUgaGVhZGVyDQogICAgICAgICAgICAgICAgICovDQotICAgICAgICAgICAgICAgc3N0
X2RzcF9zaGltX3VwZGF0ZV9iaXRzNjRfdW5sb2NrZWQoc3N0LCBTU1RfSVBDRCwNCi0gICAgICAg
ICAgICAgICAgICAgICAgIFNTVF9CWVRfSVBDRF9ET05FIHwgU1NUX0JZVF9JUENEX0JVU1kgfA0K
LSAgICAgICAgICAgICAgICAgICAgICAgSVBDX0hFQURFUl9EQVRBKElQQ19IRUFERVJfREFUQV9N
QVNLKSwNCi0gICAgICAgICAgICAgICAgICAgICAgIFNTVF9CWVRfSVBDRF9ET05FKTsNCisgICAg
ICAgICAgICAgICAvKiBpbmxpbmUgdGhlIHNzdF9kc3Bfc2hpbV91cGRhdGVfYml0czY0X3VubG9j
a2VkIGZ1bmN0aW9uICovDQorICAgICAgICAgICAgICAgbWFzayA9IFNTVF9CWVRfSVBDRF9ET05F
IHwgU1NUX0JZVF9JUENEX0JVU1kgfA0KKyAgICAgICAgICAgICAgICAgICAgICAgSVBDX0hFQURF
Ul9EQVRBKElQQ19IRUFERVJfREFUQV9NQVNLKTsNCisgICAgICAgICAgICAgICBvbGQgPSBzc3Rf
ZHNwX3NoaW1fcmVhZDY0X3VubG9ja2VkKHNzdCwgU1NUX0lQQ0QpOw0KKyAgICAgICAgICAgICAg
IG5ldyA9IChvbGQgJiAofm1hc2spKSB8IChTU1RfQllUX0lQQ0RfRE9ORSAmIG1hc2spOw0KKw0K
KyAgICAgICAgICAgICAgIGlmIChvbGQgIT0gbmV3KQ0KKyAgICAgICAgICAgICAgICAgICAgICAg
c3N0X2RzcF9zaGltX3dyaXRlNjRfdW5sb2NrZWQoc3N0LCBTU1RfSVBDRCwgbmV3KTsNCisNCisg
ICAgICAgICAgICAgICAvKg0KKyAgICAgICAgICAgICAgICAqIHdvcmthcm91bmQsIGdpdmUgaXQg
YSBzZWNvbmQgY2hhbmNlIGlmIHRoZSBTU1RfSVBDRA0KKyAgICAgICAgICAgICAgICAqIGNoYW5n
ZXMNCisgICAgICAgICAgICAgICAgKi8NCisgICAgICAgICAgICAgICBpZiAob2xkICE9IGhlYWRl
cikgew0KKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2RiZyhpcGMtPmRldiwgIiVzOiBoZWFk
ZXIgMHglbGx4IG9sZCAweCVsbHhcbiIsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF9fZnVuY19fLCBoZWFkZXIsIG9sZCk7DQorICAgICAgICAgICAgICAgICAgICAgICBpZiAob2xk
ICYgU1NUX0JZVF9JUENEX0JVU1kpIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKG9sZCAmIElQQ19OT1RJRklDQVRJT04pIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiBtZXNzYWdlIGZyb20gQURTUCAqLw0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNzdF9ieXRfcHJvY2Vzc19ub3RpZmljYXRpb24oYnl0LCAm
ZmxhZ3MpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHJlcGx5IGZyb20gQURTUCAqLw0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNzdF9ieXRfcHJvY2Vzc19y
ZXBseShieXQsIG9sZCk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0NCisgICAg
ICAgICAgICAgICAgICAgICAgIH0NCisgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAg
LyogdW5tYXNrIG1lc3NhZ2UgcmVxdWVzdCBpbnRlcnJ1cHRzICovDQogICAgICAgICAgICAgICAg
c3N0X2RzcF9zaGltX3VwZGF0ZV9iaXRzNjRfdW5sb2NrZWQoc3N0LCBTU1RfSU1SWCwNCiAgICAg
ICAgICAgICAgICAgICAgICAgIFNTVF9CWVRfSU1SWF9SRVFVRVNULCAwKTsNCg==
