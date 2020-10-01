Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAE280441
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A751948;
	Thu,  1 Oct 2020 18:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A751948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601571010;
	bh=oEc3PMsF3a0FmiDHgn8GLbyXdhvObp6kX9CoV6YOWU4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOPzyEvUJymdyNIUyN/2CPE1T2Zno9hK6EzRUzqcOs98x7ZmIiTjFBk1m/Whd/H61
	 HSHxah87bY/K9FsJFilEMZKaQ3bmdfVIXnYt44Td9FXW9isoSxDBYJul2KClYNGHBv
	 YhE+NjS+1hczy6/7l0Cv9thiNvDTN+bpN60M2rlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F92FF8022D;
	Thu,  1 Oct 2020 18:49:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA1DF80273; Thu,  1 Oct 2020 18:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BC8EF801DB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC8EF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="rTnbfvYJ"
IronPort-SDR: El2veBvpDcqM9b8u9HgtBOSxdN8aifdKSYjN6Oi4vTFlaE17PtvGTKinEqZj98ZkNUKgl65UPm
 WHqiJ2wd1BAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="226897631"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="226897631"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:48:54 -0700
IronPort-SDR: St9MFb0xqO0StP6c1BRIhV8oMUld92wO2eFL8wysJK7nYPWM1yCKlOFaL1ah7+bOjkujwdh7da
 OUJTzvlWqfDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="514802373"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 01 Oct 2020 09:48:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:48:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 09:48:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 09:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=do4WN6YNmCrzWQ9zSbPqevndTjrmLsIWfBxXUUp+vHsS7x58VZtpjryiNNYVJraDP2Z40e4TyEs+ygvbpyDSwWLsh4IIndR6CGm6fq6AkKi+BQtjEy3QcR7P+kYtiyBPeZz6M40m70CSFQd1gUY3eBwzuHPirEqlqKJzcm6Bh140+sUBcFbL4yLVjQEOZp8pUNeZFWiGDxS0sot5VMuEbBczrfULtxl85hO9l/eeV2gy2qq4z9L91IzDjDSMqoB5BaleYm4ns/9W75v8WeWLnfc4bY5S2fw8VxNcvOljeLczYZpVj7TM80UqskQCYtDUtPV5MhDxufJvppLxdAICVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEc3PMsF3a0FmiDHgn8GLbyXdhvObp6kX9CoV6YOWU4=;
 b=FdgocCqS6SezmaX7jzcB9IQkG6Ixvj1fj7YUOO59HAAYoFMq6VEbnwx7Muh0Xx/W98yqWsuudRS+XAlGcR6y0vg2md0wDxoqaVQh21jW1ZjhKkST7HjJYS3TPg0ph6Xz47eyQ8JXzRTijw66rMcM88jkcPYH1InT6PJnWQt1su5+PtWZyWWV3SqnNpT6woWqS/EAMtXDXABDsG6RMT3d6okPmrgEPhbfR7SjjOI8qnUm/S8+C4hG91gEaNc1JLIzpkd1eS8WVUJ18HZSu1fPnzO/JvdeAc6DAYjC8ajmnAFIs4DnfjRNd5xkWqMeJFnMNQ6IHgR/n9O/NwgofBlHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEc3PMsF3a0FmiDHgn8GLbyXdhvObp6kX9CoV6YOWU4=;
 b=rTnbfvYJK9j3+lk5mpA9oSkHafeiIyfIetHBgbWmGlT3nHQ2R1qBhW/CHoTmaNTiC9zayVSJWaIibgJXstbIeOJJzKW5tCpNHh0E3RTfoVgk/QCJi4OOmk3X/Y74yx6NkV3SwoOdBxElFfMmCFaDNPenAOZeE0mVl3HvALtg5zA=
