Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E3210859
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 11:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF1AA167B;
	Wed,  1 Jul 2020 11:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF1AA167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593596310;
	bh=tc0EuN6xM5cwKGT97Hxrsm7fVgS6mlO1eng2CJS0Tbg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TsDSJTjnJbpzI55gp9Dbp6YpcDfc6WrTkpbsNX63JDp0Ey4s8g0RUHwosRga+o1e1
	 XAwV/jXhEFbieNW5vstSmy65gw3fxQxUDuP3p4hGU/IPyFvP3nVEaRGFgRCV2WQPVz
	 1H7UHcMFQWUmr6NpN6sOWXhWOkoWbPHL/Z/YbuYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8F6F800EA;
	Wed,  1 Jul 2020 11:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6FB4F80256; Wed,  1 Jul 2020 11:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75BBF800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 11:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75BBF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="WGuWdA9w"
IronPort-SDR: /50xPmgLoPN0Dk1GTmHqaGmq2SMV0Cxjx+t17UVAFGzcUNjBXFTgW5botnyx5KsF8sMPNQci71
 bHMbvEt4qS/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133989210"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="133989210"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 02:36:16 -0700
IronPort-SDR: BAgJjsXbiLNV+Suk/FIQXmWFXn9eXDiGmQ+zl0P0YKofgAGY1np1U+cnPIf2tgEbb6BKyjjyoY
 qqY52Wu3hHMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="295507034"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga002.jf.intel.com with ESMTP; 01 Jul 2020 02:36:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 1 Jul 2020 02:36:15 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 1 Jul 2020 02:36:15 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 1 Jul 2020 02:36:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 1 Jul 2020 02:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDxyA5PKtxM4jtCT76cIlDUPJ9PBfSJCqT2yPpMX456Cf/ARoWyviD9gAAsiNS0l0Ow7oUuRPp4n57J/FG9OzeewSFuylA76sjL0luJ9/TnFfO4xCrM0uwj2zY0Z6MW+L4XBejpCjcXYShlnialDCRnD57XZpnk1qpbtFa7v/mLBB6Y4jIZR2wtYLuSglSviZAiSw333g5NLpBfA+muX25n6hFFOaqQR+82tt4uJGdSdXdIJTdqY3oeaOAQwCyW1TifYgdQWKpjgV5Bagg//6o/Ft+QwScXEQuPa1gBN5jJ4IcX9cc+h8nK5uieCsepcsVj3CLuADgJ7/gik0s54fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0EuN6xM5cwKGT97Hxrsm7fVgS6mlO1eng2CJS0Tbg=;
 b=d2pwjj/JfPZWSYB3L0GRc0AgSGH6jClYl5imK0XWu6KO8IQjTXo/FtZUQ5GIoxojTDwQEorHEyglrYSBs4lp2PVYuXhPSpz0MDx8j+/VxjS52stDjRJAeyEK+Y804QJFnWyYYqP9nhZsBzS4qU+JFA7r40IATaX6CTruVxtT5yAm9u7MKGDfrhjG3JHK4v0pnAN3YdqdbpZacQGGiwVbuOPbwN8dM7EhGc7DBgC2fG1G22gB/hLQExfGfjiHYwawG1vXIbkdcpALqmwI13MrVOQyZ6rkbblhhiarsNzU7dh9DcCIjnhpdqfQqJsXrsSwQTWS94uE+y6iTnIwMyv7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0EuN6xM5cwKGT97Hxrsm7fVgS6mlO1eng2CJS0Tbg=;
 b=WGuWdA9wsVv0FPmnHGkNgUmKE52x3TMzYVmUCk2LWfcaAQb1JEnTwnfwvlanKRZ8QJpRmTCHUlcGM2WYJUcfPjaDH04XdfF6Ya3pLawSH3jZD+8RNqSpALOXTxnCUKw/HhF6WvcT/KJhZtMp/ic9838sPD//T9szDP6dIrfYvFI=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM5PR11MB1562.namprd11.prod.outlook.com (2603:10b6:4:6::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.25; Wed, 1 Jul 2020 09:36:13 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::29db:26c0:5600:9a71]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::29db:26c0:5600:9a71%7]) with mapi id 15.20.3153.022; Wed, 1 Jul 2020
 09:36:13 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
