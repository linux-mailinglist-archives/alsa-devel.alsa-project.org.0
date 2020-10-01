Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041812809F0
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD4F1AE3;
	Fri,  2 Oct 2020 00:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD4F1AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601590679;
	bh=RXzOoQ8VsCK5Z2/tCc06xhWf6LFIiiGiXTMdu91aqR0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PqiNAodTEQg4jp+6re+S/QLplG7KFU/rsQ4VL7yedPL4HxL94O/bknKuDU2Urqz3E
	 1OqU+sSBnmDjf64pbTUw6a+NbDpkJUpkxvilhZ+zGX/a5Aje7eF3yc6AYPoOTt80g6
	 E09KLLOlMslSS3mQZHLy0eBV0x9R8+WiOhXo7hRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A9B6F80105;
	Fri,  2 Oct 2020 00:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF1B8F801F5; Fri,  2 Oct 2020 00:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DD19F80105
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DD19F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="uO+tWkjX"
IronPort-SDR: RrwjiPbIbfNcCTG45twBbcFI8l+cF8mnuWD/L4S366eryPyHW4JCYt2/WUPLqhCjx1ls2uE1mQ
 C2fAzD/mqB5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150642628"
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="150642628"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 15:16:05 -0700
IronPort-SDR: +vH+Mrw9hk0Tdc1O7lL5g6PzR+skTnyvubMR6ge4+0biTU5XJ2BA4krM6RqlXpWHy/p5oOVjB4
 RoQvAAad7Olg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="313254308"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 01 Oct 2020 15:16:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 15:16:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 15:16:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 15:16:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 15:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+0ve3Em4RBGrmNd8jtam3+KUNiKVVlpjrIXpiM8uG4bdu6Z4SjVO/bapoM4Lw9/d6eHtcJEeDJ8FFHesbUH++JF5LUwVlRvBIhx5cCVLM6Zh8aeUWkx5SI8FPRmZI9kYyLvgKAyt3AxIJ3W7yglqgP+2sxWv5Tr+4qGnC94qIIjacr6XvUMcrRvW2ajhRJMDrpVjXCAkJ4NouHhv4wjV24gGUDyII5rJUwuBpuoCnmNQkILD42K9o5L4WyY+pAM6YMM65L+JYZ7a4wzAHfiDRRgUxzaEo/W6hOCPCeVzqGDgWXNttgrYTtfx18YpPOjbODR7TKlN4UZKxwF0q63Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXzOoQ8VsCK5Z2/tCc06xhWf6LFIiiGiXTMdu91aqR0=;
 b=RkiX147rh2k8yPXlxlQs9wy3fiAc4lCI9YF31y/sqZezBRD7w//boVR9FI3KrpoaRTIkijqZota/4rIuQoht+mXxzgqa3sISD/awsFu8+JyUxubNvPqdItyQz/T3y8mRL0cifUEcl6+RFPSbHDHsFPZdzUlr0Nqf1/X4tsd0HkH9Qah+UXmgdiL+tJ8W8j6bqkf4jP3Y+AMny6933Oeg934dZ2Jvq7A93gzHgysR4u1tFhH9Uy1ubhWCzXO1uhcgaluylWWRUv5GF1dP3HWlljs0r4I7wg8D6JrMCv/CMSSiEMEpBuGCi/1YnkO/e8CFr7aiketiNOTmzy7tsYvnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXzOoQ8VsCK5Z2/tCc06xhWf6LFIiiGiXTMdu91aqR0=;
 b=uO+tWkjXIWsTp1BrM2fEBBOv23dls1l21c88+VyDMtLoDWBL8TUfXVa58CKTOUqln/eJZq8RxTz+BZ+KqPOLS3+CG+oUsGfaZr/JMAfMFnEQ3XOObBPaYT4mjO7VloTIDWGdyqGxSItkCEVfdOP7v7ju3UUB6bKRoJEIw2P64do=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM6PR11MB2796.namprd11.prod.outlook.com (2603:10b6:5:c8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36; Thu, 1 Oct 2020 22:16:02 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::6d10:7101:a24a:74d4]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::6d10:7101:a24a:74d4%2]) with mapi id 15.20.3433.038; Thu, 1 Oct 2020
 22:16:02 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "Ertman, David M" <david.m.ertman@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Topic: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Index: AQHWl3xDvKWSWQdJ60eB+Xz3B/EyS6mCt1aAgACajwA=
Date: Thu, 1 Oct 2020 22:16:00 +0000
Message-ID: <f3fa8df9fc8bcd789167f61b6c9d4df66b9b85c1.camel@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
 <20201001130245.GB2378679@kroah.com>
