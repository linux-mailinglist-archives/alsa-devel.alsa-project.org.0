Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C03233863
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 20:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A011683;
	Thu, 30 Jul 2020 20:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A011683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596133748;
	bh=wjdTrtIJElUxSgAlLeDlKT5qj8mFfk2Q63blVfCGD5E=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kv+nssMXY50ouFewpXuiM+YhuwZL0ffGnR++2NYmWkg26tD6ThHZnOz5nvYGQ34g2
	 WduNwjhCr2SqFBWN3CpfINmD6FcdoODFU/VuSIt7q4C/oyIYEsgw1G9IfqTYYvW054
	 rvUcruJHk8EKBfshmtBwu1xvoCJowZiipIvUNvZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79029F8012F;
	Thu, 30 Jul 2020 20:27:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CFB9F8021E; Thu, 30 Jul 2020 20:27:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CED96F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 20:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED96F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="tUIlWu1F"
IronPort-SDR: cBB+85z1OCHSrvxobz/0tpjQDiD3rIfiu1CwcwflHJ2iJSZQgfYleLMJJuE+q/YHRZzCw2Tprm
 qZyBIxvIAERg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="139662037"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="139662037"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 11:27:18 -0700
IronPort-SDR: 8CMnZ68zHfZ8ymtF3sk6KrgA9dVO9P7m67Oao4cJCN2zyFkevlHB9J1n/B6nTrbmwqyV//Zo/F
 qLynGZsU/0Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="274293619"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2020 11:27:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 11:27:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jul 2020 11:27:17 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 11:27:17 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.59) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 30 Jul 2020 11:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mS3TwKR++RQN29/Tre+UkOXZOP9oEqM1S/sfLgXc7HZlLr+fZH/bXES98W+Ze8v64J7aIXo6Gi3FQxSkWGPUBXzYS/4hCPYWqg5EyTabr+B8tGgufeugdsaBXZwa6DMDAESsZKM6iyA6wOw52v7mGT4AwjrfLDWp9OJFfNTOVYjRmKqNSxxV7O17xF6tvjVsVEvgMioDqc0TqDYRn3U+PSLoyZPSm6vJ8bri+cLqd+9CHO7L6N4z+wznSadXGeMB1WIA+b+WIAbfl0oyIb6nPAF1ykXiPBAgK28CPDGCbQoyuHzcKrawo9m1c2yiDqSnA7ymtAgWP+WwjQc4h/pTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjdTrtIJElUxSgAlLeDlKT5qj8mFfk2Q63blVfCGD5E=;
 b=CxI9ouwDhHthYb7RgY+V74I/vUBnQwb6BzjzAK99rM3eD7bUO6K2LZ6SOPR70vQI/yCNSLV7QtjFBOWcKeOXQIMOJ2Z7nsTa2nph8lTPC67K72SdWRrpYqiyNGDsxyhocTiceF6mfByh54ISF3OBz6LFrRgk2gOlF8OXAP39IfWUCr+TzC6sY265QVadRuvVW7NN9qa6qp+7CUSb0gXC0TMoym5kjio9eqfbE5ZU5WQj0FttSD052XIpd47J0LbWX+RwyTE2EyK7Ym22MkD+s0PBLe16m4cpp8OZfE3JPkyqQlncNkVHx99laxxVva0ymFUuBvmjeTZpBixN8CNLaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjdTrtIJElUxSgAlLeDlKT5qj8mFfk2Q63blVfCGD5E=;
 b=tUIlWu1F4Fra/d6IaBr8LwqbPoHI4+w4Dz6FXdXtH1MuK/kT2li423dF36xzVowTAmFI24UqH4q7OfdMSLXNQzkBIbEBesYFsNptYTOmK0NY0EPOWTU88K0dtmEU7NGE/IyJksN+BVUIOj6L0eABpfyDQRXWOnvV1+NhhDAn4N8=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BY5PR11MB4102.namprd11.prod.outlook.com (2603:10b6:a03:181::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Thu, 30 Jul
 2020 18:27:15 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 18:27:15 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Topic: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Index: AQHWZpabwQv8AEaOYUq8HJOMkq6/wqkgYrOAgAAMXdA=
Date: Thu, 30 Jul 2020 18:27:15 +0000
Message-ID: <BY5PR11MB4307932CDA8DD4C0F594BCA2FD710@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
 <2788f0fd-adaa-c56d-6801-503432ba7ee6@linux.intel.com>
In-Reply-To: <2788f0fd-adaa-c56d-6801-503432ba7ee6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [24.23.139.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4d72458-db80-4cf8-24e5-08d834b62f7a
x-ms-traffictypediagnostic: BY5PR11MB4102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4102F60075043217DF01DBEBFD710@BY5PR11MB4102.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u0kL4IHtIyeO9RzxSt7+B+78ZA1zK0lnGzb4KRyWNykuFGtdkT6fEoumGzdn+ZINA/+tNUT0T92ehRToTVemK7g/z+BGRgUD9Uv6ka68k3SlRNwnh3OKIw1M6VNohLfySFt9fpy+YvfFNpz1rx0SRoBHk5MZYnba6HBibVh4X/DdBsbCzalbSxKMiRxcA6EtXgTGGJMZ5A+LCZBcHJhyZ/OxzAGgKh/2MaO8m8VUOZr7ITahpgr02moPcoBKAqLjfs6oz4O6tDa0jQZFHbCaWJJeeArbk3iXptoyq9SnEQjUvdndWNTqrV3OeCqSPiEBrD2M9Muzy/4R0Hbt9GvAVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(71200400001)(9686003)(478600001)(4326008)(33656002)(2906002)(66476007)(55016002)(83380400001)(66446008)(64756008)(66946007)(66556008)(54906003)(86362001)(6506007)(76116006)(5660300002)(110136005)(8936002)(7696005)(186003)(52536014)(8676002)(316002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dEcpYDlimBh35kTkdh9v6mGLqVqq2kZa3qJjLLSKCqZQ6ZPGzzuOy7vvwuds0zRCKgJx4XjHErqk4Bgat/I/QNdrKsHcljflyOL0/2/47hWFRWx9/FSRRxluDft9dmUxC3JHVkx987GaOHPm4d94aqeKqB2owsa+KWJktCS+tkkFNkDBYFj6/o1K/BGwbzuOy1bCAEO5t6uhF2ygtgn/fG1MTpB5YlKhFTePxQg5hpVvDMYmcAlZe4bKDc4iTn83Fv0hYaeDq0QNd/g+K2LkxW05razwKvXEMUODDsk8SwpcYF/HZlGxvkA5jQ2uhbLJ8G0ULkvu17kDkjIfAgMTP62Tbj/l7YGg9Dh75jjHk62tirpsYQmvBzxVZitimH8Da/rGQIO1gSoATO+nm1Fi+S/c9sTUVr/pF77jJhIdqGdj5gqAniDYGoHgJIHhv7poUBTZ/wdxSrfadgU2BLnNVh/IsjVX7XyZgH5n74OcIqlHALXstW1CB35UeZxdiWpR6V5+fFpfanMouAO8qmaUgPSeKo3YTzkvwP8QggSpNPurAoxBcMfxVrgYVLeq4Sa/AB0sGFeV5fjG+XixyPZ8GjLX9QMZh1y+BHROyqhyAX7FLbi9nDjp6tjS04ROyhuTy5zu6ocOWvUUWNq3+MKeiw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d72458-db80-4cf8-24e5-08d834b62f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 18:27:15.6512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldO9pljZJW2kH7vNz61hpYw6gOCgE8adjfyGSNbviU08xm5KrpwYKDA1x2BEHI0lQEUt/A+hqiKX88hE60yKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4102
X-OriginatorOrg: intel.com
Cc: "Lu, Brent" <brent.lu@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

PiANCj4gPiAgIAkvKg0KPiA+ICAgCSAqIE1DTEsvU0NMSyBuZWVkIHRvIGJlIE9OIGVhcmx5IGZv
ciBhIHN1Y2Nlc3NmdWwgc3luY2hyb25pemF0aW9uIG9mDQo+ID4gICAJICogY29kZWMgaW50ZXJu
YWwgY2xvY2suIEFuZCB0aGUgY2xvY2tzIGFyZSB0dXJuZWQgb2ZmIGR1cmluZyBAQA0KPiA+IC05
MSwzOCArMTA4LDQ4IEBAIHN0YXRpYyBpbnQgcGxhdGZvcm1fY2xvY2tfY29udHJvbChzdHJ1Y3QN
Cj4gc25kX3NvY19kYXBtX3dpZGdldCAqdywNCj4gPiAgIAkgKi8NCj4gPiAgIAlzd2l0Y2ggKGV2
ZW50KSB7DQo+ID4gICAJY2FzZSBTTkRfU09DX0RBUE1fUFJFX1BNVToNCj4gPiAtCQkvKiBFbmFi
bGUgTUNMSyAqLw0KPiA+ICAgCQlyZXQgPSBjbGtfc2V0X3JhdGUocHJpdi0+bWNsaywgMjQwMDAw
MDApOw0KPiA+ICAgCQlpZiAocmV0IDwgMCkgew0KPiA+IC0JCQlkZXZfZXJyKGNhcmQtPmRldiwg
IkNhbid0IHNldCByYXRlIGZvciBtY2xrLCBlcnI6ICVkXG4iLA0KPiA+IC0JCQkJcmV0KTsNCj4g
PiAtCQkJcmV0dXJuIHJldDsNCj4gPiArCQkJZGV2X2VycihjYXJkLT5kZXYsICJDYW4ndCBzZXQg
cmF0ZSBmb3IgbWNsayBmb3Igc3NwJWQsDQo+IGVycjogJWRcbiIsDQo+ID4gKwkJCQlzc3BfbnVt
LCByZXQpOw0KPiA+ICsJCQkJcmV0dXJuIHJldDsNCj4gDQo+IG5pdC1waWNrOiBhbGlnbm1lbnQg
aXMgb2ZmIGZvciB0aGUgJ3JldHVybiByZXQnLg0KbXkgYmFkLi4uIHdpbGwgY2hhbmdlIHRoYXQN
Cj4gDQo+ID4gICAJCX0NCj4gPg0KPiA+IC0JCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShwcml2
LT5tY2xrKTsNCj4gPiAtCQlpZiAocmV0IDwgMCkgew0KPiA+IC0JCQlkZXZfZXJyKGNhcmQtPmRl
diwgIkNhbid0IGVuYWJsZSBtY2xrLCBlcnI6ICVkXG4iLA0KPiByZXQpOw0KPiA+IC0JCQlyZXR1
cm4gcmV0Ow0KPiA+ICsJCWlmICghX19jbGtfaXNfZW5hYmxlZChwcml2LT5tY2xrKSkgew0KPiA+
ICsJCQkvKiBFbmFibGUgTUNMSyAqLw0KPiA+ICsJCQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUo
cHJpdi0+bWNsayk7DQo+IA0KPiBUaGF0IHNlZW1zIGNvcnJlY3Qgc2luY2UgeW91IHNoYXJlIHRo
ZSBtY2xrIGJldHdlZW4gdHdvIHJlc291cmNlcyBidXQgc2VlIFsxXQ0KPiBiZWxvdw0KPiANCj4g
PiArCQkJaWYgKHJldCA8IDApIHsNCj4gPiArCQkJCWRldl9lcnIoY2FyZC0+ZGV2LCAiQ2FuJ3Qg
ZW5hYmxlIG1jbGsgZm9yDQo+IHNzcCVkLCBlcnI6ICVkXG4iLA0KPiA+ICsJCQkJCXNzcF9udW0s
IHJldCk7DQo+ID4gKwkJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCQl9DQo+ID4gICAJCX0NCj4gPg0K
PiA+IC0JCS8qIEVuYWJsZSBTQ0xLICovDQo+ID4gLQkJcmV0ID0gY2xrX3NldF9yYXRlKHByaXYt
PnNjbGssIDMwNzIwMDApOw0KPiA+ICsJCXJldCA9IGNsa19zZXRfcmF0ZShzY2xrLCBzY2xrX3Jh
dGUpOw0KPiA+ICAgCQlpZiAocmV0IDwgMCkgew0KPiA+IC0JCQlkZXZfZXJyKGNhcmQtPmRldiwg
IkNhbid0IHNldCByYXRlIGZvciBzY2xrLCBlcnI6ICVkXG4iLA0KPiA+IC0JCQkJcmV0KTsNCj4g
PiArCQkJZGV2X2VycihjYXJkLT5kZXYsICJDYW4ndCBzZXQgcmF0ZSBmb3Igc2NsayBmb3Igc3Nw
JWQsDQo+IGVycjogJWRcbiIsDQo+ID4gKwkJCQlzc3BfbnVtLCByZXQpOw0KPiA+ICAgCQkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPm1jbGspOw0KPiA+ICAgCQkJcmV0dXJuIHJldDsNCj4g
PiAgIAkJfQ0KPiA+DQo+ID4gLQkJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPnNjbGsp
Ow0KPiA+IC0JCWlmIChyZXQgPCAwKSB7DQo+ID4gLQkJCWRldl9lcnIoY2FyZC0+ZGV2LCAiQ2Fu
J3QgZW5hYmxlIHNjbGssIGVycjogJWRcbiIsIHJldCk7DQo+ID4gLQkJCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShwcml2LT5tY2xrKTsNCj4gPiArCQlpZiAoIV9fY2xrX2lzX2VuYWJsZWQoc2Nsaykp
IHsNCj4gDQo+IFdoeSBkbyB5b3UgbmVlZCB0aGlzIHRlc3Q/IHRoZSBzY2xvY2tzIGFyZSBub3Qg
c2hhcmVkPyBzZWUgYWxzbyBbMl0gYmVsb3cNCk15IHRob3VnaHQgcHJvY2VzcyB3YXMgaWYgdGhl
IGNsb2NrIGlzIGFscmVhZHkgZW5hYmxlZCwgdGhlbiB3ZSBkb24ndCBoYXZlIHRvIGVuYWJsZSBp
dC4gDQpJc2VlIHlvdXIgcG9pbnQsIEkgY2FuIHNraXAgdGhpcyBjaGVjay4gVGhpcyBjaGVjayB3
aWxsIGFsd2F5cyBiZSB0cnVlLg0KPiANCj4gPiArCQkJLyogRW5hYmxlIFNDTEsgKi8NCj4gPiAr
CQkJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHNjbGspOw0KPiA+ICsJCQlpZiAocmV0IDwgMCkg
ew0KPiA+ICsJCQkJZGV2X2VycihjYXJkLT5kZXYsICJDYW4ndCBlbmFibGUgc2NsayBmb3INCj4g
c3NwJWQsIGVycjogJWRcbiIsDQo+ID4gKwkJCQkJc3NwX251bSwgcmV0KTsNCj4gPiArCQkJCWNs
a19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5tY2xrKTsNCj4gPiArCQkJCXJldHVybiByZXQ7DQo+
ID4gKwkJCX0NCj4gPiAgIAkJfQ0KPiA+ICAgCQlicmVhazsNCj4gPiAgIAljYXNlIFNORF9TT0Nf
REFQTV9QT1NUX1BNRDoNCj4gPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+bWNsayk7
DQo+ID4gLQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPnNjbGspOw0KPiA+ICsJCWlmIChf
X2Nsa19pc19lbmFibGVkKHByaXYtPm1jbGspKQ0KPiA+ICsJCQljbGtfZGlzYWJsZV91bnByZXBh
cmUocHJpdi0+bWNsayk7DQo+ID4gKw0KPiANCj4gWzFdIHRoaXMgc2VlbXMgd3JvbmcgaW4gY2Fz
ZSB5b3UgaGF2ZSB0d28gU1NQcyB3b3JraW5nLCBhbmQgc3RvcCBvbmUuDQo+IFRoaXMgd291bGQg
dHVybiBvZmYgdGhlIG1jbGsgd2hpbGUgb25lIG9mIHRoZSB0d28gU1NQcyBpcyBzdGlsbCB3b3Jr
aW5nLg0KRm9yIHRoaXMgcGxhdGZvcm0gd2UgdXNlIGVpdGhlciBoZWFkc2V0IG9yIGRtaWMuIA0K
VGhlcmUgaXMgbm8gd2F5IHdlIGNhbiByZWNvcmQgc2ltdWx0YW5lb3VzbHkgdXNpbmcgZGlmZmVy
ZW50IGRldmljZXMuDQpTbyBkaXNhYmxpbmcgbWNsayBtaWdodCBub3QgYmUgaGFybWZ1bCBoZXJl
LiBCdXQgdGhpcyBjYXNlIHdpbGwgYWx3YXlzIGJlIHRydWUgdG9vIDopLiANCj4gDQo+ID4gKwkJ
aWYgKF9fY2xrX2lzX2VuYWJsZWQoc2NsaykpDQo+IA0KPiBbMl0gQWdhaW4gaXMgdGhpcyB0ZXN0
IG5lZWRlZCBzaW5jZSBzY2xrIGlzIG5vdCBzaGFyZWQgYmV0d2VlbiBTU1BzDQpTYW1lIHRob3Vn
aHQgcHJvY2VzcyB0byBjaGVjayBpZiBpdHMgZW5hYmxlZCBvciBub3QuIFdpbGwgcmVtb3ZlIHRo
YXQuDQo+IA0KPiA+ICsJCQljbGtfZGlzYWJsZV91bnByZXBhcmUoc2Nsayk7DQoNCg==
