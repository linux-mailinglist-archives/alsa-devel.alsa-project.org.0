Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BAF2818D7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 19:09:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BCD31F2C;
	Fri,  2 Oct 2020 19:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BCD31F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601658559;
	bh=+AYHVEzn0NRlEvmFhFklUViv9amMMq9odXaEIIlXF9A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRWdy6Kt65+i0/WpFfUiKxXmwZPUKwuB2axyvb++Hfvpyjc2geaYVJxTj5sZV80YS
	 ekGQ6Yn3lpDXBnGZduiBNPPWYgIgRbZmgmpYPEFoOvs8txmzd34PZT/+fBOj6xQC9e
	 v/H69W504KGHqBFdyAwDjxKqfLPAyHktnrobaUxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E449F80228;
	Fri,  2 Oct 2020 19:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70C56F801F9; Fri,  2 Oct 2020 19:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B12AEF801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 19:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B12AEF801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="XLvT1Cv5"
IronPort-SDR: qkAnfs3j75PYvBwq3Hzq+VUT8jSjTSHQXvSTiKjbnhOuLY8EwGN+mIxZTyjTMRycam5dpFIaDq
 31xtQN73/lxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="160435413"
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="160435413"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 10:07:21 -0700
IronPort-SDR: NM57jrKC4HutRG2iOgledcDp5tS6JGoqCDIG2sLpI8oGLCSDwgJMDExzkGCK6+OgjcUl79DspQ
 RRY+756gINkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="458684459"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 02 Oct 2020 10:07:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 2 Oct 2020 10:07:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 2 Oct 2020 10:07:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 2 Oct 2020 10:07:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjqmJxvNoUFoMzGq2wLVlYAo+btjZPnSTNRKv0mQVUIm1XwEq0BaIe015YkS8vwrZbZ8LabFCfZEtzrY4aZzp6/Lg6oHQDYpD5fLrh2UV6ygwPmFHhsvUYCGHVPhN8aHgaEhWrVBDkNipiEzAoumWaUvkhIr+q/7T/Ycr4/j10bP4YKm7mGvefIHULvoHqswLCVHmpayibFzkGgjTLjbfzddyxBAYWejgY4q7WCh0/UEHHf1DtnDb9FkMV8q3KHu8Ci4FWzEgBc3VSvBUptvC6nXfY79GOt1U4e7UtNtR9niZ/DyKHpAT9ITKBheY9gCBjVK4euv76KorAkOEClFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AYHVEzn0NRlEvmFhFklUViv9amMMq9odXaEIIlXF9A=;
 b=mFKzdZNujSZNFw3HuaQiuy3gEEr5uzSj2SwerzygwHZIffeOVGHZcwUUqu+wENHkeJA2iOZZ4mEc6va1Ngt4mcipkYSuaT++nWg8phLBjZQaNdVkyW8sGMkqYW5KzhZIkiGtsJs9z3CWQIdGwufa0ChAI/yU51omPljN8Xr000qg7jq6RcQ6CLIOu7CrCZ4OnGG7uOGeu6+LsRWP5P3XzdcNpdA0srHrv5Dwb2IQBoQtOVX6wLMvb9nlI34AAl/5fpw68nnwFkeHChapRNtogssWNfrqNQgbUokJZBkgTGNjEheL5SwiAX4CK/nRfJTm2WLcjEFIJ2MY5IYHIQowQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AYHVEzn0NRlEvmFhFklUViv9amMMq9odXaEIIlXF9A=;
 b=XLvT1Cv50MUokvUP6frrzBLF/5myGCqP3NxHxmiRDmLcuMTM4Cd17YAXmvKMpDuYwOzSsrgoWycc/q54uDeopdOEJ3becfMDd2rnzinIrzpoOVBdXpImF4Qkmnz2JK/iAQ7HfQv8X5RDgz20uBTA/+CNK8fV1HNjwLVMEL1jPvE=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM6PR11MB3788.namprd11.prod.outlook.com (2603:10b6:5:13a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36; Fri, 2 Oct 2020 17:07:14 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::6d10:7101:a24a:74d4]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::6d10:7101:a24a:74d4%2]) with mapi id 15.20.3433.038; Fri, 2 Oct 2020
 17:07:14 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Topic: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Index: AQHWl3xDvKWSWQdJ60eB+Xz3B/EyS6mCt1aAgACajwCAAG80gIAAzN2A
