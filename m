Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1DE1CECF0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 08:20:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F381676;
	Tue, 12 May 2020 08:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F381676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589264409;
	bh=ehwNMz9Vo8qtVaP6EO+sFxJZ2t2kMuQWmifQ8u6kYo0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qp0GYdGPHL5ytL8Mdc4BQ1zgIqYOPctpKuN8QQ7dW+501MmvqL51S4TJdCSHqrOPn
	 /fzUKqQX+Z8AsFVf+ZVOkcD6yn7xErio9tu4xqmQh9bk3fdA+81op4cu0r6fBcU1Pe
	 vhMsdWJ7cXKtkCl0XADYtx+OPxR0UNcywzxcLsSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8919EF801DB;
	Tue, 12 May 2020 08:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA138F80158; Tue, 12 May 2020 08:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75DC7F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 08:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75DC7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="hDAgGUGP"
IronPort-SDR: zNl5spljQjOzdBr9Ec+eQP34jdcMYnwoOWOPgeSJ5LbzjxLbBTskq40VmiU8IIn3lRlJWKTcve
 mUtu1FQeq5LA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 23:19:03 -0700
IronPort-SDR: 6X0hHKmyQolfV/7ZOpklEGvs24Pq7WyKMVz5pkjVauCVaYs3z5CrjMEXMT2pHK1Wgx1zOsINlI
 pHCiBU0sGy/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,382,1583222400"; d="scan'208";a="251370130"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by fmsmga007.fm.intel.com with ESMTP; 11 May 2020 23:19:02 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 23:19:03 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX155.amr.corp.intel.com (10.22.240.21) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 23:19:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 23:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6BvNVEhWZccWicmHTSC4zQ/lwe1i5B5/4aQrlF8q/js7tx3m/kJVXayTSCrJGrgDSOj/3A6q822Bt7cUSdykHKWwPQgoujh98oy2ec+SRke6DG3btdq7TpNbjEyVhrGJn9irwoh5qibBpEdr5U14mVprZyE1ScPUafgj2AZGmByTo4gnpu7Y6FBR25a3yPnuoeRjTIRjAk44obguX9ge44803KCGWBh2nsicRxRoZzsQXXmvxOF7xGg/wwZK0L0ifs5GbH/dOKo0w4lOPWTOh54d5GZ2rWV1mqrEKyPoZ/W68o8sh6I0VJF4MAtHn49hTAQF+MUQR6aiRAGjK/fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehwNMz9Vo8qtVaP6EO+sFxJZ2t2kMuQWmifQ8u6kYo0=;
 b=b5JQhMqJvX7xgjS74WziW19pVeJU8von+2BSUk0lLZcI98iNRCYxjtkQCUsMyhN77NdXmaTznUF44N16A3HRJYrrYvQ9Zk6vfabfhCvZdk8bHxQxRvpqQq9tGR5pLP0GaEE0TwgX9Vb7bttbjRL08O3Qc3yyWoRbEaLc6F01KbjZLV4vP66K3W2c8/azI7UKYvByPRkoz2lwNeIDtSiFdeV0N+9A/AtK2E+la+aNj2Rg/Jn4LBswXdjHIYI5Q78uKnzDY6c7Bz52d+0/uJky3XpDtL0/rgNCA2UVTaBafN3PW1zZ6LxC6UFs/IzjBV+uzIgpA6zbROeARHzVkh3ydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehwNMz9Vo8qtVaP6EO+sFxJZ2t2kMuQWmifQ8u6kYo0=;
 b=hDAgGUGPTRoWhBWfgSippvEy6tpK0hIEVjlBhsBCfEs/ygwL7KKF+z7mB9ikov3FG/DBofJM7d8nRSwZ3lwWEbtrqr+HIlaxxzSo977SDk1qFHeGvr1GHAYzZ9l3qgktel5icfcc7LZLTjWJGYQI+EAHOfU0hdHsE0ZlAgGmBxs=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2116.namprd11.prod.outlook.com
 (2603:10b6:405:58::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 06:19:00 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 06:19:00 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, "Rojewski, Cezary"
 <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>
Subject: RE: [PATCH 1/2] ASoC: Intel: baytrail: Fix register access
Thread-Topic: [PATCH 1/2] ASoC: Intel: baytrail: Fix register access
Thread-Index: AQHWJGKN7GU/klieUEua3hguXOeTUKikAWjg
Date: Tue, 12 May 2020 06:19:00 +0000
Message-ID: <BN6PR1101MB2132B47AE82281E17C9CD78B97BE0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <20200507133405.32251-1-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20200507133405.32251-1-amadeuszx.slawinski@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.206.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 342c8e2e-5b56-41e8-e46e-08d7f63c5c9b
x-ms-traffictypediagnostic: BN6PR1101MB2116:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB2116EBC78B8EBE8E5391400F97BE0@BN6PR1101MB2116.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ibm/g/FVYt69iF3al4x8MwoA3TY389/B8IUKe+bct7xE77XJQlDAdBtMx/6p28ooIDQ/QHpH/Cct7ZpiR6Tyno1osPFGIvf4k3NEQfKFe9SKkWoxxou8JVJ5vGoTCsFXjT6qelgaAsnr0mi/DI23nEWedRNpUAgwk11E0OsOAERQcpQVoHpp89RLMk+CELliJrv8SC5BGAW/7K0RfsnSxIuuNGPBW9rRn6zPnh07tOcm9t46v2lxvkj6RACN73vtRAMMyUfxA/BbsGiC0vXZQF6kKeXvjXCXdFzLEZ6o6OXymmeUm0TERL2Tw/XAR8wFu1LgkYK8Mn5NLHs+okCs8DaLNFF9xveytqnqvqs4pg9Ij2LrICCg2/cDef1m9R0cTu6cd04VdpbIl87M25FBepCuH3q+C9Kxeqc4A+1Nu4NoD/SnaPBowcQRoNGMYjQCbsBxwez/o0rQKiG78mlOeesRzoD3Dk1rQz+wKgOjl1bg+Tpg56wjjIo2z4Zkz1r9n/oftXT1fPkp4qHJZIYIXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(136003)(396003)(39860400002)(346002)(33430700001)(478600001)(55016002)(7696005)(9686003)(76116006)(66946007)(66446008)(6506007)(186003)(66556008)(64756008)(52536014)(53546011)(66476007)(26005)(86362001)(110136005)(33440700001)(66574014)(8936002)(33656002)(8676002)(316002)(5660300002)(4326008)(2906002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MitYbEfhKNwQDUgA9uNUrbqp2CbckKuNcUCRmuMdRCs8WJ6zt6g3Z/EUBqMoB0Rp4K0xYw0lQlFtJ7AZYYA68NGRFS+ToBUUIY7zfrkaQIphNWeaF4ENyHwXQqtbRryhYmyAkf1xRov8B6qUbPbGxGRmKz3KJe8yBwH03Y+Qn9H4WB6xmPHqy5Ju5lN4mIDQnblUg3Ua2OTcfIrQuyDm/lA4Otp0XxeAMBPZbTtDNfejqdQLo8uVBrQU/BEcV8OMN498MFm8bZ17G+qbSVNbq/ger+2U1VRQp/TSLTFYwt29H7lxRniRJrj0AYoNy6ZEsW0uHYhL3H2kzg7KfSxhplpINJ8hwaqiXU2osa5PjVI1qkuS1hKEZfYC3N+LXLVv6VjprFrwdG0wZ6YhKTazW5lD6MLy4IYnNNJPW7TPJPpwSWwCgjc9mPKObtQjmzS7FAijpHFjX15oig9iUonVbrSQEI8l3qSscJ+6NbApKJ8Ilx2ZK7cPTD3/QYT77ptG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 342c8e2e-5b56-41e8-e46e-08d7f63c5c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 06:19:00.7256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uFOQCuJTih5D6og9VsV6S5TI+Fk5abbdsOWcWMW0p/xIVCOT9tNxzD+JWOkdXrkP+9Hk4I+3dNbNmml1vnE7MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2116
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbHNhLWRldmVsIDxhbHNhLWRl
dmVsLWJvdW5jZXNAYWxzYS1wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEFtYWRldXN6IFNs
YXdpbnNraQ0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDcsIDIwMjAgOTozNCBQTQ0KPiBUbzogUm9q
ZXdza2ksIENlemFyeSA8Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT47IFBpZXJyZS1Mb3VpcyBC
b3NzYXJ0DQo+IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+OyBMaWFtIEdp
cmR3b29kDQo+IDxsZ2lyZHdvb2RAZ21haWwuY29tPjsgSmllIFlhbmcgPHlhbmcuamllQGxpbnV4
LmludGVsLmNvbT47IE1hcmsgQnJvd24NCj4gPGJyb29uaWVAa2VybmVsLm9yZz47IFRha2FzaGkg
SXdhaSA8dGl3YWlAc3VzZS5jb20+DQo+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7
IEFtYWRldXN6IFPFgmF3acWEc2tpDQo+IDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVs
LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvMl0gQVNvQzogSW50ZWw6IGJheXRyYWlsOiBGaXgg
cmVnaXN0ZXIgYWNjZXNzDQo+IA0KPiBCYXl0cmFpbCBoYXMgNjQgYml0IHJlZ2lzdGVycywgc28g
d2Ugc2hvdWxkIHVzZSAqcmVhZDY0KiB0byByZWFkIGZyb20gaXQgYW5kDQo+IHRoZW4gdXNlIHBy
b3BlciBtYXNrIHZhbHVlcyB0byBjaGVjayBzdGF0dXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBB
bWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+
DQoNClRlc3RlZC1ieTogQnJlbnQgTHUgPGJyZW50Lmx1QGludGVsLmNvbT4NCg0KDQpSZWdhcmRz
LA0KQnJlbnQNCg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9pbnRlbC9iYXl0cmFpbC9zc3QtYmF5dHJh
aWwtaXBjLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2JheXRyYWls
L3NzdC1iYXl0cmFpbC1pcGMuYw0KPiBiL3NvdW5kL3NvYy9pbnRlbC9iYXl0cmFpbC9zc3QtYmF5
dHJhaWwtaXBjLmMNCj4gaW5kZXggNzQyNzRiZDM4ZjdhLi4zNDc0NmZkODcxYjAgMTAwNjQ0DQo+
IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9iYXl0cmFpbC9zc3QtYmF5dHJhaWwtaXBjLmMNCj4gKysr
IGIvc291bmQvc29jL2ludGVsL2JheXRyYWlsL3NzdC1iYXl0cmFpbC1pcGMuYw0KPiBAQCAtNjY2
LDggKzY2Niw4IEBAIHN0YXRpYyBib29sIGJ5dF9pc19kc3BfYnVzeShzdHJ1Y3Qgc3N0X2RzcCAq
ZHNwKSAgew0KPiAgCXU2NCBpcGN4Ow0KPiANCj4gLQlpcGN4ID0gc3N0X2RzcF9zaGltX3JlYWRf
dW5sb2NrZWQoZHNwLCBTU1RfSVBDWCk7DQo+IC0JcmV0dXJuIChpcGN4ICYgKFNTVF9JUENYX0JV
U1kgfCBTU1RfSVBDWF9ET05FKSk7DQo+ICsJaXBjeCA9IHNzdF9kc3Bfc2hpbV9yZWFkNjRfdW5s
b2NrZWQoZHNwLCBTU1RfSVBDWCk7DQo+ICsJcmV0dXJuIChpcGN4ICYgKFNTVF9CWVRfSVBDWF9C
VVNZIHwgU1NUX0JZVF9JUENYX0RPTkUpKTsNCj4gIH0NCj4gDQo+ICBpbnQgc3N0X2J5dF9kc3Bf
aW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzc3RfcGRhdGEgKnBkYXRhKQ0KPiAtLQ0K
PiAyLjE3LjENCg0K
