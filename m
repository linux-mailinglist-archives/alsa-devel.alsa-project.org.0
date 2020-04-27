Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 476591BA809
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 17:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7FED1689;
	Mon, 27 Apr 2020 17:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7FED1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588001547;
	bh=JKt4UX6zCmglcFRmLqFS+dyAFUnPMhObMcJFEleJDVg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oe/c2adepiPpM3ZTUqRXyyHkP9j2CuewwJBla6r3OQ7ZeDyjzVEnaY8H3CjUsNXzJ
	 GrRuZOFo1ECehRKu8KDzI2Mn+lHFejsBM3U07lAyQXfYnAqsNzrKvIyoVrqnSmkxC2
	 Fkw0JCHEbbiSpEhU4/G4qcE5NllIq083YgydynsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9C6F80113;
	Mon, 27 Apr 2020 17:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0C22F8022B; Mon, 27 Apr 2020 17:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD455F80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 17:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD455F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="raHg6zRT"
IronPort-SDR: Ua8ubmrEYAoIKjoMpS5oaa0sUsiWULqJGEYVcvns2nLD6LOZqY4rXqB82kix6VMObhKe3nawUn
 bFHf2yCbuyNA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 08:30:31 -0700
IronPort-SDR: quPxSxyH9HLDuyc9Z+NJ/0g2JypDBehRp+Ra1plX0xvgQ4vkOynL2+TObf0bfvOKGYs9jfwR1u
 pOKYeE9iHZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="246179909"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga007.jf.intel.com with ESMTP; 27 Apr 2020 08:30:30 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Apr 2020 08:30:30 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Apr 2020 08:30:29 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 27 Apr 2020 08:30:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 27 Apr 2020 08:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9clbmty01scpumd4KlBXVkTcBiRwwh+G99cO09tb1z7NdkYrIbUNEFENUYiTjRgIGbpBzR8GyCkpIUaATOdF50zoCrq6neotpJ/J0oxUfMp0NMUH6WIwfPQGpW5VYAhaihWwiqizsn6E57QrIc1eCQW02Y4TeN/MxwoFwDCSQKc9uQ7uuKYAYhw2V2f2O/7uxU0QZYj4W3n88ntyrsZ0l0nRmlgMVmTAuCvRCUP92LaIIDysvaTgino68Xbtkc1B18C3DCZlaoGlSOUH1Y/x5VztEC0wiAVzy9ok6ZA6QdPbv4NpFH0aKQFRi3hoV6cWlIha0vvU/XoiXgWgIeQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKt4UX6zCmglcFRmLqFS+dyAFUnPMhObMcJFEleJDVg=;
 b=a/ablCQ6AUeAiK+vc/9iZ7KMnlBSsz4Lx613VSyRrs+WuzWocrm2DrljN/n+CzRBBn657InBx2LWdximiZ0/x45KyhFmHGeXg4Cn6kknlXR5sxHZshvkeY7RO6l/CTfR8y0iI6846nzSlo8KWxSKa5K6LF2qlIzbHmIlzi+D5ngan4XXiKQPLjE5Vp8xJaVSXnLvoZ8uqGT2KIJlN+Gmd4R6OiumZNVWyWedEB17nWbyqM8ZfXhRPJrYNWFZf5c7cb3i7aRX1abpeUQQm2J6AgHh5PfljLWPW2B9Z+Lxdh+AWdC4/heHUV/Gc2sBoBrP+ya3Z/XzR0sdBspeRhF3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKt4UX6zCmglcFRmLqFS+dyAFUnPMhObMcJFEleJDVg=;
 b=raHg6zRTTRNfLCmlpIcCEz4xc2JIqm/dSOsHYVL5rKMM1rVgpr42R6KhXdU0LE70RRktUq3nB2Tyq7XDJ+fW7/7sVXPuewC2Yqrjlv8lVwGgr9oHI3cFM/v1o5BfWytoGy38/TcE2eKIiZrf+3OZkUY/W49YgIFhsM+93MRUeIA=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2196.namprd11.prod.outlook.com
 (2603:10b6:405:52::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Mon, 27 Apr
 2020 15:30:23 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6%11]) with mapi id 15.20.2937.023; Mon, 27 Apr
 2020 15:30:23 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/3] ASoC: bdw-rt5650: channel constraint support
