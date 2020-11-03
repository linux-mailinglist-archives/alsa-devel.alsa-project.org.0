Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 040CE2A4C70
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 18:14:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ECD916A3;
	Tue,  3 Nov 2020 18:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ECD916A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604423679;
	bh=zF24QUel7se/0TUURD5P9cggk8iWLbzVbwi4O6n2K2s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgM6ytvEb/47GtCrpOsQRFxISGJSZQ/ulxchknfxSrEeOJNOEFLLGaaQpckzfWBcl
	 UW/qg4qyRUYvLiIWL0URl/JZgV/IaPYAHpBX/ib/YIDF5PLG7V45mpcwYZl1EVulep
	 paW5PZZDBHJfz8TbL2VySl7X8+Q9Q0U5HTw2QzQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC93EF80108;
	Tue,  3 Nov 2020 18:13:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1589CF80171; Tue,  3 Nov 2020 18:13:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6DC0F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 18:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DC0F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="rjEFE6Qu"
IronPort-SDR: H4Po9MRhyBpdj3MDh668jvaPPSgeKKsdZEZzjMRTZVwZshvIOPcXY8QN4K5qMdpfimQ3JHbS3T
 l6UTsU/ugCaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156868137"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="156868137"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 09:12:43 -0800
IronPort-SDR: jP9zFvxx2WWX8ajEuGLkZkl7u0n8be2xeSKO8jE2vfi7qzoESq+Idv1wnZBEo03XefqPgQRD/U
 axUfzJ8GRh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="426412873"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2020 09:12:43 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 09:11:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 09:11:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Nov 2020 09:11:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 3 Nov 2020 09:11:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELn067b+fyK4JkxxIG+2G9VVmcbzqrB9H7GrMBXZPVwobNdDigr1qK2mkCkd1fFj2LyR8OvLVfF7PZwsCOPZdWxh305ASjkshcrMXees0vxJBk5JPnZoTimLcvE5Mc+7TF4c7oxdqYjLJOnL23u/SniEeuaHPRLXBaOkzXuhVEpnY0freaawNNK9EzlslFKUIf5KXrSQfLhzMjFy6YEgpOJ4qI4I6VptyiLmdYpPKJ6gEuHTGgq2EX9pjIWPfKGrvbIgEzrGkecSbxrwkSlXwjQQk0ZI4i+F2Pt84p6ruip6XhYY8l7H4S6VOkbakau+g5phG5q3vxCNQSXxjGlF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF24QUel7se/0TUURD5P9cggk8iWLbzVbwi4O6n2K2s=;
 b=IJQJSgRvRckf3jSmorix8dDei7C8Ykr31UdQtAXxoeUixHbkknPNJE0E8rDv6k76qhOUOw/xuBsOdXXHmj2cNhpOcQeSDZErCWCQuO2CNCqPE+g8cYjMZBNHH/8MM1TKZPmXfZh3rKCeYEzx6L02R7DQ+53qlchaimUHxiJBOiNeQbdT7UwbyL+QT97IK0J1/PgS1DkJZQqSS7iMODsEyw2gCATESYRwAIUX/bilroFJzCag2L9NtDorweBmHKkoNhL0QNOO+KZviyiyk50pyts204NF+zZKeorpxE/2iZSJswDmprFzz/KttXvi5wKzPD3VdSuHFo+sxVq0U+1IFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF24QUel7se/0TUURD5P9cggk8iWLbzVbwi4O6n2K2s=;
 b=rjEFE6Quz3F1GitdIUfTxXCaNQvr8WjfOnOSH1s5l/q4HtO5l0dRVDU4DWtMa4MpufBjUcJQY0+WoA3pC6+lXCVDTg3lsitxQjX4NC3Eh6v7vQIIeOdFtCikcw8WlJt1ZlOLCP6/D3qETOD09dG7OXIrN2smVDDrezOivk2jv/4=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM5PR11MB1369.namprd11.prod.outlook.com (2603:10b6:3:c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Tue, 3 Nov 2020 17:11:48 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::4c03:991d:7286:305b]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::4c03:991d:7286:305b%7]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 17:11:48 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: pcm: DRAIN support reactivation