In-Reply-To: <20201001130245.GB2378679@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.151.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e80f1a56-a628-4a02-e067-08d86657953d
x-ms-traffictypediagnostic: DM6PR11MB2796:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB27968914A0CF10E7ADF4E87CE8300@DM6PR11MB2796.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fw8cgRXr1wNYhPBOze5Y5pdXwAfte+lzlWTFIPvj87nctFtP1VSKwHDSDSSr4rUOzI3OKLrCh+eTcoYUaxa7dCt8QEUqnoasehoga4jNiPFGngMPat5/PuOtgtjeK/+Zys1rLAa87i2b+Nj+2lAgmAGrKrvBU1sDpjXFGPsbUNG5KSdMBBmiecj+5HoO9hBODr4SoW3fkEjq2BnCeLIXXij2qDzIlkHXIVc63gtX08cIzWCXV0MQUU/uousy+iUjecU5ShROFVTYC6vcS7i3S+hkgonrGWs+rvmAStajlGyzImPN3qABkVXoI1mp8Dq8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(2616005)(64756008)(76116006)(54906003)(110136005)(66946007)(91956017)(316002)(66476007)(66446008)(6512007)(5660300002)(8936002)(8676002)(2906002)(66556008)(71200400001)(6506007)(26005)(36756003)(6486002)(86362001)(83380400001)(186003)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8DzhdG7fJUMzLbTRsZU/YfKNnstHqsJubNn73BgO7wjm4rMZoQfOr8L79v9EkkhHeavB9y9DEBERnMi09+j6dUWoKYsteLdUc6PyQBZNxXusCz6LJOa89GAhxQt28ML4xtElc2t0a0lPze0DugD4hSe+RqzX2VcC/B57hHdPlpNN+O5psH9YI+ihvdQlnMDOi9/d1OmgMdN1LeXWDcyS02f1d9sfsYPlsQb5G31Kk2rmO9IMySWaels377PGTI0KGdFJ6a8OdSZsdxL5/cQOnJsj6Ko3ijckp3HrCtzQNSkttzo9+wRkNcLmO2xFaRXGFUzZVSRxwIjjnZTd9UQMySPla4Bt7FUAkN5j/oTTYi/vEKjdWfWvklatearJaV7xIT4b+Ip8Dj4HnoS8iLILCaDg951HR2H4CgiEIH6/I2WuMAhgIqsmP4rQAz3UWPplCh99kfz3BJVOXpMXyxcDdGJKD8B4Nky1MWGytYXXYR8kyXv+sItLpDTxvxWG2PW++0aDYlcLASArEngNts1oU7Rwr4ImyaCMOd0aOjZ9ke7aGI10XJA9Y6Xifw5uh80CtQCF5bFUPuZSDufgCwlM/NzqR08s+0v0CL1O6N9CgIgLKJivjsKGME3XTdJObylRe4JIFoj79gTXz2IOauvBRw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E62BFF6CD5B31479C7EB03E945D65FD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80f1a56-a628-4a02-e067-08d86657953d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 22:16:02.4013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBrxsg7nEPHtZ3CMMMjhVY6Gb5mLtjIOLZ+WKNB/C3yZUw2czRimiL6hdLwucYmiMnRuM/i9CS/1QQ0Y+JuRvO+YntvCTMXb5oEPIv+xgH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2796
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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