Thread-Topic: [PATCH 2/3] ASoC: bdw-rt5650: channel constraint support
Thread-Index: AQHWHHACXxONYsF1y0+pzDhd7VvBBqiMzL+AgABHQbA=
Date: Mon, 27 Apr 2020 15:30:23 +0000
Message-ID: <BN6PR1101MB213246F6E8592460559440F097AF0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1587976638-29806-1-git-send-email-brent.lu@intel.com>
 <1587976638-29806-3-git-send-email-brent.lu@intel.com>
 <dc30437d-440b-937b-910f-6876bbc7cf56@intel.com>
In-Reply-To: <dc30437d-440b-937b-910f-6876bbc7cf56@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [111.248.248.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7abcaba8-6563-4779-cd8a-08d7eabfe755
x-ms-traffictypediagnostic: BN6PR1101MB2196:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB2196F1008EDEB9B97353A79397AF0@BN6PR1101MB2196.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(39860400002)(136003)(376002)(396003)(7696005)(2906002)(6506007)(186003)(26005)(33656002)(54906003)(71200400001)(110136005)(316002)(8676002)(7416002)(81156014)(66946007)(8936002)(5660300002)(4326008)(52536014)(55016002)(64756008)(9686003)(66476007)(66556008)(76116006)(86362001)(478600001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Usps1g3NoLilnHryzhYVDuJCNTPhCL8Ejof32WqFq5kvQnmpFQU6ffcOGT0odcsdsxwLlzN1DJpaVY8cVF7stX5JsneJ0F+lSSnQHBR1Wdj7iplyVXTDK5hMq5TxoCivt7v+iftyaUf9eeF7vbIUeYxm4UGQAJ2cF19N5Br48YsyiuCKUx+13GT5bgq/50ATOlzgyKJBHHqb9nd5FaOp3UOfGQceZLq385Mh0W66Jw8hIjKwNz2vwjBeCD5Pc41PQFNfmPTbvfGH0Ro2i95IOkLSGc4kLyuXbl4I+ixPzm3iXeaNSI+yluLi6D7OR/VHLVRubX5Kb4qaW78rp6th0fOLmeXIQP9ljPU6Ox3BAnj7mSQYOVaJSG4SEiVTTdoZ2SoLI+xCZKK/qgbSEL1Lvg/I507XoHOyAYiFiJjm+qgA2QzuLHkZ+P+OvWuZ8I5Q
x-ms-exchange-antispam-messagedata: m9oHYB0Lb9J7vqRw0v8DNl5a6OomN5Llebvrtz9kvfUNPTWz6UT4XngR7v+GXrNHxIDg2S1jGXveDHyOioKVV9iANBCfIKZ30bRHJQgUTRtbS6jHefIaHlRxDenB25x+aNZi9Fvmbnhlzoq4ARkuhcsiG/iCHPs14osGGXEVFcm5paQvPJJw7gCZT0S0pNVdhMBev6n5cd1cFV0V6uXF5a9nzynRzD7XTVH6jTjogHvyEl7d/tzbrODYv00/+rDdU6vNcSvPu+qyol3TYx5WOpk0P7C9/1oNUJ8znrCKPQLeIkwvJo2Suihszfdf4cYR21bFbM9DOcKTwOxSaGMBBeBWmsWWHhDBYtAnMBaVVIfK/wuKRa4al5RLF+J1otP7cWmqiYcy0acN9Nh9TAtQpVFCEjWZLEqpO56rUZ/WRlOYY9DX9zdH7nag1urrNxX020eoRx4j6nErl3B8/eJFXWVt0IcBn5TvVZFsxup8Y2OD8z7/AVnA6rEuXl5yTd07uPuJLq/Ygdnqtg13wWQQDGBXX+5oyY8geTqOopIMk9MVCvrBxjuhGVzkPsIFavatdrhPyvmyZoVKZUDH9UZOASqQN4N0iehojMjYebQJrTO04UUM9r8AkthuCW7QOf/od+feZoJ98bFyAKWYmr772k+rA5UJnvgl42JnbwvAKW8UpQdrg2T83l1bSEyWFXKqJaaDo912BFNV0O2roPYjMqwV1o21Vxn6nXe7QSZ3juH3594/4v+KGfbCDOuaRo4aKJSo1w8klGgvshUM60kgILopyeuOY5Zdvw5kfYSJFOrfqAqRwPU7//yReKISi8fL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abcaba8-6563-4779-cd8a-08d7eabfe755
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 15:30:23.4798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OPyMgJVccq3Z+e86gV81Arfr7lMDi2zha4gmG9yXVelyn97GopiYVwWDYfQPRVYar7wNcjba6jKMFcEDCZ9ucA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2196
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, "Chiang, Mac" <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>
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

PiANCj4gV2hhdCBhYm91dCBwbGF5YmFjayBjb25maWd1cmF0aW9ucz8NCj4gDQo+IFRpdGxlIGZv
ciB0aGUgb3ZlcmFsbCBzZXJpZXMgZml0cyBiZXR0ZXIgdGhhbiB0aGUgb25lIGNob3NlbiBmb3Ig
YWN0dWFsIHBhdGNoZXMuDQo+ICJjaGFubmVsIGNvbnN0cmFpbnQgc3VwcG9ydCIgaXMgbWlzbGVh
ZGluZy4gQ29uc3RyYWludHMgYXJlIGFkZGVkIG9yIHJlbW92ZWQNCj4gYnV0IGNlcnRhaW5seSBu
b3Qgc3VwcG9ydGVkLg0KPiANCg0KVGhlIEZFIERBSSBzdXBwb3J0cyBzdGVyZW8gcGxheWJhY2sg
b25seSBzbyBJIGRvbid0IGluc3RhbGwgdGhlIGNvbnN0cmFpbnQgZm9yIHBsYXliYWNrIHN0cmVh
bS4NCg0Kc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIgaHN3X2RhaXNbXSA9IHsNCgl7
DQoJCS5uYW1lICA9ICJTeXN0ZW0gUGluIiwNCgkJLmlkID0gSFNXX1BDTV9EQUlfSURfU1lTVEVN
LA0KCQkucGxheWJhY2sgPSB7DQoJCQkuc3RyZWFtX25hbWUgPSAiU3lzdGVtIFBsYXliYWNrIiwN
CgkJCS5jaGFubmVsc19taW4gPSAyLA0KCQkJLmNoYW5uZWxzX21heCA9IDIsDQoJCQkucmF0ZXMg
PSBTTkRSVl9QQ01fUkFURV80ODAwMCwNCgkJCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9T
MjRfTEUgfCBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwNCgkJfSwNCg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJyZW50IEx1IDxicmVudC5sdUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBzb3VuZC9z
b2MvaW50ZWwvYm9hcmRzL2Jkdy1ydDU2NTAuYyB8IDM0DQo+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9iZHctcnQ1NjUwLmMN
Cj4gPiBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvYmR3LXJ0NTY1MC5jDQo+ID4gaW5kZXggYWYy
ZjUwMi4uZGQ0ZjIxOSAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2Jk
dy1ydDU2NTAuYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvYmR3LXJ0NTY1MC5j
DQo+ID4gQEAgLTIxLDYgKzIxLDkgQEANCj4gPg0KPiA+ICAgI2luY2x1ZGUgIi4uLy4uL2NvZGVj
cy9ydDU2NDUuaCINCj4gPg0KPiA+ICsjZGVmaW5lIERVQUxfQ0hBTk5FTCAyDQo+ID4gKyNkZWZp
bmUgUVVBRF9DSEFOTkVMIDQNCj4gPiArDQo+IA0KPiBSZW1vdmUsIHdlIG5lZWQgbm90IGFkZGl0
aW9uYWwgdG9vLW9idmlvdXMgbWFjcm8uIE9uZSBjb3VsZCBhcmd1ZSAnU1RFUkVPJw0KPiBpcyBh
IGJldHRlciBjaG9pY2UgZm9yICcyJyBjaGFubmVsIGNvbmZpZ3VyYXRpb24gdG9vLg0KPiANCj4g
PiAgIHN0cnVjdCBiZHdfcnQ1NjUwX3ByaXYgew0KPiA+ICAgCXN0cnVjdCBncGlvX2Rlc2MgKmdw
aW9faHBfZW47DQo+ID4gICAJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQ7IEBA
IC0xNjIsNiArMTY1LDM2IEBADQo+IHN0YXRpYw0KPiA+IGludCBiZHdfcnQ1NjUwX3J0ZF9pbml0
KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQpDQo+ID4gICB9DQo+ID4gICAjZW5kaWYN
Cj4gPg0KPiA+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IGNoYW5uZWxzW10gPSB7DQo+ID4g
KwlEVUFMX0NIQU5ORUwsIFFVQURfQ0hBTk5FTCwNCj4gDQo+IElubGluZSBhcyBzdGF0ZWQgYWJv
dmUuDQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNt
X2h3X2NvbnN0cmFpbnRfbGlzdCBjb25zdHJhaW50c19jaGFubmVscyA9IHsNCj4gPiArCS5jb3Vu
dCA9IEFSUkFZX1NJWkUoY2hhbm5lbHMpLA0KPiA+ICsJLmxpc3QgPSBjaGFubmVscywNCj4gPiAr
CS5tYXNrID0gMCwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgYmR3X2ZlX3N0YXJ0
dXAoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0pDQo+IA0KPiBFbnRpcmUgZmls
ZSB1c2VzICdiZHdfcnQ1NjUwXycgbmFtaW5nIGNvbnZlbnRpb24uIExldCdzIG5vdCBzdHJheSBh
d2F5IGZyb20gdGhhdA0KPiBwYXRoIG5vdy4NCj4gDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBzbmRf
cGNtX3J1bnRpbWUgKnJ1bnRpbWUgPSBzdWJzdHJlYW0tPnJ1bnRpbWU7DQo+ID4gKw0KPiANCj4g
TWlzc2luZyBody5jaGFubmVsc19tYXggYXNzaWdubWVudCBmcm9tIHJ0NTY3NyAtIGluY29uc2lz
dGVuY3kvIGNvcHkgZXJyb3I/DQo+IA0KSSBqdXN0IGNvcHkgdGhlIGFzc2lnbm1lbnQgZnJvbSBv
dGhlciBtYWNoaW5lIGRyaXZlciBidXQgSSB0aGluayB0aGUgYXNzaWdubWVudCBpcw0KcmVkdW5k
YW50LiBUaGUgcnVudGltZS0+aHcgd2lsbCBiZSBpbml0aWFsaXplZCBpbiB0aGUgZHBjbV9pbml0
X3J1bnRpbWVfaHcoKQ0KZnVuY3Rpb24gYW5kIHRoZSBjaGFubmVsX21heCB3aWxsIGJlIG92ZXJ3
cml0dGVuLg0KDQpkcGNtX2ZlX2RhaV9zdGFydHVwDQotPiBkcGNtX2JlX2RhaV9zdGFydHVwDQot
PiBzb2NfcGNtX29wZW4NCiAgICA9PiBoZXJlIG91ciBiZHdfZmVfc3RhcnR1cCAoKSBpcyBjYWxs
ZWQNCi0+IGRwY21fc2V0X2ZlX3J1bnRpbWUNCi0tLT4gZHBjbV9pbml0X3J1bnRpbWVfaHcNCiAg
ICA9PiBoZXJlIHJ1bnRpbWUtPmh3IGlzIGluaXRpYWxpemVkDQoNCj4gPiArCS8qDQo+ID4gKwkg
KiBPbiB0aGlzIHBsYXRmb3JtIGZvciBQQ00gZGV2aWNlIHdlIHN1cHBvcnQsDQo+ID4gKwkgKiAy
IG9yIDQgY2hhbm5lbCBjYXB0dXJlDQo+ID4gKwkgKi8NCj4gDQo+IFNvbWV0aW1lcyB5b3UgYWRk
IGEgbmV3bGluZSBhZGQgYW5kIGJlZm9yZSwgd2hpbGUgb3RoZXIgdGltZXMganVzdCBvbmUsIGJl
Zm9yZQ0KPiB0aGUgY29tbWVudC4gUGxlYXNlIHN0cmVhbWxpbmUgdGhlIGZvcm1hdCBhY3Jvc3Mg
YWxsIHBhdGNoZXMgaW4gdGhlIHNlcmllcy4NCj4gQ29tbWVudCBjYW4gYmUgbW9yZSBzdHJpY3Qg
dG9vDQo+IAkvKiBCb2FyZCBzdXBwb3J0cyBzdGVyZW8gYW5kIHF1YWQgY29uZmlndXJhdGlvbnMg
Ki8NCj4gDQo+ID4gKwlpZiAoc3Vic3RyZWFtLT5zdHJlYW0gPT0gU05EUlZfUENNX1NUUkVBTV9D
QVBUVVJFKQ0KPiA+ICsJCXNuZF9wY21faHdfY29uc3RyYWludF9saXN0KHJ1bnRpbWUsIDAsDQo+
ID4gKw0KPiBTTkRSVl9QQ01fSFdfUEFSQU1fQ0hBTk5FTFMsDQo+ID4gKwkJCQkJICAgJmNvbnN0
cmFpbnRzX2NoYW5uZWxzKTsNCj4gDQo+IFJlZGVzaWduIHRvIHJlZHVjZSBpbmRlbnRhdGlvbiBh
bmQgaW1wcm92ZSByZWFkYWJpbGl0eSAtDQo+IAlpZiAoc3RyZWFtICE9IGNhcHR1cmUpDQo+IAkJ
cmV0dXJuIDA7DQo+IA0KPiAJcmV0dXJuIHNuZF9wY21faHdfY29udHJhaW50X2xpc3QoLi4uKTsN
Cj4gDQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgc25kX3NvY19vcHMgYmR3X3J0NTY1MF9mZV9vcHMgPSB7DQo+ID4gKwkuc3Rh
cnR1cCA9IGJkd19mZV9zdGFydHVwLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQg
YmR3X3J0NTY1MF9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQpDQo+ID4gICB7
DQo+ID4gICAJc3RydWN0IGJkd19ydDU2NTBfcHJpdiAqYmR3X3J0NTY1MCA9IEBAIC0yMzQsNiAr
MjY3LDcgQEAgc3RhdGljDQo+ID4gc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgYmR3X3J0NTY1MF9k
YWlzW10gPSB7DQo+ID4gICAJCS5uYW1lID0gIlN5c3RlbSBQQ00iLA0KPiA+ICAgCQkuc3RyZWFt
X25hbWUgPSAiU3lzdGVtIFBsYXliYWNrIiwNCj4gPiAgIAkJLmR5bmFtaWMgPSAxLA0KPiA+ICsJ
CS5vcHMgPSAmYmR3X3J0NTY1MF9mZV9vcHMsDQo+ID4gICAjaWYgIUlTX0VOQUJMRUQoQ09ORklH
X1NORF9TT0NfU09GX0JST0FEV0VMTCkNCj4gPiAgIAkJLmluaXQgPSBiZHdfcnQ1NjUwX3J0ZF9p
bml0LA0KPiA+ICAgI2VuZGlmDQo+ID4NCg==