Received: from BL0PR11MB2899.namprd11.prod.outlook.com (2603:10b6:208:7b::21)
 by MN2PR11MB4271.namprd11.prod.outlook.com (2603:10b6:208:188::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 16:48:45 +0000
Received: from BL0PR11MB2899.namprd11.prod.outlook.com
 ([fe80::85d1:1545:621b:8200]) by BL0PR11MB2899.namprd11.prod.outlook.com
 ([fe80::85d1:1545:621b:8200%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 16:48:44 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "Ertman, David M" <david.m.ertman@intel.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Topic: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Index: AQHWl3xDvKWSWQdJ60eB+Xz3B/EyS6mCwVEAgAA1J4A=
Date: Thu, 1 Oct 2020 16:48:44 +0000
Message-ID: <dc4f4ade14ba49be8059c59407ec41283f14ba09.camel@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
 <20201001133828.GH6715@sirena.org.uk>
In-Reply-To: <20201001133828.GH6715@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.151.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e742b156-bc16-41d3-d4f0-08d86629dc5a
x-ms-traffictypediagnostic: MN2PR11MB4271:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB4271F98529066257796AA07CE8300@MN2PR11MB4271.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kxdc7NLgGO1CnuiRiEhIub8PhFHue8wvYePZlcqgnahuqe/XiN5l1QCnChNTm9SD4DCaZtp+D3na/frULnhH+EVzhw9WLtsAt8VGXmwenK3TDbobZjUgVJRQr7+duEBxjrJ+7HbXGktAiIN3OS0ty9+eR+x4mVjCOJKBN5YO1ZVleobRsJ9SwsMBUE94DrZCkqxW2asdwjVLzNLAyxEQzxx9MzD5XiQMEiE0kWD4QnltgipkLHuX8MVZIVxUlpRCmULFGV6jVIvqKrVCT7ucsh2gaUTqD6ed4ondACdNL7R3/0RbYIbyka/Ak/kyXbNa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2899.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(54906003)(4326008)(66476007)(71200400001)(478600001)(86362001)(186003)(2906002)(66446008)(110136005)(64756008)(66556008)(66946007)(316002)(76116006)(91956017)(6512007)(8676002)(26005)(4744005)(2616005)(6486002)(8936002)(36756003)(6506007)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0m3qw7JP+eEePKcbcl8peG1mF8bHvO7reJulH3eQC5lvWoA5lZsZZPKSJ8rq24+N/OsBOTwt7E/FvFE1dkYojGWKQKHoFZKrxbREU4NWmhbcQyeyMGmlEkbaiSA68u+25Oq7lIWtdE4eyJhmxzECszEy3rIZTeYZ/s57fM7KdPJ6pmFIUK/Uicl9fLf74g/Nb+YinrlD1QAuVBViN+F1d5lEwRDLwfMmc9KhW4Om4+i7pqMPcYLOvtHeO8O47a1gvu03ZXKyXa0QJXQRRqK5c+WmqnRnYQqtjGmPfxbJhdB+A/Bk+pu0hFZbJssNL9KtN3VEjXRheZer31ba+WKOzKs4odJNqjafQuo7F5uAoFsMfqa5WNghhPq5eylL+tlJ2NOnoKEfyqor1FUSnDLS+Sx3mIexQbLeggRzNCfWwVJU/KgcaG0iWX7gNPZv8JIhpOXLXLkvu/MPLOwERk1fLdK+8reQqxyoXhbbzV6Gv1gsr+fME+TP3Nd3zR/M/Pah2nZqQfWXZaSk0eb7VMH2UNtYORYskKaemqII6lYvE0c4VFn1mTq+FDwnSb7cwXOVP6Hb8+10a4rHGB5lQHWALu9251THSgP/eP2GZ8H0Ey6mbFKMeSMR32o7senQsiFcNP7lPBI7KJhTS8zkRAv1+g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <881BDCFD3047AD43A3EE79D0BABB7450@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e742b156-bc16-41d3-d4f0-08d86629dc5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 16:48:44.8078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yd2UOqb0L3G4zl0HJfBW9aVY4/O1kMcVa9p6KghscFRmkDuy1LTq76N8oh/4LwV8xCLcWemYr4tZZqnJWNG8tg8sPXD3w1SB43V9mhZZ2dE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4271
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
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

T24gVGh1LCAyMDIwLTEwLTAxIGF0IDE0OjM4ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIFNlcCAzMCwgMjAyMCBhdCAwMzo1MDo0N1BNIC0wNzAwLCBEYXZlIEVydG1hbiB3cm90
ZToNCj4gDQo+ID4gKwlyZXQgPSBhbmNpbGxhcnlfZGV2aWNlX2luaXRpYWxpemUoYW5jaWxkZXYp
Ow0KPiA+ICsJaWYgKHJldCA8IDApIHsNCj4gPiArCQlkZXZfZXJyKHNkZXYtPmRldiwgImVycm9y
OiBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBjbGllbnQNCj4gPiBkZXYgJXNcbiIsIG5hbWUpOw0KPiA+
ICsJCWlkYV9zaW1wbGVfcmVtb3ZlKGNsaWVudF9pZGEsIGFuY2lsZGV2LT5pZCk7DQo+ID4gKwkJ
Z290byBlcnJfZnJlZTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gY2RldjsNCj4gPiAr
DQo+ID4gK2Vycl9mcmVlOg0KPiA+ICsJa2ZyZWUoY2Rldik7DQo+IA0KPiBJdCB3b3VsZCBiZSBu
aWNlIHRvIGhhdmUgdGhlIGlkYV9zaW1wbGVfcmVtb3ZlKCkgZG9uZSBpbiB0aGlzIHVud2luZA0K
PiBzZWN0aW9uIGhlcmUgdG9vIGZvciBjb25zaXN0ZW5jeS4NCmFjaw0KPiANCj4gPiAraW50IHNv
Zl9jbGllbnRfZGV2X3JlZ2lzdGVyKHN0cnVjdCBzbmRfc29mX2RldiAqc2RldiwgY29uc3QgY2hh
cg0KPiA+ICpuYW1lLCBzdHJ1Y3QgaWRhICpjbGllbnRfaWRhKQ0KPiA+ICt7DQo+IA0KPiBJIGtu
b3cgdGhlIGhhcmQgbGltaXQgb24gbGluZSBsZW5ndGggZ290IHJhaXNlZCBidXQgY2FuIHdlIHdy
YXAgdGhpcw0KPiBwbGVhc2U/DQphY2suDQoNClRoYW5rcyxSYW5qYW5pDQo=
