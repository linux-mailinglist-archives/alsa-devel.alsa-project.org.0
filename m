Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEAB1CD89F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 13:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B87D31655;
	Mon, 11 May 2020 13:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B87D31655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589197008;
	bh=KE/I/urNjRH2sYMp2lJSM+bYqxJSlaJppq5FhudbgV0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OMtjXwFLzprRkMo46Z4Vj97vlq/GcOXDl8BrMiHu66BiRqN62ymy0qVYDPB7lI8mu
	 tSv+exZWijnzQoAKiy5ci+UYn4iQjsR1Gr0h6zN06OefTN+tr20/6a2qOyYeZuptBK
	 mOouHKYqKkyeNWPGfwTX/F9K2obS8Q4DAO4zHwQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8EDFF80107;
	Mon, 11 May 2020 13:34:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38128F80254; Mon, 11 May 2020 13:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0CFF80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 13:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0CFF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Aufiv6Ep"
IronPort-SDR: d/rn1qaTKCHV75Pi/Y0gCmCaoFDCMDyC3Z/Ajteacp2u8J7oHXbzBeFZy+mKkpbVlYDmUFzShe
 ZWhAFQECrPkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 04:34:40 -0700
IronPort-SDR: LkuwUuohHKDq8FHNy8Q76JO6stHuSghqqpaG7CBGWaNLnKndQ9WCLIoDf11wS36UfDYfS6z3q4
 NL6xIwvA7Jkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; d="scan'208";a="408892919"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 11 May 2020 04:34:40 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 04:34:39 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 04:34:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 11 May 2020 04:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8pw7sNfgc0r8NmuKkyU55FtcYUoET76wW5l6F8+Ki7ThJVVOWdvZ/7icPibLZP0C13nl5Urd829eSSDa+yl7AzjRR/SvFPtdfv8NU4WB9rEpYHn5d5ZtMIN3vJUW65TUMo1bFCvPZ70f00fnv+jpvXLoMie38SiL0tK9+8WN2nl/NddWRdUJ/naAEZFU+sMpQWtHfSBWcNLdrJ6lCW0woFWfsdbtc+vFK9qsN8l4hjSizQrKBRUNVWPkzvw+9K6l5Mzfx9XxjZtaCXv8/BFzzC5dcl553rnKj/y7pVE9z8RCFAzV4jE7Mvhp34rOpe0QceTIc92oaNZ3i0lKI3bpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE/I/urNjRH2sYMp2lJSM+bYqxJSlaJppq5FhudbgV0=;
 b=aa2qIQF+S6tbOQoaXDWPbfqBpipyxlN26denTErAVV0zSrrDKj+c9AfV71YzcleJ8BwAsHqXuocspADmASxe05o2kUKQ5Cl+O1v9BEDtmlhoOr82HOZ/5vS/DYDyIak1ox/PPSk2nauaKJf51B8M/VUxZku8D+gx02ouRThleg7+9Q8TXFSearvS1MR5tKyG1ZrteduyniJJmNpHnXKhJNTwzFdtdFSLdaX3LXAXV2NVJro/v6j7fq8zuoXkWHLfaPmjJyvpT+jR/O4wk645gqW9PNyvpi15W8sznmisuYZnzEP5Zr48EQJaa9pDTQ7rtiXcvuPLVhESZJMTQ5EhRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE/I/urNjRH2sYMp2lJSM+bYqxJSlaJppq5FhudbgV0=;
 b=Aufiv6Ep6NxWi7wK4/kVCZhtPbiRWBL9U0zU9LwCAyyqGgbS/pp6+nDOZRh+w1eff+pWO3zC5dks86OQrYL4IkbrA4Z1Z+9vXC5Z2MOzDiq+eCLvWa2qjvVaKhSUySy3j0XblupPuzOc4LzXWOLnZu8+jczIyZAP8Hj9DO78my4=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3066.namprd11.prod.outlook.com (2603:10b6:5:64::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.30; Mon, 11 May 2020 11:34:38 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::6921:e03e:b890:fd53]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::6921:e03e:b890:fd53%7]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 11:34:38 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: RE: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Thread-Topic: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Thread-Index: AQHWHrsvVp1w6XL6HkWXivkwcq57E6iifmqAgAAQ+dCAABhEgIAAIVWA
