Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB5B2A0B97
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 17:46:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ECFA15F9;
	Fri, 30 Oct 2020 17:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ECFA15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604076364;
	bh=UzBVI6QG3FJ78kn9LxyxGE4vzvOEMR+VAWVSrUxzS48=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQ8acEB/Z1z18CPx66n6q2+X1RfGL21WagiBg8tm28gl0OTb8omo5/ag4iGuYUbyP
	 pMBvEAVeAQIcplG7vBpXsjUZZLweiJi3qXZDI+ySFGsbKSHejZH350mkcLfH6tj7Xy
	 Ixc6V7XMANa5Zf4JE32hpaIH40bTmoezSSllViwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 560A5F80249;
	Fri, 30 Oct 2020 17:44:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65087F80212; Fri, 30 Oct 2020 17:44:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C98AF800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 17:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C98AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="iS7SlZkq"
IronPort-SDR: hLCawgWODCYJAng2gtsITBkJeKRHf0VwS3/8arKbMUuMDp+cG7DAhhb115BCP7Fz19vilkO6kR
 tOqpa246d18Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="230269497"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="230269497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 09:44:22 -0700
IronPort-SDR: 7HMsK9KuPhvYAtpY2UW59fLEJ7SfsmU5Foft/tfdyqhrtZwfujwGMxImVNGlYCu0xPLGXAxOmo
 UjYBgdNDbnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="362496930"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2020 09:44:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Oct 2020 09:44:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Oct 2020 09:44:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 30 Oct 2020 09:44:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 30 Oct 2020 09:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuR1Z5V/QSPG/TbeRX1bA7d8CiIQQi2O0DIxyDg2Vw/NYlovAJHaqj/O9SMTM/U0v6PfR0Lra5e2B+T1PE6mRw4DZW1AtTiJoZ6cOWX8xScuSF+X70LZcKmqWRhF329iMSXf/Woocdl8WthkFTeOAtwkUdd7uhD9bvVZ6t7wTxZgZlkQj5e9eBFy3sXqRkq6v+y6a6iPGfNM6eJyxZ/SYWfaHHh1m8y3k9BW+PvIGxpWdX+qlIRlREQ8y9jaYoC5ghTddnKrFyw+M0TE49gi2FzC9Cfos8XpOGAXCYyhPKint1hDk46AItKzdFm/j6jLvxx07XuXe1XoDNDNkS1CEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzBVI6QG3FJ78kn9LxyxGE4vzvOEMR+VAWVSrUxzS48=;
 b=V4/jijWR5IfsDcAQFaxzzmL7Cf2ifRWqVLGNk0QFe471P95z8x0XjoTDmfP9pNrR5FbZK5m5BbUMDt4t0YPBu5hOdlCCf+RtY26lf+Wks7RPt0Q0YF52ThW7IYKcboj58unP7M8Ln4EtZOgOLq0CbOYeTThM0+r0LQsJ+mApUNLigEypLeo9Ls2JK8HEwYTBcFmugM6EtiOyrvXoYfcUt0S2MJYit5uFEVnRuRjVJfupaxn4wXtV5Tjy3XCEbRLbCobYy/3nsEV5m/3F0Wi4T/jRL5U6HeY4njIP/W8QMMirCmbSZZMAaaRhn8vSnA+BJ5Q00RfoglC9motOMzDn6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzBVI6QG3FJ78kn9LxyxGE4vzvOEMR+VAWVSrUxzS48=;
 b=iS7SlZkqbMnRbe1i/Ghwd6favySyK9SHIt3Zn+KTX4y7mG+dObfpGNk3u2NoVgC0lODyfAAdG4/uUQc8rrETF067DGfGFc3QcewKgoZOE36t6ZWor5ar8I2qJ6zD9rp4bHJzs0IpQ83OVtMjBHSk25gOTEYvZHLGiLRc+DMoicw=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB0043.namprd11.prod.outlook.com (2603:10b6:4:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Fri, 30 Oct
 2020 16:44:17 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::a567:4244:5727:7a14]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::a567:4244:5727:7a14%6]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 16:44:17 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2] ASoC: intel: sof_rt5682: Add quirk for Dooly