T24gVGh1LCAyMDIwLTEwLTAxIGF0IDE1OjAyICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBX
ZWQsIFNlcCAzMCwgMjAyMCBhdCAwMzo1MDo0N1BNIC0wNzAwLCBEYXZlIEVydG1hbiB3cm90ZToN
Cj4gPiBGcm9tOiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50
ZWwuY29tPg0KPiA+IA0KPiA+IEEgY2xpZW50IGluIHRoZSBTT0YgKFNvdW5kIE9wZW4gRmlybXdh
cmUpIGNvbnRleHQgaXMgYQ0KPiA+IGRldmljZSB0aGF0IG5lZWRzIHRvIGNvbW11bmljYXRlIHdp
dGggdGhlIERTUCB2aWEgSVBDDQo+ID4gbWVzc2FnZXMuIFRoZSBTT0YgY29yZSBpcyByZXNwb25z
aWJsZSBmb3Igc2VyaWFsaXppbmcgdGhlDQo+ID4gSVBDIG1lc3NhZ2VzIHRvIHRoZSBEU1AgZnJv
bSB0aGUgZGlmZmVyZW50IGNsaWVudHMuIE9uZQ0KPiA+IGV4YW1wbGUgb2YgYW4gU09GIGNsaWVu
dCB3b3VsZCBiZSBhbiBJUEMgdGVzdCBjbGllbnQgdGhhdA0KPiA+IGZsb29kcyB0aGUgRFNQIHdp
dGggdGVzdCBJUEMgbWVzc2FnZXMgdG8gdmFsaWRhdGUgaWYgdGhlDQo+ID4gc2VyaWFsaXphdGlv
biB3b3JrcyBhcyBleHBlY3RlZC4gTXVsdGktY2xpZW50IHN1cHBvcnQgd2lsbA0KPiA+IGFsc28g
YWRkIHRoZSBhYmlsaXR5IHRvIHNwbGl0IHRoZSBleGlzdGluZyBhdWRpbyBjYXJkcw0KPiA+IGlu
dG8gbXVsdGlwbGUgb25lcywgc28gYXMgdG8gZS5nLiB0byBkZWFsIHdpdGggSERNSSB3aXRoIGEN
Cj4gPiBkZWRpY2F0ZWQgY2xpZW50IGluc3RlYWQgb2YgYWRkaW5nIEhETUkgdG8gYWxsIGNhcmRz
Lg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBkZXNjcmlwdG9ycyBmb3IgU09GIGNs
aWVudCBkcml2ZXINCj4gPiBhbmQgU09GIGNsaWVudCBkZXZpY2UgYWxvbmcgd2l0aCBBUElzIGZv
ciByZWdpc3RlcmluZw0KPiA+IGFuZCB1bnJlZ2lzdGVyaW5nIGEgU09GIGNsaWVudCBkcml2ZXIs
IHNlbmRpbmcgSVBDcyBmcm9tDQo+ID4gYSBjbGllbnQgZGV2aWNlIGFuZCBhY2Nlc3NpbmcgdGhl
IFNPRiBjb3JlIGRlYnVnZnMgcm9vdCBlbnRyeS4NCj4gPiANCj4gPiBBbG9uZyB3aXRoIHRoaXMs
IGFkZCBhIGNvdXBsZSBvZiBuZXcgbWVtYmVycyB0byBzdHJ1Y3QNCj4gPiBzbmRfc29mX2RldiB0
aGF0IHdpbGwgYmUgdXNlZCBmb3IgbWFpbnRhaW5pbmcgdGhlIGxpc3Qgb2YNCj4gPiBjbGllbnRz
Lg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8DQo+ID4gcGll
cnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJh
bmphbmkgU3JpZGhhcmFuIDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20NCj4gPiA+
DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBGcmVkIE9oIDxmcmVkLm9oQGxpbnV4LmludGVsLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGcmVkIE9oIDxmcmVkLm9oQGxpbnV4LmludGVsLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEVydG1hbiA8ZGF2aWQubS5lcnRtYW5AaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBzb3VuZC9zb2Mvc29mL0tjb25maWcgICAgICB8ICAxOSArKysrKysNCj4g
PiAgc291bmQvc29jL3NvZi9NYWtlZmlsZSAgICAgfCAgIDMgKw0KPiA+ICBzb3VuZC9zb2Mvc29m
L2NvcmUuYyAgICAgICB8ICAgMiArDQo+ID4gIHNvdW5kL3NvYy9zb2Yvc29mLWNsaWVudC5jIHwg
MTE3DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBzb3Vu
ZC9zb2Mvc29mL3NvZi1jbGllbnQuaCB8ICA2NSArKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
c291bmQvc29jL3NvZi9zb2YtcHJpdi5oICAgfCAgIDYgKysNCj4gPiAgNiBmaWxlcyBjaGFuZ2Vk
LCAyMTIgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL3Nv
Zi9zb2YtY2xpZW50LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9zb2Yvc29m
LWNsaWVudC5oDQo+IA0KPiBBcyB5b3UgYXJlIGNyZWF0aW5nIG5ldyBzeXNmcyBkaXJlY3Rvcmll
cywgeW91IHNob3VsZCBoYXZlIHNvbWUNCj4gZG9jdW1lbnRhdGlvbiBmb3IgdGhlbSA6KA0KSGkg
R3JlZywNCg0KV2UgYXJlIG5vdCBhZGRpbmcgYW55IHN5c2ZzIGVudHJpZXMgaW4gdGhpcyBzZXJp
ZXMuIA0KDQpUaGFua3MsDQpSYW5qYW5pDQo=
