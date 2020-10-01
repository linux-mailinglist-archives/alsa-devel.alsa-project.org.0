Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB528043D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:48:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CF0E1903;
	Thu,  1 Oct 2020 18:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CF0E1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601570936;
	bh=mrJlRnf+EKenVeoFx32mNH9SDamktSpqoiylpP7ql38=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgNiirZx/wjJSvujrwswr4ioOjYG1t8ximuWDhMWj6d2NO8wf+gLh3L2MUhnB0AqK
	 FQFaMWOmWfb8nxJes6mfQgdJrFWEC1Ws8DMGlQOmkxSsI7hX8t8eReCkRwAJC0rlj1
	 bxQXRIJ51x/mkxFrQXkqZhtdn0shOVtshth7C2wY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCED2F8020C;
	Thu,  1 Oct 2020 18:47:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F5A4F801F5; Thu,  1 Oct 2020 18:47:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 521D8F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521D8F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="imOcxbeI"
IronPort-SDR: wcEXZgzMKHPVzzCVETwG0tuu42Y3NoXE3976HQodLe+jPc3rR9c+oXMVw2HJ87BxgLgQ4RiIAo
 470tV/EzJ4HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150571606"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="150571606"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:46:58 -0700
IronPort-SDR: 8D1Re6oRPkGF4+q29Iz30p7mtEPlal3DAHLRO2p+8nX/13jcCNva3H1zpJyxKZODJlWCxbaSBe
 /zJJF95Ak6Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="313116669"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga006.jf.intel.com with ESMTP; 01 Oct 2020 09:46:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:46:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:46:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 09:46:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 09:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSM0sRrG4OQD8swd3oMg75ZD4kDb06i0JLj+3gpwOs8Bb9N6W5g6p9+xBA4qAg0f+uaMruEPjU3PPOhhYHX/HmQZhnh+ucw7LGozqWqtaNipTFrEbx0GA/coWGRkN/W8DKPZiiNb7J65yjAmWHT0wsFZn0epeAUZ+634D1E0pwiP6gU5sucwiXlUfwY6/frhTrlFI1TCgIPyHUbTvWXlE8GToQVwLE+gtRXSK5lOP5fGm5DFyy4RX7Lc95XJeMVJ7xaSGEIxs+IZoRl2ikKqKADxcXIbOdxnyhWdFe1zOpDmLu/fy/Sish34jFNpZ6ScIY6DVwakjjOxWzHucGNKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrJlRnf+EKenVeoFx32mNH9SDamktSpqoiylpP7ql38=;
 b=Tdxji+RkJt2mE8JHQ/Kuedv0MurPajZLXyTjvegD+sq5nxEnFbNmx9FYmFxTUr+ogz4rI/LpACH3zedUPeBwRl6nmQsxrJabNnroVt8yOj1NFZ+BD8PYM8VNVsYBKhVEnbt3x7fPJiHhT2tsb4YjVYG0QLqCLZjrsba6FKuFOQ9X3Ksffz8aaw8lv7NWoy9ZZZWQYX+1byxwAWD7Xu/wr3oySbAjo+ZzPfE5PKzMCKZgDrGoTKCMnz4bdM2+HDiAL8uyXsD/4wbzWzKHHPCfuC1ExF+QvaqLAJpLqHiGHUssGE4dv/DkJ4lk/4xBXgXMhlY83ZUy1CX/L9rnPe7sbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrJlRnf+EKenVeoFx32mNH9SDamktSpqoiylpP7ql38=;
 b=imOcxbeIVYbraf26gMU0fMiMLPSNqmV0wtHbkWK8IydOKNjhv8YX+ynhSzpJalBftlrMQTcLkqvv5+IB8MsSuQVdqeIfX8E+UvqcTARKAZ9eez0er6QjroYKF7GwoSOLqvxuAlwHN/r2xFD9nI8Yhyin/GcCVFVZXLGOszU9n0U=
