Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C58B207B24
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 20:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C78F18B2;
	Wed, 24 Jun 2020 19:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C78F18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593021635;
	bh=UFPKiIAjr4Zc013/Hl8wZFyocQFJEQDlXlOrCRhEnv4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qdiqkp7sWVMHCUp/uerVHd+GXfm9gfc/xzRG/UA022l1hcYbPCpXgATj5enYJ/rYr
	 qOOnXxXTdhPD6R6LJaHqVEApPdh4ZFH3dc7YDlMSQqc0vP5pC55LsARJiSOjBhqgDK
	 jWB2iZRCwFwFxp61hyNYSFjd2izVMUqUwYPX7/BI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1218CF8015B;
	Wed, 24 Jun 2020 19:58:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD1D5F8015A; Wed, 24 Jun 2020 19:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D44F8F800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 19:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D44F8F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="q9gXPoZ9"
IronPort-SDR: Xks+ffY/9dqHuHhB7ng/vcORXdH+ukS+QpQYtxgp6NzjJM+5NtvyWni1N+qdiXyOg+Jk5xiMvr
 4eCAa7B8Qy3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="132009328"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="132009328"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 10:58:44 -0700
IronPort-SDR: FZLQABSVPqar5DoUvqIC/b5J4eCPAlkTAgBvTV5L/2pmCITLMVm07btqZqkiJ86w1wjtFSZBrG
 TTP3aWkU+c/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="275769448"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga003.jf.intel.com with ESMTP; 24 Jun 2020 10:58:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 24 Jun 2020 10:58:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 24 Jun 2020 10:58:43 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 24 Jun 2020 10:58:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 24 Jun 2020 10:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJOJcFpA/AJuZWXgzzSiRFgqa9pute9KjfDT7n3Gt+QOVg8gqh0fRUuYdzB46BoXA7ema2iWp7rcCe5QvBrcFUpAuoUd6AEaogXvNzLRYS9te7tgG9SUboIKOOv7/wOtl9IP9O7TKO/9Y6U4E84P83iWXitWH9YG3920pmY5ePhnDktb2MvzcG3SXtCdnSQMOsnu8fDd37m4zh50wBq+JboNIAD//3MIhqH1bMOr30EfCP9k1C3z/sMMp4Q+S0PhOXkjrKKLnupCbDN96Y7T8fmAxfHjxoRbBytzE0QkbqgvAXaEcucVULAm0sA+q6E1JZDPKVr2+srxcQthmNcH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFPKiIAjr4Zc013/Hl8wZFyocQFJEQDlXlOrCRhEnv4=;
 b=f/iJnYt+CZdhOmMrYm7JUwhyuhZQ+XBiMK63QcwQo5m5Y1uJtYAVseJ7Uxo5x6mh8k4KylBqb6jdpRHBWvE9MTpIlhWn56iGrAVlKwbjS9wEtRubLMTuPdx2KRLs0u0ZVQGMWq9FjLCDdQvTbPgt+rcR4CyRevt3VFSd3/oNC1IGAlE2Pj+4Bm4XlSyNirXg5Kp+leOf698zYrXtGcstKBgRDhQTsYbB8FAr5oGUtZiyVQiSVi6I/lA6ho8R12VlVdvBO5ft84QANRd3zmAY9ZFLp/CcXaMfNxN5ZBhtwm8XTZU6LLoxRNCJNCqGzFSbyjRn7EPJOJ6FisVQ/0u2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFPKiIAjr4Zc013/Hl8wZFyocQFJEQDlXlOrCRhEnv4=;
 b=q9gXPoZ9NT5VJ/kemRNSoj6OoNRnu7yRDHZfcx87b+Rn9cakm5HJkkNWvTYC1IJ+rxznBtZ/za79+ZvHI9sEQiq7jwEvaNWnjNk/TxFZHPyGjiU5tNbziC0PYt6sT0ZozISMGZxwzx6LcndPx0MvRegwFUZEc1MiBS8T0ThAWH0=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB3223.namprd11.prod.outlook.com (2603:10b6:a03:1b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Wed, 24 Jun
 2020 17:58:40 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 17:58:40 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
Thread-Topic: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
Thread-Index: AQHWSbYGKNZWQ4UFnkOTeQC1rScKPajnY4OAgAAJGYCAAHmpgIAAE5cAgAAF+ACAAAfSgIAABicQ
Date: Wed, 24 Jun 2020 17:58:40 +0000
Message-ID: <BY5PR11MB43073E2381CE37D7CF584234FD950@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
 <s5hr1u4lxee.wl-tiwai@suse.de>
 <f2da25c0-c740-4d44-ab66-6017622f7dde@perex.cz>
 <7dd38f98-e74a-94c0-6888-523e6189c00b@linux.intel.com>
 <s5ho8p8ifcn.wl-tiwai@suse.de>
 <2404f45d-832d-69a0-fb3b-1981ae455f50@linux.intel.com>
 <s5hftakid2e.wl-tiwai@suse.de>
In-Reply-To: <s5hftakid2e.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4118a75-7c36-4763-125b-08d818683a0e
x-ms-traffictypediagnostic: BYAPR11MB3223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB32235A83A7D84AFDF12042C9FD950@BYAPR11MB3223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nr88WKwLH9wGTFLN3Kjbf+GXxkAcJ9tUv2DFHAFtvVQ306jthGrjMMbI+qXhAPz9FdND5ljW6MCzeHhl5d2oH2no5Lwlyry7rl51pPxCkQJdhX1du8adImuH0JlGScpDhmB0DmpkxOlkS54WGfUMlHXTODoK68eTg26zeWQGrq18YCp9Gxqn/ES/GVN0kxW7jy1zlYHFMqqeND7MhLFufeyTBZY3xz10rGTOJgIrU2y6teoHmhaTjZXJxKmUZKXp8eu5ujzi8B8lwdC7R0UdElRVC4yASIoa+pDQK1odHf2WDaJMP6lYYHtL7dLFvKQOQWFcGiHJ5Kmcq3Gf2aoR5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(6506007)(8676002)(53546011)(186003)(26005)(66946007)(33656002)(316002)(64756008)(5660300002)(52536014)(66446008)(66556008)(76116006)(66476007)(71200400001)(4326008)(2906002)(9686003)(54906003)(7696005)(478600001)(8936002)(110136005)(55016002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0CuI1MtrVmIkRhU6YaHKwTsSctYhLIcVBf3dslWzzxV1j/wiTv37bqxJBGInCOdQ2LGMbXn/v2gPo4n6rTzXvUf64Vk2L+TAZjxM3amw1uhAW8j9e0LPEJZWH4L/4yto3w7VcsZRyRmzM74WgEvqlRjs5tpOfFP8dL6gRA/DUCTWpiclkUI3A4gNsPvZpBKEwrip6Obyjtf2BrlMcwTKfy8EbIOMKEN+IBeIVc0JV3/WbYSlPHnEeDf8uQZuufIl9tNugRbOQmTssNFhyv4BUMniRRI1G/6eS0Z4EVCIBHPKbujBHrGei/PobStwhVmP45e1ntFJlvg5WENMBLAMVQZkxGefMRHw3BxkPEv9KtypPLNZLtfvb4/Txd2IWKicP8fWZyh6aThQBiRwBlk5o5MdXz44sW2m3PSY2Bophz4BlkQ3zBWvXnsitkv+6ysHVhcUjSE1/f6jbM5cZtw2Zf76BRfK3bPfNAfyO+s6/B1XgiLirXlHbkIWB5kBQ2aF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e4118a75-7c36-4763-125b-08d818683a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 17:58:40.1591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mb5r9V5UeZJ/Vjq2TJ8DRMpmOzjHFLMDZub7EPnLjQE0Y0JsgdxZh+MyfzhS8XhhK/KU5n0VJ5js3g9VK+/7xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3223
X-OriginatorOrg: intel.com
Cc: "Vehmanen, Kai" <kai.vehmanen@intel.com>, "Jillela,
 Emmanuel" <emmanuel.jillela@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

PiBPbiBXZWQsIDI0IEp1biAyMDIwIDE5OjA1OjE0ICswMjAwLA0KPiBQaWVycmUtTG91aXMgQm9z
c2FydCB3cm90ZToNCj4gPg0KPiA+DQo+ID4NCj4gPiBPbiA2LzI0LzIwIDExOjQzIEFNLCBUYWth
c2hpIEl3YWkgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDI0IEp1biAyMDIwIDE3OjMzOjQ1ICswMjAw
LA0KPiA+ID4gUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+ID4gPj4NCj4gPiA+Pg0KPiA+
ID4+Pj4+IFRoZSBzaWxlbnQgc3RyZWFtIGlzIGVuYWJsZWQgd2l0aCBhIEtjb25maWcgb3B0aW9u
LCBhcyB3ZWxsIGFzIGENCj4gPiA+Pj4+PiBrZXJuZWwgcGFyYW1ldGVyIHNob3VsZCB0aGVyZSBi
ZSBhIG5lZWQgdG8gb3ZlcnJpZGUgdGhlIGJ1aWxkIHRpbWUNCj4gZGVmYXVsdC4NCj4gPiA+Pj4+
DQo+ID4gPj4+PiBJJ20gbm90IHN1cmUgd2hldGhlciB0aGUgbW9kdWxlIG9wdGlvbiBpcyB0aGUg
YmVzdCBpbnRlcmZhY2UuDQo+ID4gPj4+PiBBbiBhbHRlcm5hdGl2ZSBpcyBhIG1peGVyIGVsZW1l
bnQgdGhhdCBjb250cm9scyBkeW5hbWljYWxseS4NCj4gPiA+Pj4+IFRoZW4gaXQnbGwgYmUgcGVy
IGNhcmQgdW5saWtlIHRoZSBtb2R1bGUgb3B0aW9uLg0KPiA+ID4+Pg0KPiA+ID4+PiArMSwga2Nv
bnRyb2wgc2VlbXMgdGhlIGFwcHJvcHJpYXRlIHdheSB0byBjb250cm9sIHRoaXMuDQo+ID4gPj4N
Cj4gPiA+PiBJdCB3YXMgbXkgc3VnZ2VzdGlvbiB0byB1c2UgS2NvbmZpZytrZXJuZWwgcGFyYW1l
dGVyIGZvcg0KPiA+ID4+IHNpbXBsaWNpdHkvb3ZlcnJpZGVzLg0KPiA+ID4+DQo+ID4gPj4gVGhl
IGtjb250cm9sIGlzIGEgbmljZSBpZGVhLCBidXQgaW4gcHJhY3RpY2Ugd2UgdHlwaWNhbGx5IG9u
bHkgaGF2ZQ0KPiA+ID4+IG9uZSBjYXJkIGRlYWxpbmcgd2l0aCBIRE1JLg0KPiA+ID4NCj4gPiA+
IE5vdCByZWFsbHkuICBUaGVyZSBhcmUgc3lzdGVtcyB3aXRoIHR3byBIRE1JIG91dHB1dHMgZnJv
bSBib3RoDQo+ID4gPiBpbnRlZ3JhdGVkIGFuZCBkaXNjcmV0ZSBHUFVzLiAgTW9zdCBtb2Rlcm4g
c3lzdGVtcyBhcmUgb25seSB3aXRoDQo+ID4gPiBoeWJyaWQgZ3JhcGhpY3MsIHRob3VnaC4NCj4g
Pg0KPiA+IE9rLCBtYXliZSBJIGFtIG1pc3Rha2VuLCBpbiBtb3N0IG9mIHRoZSBIRE1JIGlzc3Vl
cyB3ZSd2ZSBzZWVuIG9ubHkNCj4gPiBvbmUgSERNSSBzb3VyY2UuDQo+ID4NCj4gPiBCdXQgaXQn
cyBhIGdvb2QgcG9pbnQgdGhhdCB0aGlzIGlzIG9ubHkgc3VwcG9zZWQgdG8gYmUgdXNlZCBmb3Ig
SW50ZWwNCj4gPiB3aGV0aGVyIGl0J3MgYSBrZXJuZWwgcGFyYW1ldGVyIG9yIGEga2NvbnRyb2wg
c2hvdWxkbid0IHRoaXMgYmUNCj4gPiBkZXBlbmRlbnQgb24gYSBQQ0kgSUQgYmVpbmcgZGV0ZWN0
ZWQgYW5kIGEgU0tZTEFLRSBmbGFnIGJlaW5nIHNldD8NCj4gPiBpdCdzIG15IHVuZGVyc3RhbmRp
bmcgdGhhdCB0aGlzIGFwcGxpZXMgZnJvbSBTa3lsYWtlIHRvIFRpZ2VyTGFrZSwgbm90DQo+ID4g
YmVmb3JlLg0KPiANCj4gSSBndWVzcyB3ZSBjYW4gY2hlY2sgaXQgZnJvbSB0aGUgY29kZWMgSUQ/
ICBDaGFuZ2UgdGhlIHByb2JlIGZ1bmN0aW9uIGZvcg0KPiBTa3lsYWtlKyBjb2RlY3MgdG8gcGF0
Y2hfaTkxNV9za2xfaGRtaSBhbmQgY28sIGFuZCBzZXQgdGhlIGZsYWcgdGhlcmUuDQo+IA0KPiA+
ID4+IEl0IGFsc28gZG9lc24ndCBoYXZlIGEgVUNNIHJlcHJlc2VudGF0aW9uIHNvIHdvdWxkIGZv
cmNlIHRoZSB1c2Ugb2YNCj4gPiA+PiBhbWl4ZXIgYW5kIG1hbnVhbCBjb25maWdzLCBvciB0aGUg
VUNNIGZpbGUgd291bGQgYWx3YXlzIHNldCB0aGUNCj4gPiA+PiBtb2RlLg0KPiA+ID4NCj4gPiA+
IEJ1dCBwZW9wbGUgdXN1YWxseSB1c2UgdGhlIGRpc3RybyBrZXJuZWxzLCBzbyB0aGUgc2l0dWF0
aW9uIGlzIG1vcmUNCj4gPiA+IG9yIGxlc3MgZXF1aXZhbGVudDsgeW91J2QgaGF2ZSB0byBhZGp1
c3QgYSBtb2R1bGUgb3B0aW9uIG1hbnVhbGx5IGlmDQo+ID4gPiB5b3Ugd2FudCBhIGRpZmZlcmVu
dCBvbmUgZnJvbSB0aGUgZGVmYXVsdCwgYW5kIHlvdSdkIGhhdmUgdG8gYmUgcm9vdA0KPiA+ID4g
dG8gY2hhbmdlIGl0Lg0KPiA+ID4NCj4gPiA+IFNvLCByYXRoZXIgdGhlIHF1ZXN0aW9uIGlzIGhv
dyB3ZSBzaG91bGQgcHJvdmlkZSB0aGUgc2V0dXAgb2Ygc3VjaA0KPiA+ID4gcGFyYW1ldGVyLiAg
SXQncyBzdXBwb3NlZCB0byBiZSBhIHBhcnQgb2YgcG93ZXIgbWFuYWdlbWVudCBzdHVmZg0KPiA+
ID4gdGhhdCBzaG91bGQgYmUgdG91Y2hlZCBieSBlaXRoZXIgYSBzbWFydCBQTSB0b29sIG9yIGEg
bWFudWFsDQo+ID4gPiBvdmVycmlkZSBzdWNoIGFzIHJ1bnRpbWUgUE0gc2V0dXA/ICBPciBjYW4g
aXQgYmUgc2VlbiBhcyBhIG1vcmUgY2FzdWFsDQo+IHR1bmluZz8NCj4gPg0KPiA+IEkgYW0gbm90
IGF3YXJlIG9mIHN1Y2ggdG9vbHMuIFRoZSBvbmx5IHRoaW5nIEkga25vdyBpcyB0aGF0IHNvbWUg
b2YNCj4gPiB0aGUgSERhdWRpbyBwb3dlciBzZXR0aW5ncyBhcmUgYWxyZWFkeSBjb250cm9sbGVk
IGJ5IGtlcm5lbA0KPiA+IHBhcmFtZXRlcnMsIGUuZy4NCj4gPg0KPiA+IC9ldGMvbW9kcHJvYmUu
ZC9hdWRpb19wb3dlcnNhdmUuY29uZg0KPiA+IG9wdGlvbnMgc25kX2hkYV9pbnRlbCBwb3dlcl9z
YXZlPTENCj4gDQo+IFllcywgaXQncyBiZWVuIHRoZSBwcmltYXJ5IGtub2IgZm9yIHllYXJzIHRv
IHR1cm4gb24vb2ZmIHRoZSBydW50aW1lIFBNIGZvciBIRC0NCj4gYXVkaW8gYW5kIG90aGVyIGxl
Z2FjeSBkcml2ZXJzLiAgVGhpcyB3YXMgdXNlZCBieSBwb3dlcnRvcCBvciBzb21lIG90aGVyDQo+
IHBvd2VyLWF3YXJlIGRhZW1vbnMgYW5kIHRvb2xzLCB0byBiZSB0b2dnbGVkIGR5bmFtaWNhbGx5
IHBlciB0aGUgcG93ZXINCj4gY2FibGUgc3RhdGUgb3Igc3VjaC4NCj4gDQo+IEFuZCwgaG93IHRo
ZSBzaWxlbnQgc3RyZWFtIGZlYXR1cmUgc2hvdWxkIGJlIHNlZW4/DQo+IFNob3VsZCBpdCBiZSBh
IHN5c3RlbS13aWRlIHJvb3Qtb25seSBzZXR1cCBvciBhZGp1c3RhYmxlIHBlciB1c2VyPw0KPiBX
b3VsZCBpdCBiZSBjaGFuZ2VkIG9mdGVuPyAgU3VjaCBxdWVzdGlvbnMgYW5kIGFuc3dlcnMgd2ls
bCBsZWFkIHVzIHRvIHRoZQ0KPiByaWdodCBkaXJlY3Rpb24sIEkgaG9wZS4NCkkgdGhpbmsgdGhp
cyBmZWF0dXJlIHNob3VsZCBub3QgYmUgYWRqdXN0YWJsZSBieSB0aGUgdXNlciBkdXJpbmcgcnVu
dGltZSBiZWNhdXNlLA0KYSkgIEl0J3MgYmFzZWQgb24gdGhlIHBsYXRmb3JtIGFuZCBPRU0gcHJl
ZmVyZW5jZSBvZiBoYXZpbmcgaXQgKGdpdmVuIGl0IGhhcyBwb3dlciBpbXBsaWNhdGlvbnMpDQpi
KSBDaGFuZ2luZyBpdCBvbiB0aGUgcnVudGltZSB3aWxsIGNhdXNlIHRoZSBpc3N1ZSBvZiB1bmJh
bGFuY2VkIHBvd2VyIHVwL2Rvd24gc2VxdWVuY2UgbGlrZSB5b3UgbWVudGlvbmVkDQoNCj4gDQo+
IA0KPiBUYWthc2hpDQo=