Date: Fri, 2 Oct 2020 17:07:13 +0000
Message-ID: <ad38db14921dc5afb424db1ecac53053f15bb753.camel@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
 <20201001130245.GB2378679@kroah.com>
 <f3fa8df9fc8bcd789167f61b6c9d4df66b9b85c1.camel@intel.com>
 <20201002045357.GA34005@kroah.com>
In-Reply-To: <20201002045357.GA34005@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [192.198.151.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8641f23c-827c-4029-eb40-08d866f59be7
x-ms-traffictypediagnostic: DM6PR11MB3788:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB37882C0152C239DF1E91111EE8310@DM6PR11MB3788.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mpgl1HF/enuVuE4gVG4t40uhguGGzhKxuM3xEjQfRldqxKTsQ7HMs0eee/PFUBuBIziPK/k+VJt5QHD0h67rimI+YmsnA+t/daNXpUYm6qPMDPkPoaU56np4Q9n+J3W93NodRt2xpUhCQNOdAos9Ep2ssO/YDclK2UtnJfDarAYVRQQ+QYiXlaMM5rY5VzRIMTNfGWEHzexqhN03mHkqrIJASbmClPf99PtlHeMZsgUx/1/QnY2JavtNkMfW6R/xtc3A3iAWq7yBYtNXLCYGEWMsaF3q0gyjxo3u+zArq5De5P+1NFxFQGHWXQHMUOqU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(83380400001)(66556008)(66476007)(64756008)(8676002)(478600001)(66446008)(54906003)(6512007)(316002)(5660300002)(186003)(36756003)(2906002)(26005)(2616005)(86362001)(4326008)(8936002)(91956017)(76116006)(6506007)(66946007)(71200400001)(6916009)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TzfljqSTXmzgyMMb2WAxJV6xIutlVjmtaan6mJ64WePr/gEvpbbP9ovU0hTbQZ8OsdyTcdD3HIsTlxKD/xQ8hG23Xjo26rY4aoDmr3a/1Ils7BCB/XVzcPaJpdAl1iE73ykTGyCDUqPU9Rme3NDnNgvOnk5hRkn9d2mya1M1yOJlxCcWtXfx+jzJH5xEXwsf/s7AgmkOl+aiZp2+wmLQXqP/uKu/WLgvHOAOVJl+80a1bZb1VXfUvTRKeStBxW/oOREla4LECOpL+rmGQDeAQd0ekhCZylv/xMqvTfy1WZlXaod/b5J4xeL4WawkQYdsPTBuCi4brPAqTXlpaveVkrtD7FtoAY4J4Wm/oPFtS6KAmWumUCohCPsfuuHKGNx5vAc2UNV5uWmW/p0rVjCCcYVgoWbleToQbpxfXpW7uesAmb+g4f2vyfuPnJp2girm86l2hT1IGnnjsSWSXQ0juu2sJrbbYuLM8iALz5c5LK57p8YVUPYL3uaMpoRjKL7dqaSQfa3JOOcKs87/xzbnMoX7zj40C/6CmayYs65WewIy6pfk4ehhFCO+Jj8fLYHDzEMMXwBVLKL0oWSBGXnIvjcn0Y/QeegDVsaiZiL4pipI80WjQSWug9p9AFVGX858gGBMxssrXGnCeeBwquSH+Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <560C670BC2F3FD42B900C4E39CE2D826@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8641f23c-827c-4029-eb40-08d866f59be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 17:07:14.0524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x67Eh+Qz8zkLPe6Ayvh71BOJQ1txYoLvHGGUXYWi/L7FNV2OXrJ4QCClC0oOdCFtkbweOM8j5jvJYx4bOtmJGorEXZ5OVbWjdZBLwW1XGbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3788
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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

T24gRnJpLCAyMDIwLTEwLTAyIGF0IDA2OjUzICswMjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gVGh1LCBPY3QgMDEsIDIwMjAgYXQgMTA6MTY6MDBQTSArMDAwMCwg
U3JpZGhhcmFuLCBSYW5qYW5pIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMC0xMC0wMSBhdCAxNTow
MiArMDIwMCwgR3JlZyBLSCB3cm90ZToNCj4gPiA+IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDAz
OjUwOjQ3UE0gLTA3MDAsIERhdmUgRXJ0bWFuIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBSYW5qYW5p
IFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiAN
Cj4gPiA+ID4gQSBjbGllbnQgaW4gdGhlIFNPRiAoU291bmQgT3BlbiBGaXJtd2FyZSkgY29udGV4
dCBpcyBhDQo+ID4gPiA+IGRldmljZSB0aGF0IG5lZWRzIHRvIGNvbW11bmljYXRlIHdpdGggdGhl
IERTUCB2aWEgSVBDDQo+ID4gPiA+IG1lc3NhZ2VzLiBUaGUgU09GIGNvcmUgaXMgcmVzcG9uc2li
bGUgZm9yIHNlcmlhbGl6aW5nIHRoZQ0KPiA+ID4gPiBJUEMgbWVzc2FnZXMgdG8gdGhlIERTUCBm
cm9tIHRoZSBkaWZmZXJlbnQgY2xpZW50cy4gT25lDQo+ID4gPiA+IGV4YW1wbGUgb2YgYW4gU09G
IGNsaWVudCB3b3VsZCBiZSBhbiBJUEMgdGVzdCBjbGllbnQgdGhhdA0KPiA+ID4gPiBmbG9vZHMg
dGhlIERTUCB3aXRoIHRlc3QgSVBDIG1lc3NhZ2VzIHRvIHZhbGlkYXRlIGlmIHRoZQ0KPiA+ID4g
PiBzZXJpYWxpemF0aW9uIHdvcmtzIGFzIGV4cGVjdGVkLiBNdWx0aS1jbGllbnQgc3VwcG9ydCB3
aWxsDQo+ID4gPiA+IGFsc28gYWRkIHRoZSBhYmlsaXR5IHRvIHNwbGl0IHRoZSBleGlzdGluZyBh
dWRpbyBjYXJkcw0KPiA+ID4gPiBpbnRvIG11bHRpcGxlIG9uZXMsIHNvIGFzIHRvIGUuZy4gdG8g
ZGVhbCB3aXRoIEhETUkgd2l0aCBhDQo+ID4gPiA+IGRlZGljYXRlZCBjbGllbnQgaW5zdGVhZCBv
ZiBhZGRpbmcgSERNSSB0byBhbGwgY2FyZHMuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIHBhdGNo
IGludHJvZHVjZXMgZGVzY3JpcHRvcnMgZm9yIFNPRiBjbGllbnQgZHJpdmVyDQo+ID4gPiA+IGFu
ZCBTT0YgY2xpZW50IGRldmljZSBhbG9uZyB3aXRoIEFQSXMgZm9yIHJlZ2lzdGVyaW5nDQo+ID4g
PiA+IGFuZCB1bnJlZ2lzdGVyaW5nIGEgU09GIGNsaWVudCBkcml2ZXIsIHNlbmRpbmcgSVBDcyBm
cm9tDQo+ID4gPiA+IGEgY2xpZW50IGRldmljZSBhbmQgYWNjZXNzaW5nIHRoZSBTT0YgY29yZSBk
ZWJ1Z2ZzIHJvb3QgZW50cnkuDQo+ID4gPiA+IA0KPiA+ID4gPiBBbG9uZyB3aXRoIHRoaXMsIGFk
ZCBhIGNvdXBsZSBvZiBuZXcgbWVtYmVycyB0byBzdHJ1Y3QNCj4gPiA+ID4gc25kX3NvZl9kZXYg
dGhhdCB3aWxsIGJlIHVzZWQgZm9yIG1haW50YWluaW5nIHRoZSBsaXN0IG9mDQo+ID4gPiA+IGNs
aWVudHMuDQo+ID4gPiA+IA0KPiA+ID4gPiBSZXZpZXdlZC1ieTogUGllcnJlLUxvdWlzIEJvc3Nh
cnQgPA0KPiA+ID4gPiBwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFJhbmphbmkgU3JpZGhhcmFuIDwNCj4gPiA+ID4gcmFuamFuaS5z
cmlkaGFyYW5AbGludXguaW50ZWwuY29tDQo+ID4gPiA+IENvLWRldmVsb3BlZC1ieTogRnJlZCBP
aCA8ZnJlZC5vaEBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyZWQg
T2ggPGZyZWQub2hAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZl
IEVydG1hbiA8ZGF2aWQubS5lcnRtYW5AaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
IHNvdW5kL3NvYy9zb2YvS2NvbmZpZyAgICAgIHwgIDE5ICsrKysrKw0KPiA+ID4gPiAgc291bmQv
c29jL3NvZi9NYWtlZmlsZSAgICAgfCAgIDMgKw0KPiA+ID4gPiAgc291bmQvc29jL3NvZi9jb3Jl
LmMgICAgICAgfCAgIDIgKw0KPiA+ID4gPiAgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmMgfCAx
MTcNCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4g
PiAgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmggfCAgNjUgKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gPiA+ICBzb3VuZC9zb2Mvc29mL3NvZi1wcml2LmggICB8ICAgNiArKw0KPiA+ID4gPiAg
NiBmaWxlcyBjaGFuZ2VkLCAyMTIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHNvdW5kL3NvYy9zb2Yvc29mLWNsaWVudC5jDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmgNCj4gPiA+IA0KPiA+ID4gQXMgeW91IGFy
ZSBjcmVhdGluZyBuZXcgc3lzZnMgZGlyZWN0b3JpZXMsIHlvdSBzaG91bGQgaGF2ZSBzb21lDQo+
ID4gPiBkb2N1bWVudGF0aW9uIGZvciB0aGVtIDooDQo+ID4gSGkgR3JlZywNCj4gPiANCj4gPiBX
ZSBhcmUgbm90IGFkZGluZyBhbnkgc3lzZnMgZW50cmllcyBpbiB0aGlzIHNlcmllcy4gDQo+IA0K
PiBZb3UgYWRkZWQgZGlyZWN0b3JpZXMgaW4gc3lzZnMsIHJpZ2h0Pw0KSGkgR3JlZywNCg0KV2Ug
YXJlIG5vdCBhZGRpbmcgYW55IHN5c2ZzIGRpcmVjdG9yaWVzLiBUaGUgb25seSBjaGFuZ2UgaW4g
dGhlIC9zeXMNCmRpcmVjdG9yeSB3aWxsIGJlIHRoZSBuZXcgYW5jaWxsYXJ5IGRldmljZXMgY3Jl
YXRlZCBpbiB0aGUNCi9zeXMvYnVzL2FuY2lsbGFyeS9kZXZpY2VzIGRpcmVjdG9yeSBpZSBzbmRf
c29mX2NsaWVudC5pcGNfdGVzdC4wIGFuZCANCnNuZF9zb2ZfY2xpZW50LmlwY190ZXN0LjEuIElu
IHRoZSBmb2xsb3dpbmcgcGF0Y2hlcywgd2UncmUgYWRkaW5nDQpkZWJ1Z2ZzIGVudHJpZXMgZm9y
IHRoZSBpcGMgdGVzdCBjbGllbnRzIGJ1dCBubyBvdGhlciBzeXNmcyBjaGFuZ2VzLg0KDQpJcyBp
dCByZXF1aXJlZCB0byBhZGQgZG9jdW1lbnRhdGlvbiBmb3IgdGhlc2UgYXMgd2VsbD8NCg0KVGhh
bmtzLA0KUmFuamFuaQ0KDQo=