Thread-Topic: [PATCH 2/2] ASoC: intel: sof_rt5682: Add quirk for Dooly
Thread-Index: AQHWroisj9IJuk1qYEyQThVviMAAbqmwRq4AgAAPO/A=
Date: Fri, 30 Oct 2020 16:44:17 +0000
Message-ID: <DM6PR11MB3642F7AB13991ACF8A32B1DE97150@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20201030063654.25877-1-brent.lu@intel.com>
 <20201030063654.25877-3-brent.lu@intel.com>
 <c83b3f20-2afd-12da-c349-31f35f8f6aa5@linux.intel.com>
In-Reply-To: <c83b3f20-2afd-12da-c349-31f35f8f6aa5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.6.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4550951e-f32b-4d77-7566-08d87cf30af3
x-ms-traffictypediagnostic: DM5PR11MB0043:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB004340713825970098959CE997150@DM5PR11MB0043.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eInmdw02+nG+nZDQU95TRhHI8tR5Db3j9OrhzeQLcVOe4mewQCgw1SMsdMeMGD4EWHImLeoT8XxnKzZ5jvaTONm9hPX2itAOzmyUMyg7JcLeNiGxjyYq6agC2Zf1qkJt/xOipYfiYX+74NwuknKRVVP2mSES4XPj4RzOC55OcvS9wLd1Ju1Wgz9RfkpA/WZKb2dEaEJ8GbiultLaDcjErRP5h6ugWdMDJ3bU2NRM+qUCzFkdTRZMUDSR1XEwkLpWrf9RD11ZqnYyo3fkFg+wXfEBTkrYlbIgdl7hjOuY/1uuPlaLqF0Ns5Zu0CMQwVzl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(5660300002)(8676002)(66556008)(55016002)(66946007)(186003)(6506007)(9686003)(2906002)(4326008)(83380400001)(478600001)(71200400001)(7416002)(86362001)(76116006)(66476007)(64756008)(8936002)(66446008)(7696005)(26005)(54906003)(33656002)(52536014)(110136005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SKyXWVLj2l7HGUh+AUWeZqnrSkmFpIqpi2RS2eSP1eojhdLgRI8WFo29/w8//kliESKtlHVFvDFoSHSuRf37/c7UKrAWK0doLDdPEYru5aFnM1Hp/CUPfCBGsZoaPJPx7L9+A149znL5czIv7G7VPwGc+6XOhudyXNCi9M1quWjyQxrbY2FWUrZHC0ffWSaIQMdGvuNrvL7ner568I6fxN3Dkc3QLzn6rt0VmgQb6oNNx0ArFKO3vBIxgcKlMt4HHWR/zZ7RfC/ePxBJrGvg9LSZTjpoIQp04B5bsjK4twm4ITPZXpDDSCRngF981zHAQLHuE8JxpDUqXhJlBBEPfv5CeT0AbJz0atwxM+hsXuwUnhENNtqFlzZ9zNDC76gJ56Hi+EUmNmdpe9WJShGN3FIHekigZ4fPINmZQY24ECpwJgyGFpEmvF5OL7aoWKk2P/E0l6uUDxrNobE/Mpx2HkdYjhtQcWQ3n4SyUIbLzSqgKuYOQe3PkZ2lXfwgOtcGLGqZXbr9G7peBnpwdji5oZHL0q8pVGJJAeLw+YqcLh6on2w7f/njbf6FdeTs6gxGL7NlFwgxk4F7KvnDKPbFLywdWQlF+xGMgd+sxWaqolWr9ZhhfvWnoijE2kSixUdsN3CA9FA2CBGZET04Fhcg7Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4550951e-f32b-4d77-7566-08d87cf30af3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 16:44:17.4210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pj/d1ozx2+ko+WnKKm1URTtu87ICEbkSwiGxGAfp+nGx2m+RV55FNiGcJjQLHNIeYWnldK1/mEj8tKwQ2bd0XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0043
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, "Nujella, 
 Sathyanarayana" <sathyanarayana.nujella@intel.com>, "Wang,
 Rander" <rander.wang@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "Zhi, Yong" <yong.zhi@intel.com>
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

LCBCcmVudCBMdSB3cm90ZToNCj4gPiBUaGlzIERNSSBwcm9kdWN0IGZhbWlseSBzdHJpbmcgb2Yg
dGhpcyBib2FyZCBpcyAiR29vZ2xlX0hhdGNoIiBzbyB0aGUNCj4gPiBETUkgcXVpcmsgd2lsbCB0
YWtlIHBsYWNlLiBIb3dldmVyLCB0aGlzIGJvYXJkIGlzIHVzaW5nIHJ0MTAxNSBzcGVha2VyDQo+
ID4gYW1wIGluc3RlYWQgb2YgbWF4OTgzNTdhIHNwZWNpZmllZCBpbiB0aGUgcXVpcmsuIFRoZXJl
Zm9yZSwgd2UgbmVlZCBhbg0KPiA+IG5ldyBETUkgcXVpcmsgZm9yIHRoaXMgYm9hcmQuDQo+IA0K
PiBEbyB5b3UgYWN0dWFsbHkgbmVlZCBhIERNSSBxdWlyayBmb3IgdGhpcyBwbGF0Zm9ybT8NCj4g
DQo+IHRoZSAuZHJpdmVyX2RhdGEgYmVsb3cgdXNlcyB0aGUgZXhhY3Qgc2FtZSBzZXR0aW5ncyBh
cyB3aGF0IHlvdSB3b3VsZCB1c2UNCj4gd2l0aCB0aGUgZ2VuZXJpYyBzb2x1dGlvbiBiYXNlZCBv
biBBQ1BJIElEcywgc2VlIGJlbG93Lg0KPiANCj4gV29uZGVyaW5nIGlmIHBhdGNoMSB3b3VsZCBi
ZSBlbm91Z2g/DQo+IA0KDQpEb29seSBoYXMgRE1JIGZhbWlseSBzdHJpbmcgIiBHb29nbGVfSGF0
Y2giIHNvIHRoZSBETUkgcXVpcmsgd2lsbCBvdmVyd3JpdGUgdGhlDQpkcml2ZXJfZGF0YS4gSSBh
c2tlZCBnb29nbGUgYnV0IHRoZXkgcHJlZmVyIG5vdCByZW1vdmluZyB0aGlzIHN0cmluZyBzbyBp
dCBzZWVtcyB0bw0KbWUgdGhhdCBvbmUgZXh0cmEgRE1JIHF1aXJrIGlzIG5lZWRlZC4NCg0KICAg
ICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLmNhbGxiYWNr
ID0gc29mX3J0NTY4Ml9xdWlya19jYiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Lm1hdGNoZXMgPSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBETUlfTUFUQ0goRE1JX1BST0RVQ1RfRkFNSUxZLCAiR29vZ2xlX0hhdGNoIiksDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0sDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopKFNPRl9SVDU2ODJfTUNMS19FTiB8DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFNPRl9SVDU2ODJfTUNMS18yNE1IWiB8DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNPRl9SVDU2ODJfU1NQX0NPREVDKDApIHwNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgU09GX1NQRUFLRVJfQU1QX1BSRVNFTlQgfA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTT0Zf
UlQ1NjgyX1NTUF9BTVAoMSkpLA0KICAgICAgICAgICAgICAgIH0sDQoNClRoZSBvdGhlciB3YXkg
aXMgdXNpbmcgYWNwaV9kZXZfcHJlc2VudCgpIGluIHByb2JlIHRvIHVwZGF0ZSB0aGUgcXVpcmsg
d2l0aCBjb3JyZWN0DQpjb2RlYyBzZXR0aW5nLiBXaGljaCBvbmUgZG8geW91IHRoaW5rIGlzIGJl
dHRlcj8NCg0KDQpSZWdhcmRzLA0KQnJlbnQNCg0K
