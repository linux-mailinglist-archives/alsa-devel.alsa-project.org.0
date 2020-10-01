Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 208AD28043F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD729192F;
	Thu,  1 Oct 2020 18:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD729192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601570979;
	bh=zQwA9zmzq8CXa9kNY7D12dkSR/ZGWrclagPeK5GqgIE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1001sM7EDTWAQaxvIsOkQcL5RxAsAC+C7UEJ2fVErDqT4tR8+EDzmzQlk5ZDr0BV
	 FiSsA/lmGmZD3UZ97AxXx2IFZnDiRBcwULbojzx43boNZ+xuENk5OoBRfv7R/C/dtF
	 xc75qva4oAkRzRPXZLAhSd/R16EFswC5tymyjvZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2EE2F801F5;
	Thu,  1 Oct 2020 18:48:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BE9BF8022B; Thu,  1 Oct 2020 18:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7723DF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7723DF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="YkT1sb1C"
IronPort-SDR: mffqwmQ2hODs86cBTDdNG+Lp5YQ6ZFPMrGQb5OFfumRBZRv68r84WOPzs5xUBnPy8QswYzYByj
 3++zV4brNSoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="142179792"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="142179792"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:48:11 -0700
IronPort-SDR: MpeAOHu9kfj0poVTgdpJQ8RqY61/I7IF3yPGq6+05wFJdsaPjRyfCNkjURJREz/zPbRaDDrpCD
 n5XlCU6hwBXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="313117477"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 01 Oct 2020 09:48:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:48:10 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:48:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 09:48:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 09:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ru0I4RpJxcjxRxQEISMJZ+nCTxiiDLFsBpWZ9PjTjg8BDCeF11cVDKLZmJ3PdWsuHIsvc0Drw614wh6WuzV9mm23+ZCKbhjw/HI9mue4Wk8ejaZU4T0YDnIL+IgIwt4n+2Za3D0APa8HjaP1DxKCAwuLYaqYe8DCESVAYgiryDc+5Io52XTn6voXTEK86bjZzpuBGXLhHRNL92iOQGdaMH46xbuFSnauwpk55odzVhIwBDXpCuhrM6t49hkpcWTIbwjkbYmkY5KEsvtH9IwR7HsAW7V0F9asXLpz5hm0zQAOK7fcWrTC0WbWsDgv3GTuF+M9fkWMR/cv5SgCEFyRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQwA9zmzq8CXa9kNY7D12dkSR/ZGWrclagPeK5GqgIE=;
 b=GH//JsXjNI3LesmQdRSobKpyOM0Psy7XlKnE/ZYxY0PUhNlc9aFMmtrrlppT0IneS0wCnyOUvlevcVPdHu/N83qIweAGNhugwOuSTO6WOPFCOkORhjZzgkpoQfeCyTnWrp67itR372j7i3BhgyN7PGO6Kkg/Jth3eaUnHTNTmYzku6AL8DbSA8vsGCIPtsWC3afwWjKAXi/OIY4TyFwqHaU7lr6TfvqDTipigWTEyZsXdOLfJHxuLkXC698BEWGleIfYsvJvVyDBcJmBM8LUlLCTXa7kzEoTWD+6UVYQHvoQTUPVcdSgid66cW2DyQ9fPMbIlLlxpgUz8ORbMEXXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQwA9zmzq8CXa9kNY7D12dkSR/ZGWrclagPeK5GqgIE=;
 b=YkT1sb1CTj2i838EFCByJnRh8oy6fgly+Y0yVNeE5ITQ2oLAUR8zhTBIdQ52r9SbGch3CRxhRYN6IBcBAzT6/80Yx8fs9nlj8+WLhSl7sgl2TBqbEp2r/7rP6alIjUeAzKa23CaLXeEhjXf3PiXu+8zKRRFHQos6QDI7F5cEWFE=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB3756.namprd11.prod.outlook.com (2603:10b6:5:136::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Thu, 1 Oct 2020 16:48:02 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 16:48:02 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Thread-Topic: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Thread-Index: AQHWl3zYlodSEYMeTUmqcrTNr7ttCqmCuRyAgAAM9YCAAC7PcA==
Date: Thu, 1 Oct 2020 16:48:01 +0000
Message-ID: <DM6PR11MB28412DAE6EA76BF544438FE1DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-4-david.m.ertman@intel.com>
 <20201001130907.GD2378679@kroah.com>
 <537015d3-6113-76ae-feda-fba0ad3d54e9@linux.intel.com>
In-Reply-To: <537015d3-6113-76ae-feda-fba0ad3d54e9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df2be0bb-0f96-4eeb-befc-08d86629c2f8
x-ms-traffictypediagnostic: DM6PR11MB3756:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3756F9784951D85FC471CA98DD300@DM6PR11MB3756.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mD4vy4Jx4iGMpA74Rz3PNt/lj1ltNhZJugjmJfOVKvq/nJHOi+smtPH11sodpwCEcEjB/+5bvNM7Og9DGYa6yCwx9T4Rlw7wgyNybKsDXWUkmuEp6gb0Ok76D9DHyqR1ZAhvXf2idVVrKMHgX5/x/VPaXmPgQFdIBI83glUqGKp6nR5Fb3NlDVn5IghkPJfgxtqpdo+ngLlnlB8DqJ5plihjj6cHczpkVeF5MmEe8sLSJhUTtBHwjIy+IX1nXRujVjb6PMY0sSoBdEU1/L1ogry9K6tQ7tW383DTFYc5wGM0uCxAuZh2LRQRHwo9DoncnseshXoIsmSM9SG669cZng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(54906003)(66446008)(64756008)(19627235002)(66946007)(9686003)(8676002)(76116006)(66556008)(86362001)(2906002)(55016002)(186003)(66476007)(71200400001)(110136005)(26005)(316002)(6506007)(7696005)(83380400001)(5660300002)(4326008)(8936002)(478600001)(52536014)(53546011)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: E500LGLF3yQyldZrRAG7uUFyKxTFPJlw1F56fhF4Q/6gqprrzj8dStbDG8eoIZF5+RalEsMHLyPh2cUVCFoI+ShZABXnGzmKUV3g00gSDTuQ7uDfQTksdZJza2IvVyEZtBo/fZfJ/oB9lXkZ1EWPK1fuB9D5XWSAy3qANZSJWzTsL1uAnj0tItvbC4/iIhnDiBeoUuqyxX3GDFzTNePpAt9Jj+/7dIzZsTarZLXsYu69rZPHCpXAd8GlAtEimCGy1fD6aKtf7yBgAmA/w7StQbpxraMB2UWA/XdKlmZEA0ZXroAu2fvMUYMbHufEImhjc8jaxg4iOXl0pHZ/TeMwL+1cUkLbSVnlrKJhWOnhJSAaBRAohXRnXmNyEAG9kvp8Tl6cYL5uQhgR2htY7+xqq41Fd0cKRwTyKx6023JyzgokVBepKAB4FlF9SW2T5KFNnmr6u3S8zaL3VIlF+anY1wJYnZYwVdppBmtUYRirwht7nILc+ZMfVkYmvT4xiHqSyUW+4nnCncxT4/3SecC/Yz1RgSAl7y55jihSajfyMdqgDnriCqx1Heeqr3Ykz6Qm2rbMWZd52LOf1WooPgNldhw5N+PsyYsZJOvZyozNGcYWvLbqzqRrRb6rrXiGozuHVMkPA0f3OT/Uo81s4Wr1Bg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2be0bb-0f96-4eeb-befc-08d86629c2f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 16:48:02.0850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JooVvYQvXH0PeMHaZzI2cJi3GodK4ObMiU1N7NA7c/XvGk25QMtoSAG2dxIjhiPsKlYBoNPKh65maZJKJBRGWB7ptGmFIO1F1N98Nxxasu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3756
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2Fy
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAxLCAyMDIwIDY6NTUgQU0NCj4gVG86IEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPjsgRXJ0bWFuLCBEYXZpZCBNDQo+IDxkYXZpZC5tLmVydG1hbkBpbnRlbC5j
b20+DQo+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IHRpd2FpQHN1c2UuZGU7IGJy
b29uaWVAa2VybmVsLm9yZzsNCj4gU3JpZGhhcmFuLCBSYW5qYW5pIDxyYW5qYW5pLnNyaWRoYXJh
bkBpbnRlbC5jb20+OyBqZ2dAbnZpZGlhLmNvbTsNCj4gcGFyYXZAbnZpZGlhLmNvbTsgUmFuamFu
aSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT47DQo+IEZyZWQg
T2ggPGZyZWQub2hAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNl0g
QVNvQzogU09GOiBDcmVhdGUgY2xpZW50IGRyaXZlciBmb3IgSVBDIHRlc3QNCj4gDQo+IFRoYW5r
cyBmb3IgdGhlIHJldmlldyBHcmVnLg0KPiANCj4gT24gMTAvMS8yMCA4OjA5IEFNLCBHcmVnIEtI
IHdyb3RlOg0KPiA+IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDAzOjUwOjQ4UE0gLTA3MDAsIERh
dmUgRXJ0bWFuIHdyb3RlOg0KPiA+PiBGcm9tOiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5z
cmlkaGFyYW5AbGludXguaW50ZWwuY29tPg0KPiA+Pg0KPiA+PiBDcmVhdGUgYW4gU09GIGNsaWVu
dCBkcml2ZXIgZm9yIElQQyBmbG9vZCB0ZXN0LiBUaGlzDQo+ID4+IGRyaXZlciBpcyB1c2VkIHRv
IHNldCB1cCB0aGUgZGVidWdmcyBlbnRyaWVzIGFuZCB0aGUNCj4gPj4gcmVhZC93cml0ZSBvcHMg
Zm9yIGluaXRpYXRpbmcgdGhlIElQQyBmbG9vZCB0ZXN0IHRoYXQNCj4gPj4gd291bGQgYmUgdXNl
ZCB0byBtZWFzdXJlIHRoZSBtaW4vbWF4L2F2ZyByZXNwb25zZSB0aW1lcw0KPiA+PiBmb3Igc2Vu
ZGluZyBJUENzIHRvIHRoZSBEU1AuDQo+ID4+DQo+ID4+IFJldmlld2VkLWJ5OiBQaWVycmUtTG91
aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXgu
aW50ZWwuY29tPg0KPiA+PiBDby1kZXZlbG9wZWQtYnk6IEZyZWQgT2ggPGZyZWQub2hAbGludXgu
aW50ZWwuY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBGcmVkIE9oIDxmcmVkLm9oQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBFcnRtYW4gPGRhdmlkLm0uZXJ0bWFu
QGludGVsLmNvbT4NCj4gPg0KPiA+IEFtIEkgcmVhZGluZyB0aGlzIHNlcmllcyBjb3JyZWN0IGlu
IHRoYXQgdGhpcyBpcyB0aGUgb25seSAidXNlciIgb2YgdGhlDQo+ID4gbmV3IGFuY2lsaWNhcnkg
YnVzL2RyaXZlciBjb2RlPw0KPiANCj4gVGhpcyBpcyB0aGUgZmlyc3QgdXNlciwgYW5kIGl0IHdh
cyBtZWFudCB0byBkZW1vbnN0cmF0ZSBob3cgdGhlIGNsaWVudA0KPiBpcyBpbnN0YW50aWF0ZWQg
YW5kIGNvbW11bmljYXRlcyB3aXRoIGhhcmR3YXJlIGNvbnRyb2xsZWQgYnkgdGhlIHBhcmVudC4N
Cj4gVGhlIG5leHQgdXNlcnMgd2lsbCBiZSAnYXVkaW8gcHJvYmVzJywgd2hpY2ggcHJvdmlkZXMg
dGhlIGFiaWxpdHkgdG8NCj4gZXh0cmFjdC9pbmplY3QgZGF0YSBpbnRvIHRoZSBEU1AuIFdlIGFs
c28gd2FudCB0byBzcGxpdCB0aGUgZXhpc3RpbmcNCj4gYXVkaW8gY2FyZHMgaW50byBzZXZlcmFs
IHBpZWNlcywgZS5nLiB0aGUgSERNSSBwYXJ0cyBzaG91bGQgcmVhbGx5IGJlDQo+IHByZXNlbnRl
ZCBhcyBhIHNlcGFyYXRlIGNhcmQuDQo+IA0KPiBUaGUgb3RoZXIgdXNlcnMgd2lsbCBiZSBuZXR3
b3JraW5nL1JETUEsIHdoaWNoIHdlcmUgYWN0dWFsbHkgdGhlIGZpcnN0DQo+IHRvIHN1Z2dlc3Qg
dGhpcyBidXMuDQo+IA0KPiA+IElmIHNvLCB3aHkgaXMgaXQgZXZlbiBuZWVkZWQ/ICBUaGVzZSBh
cmUganVzdCBkZWJ1Z2ZzIGZpbGVzIGZvciB0ZXN0aW5nLA0KPiA+IHdoeSBkb2VzIHRoYXQgbmVl
ZCB0byBiZSBpbiBhIHNlcGFyYXRlIGRldmljZT8gIFdoYXQgaXMgYmVpbmcgInNoYXJlZCINCj4g
PiBoZXJlIHRoYXQgbmVlZHMgbXVsdGlwbGUgc3RydWN0IGRldmljZXMgdG8gaGFuZGxlPw0KPiA+
DQo+ID4gY29uZnVzZWQsDQo+IA0KPiBUaGUgcGFyZW50IFBDSSBkZXZpY2UgcHJvdmlkZXMgYWNj
ZXNzIHRvIHRoZSBEU1AgZmlybXdhcmUvaGFyZHdhcmUgYW5kDQo+IGlzIGluIGNvbXBsZXRlIGNv
bnRyb2wgb2YgdGhlIElQQyB3aXRoIHRoZSBEU1AgZmlybXdhcmUuIFRoZSBwYXJlbnQNCj4gcGxh
eXMgdGhlIHJvbGUgb2YgYSAnc2VydmVyJyBwcm92aWRpbmcgc2hhcmVkIGhhcmR3YXJlIGFjY2Vz
cyB0bw0KPiBtdWx0aXBsZSBjbGllbnRzLg0KPiANCj4gV2h5IGlzIHRoaXMgbmVlZGVkPw0KPiAN
Cj4gV2l0aCB0aGUgY3VycmVudCBhdWRpbyBzb2x1dGlvbnMsIHdlIGhhdmUgYSBtb25vbGl0aGlj
IHNvbHV0aW9uIHRoYXQgaGFzDQo+IHByb3ZlbiBkaWZmaWN1bHQgdG8gbWFpbnRhaW4uIFdlJ2Qg
cmVhbGx5IGxpa2UgdG8gZXhwb3NlIHVucmVsYXRlZCBEU1ANCj4gZnVuY3Rpb25hbGl0eSB3aXRo
IGRpZmZlcmVudCBkZXZpY2VzLg0KPiANCj4gVGhlIGJlc3QgZXhhbXBsZSBpcyByZWFsbHkgSERN
SS4gSERNSS9EUCBhdWRpbyBpbnRlcmZhY2VzIGFyZSBjb250cm9sbGVkDQo+IGJ5IHRoZSBzYW1l
IGhhcmR3YXJlLCBidXQgYXJlIGxvZ2ljYWxseSBpbmRlcGVuZGVudC4gV2hhdCB3ZSBlbmQtdXAN
Cj4gZG9pbmcgaXMgcmUtYWRkaW5nIHRoZSBzYW1lIHNvbHV0aW9uIG92ZXIgYW5kIG92ZXIgZm9y
IGVhY2ggbWFjaGluZSBkcml2ZXI6DQo+IA0KPiBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzJCBnaXQg
Z3JlcCBoZGFfZHNwX2hkbWlfYnVpbGRfY29udHJvbHMNCj4gYnh0X2RhNzIxOV9tYXg5ODM1N2Eu
YzogICAgICAgICByZXR1cm4gaGRhX2RzcF9oZG1pX2J1aWxkX2NvbnRyb2xzKGNhcmQsDQo+IGNv
bXBvbmVudCk7DQo+IGJ4dF9ydDI5OC5jOiAgICAgICAgICAgIHJldHVybiBoZGFfZHNwX2hkbWlf
YnVpbGRfY29udHJvbHMoY2FyZCwgY29tcG9uZW50KTsNCj4gY21sX3J0MTAxMV9ydDU2ODIuYzog
ICAgICAgICAgICByZXR1cm4gaGRhX2RzcF9oZG1pX2J1aWxkX2NvbnRyb2xzKGNhcmQsDQo+IGNv
bXBvbmVudCk7DQo+IGVobF9ydDU2NjAuYzogICByZXR1cm4gaGRhX2RzcF9oZG1pX2J1aWxkX2Nv
bnRyb2xzKGNhcmQsDQo+IHBjbS0+Y29kZWNfZGFpLT5jb21wb25lbnQpOw0KPiBnbGtfcnQ1Njgy
X21heDk4MzU3YS5jOiAgICAgICAgIHJldHVybiBoZGFfZHNwX2hkbWlfYnVpbGRfY29udHJvbHMo
Y2FyZCwNCj4gY29tcG9uZW50KTsNCj4gaGRhX2RzcF9jb21tb24uYzppbnQgaGRhX2RzcF9oZG1p
X2J1aWxkX2NvbnRyb2xzKHN0cnVjdCBzbmRfc29jX2NhcmQNCj4gKmNhcmQsDQo+IGhkYV9kc3Bf
Y29tbW9uLmg6aW50IGhkYV9kc3BfaGRtaV9idWlsZF9jb250cm9scyhzdHJ1Y3Qgc25kX3NvY19j
YXJkDQo+ICpjYXJkLA0KPiBoZGFfZHNwX2NvbW1vbi5oOnN0YXRpYyBpbmxpbmUgaW50IGhkYV9k
c3BfaGRtaV9idWlsZF9jb250cm9scyhzdHJ1Y3QNCj4gc25kX3NvY19jYXJkICpjYXJkLA0KPiBz
a2xfaGRhX2RzcF9jb21tb24uaDogICByZXR1cm4gaGRhX2RzcF9oZG1pX2J1aWxkX2NvbnRyb2xz
KGNhcmQsDQo+IGNvbXBvbmVudCk7DQo+IHNvZl9kYTcyMTlfbWF4OTgzNzMuYzogICAgICAgICAg
cmV0dXJuIGhkYV9kc3BfaGRtaV9idWlsZF9jb250cm9scyhjYXJkLA0KPiBzb2ZfcGNtNTEyeC5j
OiAgcmV0dXJuIGhkYV9kc3BfaGRtaV9idWlsZF9jb250cm9scyhjYXJkLA0KPiBwY20tPmNvZGVj
X2RhaS0+Y29tcG9uZW50KTsNCj4gc29mX3J0NTY4Mi5jOiAgICAgICAgICAgcmV0dXJuIGhkYV9k
c3BfaGRtaV9idWlsZF9jb250cm9scyhjYXJkLCBjb21wb25lbnQpOw0KPiBzb2Zfc2R3X2hkbWku
YzogICAgICAgICByZXR1cm4gaGRhX2RzcF9oZG1pX2J1aWxkX2NvbnRyb2xzKGNhcmQsDQo+IGNv
bXBvbmVudCk7DQo+IA0KPiBhbmQgd2UgYWxzbyBrZWVwIGFkZGluZyBIRE1JLXJlbGF0ZWQgQVNv
QyB0b3BvbG9neSBkZWZpbml0aW9ucyBmb3IgYWxsDQo+IHRoZSBjYXJkcy4NCj4gDQo+IEl0IHdv
dWxkIG1ha2UgYSBsb3QgbW9yZSBzZW5zZSBpZiB3ZSBjb3VsZCBoYXZlIE9ORSBIRE1JL0RQIGNh
cmQgd2hpY2gNCj4gaXMgY3JlYXRlZCwgaW5zdGVhZCBvZiBtYW5hZ2luZyBIRE1JL0RQIGZyb20g
dGhlIGNhcmQgdGhhdCBpcyBzdXBwb3NlZA0KPiB0byBkZWFsIHdpdGggbG9jYWwgYWNjZXNzb3Jp
ZXMgYmFzZWQgb24gSERhdWRpby9ETUlDL1NvdW5kV2lyZS9JMlMuDQo+IA0KPiBUaGUgYXVkaW8g
cHJvYmVzIGFyZSBzaW1pbGFyLCB3ZSB3YW50IHRvIGhhdmUgYSBzaW5nbGUgcHJvYmUgY2xpZW50
DQo+IGluc3RlYWQgb2YgYWRkaW5nIGF1ZGlvIHByb2JlcyB0byBldmVyeSBzaW5nbGUgY2FyZCB3
ZSBoYXZlIHRvIG1haW50YWluLg0KPiANCj4gT24gcGxhdGZvcm1zIHdoZXJlIHRoZSBEU1AgY2Fu
IGRlYWwgd2l0aCBzZW5zb3JzLCB0aGlzIHdvdWxkIGFsc28gYWxsb3cNCj4gdGhlIHBhcmVudCB0
byBleHBvc2UgSUlPIGFuZCBISUQgY2xpZW50cy4NCj4gDQo+IEdvaW5nIGJhY2sgdG8gdGhpcyBJ
UEMgdGVzdCwgbWF5YmUgdGhlIGNvbW1pdCBtZXNzYWdlIGlzIHVuY2xlYXI6IHdlDQo+IGFscmVh
ZHkgaGF2ZSB0aGlzIGZ1bmN0aW9uYWxpdHkgaW4gdGhlIG1haW5saW5lLCBpdCdzIGJlZW4gdmVy
eSBoZWxwZnVsDQo+IGZvciBzdHJlc3MgdGVzdHMuIFdoYXQgdGhpcyBwYXRjaCBzaG93cyBpcyB0
aGF0IG1vdmluZyB0aGUgZnVuY3Rpb25hbGl0eQ0KPiB0byBhIGNsaWVudCBtYWtlcyBpdCBwb3Nz
aWJsZSB0byBzY2FsZSB0byAyIG9yIG1vcmUgY2xpZW50cyB3aXRoIGENCj4gc2ltcGxlIHNldCBv
ZiByZWdpc3Rlci91bnJlZ2lzdGVyLiBUaGUgZGV2aWNlIG1vZGVsIG1ha2VzIGl0IHJlYWxseSBl
YXN5DQo+IHRvIHNjYWxlLg0KPiANCj4gU28geWVzLCB5b3UgYXJlIGNvcnJlY3QgdGhhdCBmb3Ig
bm93IHRoZXJlIGlzIGEgc2luZ2xlIHVzZXIgd2l0aCB2ZXJ5DQo+IGxpbWl0ZWQgZnVuY3Rpb25h
bGl0eS4gVGhpcyBpcyBpbnRlbnRpb25hbCB0byBtYWtlIHRoZSByZXZpZXdzIHNpbXBsZXIsDQo+
IGJ1dCBpZi93aGVuIHRoaXMgYnVzIGlzIHBhcnQgb2YgdGhlIG1haW5saW5lIHdlJ2xsIGhhdmUg
YWRkaXRpb25hbA0KPiB1c2VycywgYW5kIG5vdCBqdXN0IGZyb20gSW50ZWwgaWYgeW91IGxvb2sg
YXQgdGhlIHJldmlld2VkLWJ5IHRhZ3MuDQo+IA0KPiBXZSBtaWdodCBldmVuIHJlbW92ZSB0aGUg
cGxhdGZvcm0gZGV2aWNlcyB1c2VkIGZvciB0aGUgU291bmRXaXJlIG1hc3Rlcg0KPiBhbmQgdXNl
IHRoaXMgaW5zdGVhZCA6LSkNCj4gDQo+IERvZXMgdGhpcyBoZWxwPw0KPiANCg0KVGhlIHJlYXNv
biB3ZSBzd2l0Y2hlZCBmcm9tIHVzaW5nIFJETUEvTEFOIGFzIGFuIGV4YW1wbGUgd2FzIHRoZSBp
bXBhc3NlDQppbiB0cnlpbmcgdG8gZ2V0IHBhdGNoZXMgZm9yIGFsbCB0aHJlZSBtb3ZpbmcgcGFy
dHMgIHVwIHRocm91Z2ggdHdvIGRpZmZlcmVudCB0cmVlcw0KYXQgdGhlIHNhbWUgdGltZSAobmV0
ZGV2IGFuZCByZG1hKS4gIEl0IHdhcyBiZWNvbWluZyBhIGh1Z2UgbWVzcy4gIFRoZSBJbnRlbA0K
c291bmQgZHJpdmVyIGZvbGtzIHByb3ZpZGVkIGEgY29uc3VtZXIgaW4gYSBzaW5nbGUgdHJlZSB0
byBtYWtlIHN1Ym1pc3Npb24gc21vb3RoZXIuDQoNClRoZSBwYXRjaGVzIGZvciB0aGUgTEFOIGRy
aXZlciBhbmQgUkRNQSBhcmUgd2FpdGluZyB0byBzZWUgd2hhdCB0aGUgZmluYWwgZm9ybSBvZg0K
YW5jaWxsYXJ5IGJ1cyB3aWxsIGJlIHNvIHRoYXQgdGhleSBjYW4gbWF0Y2ggdG8gdGhlIGZpbmFs
IEFQSS4gIFdlIHN0aWxsIGhhdmUgdGhlIHNhbWUNCnVzZSBjYXNlIGluIHRoZSBMQU4vUkRNQSBt
b2RlbC4NCg0KLURhdmVFDQoNCg==