Thread-Topic: [PATCH] ASoC: pcm: DRAIN support reactivation
Thread-Index: AQHWq38O0EJZPK/kKESDEaXWzw8r9Km2sdKA
Date: Tue, 3 Nov 2020 17:11:47 +0000
Message-ID: <6a701e24725c938d7ffa7f119159062a395d4bf6.camel@intel.com>
References: <20201026100129.8216-1-cezary.rojewski@intel.com>
In-Reply-To: <20201026100129.8216-1-cezary.rojewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.151.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2b61bd2-9bce-42fc-ed4e-08d8801b8c81
x-ms-traffictypediagnostic: DM5PR11MB1369:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1369D3491BCA802E8F49EA07E8110@DM5PR11MB1369.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3JxRap5XgtZMtUSp9jd9nZZO2JTv/CcWpPqLwYybTljaXk/hn2nAgtr2Id/VR9p2M9Kl6Mh9NulBmnta6W9bm0idKMOvDETV6VT5nmAu/IAg7srB3VCgPDC6thA+I6fp0BIu8OXGOmkjg1Ou4KmAt+t2IbGWej8C9yF7sv4gyoJ1yzzh/CnCPUl62XSxAVPn6LTu0Zsse5uYmslTTpAmyE6lSv7PmmJyODAvFuJd5Z8hqADfFhFndJf0IYfKzTWsgBQqCVFMzl2vPVP0rMc7W0AAaz2rhcrn0znJRFGTV3zrBPeuHyr6XO9PdoTk4X7vQqYNlcxZTcHAbGbBbZtVwwLO8jfkkXWmETLJ9n+Y+A+DDrsyQriMT4QGMikHBgEF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(6506007)(36756003)(186003)(2616005)(83380400001)(478600001)(5660300002)(316002)(4744005)(66446008)(64756008)(66556008)(66476007)(71200400001)(76116006)(91956017)(66946007)(4326008)(2906002)(86362001)(54906003)(26005)(6486002)(8936002)(4001150100001)(8676002)(6512007)(110136005)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: US3/tnTOiPOxmC3MQFFfA2shan5gg2Y2QE+7mjV0zM5Vdu/WSl1SgvEBTGYXEOrrn2hpzVLJE+sWRUKGq0KQN5dnimqePXxPZd/nivsZlERl99FpbuCGpLQHvy4vbtIZCI2hn1Pd8GrqPv8STud6pBDGSJexxbfKOHzRsLEO70aA6zGkv71zFLrkI6wkZv+5fIsckzogiKs1+CiJeJxT5BsOOFLmRU6lU4kCby3UyIuoH6jcUgc1QI+NLJ1XnqH51oSj/gDbSjy0/Nh117BTf+8SrS9hhjo0LHQQleFrJ00DHnvbJbvFPRzu9OTYIkZpV0ag9mPIxcLuF3jg/LLk886EILQ8Xc3indMnFF/JJFqO0Pngq9J+LmUYpPtSALPFq8tIlvLD9x4uLHzcvlMhj56Sx0lbJO+mE5tT5aMCdPXFwJKX+o241kIIaY5hEacrTKL9mNBo9dfeRSFDkzRJrt/oEo/wbbg9vhexrCN5PKo3QuJwQcfKZKRo/hKsiw5Nj1Pyt1sK9E8LMaiwkV9lA/DqujpH+1xNga3CvgOiK+22Kk/sRDzYjZF14IRwV+EbizQNmY9DVJB9PJN5dJxIcpVCgb7IKU3i8Oj3hEfJSGdpkS1XIXG2Dz1OyTYxSsLHW1guEsaCXglD7cT1EpFIcg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B9D352B0141D243B118CA820AF07AF4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b61bd2-9bce-42fc-ed4e-08d8801b8c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 17:11:48.1103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MkXqpp1dNz4bf2wIOLCadt4tBx3koHh3X5mIjzPP7dnpCzIe6OE4spoK8Z/AZ1jN8pY+srXx14+urn1A4nop5Zb62xfRmwT5W7zSW1zgCqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1369
X-OriginatorOrg: intel.com
Cc: "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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

T24gTW9uLCAyMDIwLTEwLTI2IGF0IDExOjAxICswMTAwLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6
DQo+IHNvYy1wY20ncyBkcGNtX2ZlX2RhaV9kb190cmlnZ2VyKCkgc3VwcG9ydGVkIERSQUlOIGNv
bW1uYWQgdXAgdG8NCj4ga2VybmVsDQo+IHY1LjQgd2hlcmUgZXhwbGljaXQgc3dpdGNoKGNtZCkg
aGFzIGJlZW4gaW50cm9kdWNlZCB3aGljaCB0YWtlcyBpbnRvDQo+IGFjY291bnQgYWxsIFNORFJW
X1BDTV9UUklHR0VSX3h4eCBidXQgU05EUlZfUENNX1RSSUdHRVJfRFJBSU4uIFVwZGF0ZQ0KPiBz
d2l0Y2ggc3RhdGVtZW50IHRvIHJlYWN0aXZlIHN1cHBvcnQgZm9yIGl0Lg0KPiANCj4gQXMgRFJB
SU4gaXMgc29tZXdoYXQgdW5pcXVlIGJ5IGxhY2tpbmcgbmVnYXRpdmUvc3RvcCBjb3VudGVycGFy
dCwNCj4gYnJpbmcNCj4gYmVoYXZpb3VyIG9mIGRwY21fZmVfZGFpX2RvX3RyaWdnZXIoKSBmb3Ig
c2FpZCBjb21tYW5kIGJhY2sgdG8gaXRzDQo+IHByZS12NS40IHN0YXRlIGJ5IGFkZGluZyBpdCB0
byBTVEFSVC9SRVNVTUUvUEFVU0VfUkVMRUFTRSBncm91cC4NCj4gDQo+IEZpeGVzOiBhY2JmMjc3
NDZlY2YgKCJBU29DOiBwY206IHVwZGF0ZSBGRS9CRSB0cmlnZ2VyIG9yZGVyIGJhc2VkIG9uDQo+
IHRoZSBjb21tYW5kIikNCj4gU2lnbmVkLW9mZi1ieTogQ2V6YXJ5IFJvamV3c2tpIDxjZXphcnku
cm9qZXdza2lAaW50ZWwuY29tPg0KTG9va3MgZ29vZCB0byBtZS4gVGhhbmtzLCBDZXphcnkhDQoN
ClJldmlld2VkLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXgu
aW50ZWwuY29tPg0K
