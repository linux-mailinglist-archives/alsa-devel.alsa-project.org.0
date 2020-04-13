Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7AD1A682C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 16:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB27169F;
	Mon, 13 Apr 2020 16:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB27169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586788275;
	bh=NeSbgWJByQBX30ZvTluX0Ue0tvqnr/zmE8RAnUUOv8A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JylI7XpaSspFX9lC2QRTyWzq6A6FpRz8YnRzBjf+sb3oLhm6xC+a6vs0rank88OKq
	 oHC5KxnAnVeZKo34XRUgVZH/hvCBHivVOSANmJ/F+DmwRJqc5e4+ySMze+Zo6UxPT8
	 XqPIvxldqBykKAyDyHDkX5J/KSRrSWM+UQT3qbKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 670EDF8025F;
	Mon, 13 Apr 2020 16:29:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1421F80245; Mon, 13 Apr 2020 16:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0302EF8010E
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 16:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0302EF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="mwFyku4P"
IronPort-SDR: nshtWB0SFhkS1R08W+OkHgew7dvwRVwGtRQrHS/pOg42Eu8yOTpi6ZEQhIkv8WKUXxNVNV75at
 bwYqp7KJwgAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 07:29:18 -0700
IronPort-SDR: Hnq1rClRq58SIDLuq9SVLgk/qefQI3GduvsBurNZ7Z0tmIe78Nh8556rPu1+Ay4IZ01oYWu5+A
 VTvecGqGpRNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="256188156"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 13 Apr 2020 07:29:18 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Apr 2020 07:29:17 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.53) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 13 Apr 2020 07:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oE5rA57+Yv8beXpl7cd8w3MdCnMEwqTfly39OcTu7eHVUP3JMFU03+U/UIuk8aXLxMsbuImTRjQG5BnATidWAJUj61XRLCdU0hPBvJCIfZ1sSddKyzecofqRRZBLp8CxCPM/DwKgftWIzTYSI9TVMJ2FLAW1NdxzQPTxerRH8kjyoD31g16p64O79oxHkFlr6Y40GR+np/qzaygAoMXlQkflq1nnxyW2NavhwlmyK75d9lzykvLAuqa0PUAAa2t7qTiOnIUDsxrRYPCAdX+LHAWYIa6MZ/hUQbPQ7aiayL8NQKMEKITLKPKIxzfQpSON6yKozOVKhMlANoT3ik2lqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeSbgWJByQBX30ZvTluX0Ue0tvqnr/zmE8RAnUUOv8A=;
 b=dsRYuKRmX+fEN8uXSDDK5HsWhO/U4pPfmqPIHqcpUepmUXDYVF6XfxMqT2llAUBe+GNUh7FLm3ZnHlcDbWNB50jjxIhqRB9+fOPL2iE+nE1clSJs/wpFzDgmhsT0d+Xkr6oq4o34YHBcQwDlJ+mn2TQnrUll/tSO8Hn1BHC7z7doz1SebL2dIyAIdpNruBkTf7sb9UZXqUAKa43A9myLGt2fT+576LMwmCQgaYRnSuauz+dsI5v9N7jALUjvTG5en0JYYfUyLfbXDzKGfBUUCRb9iL1isXetJYwA0vXmHFDuR5NSOIz2BA8+oa4WqKhQOr2FrSCyXa6+COjUgnpgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeSbgWJByQBX30ZvTluX0Ue0tvqnr/zmE8RAnUUOv8A=;
 b=mwFyku4PcGX0WjwB0mrjbR64321j0yGWQeziurTaVtBoZ822sPEP+Lpqn0IqGrcHfHtmJuKIa7ZQbrlwP/oHULMEYeuK0dm6SnYc0LtXf6EIUjm7NFpo7sov52hye0a4qPpuuLxKaOLXaouwS266sD1hnazRjsJM1Gc2dhgT8EI=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2065.namprd11.prod.outlook.com
 (2603:10b6:405:51::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Mon, 13 Apr
 2020 14:29:12 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6%11]) with mapi id 15.20.2900.028; Mon, 13 Apr
 2020 14:29:12 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: bdw-rt5650: remove 3-channel capture support
