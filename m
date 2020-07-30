Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2077723368C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 18:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B134417C0;
	Thu, 30 Jul 2020 18:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B134417C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596125972;
	bh=KVsjvZZp89n5RsFpd2Efr91572AXIqkOwhHN3z6aJ8A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0/LGSWI/SWE5SOXhPR9WqRyUYnH9aHns3y3s4BZRucVx5Y8CrLHXYn7s3fZIvHGY
	 4UnVFBvGPWVZAJRSTk1K6HYASelD7ZXLJg+Vyi5INQVtvlLZWen3wZIeQIfD61vxq7
	 hoFQ9aawtPhlc6u95LZpQEKALz8qsJ+Nfrvcng0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1539F80227;
	Thu, 30 Jul 2020 18:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48CBFF8021E; Thu, 30 Jul 2020 18:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC22BF800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 18:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC22BF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ghlFRxAm"
IronPort-SDR: zyH/TdZLY/hhBnrUI15MgsCKXuqHGqXMM1pPXBg8+ff5Wa8FEz/cb9UlBQbjVcScS8j3wvYt93
 HwZPl+7lD+WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="236493830"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="236493830"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:17:37 -0700
IronPort-SDR: z406ovGgBCeDLGKvZlD7BgJ+fZEj/p9MPXbckH0AhBaKWSLlAn6UPYFNKhxU1FV/9Qd/fbFLC/
 c4qk/malnkZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="272966798"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2020 09:17:36 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 09:17:28 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jul 2020 09:17:28 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 09:17:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 30 Jul 2020 09:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK2u6C8ZLcf7eTU/7qyFhada9IyiBnbNB9kx4QOmNjHD4npbUD4wrL56LFxdJRQlFfPPojtk6vwz4NulDmdnBAsgJzVl9XOyW3ADfkfnbEAiCuJMQ29c1osEQM8zA5CQXBLC5NbhpcEvx7zCDIZuYtEsKmuIaGE0VXG63+4Oh3C4ErD7/tvhIAvpNAWn9yzefHffYSrzGjU8LXRCFYRu71OYcH/KLn1FB6j5Nnu53uKzeor81VhdVziRR/zs/jEGG8b0Dv0F7eZNIwY4H7BwRErXR/sxT8vwE6viLpkS37MsUC3IHNSZXxpC7FDfI3LgN1Q/zL6yrSdOyGZ/rsV6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVsjvZZp89n5RsFpd2Efr91572AXIqkOwhHN3z6aJ8A=;
 b=VV5cq0ubtJMNCBWeimsYDAtRPgKLSgNywBL2pBchGsUtxQ87Tk/DAaFSXXnvxmOj/QoM3xCgvblJs2eeDGaLWwKZYKMa+MceZmSWO0/n6LX+IRqS2+uIv/mDYtyrsIIWczgTfVjej7SNKQZRF3YK2Ckhyf8tPvM9f5xDR1SteYDrJo1v2WD/gnLNtOaVECnNmZvVoudvqmNc6gTMCwuYIhY/tDNgB/tkjmMX5/+hnVCES/PfdqRo7KHSbp6aQCTib09JQ0MVHBa+/y2FUeZTeoUOEjCAAn57X8+OEEJvQ/SqF2CUkjw6cGU4HCPI0wA6WsUN+C5Mp1TSbr/2JZk+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVsjvZZp89n5RsFpd2Efr91572AXIqkOwhHN3z6aJ8A=;
 b=ghlFRxAmZdoV0t0gxydAIauUECSpifTmt88W9AJj+DvJQ7hUKRG/RJNgRmlqbjTDpwaKh40lxGp9DmVjya6I1nadU7FCF1OrIbkDiOB9+h8mEoJsInP8RWC5DuopnqaWtNu4M5f0W7XI5dgjItv/tep+kAelVwEQ2pn4QJs6Mqw=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3737.namprd11.prod.outlook.com (2603:10b6:5:144::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 30 Jul
 2020 16:17:24 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.019; Thu, 30 Jul 2020
 16:17:24 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZZiWhH0ib4T+aUeOy2BFXbTqlKkemFEAgAErLkCAAH1RAIAABLOAgAAHjAA=
Date: Thu, 30 Jul 2020 16:17:24 +0000
Message-ID: <DM6PR11MB36420C6574DA10E075F6220297710@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596020585-11517-3-git-send-email-brent.lu@intel.com>
 <4fe97f63-e552-3b2f-803c-53894b196bfd@linux.intel.com>
 <DM6PR11MB36421D9A808D401416B72D2D97710@DM6PR11MB3642.namprd11.prod.outlook.com>
 <f1386a05-8866-9251-c751-21c9109aa35f@linux.intel.com>
 <c00c47ad-abd7-d6e7-e3c5-a25a6a4f7f68@linux.intel.com>
In-Reply-To: <c00c47ad-abd7-d6e7-e3c5-a25a6a4f7f68@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 65203ef1-aa27-4d04-5011-08d834a40b52
x-ms-traffictypediagnostic: DM6PR11MB3737:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3737A58030E41D178B79A59097710@DM6PR11MB3737.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GblJwSBWf4wkIh0av+bXgcth1m/ADGWjVP1wdGU27itqaRZsfKUIHCxOY61ivqTED9y7A3uOeXRF7im8LDFFzqY2eH5bj01sq/IMnmKlXmAVUAWrgghuQGSA3ksAcq/Gkcwy97GLpeGdSoJfNxyknGjIWjdF9GNBPghAX1ZG0iQERiMcN4TFSpxxXmnBGkXNT2Gv6Egmm1eu7VACopUlwo4N6qwRc+H9XggaKheg+OQlOkBoS7FnpsD1EH6h43wrBr9WtiplZhVNqUpvwMJ4UdC1B/HM9ugyy1lcEBWYXgPGuEGFC5/0OLNp1IpKzcJB41dmXrzykpcl/t7R/9FgZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(316002)(5660300002)(478600001)(66476007)(4326008)(110136005)(8936002)(54906003)(76116006)(66446008)(52536014)(7696005)(66946007)(66556008)(64756008)(4744005)(33656002)(83380400001)(6506007)(26005)(186003)(7416002)(2906002)(86362001)(8676002)(9686003)(55016002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IPKPF3AL+ao/K9TJuPj57UeddEmLxrBIpeIt6CqU7bUWNxEiEVRP8oggmo0TMVfmObM02rx2oauX7150TiPd0AJZuTQBuhmpmdDOWKVQBvMqtHOaY/nTjynvM9J4N1l1Xpw0UWi/3Ew+B/S1jTzpSThlyZIXA8xrfKehbz0mEOQw2TfisAsjvyHDodWv0HGT0lWNHzqMNRslnmiHSMxIkqUWBOtR+CQwC6ZuD5QE3nexThcg0CBdBGnIYIgDi3qma/oWhigMVa6331r8LqgK69NezF/Gu2DHsNTseejSo2VCRDYU0I1zU/rQeCBRD8uEnS9Q/aQ8CcAjuzJV+wdvAE4QT1gdwg49UkIClB58yDxd8p/J3Cxqom8go2bnL+IL3VVFFeuOmeGi8TChBmrptnqvXcl/5ZaGpPE+Zb81kXck+L6p22mw/nVUDWsYB9ZPCqO9HUlV0wx08QX+5IteupO1TEvXKnl87NSxnfYgE+Y=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65203ef1-aa27-4d04-5011-08d834a40b52
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 16:17:24.1450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: meTW5zd3pkpWO8Q+ITsA3Uzi1dLHYGGUtaenC+AembgM9A8YiRHq4wrQebspJv0pdAM0+bEIoR4TbaRUMNMmsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3737
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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

PiA+Pg0KPiA+PiBZZXMgb3IgYWxzYSB3aWxsIHNlbGVjdCAzMjAgYXMgZGVmYXVsdCBwZXJpb2Qg
c2l6ZSBmb3IgaXQuDQo+ID4NCj4gPiBvaywgdGhlbiB0aGF0J3MgYSBtaXNzIGluIHlvdXIgcGF0
Y2gxLiAzMjAgc2FtcGxlcyBpcyBhIG11bHRpcGxlIG9mDQo+ID4gMW1zDQo+IA0KPiB0eXBvOiBp
cyBOT1QNCj4gDQo+ID4gZm9yIDQ4a0h6IHJhdGVzLiBJIHRoaW5rIGl0IHdhcyB2YWxpZCBvbmx5
IGZvciB0aGUgMTZrSHogVm9JUCBwYXRocw0KPiA+IHVzZWQgaW4gc29tZSB2ZXJzaW9ucyBvZiBB
bmRyb2lkLCBidXQgdGhhdCB3ZSBkb24ndCBzdXBwb3J0IGluIHRoZQ0KPiA+IHVwc3RyZWFtIGNv
ZGUuDQo+ID4NCj4gPiBUbyBidWlsZCBvbiBUYWthc2hpJ3MgYW5zd2VyLCB0aGUgcmVhbCBhc2sg
aGVyZSBpcyB0byByZXF1aXJlIHRoYXQgdGhlDQo+ID4gcGVyaW9kIGJlIGEgbXVsdGlwbGUgb2Yg
MW1zLCBiZWNhdXNlIHRoYXQncyB0aGUgZnVuZGFtZW50YWwNCj4gPiBkZXNpZ24vbGltaXRhdGlv
biBvZiBmaXJtd2FyZS4gSXQgZG9lc24ndCBtYXR0ZXIgaWYgaXQncyA0OCwgOTYsIDE5MiwNCj4g
PiAyNDAsIDQ4MCwgOTYwIHNhbXBsZXMuDQoNClllcyAzMjAgaXMgZm9yIFZvSVAgYW5kIHRoZSBy
YXRlcyBpbiBDUFUgREFJIGFyZSA4LzE2S0h6LiBJdCdzIGEgbWlzdGFrZS4NCg0KUmVnYXJkcywN
CkJyZW50DQo=