Date: Mon, 11 May 2020 11:34:38 +0000
Message-ID: <DM6PR11MB407432225D0DA6E671DBAF67FFA10@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
 <DM6PR11MB40748EA6346831A67BD218C7FFA10@DM6PR11MB4074.namprd11.prod.outlook.com>
 <20200511090003.GT1375924@vkoul-mobl>
In-Reply-To: <20200511090003.GT1375924@vkoul-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.193]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78112712-fb65-49b1-cffd-08d7f59f49f4
x-ms-traffictypediagnostic: DM6PR11MB3066:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB30666D880B23AE717FC19D24FFA10@DM6PR11MB3066.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: scB5UtcxJjrgnEwkIKEhYzgFeTyCUhXaE9+2b9h8foPwQMoAqO7wI9H62RmkDDD65fOEg7n62UVVU2OtxFnmVpFo0nm2Xqm4CXWk8b6m7Z38OJwYU24ejk/y0gNTPZkI27N8Pp6oJ3tt/2FoEu84jC2mufnbRommE7ZSwv5Ho1dKcV6NCRMV4IyMU7IvBT2RHgEw/JnJLo2xF6r4/Jpe1Cj45XsbAsfDJKPiNyE5bKmfHd/+/K+Uw7QT7L3ipAbXw4ePOdiil/OTekS0SNLmK9NuTHsgOq8actLzgWSzosDEwnbVGQ+H5CZgJddascAiibl3KottMC61o+eI9se8Uj8qaS8Nwv7UyE9fvkzzEFyLfaO6uoOOzqcMhEzKipPv7jedcAAwv6xe18zsLs1LJXPcndP11Q2d5i8j2hk9B9vXxmYIzz/UEgOsP9HaYDELmiNjj7BOcd0N4FGrcDK+VzTN+3gKZOKe1/kmJZ0J8j8jjq/1UKiBXN4gW8T8+0Cd5tc8m/CL44250rgJFW3QMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(346002)(396003)(136003)(376002)(33430700001)(7696005)(53546011)(6506007)(55016002)(71200400001)(66946007)(66476007)(66446008)(64756008)(478600001)(6916009)(66556008)(26005)(8676002)(4326008)(5660300002)(33656002)(7416002)(186003)(9686003)(8936002)(54906003)(33440700001)(316002)(52536014)(86362001)(2906002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9aSGFO2XGOM5Z68SVQBw8Uep9JXX5rMAss22vkq1cOUbpoPhkVolMyc2aJkO8Nw6gy5zZQCMwtM6byv2u+jJ564S8AEJd3qdl8/oGEE/xo+AnJo1RygZyXsdozU0o/EowDmAWvr84MawIVD8PLoXNTBCjAXnfd0lz0i+ZxjJ+Mu1q7baWMJO+4Oom8ZS7gxrvphy+lQrlbuDHhFfWGJo20WE8PJolVxZbFJ04lSEJDY9tLG+jhRqMpxJTi4okGqm6KM7RyC2fXTdwuhsom0aTUQMvlLPwz2OGCSagXQ6RDRAfXRnwJvXR5lCuHRbcFoZbahzJnBFMoo2gLlLd3hdYhMgOHKPwAnzZCz6v7uTIxZ2f0lsy1ca5Lj/sTNL7anhT+ZeKKDxoH/pTRtn26FNeTP1sr2mdy6c1b7Uh/UKiH0+HvAjfXzdv+la5lTRzGuwMoymCimzRa0gGLL/arPtMtIiSAP71UK65cJHPXgusgE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78112712-fb65-49b1-cffd-08d7f59f49f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 11:34:38.4091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjZmLSZi7UbuN2YPEIyg6uCGay3b9RbbURc8Ad/hWnSGoSiWKLaOt3i7YVg0H3tCwDjXXhVtaQk5dwJU0Watsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3066
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Blauciak,
 Slawomir" <slawomir.blauciak@intel.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmlub2QgS291bCA8dmtv
dWxAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBNYXkgMTEsIDIwMjAgNTowMCBQTQ0KPiBU
bzogTGlhbywgQmFyZCA8YmFyZC5saWFvQGludGVsLmNvbT4NCj4gQ2M6IEJhcmQgTGlhbyA8eXVu
Zy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgdGl3YWlAc3VzZS5kZTsgYnJvb25p
ZUBrZXJuZWwub3JnOw0KPiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgamFua0BjYWRlbmNl
LmNvbTsNCj4gc3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnOyByYW5kZXIud2FuZ0BsaW51
eC5pbnRlbC5jb207DQo+IHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbTsgaHVpLndh
bmdAY2Fub25pY2FsLmNvbTsgcGllcnJlLQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNv
bTsgS2FsZSwgU2FueW9nIFIgPHNhbnlvZy5yLmthbGVAaW50ZWwuY29tPjsNCj4gQmxhdWNpYWss
IFNsYXdvbWlyIDxzbGF3b21pci5ibGF1Y2lha0BpbnRlbC5jb20+OyBMaW4sIE1lbmdkb25nDQo+
IDxtZW5nZG9uZy5saW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gc291
bmR3aXJlOiBidXNfdHlwZTogYWRkIHNkd19tYXN0ZXJfZGV2aWNlIHN1cHBvcnQNCj4gDQo+IE9u
IDExLTA1LTIwLCAwODowNCwgTGlhbywgQmFyZCB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPg0K
PiA+ID4gU2VudDogTW9uZGF5LCBNYXkgMTEsIDIwMjAgMjozMiBQTQ0KPiA+ID4gVG86IEJhcmQg
TGlhbyA8eXVuZy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IENjOiBhbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4g
PiB0aXdhaUBzdXNlLmRlOyBicm9vbmllQGtlcm5lbC5vcmc7IGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnOw0KPiA+ID4gamFua0BjYWRlbmNlLmNvbTsgc3Jpbml2YXMua2FuZGFnYXRsYUBsaW5h
cm8ub3JnOw0KPiA+ID4gcmFuZGVyLndhbmdAbGludXguaW50ZWwuY29tOyByYW5qYW5pLnNyaWRo
YXJhbkBsaW51eC5pbnRlbC5jb207DQo+ID4gPiBodWkud2FuZ0BjYW5vbmljYWwuY29tOyBwaWVy
cmUtIGxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyBLYWxlLA0KPiA+ID4gU2FueW9nIFIg
PHNhbnlvZy5yLmthbGVAaW50ZWwuY29tPjsgQmxhdWNpYWssIFNsYXdvbWlyDQo+ID4gPiA8c2xh
d29taXIuYmxhdWNpYWtAaW50ZWwuY29tPjsgTGluLCBNZW5nZG9uZw0KPiA+ID4gPG1lbmdkb25n
LmxpbkBpbnRlbC5jb20+OyBMaWFvLCBCYXJkIDxiYXJkLmxpYW9AaW50ZWwuY29tPg0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIHNvdW5kd2lyZTogYnVzX3R5cGU6IGFkZCBzZHdfbWFz
dGVyX2RldmljZQ0KPiA+ID4gc3VwcG9ydA0KPiA+ID4NCj4gPiA+IE9uIDMwLTA0LTIwLCAwMjo1
MSwgQmFyZCBMaWFvIHdyb3RlOg0KPiA+ID4gPiBAQCAtMjQsOSArMjQsMTQgQEAgaW50IHNkd19i
dXNfbWFzdGVyX2FkZChzdHJ1Y3Qgc2R3X2J1cyAqYnVzLA0KPiA+ID4gPiBzdHJ1Y3QNCj4gPiA+
IGRldmljZSAqcGFyZW50LA0KPiA+ID4gPiAgCXN0cnVjdCBzZHdfbWFzdGVyX3Byb3AgKnByb3Ag
PSBOVUxMOw0KPiA+ID4gPiAgCWludCByZXQ7DQo+ID4gPiA+DQo+ID4gPiA+IC0JaWYgKCFidXMt
PmRldikgew0KPiA+ID4gPiAtCQlwcl9lcnIoIlNvdW5kV2lyZSBidXMgaGFzIG5vIGRldmljZVxu
Iik7DQo+ID4gPiA+IC0JCXJldHVybiAtRU5PREVWOw0KPiA+ID4NCj4gPiA+IFRoaXMgY2hlY2sg
aXMgcmVtb3ZlZCBhbmQgbm90IG1vdmVkIGludG8gc2R3X21hc3Rlcl9kZXZpY2VfYWRkKCkNCj4g
PiA+IGVpdGhlciwgY2FuIHlvdSBhZGQgaGVyZSBvciBpbiBwYXRjaCAxIGFuZCBrZWVwIGNoZWNr
aW5nIHRoZSBwYXJlbnQNCj4gPiA+IGRldmljZSBwbGVhc2UNCj4gPg0KPiA+IFdlIHdpbGwgc2V0
IGJ1cy0+ZGV2ID0gJm1kLT5kZXYgaW4gdGhlIGVuZCBvZiBzZHdfbWFzdGVyX2RldmljZV9hZGQo
KS4NCj4gDQo+IFdlIG5lZWQgdG8gdGVzdCBpZiB0aGlzIGlzIHZhbGlkIG9yIG5vdCA6KQ0KPiAN
Cj4gPiBUaGF0J3Mgd2h5IHdlIHJlbW92ZSB0aGUgdGVzdC4gQnV0IG5vdyBJIGFtIHdhbmRlcmlu
ZyBkb2VzIGl0IG1ha2UNCj4gPiBzZW5zZSB0byBzZXQgYnVzLT5kZXYgPSAmbWQtPmRldj8gTWF5
YmUgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBzZXQNCj4gPiBidXMtPmRldiA9IHNkdyBjb250cm9s
IGRldmljZS4NCj4gPiBBIGZvbGxvdyB1cCBxdWVzdGlvbiBpcyB0aGF0IHNob3VsZCBzbGF2ZSBk
ZXZpY2UgYSBjaGlsZCBvZiBidXMgZGV2aWNlDQo+ID4gb3IgbWFzdGVyIGRldmljZT8gSSB3b3Vs
ZCBwcmVmZXIgYnVzIGRldmljZSBpZiBpdCBtYWtlcyBzZW5zZS4NCj4gPiBJIHdpbGwgY2hlY2sg
YnVzLT5kZXYgYW5kIHBhcmVudCBhbmQgcmVtb3ZlIGJ1cy0+ZGV2ID0gJm1kLT5kZXYgaW4gdGhl
DQo+ID4gbmV4dCB2ZXJzaW9uLg0KPiANCj4gdGhlIHBhcmVudCBpcyBidXMtPmRldiBhbmQgc2R3
X21hc3Rlcl9kZXZpY2UgY3JlYXRlZCB3b3VsZCBiZSBjaGlsZCBvZiB0aGlzDQo+IGFuZCBzaG91
bGQgYmUgc2V0IGFzIHN1Y2guIFlvdSBjYW4gcmVtb3ZlIGl0IGZyb20gYnVzIG9iamVjdCBhbmQg
a2VlcCBpbg0KPiBzZHdfbWFzdGVyX2RldmljZSBvYmplY3QsIHRoYXQgaXMgZmluZSBieSBtZS4N
Cg0KTG9va3MgbGlrZSB3ZSBkb24ndCBuZWVkIHRoZSBwYXJlbnQgYW5kIGZ3bm9kZSBwYXJhbWV0
ZXIgc2luY2Ugd2UgY2FuDQpnZXQgdGhlbSBmcm9tIGJ1cy0+ZGV2IPCfmIoNCg0KPiANCj4gVGhl
IHNkd19zbGF2ZSBpcyBjaGlsZCBvZiBzZHdfbWFzdGVyX2RldmljZSBub3cgYW5kIGxvb2tzIHRv
IGJlIHNldCBjb3JyZWN0Lg0KDQpTbywgaXQgd2lsbCBiZQ0KYnVzIGRldmljZQ0KICAgIC0+IG1h
c3RlciBkZXZpY2UNCiAgICAgICAgIC0+IHNsYXZlIGRldmljZQ0KcmlnaHQ/DQoNCkkgaGF2ZSBh
IHF1ZXN0aW9uIGhlcmUuIFdlIGhhdmUgcG0gc3VwcG9ydGVkIG9uIGJ1cyBhbmQgc2xhdmUgZGV2
aWNlcywNCmJ1dCBub3QgbWFzdGVyIGRldmljZS4gV2lsbCBwbSB3b3JrIHdpdGggdGhpcyBhcmNo
aXRlY3R1cmU/DQpDYW4gaXQgYmUNCmJ1cyBkZXZpY2UNCiAgICAtPiBtYXN0ZXIgZGV2aWNlICYg
c2xhdmUgZGV2aWNlPw0KDQoNCj4gDQo+IC0tDQo+IH5WaW5vZA0K