Received: from BL0PR11MB2899.namprd11.prod.outlook.com (2603:10b6:208:7b::21)
 by MN2PR11MB4383.namprd11.prod.outlook.com (2603:10b6:208:17b::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 16:46:54 +0000
Received: from BL0PR11MB2899.namprd11.prod.outlook.com
 ([fe80::85d1:1545:621b:8200]) by BL0PR11MB2899.namprd11.prod.outlook.com
 ([fe80::85d1:1545:621b:8200%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 16:46:54 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "Ertman, David M" <david.m.ertman@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Thread-Topic: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Thread-Index: AQHWl3xC0fACpJ/+90OoQT2u0mP7lqmCt+sAgAA+CQA=
Date: Thu, 1 Oct 2020 16:46:53 +0000
Message-ID: <53a118dd2da164d5dfd4bda83ce3e75335d0cb70.camel@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-4-david.m.ertman@intel.com>
 <20201001130450.GC2378679@kroah.com>
In-Reply-To: <20201001130450.GC2378679@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.151.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93adc3f3-70f7-4165-8069-08d866299a4d
x-ms-traffictypediagnostic: MN2PR11MB4383:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB43837D43E0CC49FB95B52379E8300@MN2PR11MB4383.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yo3k2ZanFsdvN+6riWVbNShltBe3jTgp3Mb6d3IIeGI6rfIgIncBaYci63SY4+nW/G+nrqyAiCzHCVluLHxvzxJ+JQmrOlzAc1b7MsWdR2FA3geeRFEAjtfjvL25CgFcViKHPtC5nVleqG21KI5IzEsmtXDu9gawKOuOR9two/LSUWP88J+aQe2Wfi6jLuizOZo325TwXLFV861MqXe+tVrJrUUF1ekhXCfileGkor5YEJ9EHtCE3U0HG7d7vRj/JGvhax9ygxpJ5p0R3kZ17hp2DzcmHjbYJE/wVuHd3dWD9AiKpK0Bt75wXm2GKOib
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2899.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(186003)(2906002)(6512007)(66476007)(64756008)(110136005)(66946007)(91956017)(66556008)(8676002)(6486002)(5660300002)(2616005)(76116006)(66446008)(8936002)(6506007)(54906003)(26005)(86362001)(478600001)(316002)(71200400001)(36756003)(83380400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dmvyIr4A8gwgY7kC+R3dK/TM13nkyAx6x2wlV/ScubSq+Q2Mp0mMfmdz7SrVSG80JWiMo4YclfcaxDBKc9/icYYtgk/fNkQpmwdYGnEn9Q2vo51dlL2K28zX8sYr/LTcF05s1CuYUtE7TQLRwLhvKRe9o9uEMgWjqr1+baV2RXrXfW/RJyU3PggulRn3Ds3UdlpXXZUNPiCP/fnOEn7xzDlliK5D0TcwNLWWXapPfp1ad7qSIrnRIa085KCaUP/FW4J91QQy0zQo46BIyL5TQiM8IfHuduS3kWEey6YqJM0293o5BDKzUIezWXBhL6QiXAZrKIq2gYhtEOa5E/VG22L71Lt8px29YiUbavqz8j8v9twJdKxfbYqog/WucL/7X8x8HjVjA1irS5uTLs7xlKBXDc/dj9KF1ehueQuQbUXQ/XD2CNepDyJDRv9sjXLSZZd+fmG742ZcvRd9jBGu2XN0HXtY4nKrSCDKVDWMFyLL3htjiM1/MRS8TJaCYokRj0hxe/riIXMbzGGDXZQ9rjF7j8PHM1DAEowMYj5GsMfW4RJsAZbp25jO8HvhLCHGHpGjcwboQJnVhDIxckxFYHGEgDbVrKpLAlo5Q3i/Tt8Lj/DeFe1MDdcEtAPOPh7e8s2pAGVTm/UZuH1pSURqtw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AB9ABAC8A87644F925161E5FEEE4196@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93adc3f3-70f7-4165-8069-08d866299a4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 16:46:53.9418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J38ZcFcd4VSsZwMXdzRKp8Q4rqtwnZfGMC2rmN6paHCcCV7RhFCIpc2o2JZO6ziSaZLHbd6g03m5cFb82dvIFK0PgQUDtR5wcvC5ICLniiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4383
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

T24gVGh1LCAyMDIwLTEwLTAxIGF0IDE1OjA0ICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBX
ZWQsIFNlcCAzMCwgMjAyMCBhdCAwMzo1MDo0OFBNIC0wNzAwLCBEYXZlIEVydG1hbiB3cm90ZToN
Cj4gPiArLyoNCj4gPiArICogVGhlIElQQyB0ZXN0IGNsaWVudCBjcmVhdGVzIGEgY291cGxlIG9m
IGRlYnVnZnMgZW50cmllcyB0aGF0DQo+ID4gd2lsbCBiZSB1c2VkDQo+ID4gKyAqIGZsb29kIHRl
c3RzLiBVc2VycyBjYW4gd3JpdGUgdG8gdGhlc2UgZW50cmllcyB0byBleGVjdXRlIHRoZQ0KPiA+
IElQQyBmbG9vZCB0ZXN0DQo+ID4gKyAqIGJ5IHNwZWNpZnlpbmcgZWl0aGVyIHRoZSBudW1iZXIg
b2YgSVBDcyB0byBmbG9vZCB0aGUgRFNQIHdpdGgNCj4gPiBvciB0aGUgZHVyYXRpb24NCj4gPiAr
ICogKGluIG1zKSBmb3Igd2hpY2ggdGhlIERTUCBzaG91bGQgYmUgZmxvb2RlZCB3aXRoIHRlc3Qg
SVBDcy4gQXQNCj4gPiB0aGUNCj4gPiArICogZW5kIG9mIGVhY2ggdGVzdCwgdGhlIGF2ZXJhZ2Us
IG1pbiBhbmQgbWF4IHJlc3BvbnNlIHRpbWVzIGFyZQ0KPiA+IHJlcG9ydGVkIGJhY2suDQo+ID4g
KyAqIFRoZSByZXN1bHRzIG9mIHRoZSBsYXN0IGZsb29kIHRlc3QgY2FuIGJlIGFjY2Vzc2VkIGJ5
IHJlYWRpbmcNCj4gPiB0aGUgZGVidWdmcw0KPiA+ICsgKiBlbnRyaWVzLg0KPiA+ICsgKi8NCj4g
PiArc3RhdGljIGludCBzb2ZfaXBjX3Rlc3RfcHJvYmUoc3RydWN0IGFuY2lsbGFyeV9kZXZpY2Ug
KmFuY2lsZGV2LA0KPiA+ICsJCQkgICAgICBjb25zdCBzdHJ1Y3QgYW5jaWxsYXJ5X2RldmljZV9p
ZCAqaWQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBzb2ZfY2xpZW50X2RldiAqY2RldiA9DQo+ID4g
YW5jaWxsYXJ5X2Rldl90b19zb2ZfY2xpZW50X2RldihhbmNpbGRldik7DQo+ID4gKwlzdHJ1Y3Qg
c29mX2lwY19jbGllbnRfZGF0YSAqaXBjX2NsaWVudF9kYXRhOw0KPiA+ICsNCj4gPiArCS8qDQo+
ID4gKwkgKiBUaGUgYW5jaWxsYXJ5IGRldmljZSBoYXMgYSB1c2FnZSBjb3VudCBvZiAwIGV2ZW4g
YmVmb3JlDQo+ID4gcnVudGltZSBQTQ0KPiA+ICsJICogaXMgZW5hYmxlZC4gU28sIGluY3JlbWVu
dCB0aGUgdXNhZ2UgY291bnQgdG8gbGV0IHRoZSBkZXZpY2UNCj4gPiArCSAqIHN1c3BlbmQgYWZ0
ZXIgcHJvYmUgaXMgY29tcGxldGUuDQo+ID4gKwkgKi8NCj4gPiArCXBtX3J1bnRpbWVfZ2V0X25v
cmVzdW1lKCZhbmNpbGRldi0+ZGV2KTsNCj4gPiArDQo+ID4gKwkvKiBhbGxvY2F0ZSBtZW1vcnkg
Zm9yIGNsaWVudCBkYXRhICovDQo+ID4gKwlpcGNfY2xpZW50X2RhdGEgPSBkZXZtX2t6YWxsb2Mo
JmFuY2lsZGV2LT5kZXYsDQo+ID4gc2l6ZW9mKCppcGNfY2xpZW50X2RhdGEpLCBHRlBfS0VSTkVM
KTsNCj4gPiArCWlmICghaXBjX2NsaWVudF9kYXRhKQ0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0K
PiA+ICsNCj4gPiArCWlwY19jbGllbnRfZGF0YS0+YnVmID0gZGV2bV9remFsbG9jKCZhbmNpbGRl
di0+ZGV2LA0KPiA+IElQQ19GTE9PRF9URVNUX1JFU1VMVF9MRU4sIEdGUF9LRVJORUwpOw0KPiA+
ICsJaWYgKCFpcGNfY2xpZW50X2RhdGEtPmJ1ZikNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4g
PiArDQo+ID4gKwljZGV2LT5kYXRhID0gaXBjX2NsaWVudF9kYXRhOw0KPiA+ICsNCj4gPiArCS8q
IGNyZWF0ZSBkZWJ1Z2ZzIHJvb3QgZm9sZGVyIHdpdGggZGV2aWNlIG5hbWUgdW5kZXIgcGFyZW50
IFNPRg0KPiA+IGRpciAqLw0KPiA+ICsJaXBjX2NsaWVudF9kYXRhLT5kZnNfcm9vdCA9DQo+ID4g
ZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKCZhbmNpbGRldi0+ZGV2KSwNCj4gPiArCQkJCQkJ
ICAgICAgIHNvZl9jbGllbnRfZ2V0X2QNCj4gPiBlYnVnZnNfcm9vdChjZGV2KSk7DQo+ID4gKw0K
PiA+ICsJLyogY3JlYXRlIHJlYWQtd3JpdGUgaXBjX2Zsb29kX2NvdW50IGRlYnVnZnMgZW50cnkg
Ki8NCj4gPiArCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImlwY19mbG9vZF9jb3VudCIsIDA2NDQsIGlw
Y19jbGllbnRfZGF0YS0NCj4gPiA+ZGZzX3Jvb3QsDQo+ID4gKwkJCSAgICBjZGV2LCAmc29mX2lw
Y19kZnNfZm9wcyk7DQo+ID4gKw0KPiA+ICsJLyogY3JlYXRlIHJlYWQtd3JpdGUgaXBjX2Zsb29k
X2R1cmF0aW9uX21zIGRlYnVnZnMgZW50cnkgKi8NCj4gPiArCWRlYnVnZnNfY3JlYXRlX2ZpbGUo
ImlwY19mbG9vZF9kdXJhdGlvbl9tcyIsIDA2NDQsDQo+ID4gaXBjX2NsaWVudF9kYXRhLT5kZnNf
cm9vdCwNCj4gPiArCQkJICAgIGNkZXYsICZzb2ZfaXBjX2Rmc19mb3BzKTsNCj4gDQo+IFRoZXNl
IGRlYnVnZnMgZmlsZXMgYXJlIG5ldmVyIHJlbW92ZWQsIHdoeSBub3Q/DQpMb29rcyBsaWtlIGEg
bWlzcy4gV2lsbCBmaXguDQoNClRoYW5rcywNClJhbmphbmkNCg==