Thread-Topic: [PATCH] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
Thread-Index: AQHWTqkAWJec9MAQSEmIR6xGM1dpWajwtd2wgACjV4CAAR1PsA==
Date: Wed, 1 Jul 2020 09:36:13 +0000
Message-ID: <DM6PR11MB43163B1AED403FA32D9AD9FC976C0@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1593498722-7074-1-git-send-email-brent.lu@intel.com>
 <DM6PR11MB4316CA5F11462D11D1751C6C976F0@DM6PR11MB4316.namprd11.prod.outlook.com>
 <e7bd9caf-1bf8-d57c-2b67-13a63d23ebf9@linux.intel.com>
In-Reply-To: <e7bd9caf-1bf8-d57c-2b67-13a63d23ebf9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.25.86.99]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 080e4131-d0d4-4a21-00f1-08d81da23235
x-ms-traffictypediagnostic: DM5PR11MB1562:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1562FBA95A6BF5826CF82FEF976C0@DM5PR11MB1562.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4E/YqSWmYrxaX1msOxhVR4sQuNNB5shY5R07cBT99mnkGzGOcw1bFsXH9NIG6v+TtCyXpMDEXRl9gm4OuXQ6ZaDzYBF9DFQ6BMnS5OJ71CpFZQjlSHdCx9Yev9v2hiEJ6Pc2mVGfX2c3HZvUYruIGcujwiA40ZnR0zoIrUL8u09uK5UlLOnDdsqqTt5d3weXf+92IWpyYLgE2a8ZVquUjucXMJjwBl3KnGoptaTwpjS3MkX21p3F9zD6qRnaWp8gSKOOLeajinu2FJpzym67SOjTtzRZaWnjWQvN4y1u5d0CKnfyZwkoGjy/MlEXtn2uBwaIxKnMEowg8yZzOcP1JA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(7416002)(9686003)(76116006)(55016002)(5660300002)(64756008)(66946007)(66556008)(478600001)(66446008)(4326008)(66476007)(8676002)(52536014)(33656002)(26005)(2906002)(86362001)(8936002)(186003)(7696005)(110136005)(54906003)(71200400001)(6506007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9UkFeN1B9EM+3sl/yC0sNuJo5UQj15GH96np14bO0CzyavaB0y+HKLgl/os5ZsrMPOSGDQyVAbFXWO7AcFkGrC/mZ3rgY3YyzG2Jgqv8gXm0nCUos5GXELsLZOKhKTIrhrIaqLxss5NGfewGh5QIrdZ1UtWT2zZnLQ6v+l1JUDbNt8TzbKdv2px/fH+C49iRfcDH6ixD11X8+sJTR9w84jcUWv6BuEgPuRb4naZMzn7A6y9XO4XmSskcbhMXubIAD3wb/Cs50qC0hWCKTHmvXYGbr/Me+TcfAvpxiLekZxLI17EJjtaI4hxsG5TDSC5IziuAPC4wz5Z0Pqz151t707poobl0zJXdCU1qneJ9ZvNOlXQOc0KyLKifex616Xu/09NnyQlTvIQRb5sm7qEU4Td+EMxwcu8taa+FTcs0BNw0H7lVeZ1q+0hDAqmvL7iK2tBgOm5jhQ6umV/s/qbmDKDSHU24MJ6Hicm2C67FczM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080e4131-d0d4-4a21-00f1-08d81da23235
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 09:36:13.5588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CyqAF27RttmpaGffnAuu8Dgpc0fUT6bVkmqSSoCTRcy9O1qEHCWhVo7L/jROaSNwU3+Qx48B66rMyEgfq+UAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1562
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark
 Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Song,
 Chao" <chao.song@intel.com>, "M, Naveen" <naveen.m@intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, "Zhi, 
 Yong" <yong.zhi@intel.com>
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

PiANCj4gdGhpcyBkb2Vzbid0IGxvb2sgdG9vIGdvb2QsIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMg
dGhlIGFkZGl0aW9uIG9mDQo+IE1BWDk4MDkwIHdoaWNoIHNob3VsZCBiZSBhZGRlZCBpbg0KPiBT
TkRfU09DX0lOVEVMX0RBNzIxOV9NQVg5ODM1N0FfR0VORVJJQw0KPiBhYm92ZS4NCg0KV2lsbCBk
bw0KDQo+IA0KPiBpIGRvbid0IHRoaW5rIHlvdSBuZWVkIGEgZGlmZmVyZW50IHRvcC1sZXZlbCBj
b25maWcsIGp1c3QgZXh0ZW5kIHRoZSBleGlzdGluZw0KPiBvbmUgdG8gc2F5IE1BWDk4MzU3QSBv
ciBNQVg5ODM5MC4NCj4gDQo+IFsuLi5dDQo+IA0KDQpPSy4gSSdsbCBtb2RpZnkgdGhlIGRlc2Ny
aXB0aW9uIGZvciBNQVg5ODM5MA0KDQo+IA0KPiB0aGVzZSBsb29rIGxpa2UgdW5yZWxhdGVkIGNo
YW5nZXM/DQo+IA0KPiANCg0KV2lsbCByZXZlcnQgdGhvc2UgY2hhbmdlcy4NCg0KPiANCj4gVGhh
dCBsb29rcyBqdXN0IHdyb25nPw0KPiANCj4gSXQgd291bGQgYmUgcmVhbGx5IG9kZCB0byBsaXN0
IHR3byBkZXZpY2VzIGFzIHByZXJlcXVpc2l0ZXMgZm9yIGxvYWRpbmcgYSBkcml2ZXIsDQo+IHdo
ZW4gaW4gcHJhY3RpY2UgdGhleSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlPyBTb21ldGhpbmcncyBi
cm9rZW4gaW4NCj4gY29yZWJvb3QgaWYgYm90aCBhcmUgcHJlc2VudC4NCj4gDQo+IHNlZSBiZWxv
dyB3aGF0IHdlIHVzZWQgZm9yIEpTTDoNCj4gDQo+IHNlZSBzdGF0aWMgc3RydWN0IHNuZF9zb2Nf
YWNwaV9jb2RlY3MganNsXzcyMTlfOTgzNzNfY29kZWNzID0gew0KPiAJLm51bV9jb2RlY3MgPSAx
LA0KPiAJLmNvZGVjcyA9IHsiTVg5ODM3MyJ9DQo+IH07DQo+IA0KPiBzdGF0aWMgc3RydWN0IHNu
ZF9zb2NfYWNwaV9jb2RlY3MgbXg5ODM2MGFfc3BrID0gew0KPiAJLm51bV9jb2RlY3MgPSAxLA0K
PiAJLmNvZGVjcyA9IHsiTVg5ODM2MEEifQ0KPiB9Ow0KDQpFcnIuLi4gSSBtaXNyZWFkIHRoZSBz
bmRfc29jX2FjcGlfY29kZWNfbGlzdCBmdW5jdGlvbiBhbmQgbWFkZSB0aGlzIGVycm9yLiBXaWxs
DQpmaXggaXQgaW4gdGhlIFYyIHBhdGNoLiBJIHdpbGwgYWxzbyBmaXggdGhlIENocm9tZSB2NC4x
OSBicmFuY2guIFRoYW5rIHlvdSBmb3IgdGhlDQpyZXZpZXcuDQoNCg0KDQpSZWdhcmRzLA0KQnJl
bnQNCg0KDQo=