Thread-Topic: [PATCH v2] ASoC: bdw-rt5650: remove 3-channel capture support
Thread-Index: AQHWEW50RKvqbhd6GkSfOOyTIRYC+Kh21uiAgABBZRA=
Date: Mon, 13 Apr 2020 14:29:11 +0000
Message-ID: <BN6PR1101MB21320F655CFC1C271CCA9CE097DD0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1586766533-18557-1-git-send-email-brent.lu@intel.com>
 <9a484795-ea4a-e559-4ea9-3de24417ec9b@linux.intel.com>
In-Reply-To: <9a484795-ea4a-e559-4ea9-3de24417ec9b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [192.55.52.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf33a1ae-7210-46f2-6bb5-08d7dfb7091b
x-ms-traffictypediagnostic: BN6PR1101MB2065:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB2065ED59EF0D592B5C6A9F6597DD0@BN6PR1101MB2065.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(396003)(376002)(39860400002)(346002)(478600001)(5660300002)(76116006)(186003)(66446008)(64756008)(33656002)(66476007)(2906002)(52536014)(26005)(66946007)(66556008)(7416002)(7696005)(6506007)(110136005)(54906003)(316002)(71200400001)(86362001)(8676002)(81156014)(9686003)(8936002)(55016002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xj4dvNZnrl95Z1XxFgyOueBFtJffsXjiQw2pHN4AcDPW8mWwUck40ph8a7EKtmp4s9omgysSFqKjgCJ6OAc5MtwTYv3UG45p2KulGtb8FIYjf/iK2QpJ/wH/jSo+94VM6Oth7awZiA9deLO2TTlLVDdK7IJ0TNkMzcSsYWuTDT+jgSvnwD8+9TUxiAY7loxR3PatP3Du9fzlS9IvEy/9N3UO7GHR+6C4eEtfjeX3DUpeECHp34FG7CDUMhC5GTonW46qBxn4dOOZB7EC1pTLfhScbmEZmzYTWwzWTVAM2Ac2KdMVnujXEARcPP8q0D8+njfgICV3YJnkN+9X8/GvzjOn6kQCUXp5JUaH+H7xhOKpaPBiCzSTbYs7A/Q5XHgEFOrD/wxi7UjxnVuYTDpzkx92XIkAmoLDDA1sjMAPtIt3W1aEVL8mZThFmGhoCCAv
x-ms-exchange-antispam-messagedata: 2FP4ahjC7EM3Q7AaIJ+wIJytevzxeDehSm4yh015h649EPD72mhEokUkrDw19gFtExnMqor0WMrbLq0O/YZjDcPiollEwPeqUMRpFXom+Ai4Oxo4Mgd6tpNVHg/CDy6zy4pjVqUjY8pyPYb05pWtzg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cf33a1ae-7210-46f2-6bb5-08d7dfb7091b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 14:29:12.0475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /U2qMph+c0RCXeA8uXLWMfH5idbduIuyO/RPotiH0STgo43C3wWbFjgYjEXUXMZjW0Dzysq69yKH5PG9wgg/GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2065
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, "Chiang, Mac" <mac.chiang@intel.com>, Mark
 Brown <broonie@kernel.org>
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

PiANCj4gVGhhdCBsb29rcyBsaWtlIGFuIGVycm9yIGNhdWdodCBieSB0aGUgQUxTQSBjb25mb3Jt
YW5jZSB0b29sPw0KPiANCj4gV2hhdCBhcmUgdGhlIG9kZHMgdGhhdCB3ZSBoYXZlIGEgc2ltaWxh
ciBpc3N1ZSB3aXRoIHRoZSBvdGhlciBicm9hZHdlbGwNCj4gZHJpdmVycyB3aGljaCBkb24ndCBo
YXZlIGEgY29uc3RyYWludCBvbiB0aGUgbnVtYmVyIG9mIGNoYW5uZWxzIGVpdGhlciBvbg0KPiB0
aGVpciAnU3lzdGVtIFBDTScgZGFpbGluaz8NCj4gDQo+IFRoYW5rcw0KPiAtUGllcnJlDQo+IA0K
DQpZZXMuIFRoYXQncyB3aHkgSSBhbSBzZW5kaW5nIHBhdGNoIGZvciB0aGlzIG9sZCBCRFcgcGxh
dGZvcm0uLi4NCg0KU28gZmFyIGFzIEkga25vdyBvbmx5ICdidWRkeScgc3VwcG9ydHMgMi80LWNo
YW5uZWwgcmVjb3JkaW5nIHdoaWxlIG90aGVyIEJEVw0KQ2hyb21lIHByb2R1Y3RzIHNob3VsZCBz
dXBwb3J0IHN0ZXJlbyByZWNvcmRpbmcgb25seS4gVGhlcmVmb3JlLCB0aGlzIGRlZmVjdA0Kc2hv
dWxkIG9ubHkgYmUgdHJpZ2dlcmVkIGJ5IHRoZSBBTFNBIGNvbmZvcm1hbmNlIHRvb2wuDQoNCkkg
YW0gdGhpbmsgYWJvdXQgaW1wbGVtZW50aW5nIHRoZSBjb25zdHJhaW50IGluIEZFIERBSSdzIHN0
YXJ0dXAoKSBjYWxsYmFjaw0KaW5zdGVhZCBvZiBEQUkgTGluaydzIGNhbGxiYWNrLiBTaW5jZSB0
aGUgY2hhbm5lbHNfbWF4IGlzIDQgZm9yIHRoZSBjYXB0dXJlDQpzdHJlYW0sIEFMU0EgY29uZm9y
bWFuY2UgdG9vbCB3aWxsIGFsd2F5cyB0ZXN0IDMtY2hhbm5lbCByZWNvcmRpbmcgb24gYW55DQpw
bGF0Zm9ybXMgdXNpbmcgdGhpcyBkcml2ZXIuIERvZXMgaXQgbWFrZSBzZW5zZSB0byB5b3U/DQoN
CnNvdW5kL3NvYy9pbnRlbC9oYXN3ZWxsL3NzdC1oYXN3ZWxsLXBjbS5jOg0Kc3RhdGljIHN0cnVj
dCBzbmRfc29jX2RhaV9kcml2ZXIgaHN3X2RhaXNbXSA9IHsNCgl7DQoJCS5uYW1lICA9ICJTeXN0
ZW0gUGluIiwNCgkJLmlkID0gSFNXX1BDTV9EQUlfSURfU1lTVEVNLA0KCQkucGxheWJhY2sgPSB7
DQoJCQkuc3RyZWFtX25hbWUgPSAiU3lzdGVtIFBsYXliYWNrIiwNCgkJCS5jaGFubmVsc19taW4g
PSAyLA0KCQkJLmNoYW5uZWxzX21heCA9IDIsDQoJCQkucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV80
ODAwMCwNCgkJCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfCBTTkRSVl9QQ01f
Rk1UQklUX1MxNl9MRSwNCgkJfSwNCgkJLmNhcHR1cmUgPSB7DQoJCQkuc3RyZWFtX25hbWUgPSAi
QW5hbG9nIENhcHR1cmUiLA0KCQkJLmNoYW5uZWxzX21pbiA9IDIsDQoJCQkuY2hhbm5lbHNfbWF4
ID0gNCwNCgkJCS5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzQ4MDAwLA0KCQkJLmZvcm1hdHMgPSBT
TkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLA0KCQl9LA0K
CX0sDQoNCg0KUmVnYXJkcywNCkJyZW50DQoNCg==
