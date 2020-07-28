Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D871D22FF9D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 04:30:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5572D1696;
	Tue, 28 Jul 2020 04:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5572D1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595903409;
	bh=c9pH5elaeJebZRk1tYATEFh8QnFe2xYNvaUYYAavfwE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQDEgiOFK+G3krkgNCCdSgaXu57tdE/tq7vkUrbVPaLeXvvvtfWq+b/cI0w1sGTfT
	 N1MW0AD5+6+YZqNaq+HCidnoxgoWVg3igzWgqlZaxPSU9Xf/iyARVa/YPCkzKRKfqq
	 jzDpZKpt3GSb0+ycewk1HXUohqAUbWIKgOGR6URw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80073F800AD;
	Tue, 28 Jul 2020 04:28:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF3AF8021E; Tue, 28 Jul 2020 04:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C94BF8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 04:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C94BF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ps7T9eMO"
IronPort-SDR: STeWNwET2mQnFNSpc+1eKxBks51FduSSGAyo7IjQbFTzAIkKMXkmZxjsaLLWdt8m4GUj2L935G
 P8mfkY/4ny0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="149004825"
X-IronPort-AV: E=Sophos;i="5.75,404,1589266800"; d="scan'208";a="149004825"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 19:28:13 -0700
IronPort-SDR: 6NTTXTF6EE9+NQ0CWebYT5pm6s3i7NcxR3kOrWK8gIQkm5ADrMSw0KbC2VndPPKFoYQuQfElJ+
 xN7J2lCnvoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,404,1589266800"; d="scan'208";a="285993395"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 27 Jul 2020 19:28:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Jul 2020 19:28:11 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 27 Jul 2020 19:28:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Jul 2020 19:28:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajeYtxnqGkm9YCCyQKj/pdZaS31O5eOGbEzfjAE94ZKYN7DNSJADVGuVtoEU1WLpm5zNO6a+yGCy//uLE/foiNq60K15ExZBpZuhGULAQ4okgC4iqwh0KNSZMLLwRKNcKGsL/zYWLxDHdMPedfX+hdWYRycY55yySL4Aj2qA7rR0bObQVrqOqPk6b6eJtV+6XfkntQyQz1gerXsJWXd1aiEcqNLk/9jkWY2LDP4l5FGwFyWwrLYud7u7IvL27IKfRf3jn9EqCszYIpXun3HPqn62nkS/YCbhs0oYE1J04BqVXZftRDPi18o8L0rRfmyxBCy8J1e7u/qGLiI72LOyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9pH5elaeJebZRk1tYATEFh8QnFe2xYNvaUYYAavfwE=;
 b=bmXviUc/VUdMJfiLm9hx4p4b1eA22zXWVOnkyUarWPzHyQk1umgibjqNOxCKWa88vjkh9pVryShrrP1QuzglmD83UASCU0gSLbJTdgU8RLIx3JjkalPa8/BS8QbVL1Mod4uberhhJLjbVbzwYO8hvqHzJJMIzAe3XR3Tz8JpKz2QzkFjTFWuRyoR1vuejlBwEwTAErgKEfv0Sm1SoRGnxrl97H1Who0y+FJQJ8hmzItH2hlwh1d1BLaPzpuhbhCtfInqi42xqBirdo4j5yVTH1BSHy7tuA3Qcpp45Z8nZ7dw4fcnEqlcT1yqKa99VfM5sy83Gh683ULN3IRnaGt9rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9pH5elaeJebZRk1tYATEFh8QnFe2xYNvaUYYAavfwE=;
 b=ps7T9eMOA17NwG0WpQ1FIcaX/oPiEaVhXxclnNfu10BW5F3ngaufbGzhGHCYwDorSoWzVvFtYGmPm0mbqFvlhOxS/qe3uyyW1EWWz076OvZGwUzNAEdKpjcaiWSzfXvuK/BmdC2uppU0lI3hZvPrw5p4hCDM+tbZTXKc3Cw4JCs=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3337.namprd11.prod.outlook.com (2603:10b6:5:a::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.26; Tue, 28 Jul 2020 02:28:10 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 02:28:10 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: Atom: use hardware counter to update hw_ptr
Thread-Topic: [PATCH] ASoC: Intel: Atom: use hardware counter to update hw_ptr
Thread-Index: AQHWY2e1AMm9opfdpkGft589vBQJfqkbeEuAgAC7fpA=
Date: Tue, 28 Jul 2020 02:28:09 +0000
Message-ID: <DM6PR11MB3642BE84A5C91504D6AF4ECB97730@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1595779727-31404-1-git-send-email-brent.lu@intel.com>
 <7dec7fcd-0381-d279-4dac-77c27ea5f6fe@linux.intel.com>
In-Reply-To: <7dec7fcd-0381-d279-4dac-77c27ea5f6fe@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.25.81.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 608207a5-a86c-4e71-1127-08d8329ddeb2
x-ms-traffictypediagnostic: DM6PR11MB3337:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB33374AEE4CB49F4460CCC22A97730@DM6PR11MB3337.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: flCIrfb7KEXbGOrc+IHyi+dCs1K/xcluTqFKemPuR01zp7/wIIrxHUVDOX+827LNg+wuJ9peooyHHN7dKBJ/OampLDEOZaSB9DdoZ6O4ROKIMNCoYqKrwT8Rek9PBopGiA02ouiQEuBY8i4fO9o+oTGA9arPDOf/A8awMUq8xpphOW0+zV0vdbq3Lggb1xemywqNqfOIKhnsaKt9bWY5aX+ZmRp6btzTfyqTtT5obhdfCLChSJM9RWc1gajc0VBW7x8bnvH5BFeyrir7mZq0loBlDPJ3mv476Fw+vsNJDKIfQTjAmmU0zSaW8KjkWoEYJxBRv1u9lmvEMD0ETxGpfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(478600001)(15650500001)(83380400001)(7696005)(8936002)(316002)(86362001)(71200400001)(54906003)(66476007)(2906002)(4326008)(110136005)(26005)(6506007)(186003)(64756008)(9686003)(66556008)(66446008)(66946007)(55016002)(8676002)(52536014)(76116006)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pxfIOCVn1UB9HIhMGI9XYNsPWiplj3L8cKeKL2VS9WCELiK1mE+5VC1ZaZcxkfByWQyb3etFML7WRrgGODnhfOZ5Sqy6gc1yuH+Xdpi71JGnNeBwZkO4JBukUS3e5Fjv/YG13bJKoHZEfeMhXgL2nRwg75hFNrLJ+EyaZ27gMHvi5cHli7X2BYLUhuXsHJGf3XMg/o19FXLR+IucCSc8td2SktuiTdrlkwYMKBIs6t+zFBhGsu5I1lmX31nCltc8y2yZwd7Gua487VxfEe+ShOrLSUz/Uv2XHGtioTrkjWtzrk9oTwNLaiE+bnO6JsIdV5TqTwC5PLtZt9Ku4axekaNDr9UJs9U1l8cvGQelJd+8cpUdpyIebXvLJ/RCvLSNgcvBZCK6zXSB7uXvmFvG1tRV+S4nolsxuw4kqyqHy9JRQXkjtyrDebxTPKeUvgM6Wdvg7L7k6bOfYSNK9zz7OIx9fEIUoJFs0R5DZ3Rebv8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608207a5-a86c-4e71-1127-08d8329ddeb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 02:28:09.8762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RkpKpl/0rwcJ+sG93k0GbuzZBUqQCHHHhERNHLVG5uxexHSQcMU101TmUrrulJ+0nv63xNx6bjSreV2uKYAsqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3337
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
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

PiANCj4gQWxsIHRoZSBBdG9tIGZpcm13YXJlIGFzc3VtZXMgZGF0YSBjaHVua3MgaW4gbXVsdGlw
bGVzIG9mIDFtcyAodHlwaWNhbGx5IDUsDQo+IDEwIG9yIDIwbXMpLiBJIGhhdmUgbmV2ZXIgc2Vl
biBhbnlvbmUgdXNlIDI1NiBmcmFtZXMsIHRoYXQncyBhc2tpbmcgZm9yDQo+IHRyb3VibGUgcmVh
bGx5Lg0KPiANCj4gaXQncyBhY3R1YWxseSB0aGUgc2FtZSB3aXRoIFNreWxha2UgYW5kIFNPRiBp
biBtb3N0IGNhc2VzLg0KPiANCj4gSXMgdGhpcyBhICdyZWFsJyBwcm9ibGVtIG9yIGEgcHJvYmxl
bSBkZXRlY3RlZCBieSB0aGUgQ2hyb21lIEFMU0ENCj4gY29tcGxpYW5jZSB0ZXN0cywgaW4gdGhl
IGxhdHRlciBjYXNlIHRoYXQgd291bGQgaGludCBhdCBhIHRvbyBnZW5lcmljIHZhbHVlIG9mDQo+
IG1pbl9wZXJpb2QuDQo+IA0KDQpJJ3ZlIHRvbGQgdGhlbSAyNDAgaXMgbW9yZSByZWFzb25hYmxl
IHNpbmNlIHRoZSBzYW1wbGUgcmF0ZSBpcyA0ODAwMCBhbmQgb3VyDQphbmRyb2lkIGJzcCBhbHNv
IHVzZXMgMjQwIGZvciBtdWx0aW1lZGlhIHVzZSBjYXNlIGZvciBtYW55IHllYXJzIGJ1dCB0aGV5
IGRvbid0DQp3YW50IHRvIGNoYW5nZSB0aGUgQ1JBUyBzZXR0aW5nIGZvciBzb21lIHJlYXNvbi4N
Cg0KR29vZ2xlIHNheXMgaXQncyBhIHJlYWwgaXNzdWUgZm9yIHRoZW06ICJUaGUgZHJpdmVyIGNv
bnN1bWVzIGZyYW1lcyBxdWlja2x5IGF0IHRoZQ0KYmVnaW5uaW5nIHdpbGwgbWFrZSBDUkFTIHVu
ZGVycnVuIGJlY2F1c2UgQ1JBUyBmaWxscyBzYW1wbGVzIGluIHRoZSBmaXhlZCByYXRlLiINCg0K
Q3VycmVudGx5IHRoZXkgaW1wbGVtZW50IGNvbnN0cmFpbnQgaW4gbWFjaGluZSBkcml2ZXIgb2Yg
YXRvbSBtYWNoaW5lcyB0byBmb3JjZQ0KMjQwIHBlcmlvZCBzaXplIHNvIENSQVMgaXMgdXNpbmcg
MjQwIGZvciBhdG9tIHBsYXRmb3JtcyBhbmQgMjU2IGZvciBvdGhlciBiaWcgY29yZXMuDQoNCkkn
bSBjdXJpb3VzIHdoeSBub3QganVzdCB1c2luZyBoYXJkd2FyZSBjb3VudGVyIHRvIHVwZGF0ZSBo
d19wdHIgYW5kIGdldCByaWQgb2YNCnRoZSBwZXJpb2Qgc2V0dGluZyBpbiBod19wYXJhbT8gSXQg
c2VlbXMgdG8gbWUgdGhlIHJpbmcgYnVmZmVyIGNvdW50ZXIgZG9lcyBub3QNCnJlZmxlY3QgdGhl
IHJlYWwgc3RhdHVzLg0KDQoNClJlZ2FyZHMsDQpCcmVudA0KDQo+IA0KPiBhbmQgdGhhdCBzZWVt
cyBhbHNvIHdyb25nPyBXaHkgd291bGQgdGhlIGRlbGF5IGJlIHplcm8/DQo+IA0KDQppbmZvLT5w
Y21fZGVsYXkgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiByaW5nIGJ1ZmZlciBjb3VudGVyIGFu
ZCBoYXJkd2FyZQ0KY291bnRlci4gQmVjYXVzZSB0aGUgcmluZyBidWZmZXIgY291bnRlciAoaHdf
cHRyKSBpcyBydW5uaW5nIGZhc3RlciB0aGVuIGl0IHNob3VsZCwNCnNvIHdlIGFkZCB0aGUgaW5m
by0+cGNtX2RlbGF5IHRvIHN1YnN0cmVhbS0+cnVudGltZS0+ZGVsYXkgYXMgY29tcGVuc2F0aW9u
Lg0KDQpUaGVyZWZvcmUsIGFwcGxpY2F0aW9uIGNvdWxkIHVzZSBzbmRfcGNtX2RlbGF5KCkgdG8g
Z2V0IHRoZSBhY3R1YWwgZnJhbWUgbnVtYmVyDQp3aGljaCBhcmUgc3RpbGwgaW4gYnVmZmVyLg0K
DQpzbmRfcGNtX2RlbGF5KCkgPSBidWZmZXJfc2l6ZSAtIHNuZF9wY21fYXZhaWwoKSArIHJ1bnRp
bWUtPmRlbGF5DQoNCldlIGRvbid0IG5lZWQgcGNtX2RlbGF5IHRvIGNvbXBlbnNhdGUgYW55dGhp
bmcgaWYgdXNpbmcgaGFyZHdhcmUgY291bnRlci4NCg0KDQo+ID4gLQlpbmZvLT5wY21fZGVsYXkg
PSBkZWxheV9mcmFtZXM7DQo+ID4gICAJZGV2X2RiZyhjdHgtPmRldiwgImJ1ZmZlciBwdHIgJWxs
dSBwY21fZGVsYXkgcmVwOiAlbGx1XG4iLA0KPiA+ICAgCQkJaW5mby0+YnVmZmVyX3B0ciwgaW5m
by0+cGNtX2RlbGF5KTsNCj4gPiAgIAlyZXR1cm4gMDsNCj4gPg0K
