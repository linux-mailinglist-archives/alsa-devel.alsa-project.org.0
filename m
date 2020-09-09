Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82722624B2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 04:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F90B1717;
	Wed,  9 Sep 2020 03:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F90B1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599616808;
	bh=xLXdHG1Zatit4EnfZJ/dShfAnBaUJ+mvJn3F7KaSnjo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+Usy9oydCrV9S8OZmMlNw1U76ETgULFRChUGI07x3b5XxA7XPmWf7LCJGX1pynCA
	 xA/Ovg519O6X+GwAP4kuxrTK4vUIBPAOBJggs4vRX8u8MWlg8ALB/KIm1IWl/rS0qM
	 EUB6Q8QGsFSSEt8pmqh4N8cFI9/JnwI8FsLbYQSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94E50F80240;
	Wed,  9 Sep 2020 03:58:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07DA1F80227; Wed,  9 Sep 2020 03:58:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED8A8F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED8A8F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="pg7jRvpC"
IronPort-SDR: BaE2zu1VusL7RtE/A5VLemT2uetiOrgMEHd2P8fqRtzIwpaWyFqrrvh8p+WWXfVINNVe6fZQIR
 vwRJJaCJ94/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219812512"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="219812512"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:58:10 -0700
IronPort-SDR: xWxCD14xmUsPrtYQLPKcpT//Mna2an27uoYsLinnQ+13hXgzEHpGjUEnNgwaeIGNXItApQrugQ
 MXOJvBz1umTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="341391789"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2020 18:58:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 8 Sep 2020 18:58:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 8 Sep 2020 18:58:10 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.59) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 8 Sep 2020 18:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRi5n0oYlcNZDpqxV639cIMnSpOSizGEk/HowTxX2bHU6cCZZT65T8wX4TGCZbgTfQ69ytfY31yuZRNM60jW1drNsM2jCQGa+neXU+yYSsZfNVRi/++hompNzxdSH0DAf2bTffayuKBid6pp9vzy/3l4W23psNY+IRoMBrF3DO9plkErG6cT5IArL0gX/bAQ3hHvssE3hnGYv268dEKe8qpGQoJJzRjc7gqnh15WSWlffiplX/Dv8SQEOUeMcTr0bhVbter0Y/458giHZttMbVahTjIXgyrN/mpLA7gHvq9LyLZuyLPHaX2DtZppwdaO8nJKbkjjLJRqqt2CrC40Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLXdHG1Zatit4EnfZJ/dShfAnBaUJ+mvJn3F7KaSnjo=;
 b=UPZezPPknEiKvBLBUeJ4AoFpRkas85msHPpcJ4avibp6BjpVmXqxt73BYRJfzpjsutRJSWv0r+tPjquN2LxByPrEKUtWjj0zcWBd1J9HpG2j9c1xMhntAiQD0EVIHAM9JX/0TOH8peBfaRYlOb8ddUWnInRZ4nfRZThc89w5qU39RTmn3IdgdlM8Jg9UlwllZ4ZIyYthE124FcfSADFv7dzBlPMOym0oMfl4w4iYTWlQ2LSGN+cS2a4MV1CgUsWVeZ1xO0ZMHOiExhFSynNXUaDkfRyCEMDJo5U7kdJSBrRWq6qncZ1lyDalaBbInsEs5IJDfd1piq5HcoyNXN6v7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLXdHG1Zatit4EnfZJ/dShfAnBaUJ+mvJn3F7KaSnjo=;
 b=pg7jRvpCzJ8ZFdlBbPHWPg0wH7HMoXmNXVpeJQw+MmtkKRw+HkCqa53yFtNjcbWDP+Ov1sxYgDcddmMpQwIzMGbhRELbxFCpMFlRWvaFC/75R/I7llhFj8Fskr8z3T+l3ultQbNUjpmMM/AjtIICYeFdFC/SIE09HaN4nkq4zb8=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM5PR1101MB2267.namprd11.prod.outlook.com (2603:10b6:4:52::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Wed, 9 Sep 2020 01:58:02 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40%3]) with mapi id 15.20.3348.018; Wed, 9 Sep 2020
 01:58:02 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
Thread-Topic: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
Thread-Index: AQHWdcyi9cfCqtiaqUefxJZs2KykBqlNI7GAgBGhUICAAAHHgIAABNIAgAAiw4CAAAK+AIAAuNuw
Date: Wed, 9 Sep 2020 01:58:02 +0000
Message-ID: <DM6PR11MB40748C4EFE8529E2EE6C47C8FF260@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
 <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
 <20200828065125.GI2639@vkoul-mobl>
 <ec5fe867-f2e4-4278-0376-e54bcdd7f94d@perex.cz>
 <20200908121133.GA5551@sirena.org.uk>
 <1950b662-ec59-6603-36c7-7a41d9e8460c@perex.cz>
 <20200908143312.GC5551@sirena.org.uk>
 <70eef32b-7f57-6868-edb7-f6452aa346c4@perex.cz>
In-Reply-To: <70eef32b-7f57-6868-edb7-f6452aa346c4@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6b4b191-096a-4406-c2bd-08d85463c903
x-ms-traffictypediagnostic: DM5PR1101MB2267:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2267F2D4235FB179747870CAFF260@DM5PR1101MB2267.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SlQxBwFQyojpos4xQDSE44/MLE6aGOJ0RNZny68hI3yqk0UHQBs7fpZrT3SZYhfk1mfnIkRS3GLA0sZhnxe73Ue+I58P91S/A2aarbMoFabf6WAWRg+PoMtMoEx/TsAF57HT7jiZnIuEDr1WR1uRhj+KRVQYYgiski3DN7PEnR82AvTmAiggHNOOehjO82CINd1Y1v5/G2sUjsW9xv95L/I9jdIfGZaNLPseSOMezl79ewrErzyVUA9jt6cOS9LJ5iZxbk6shHK85Ljmp4gNWPPKuzRThLyLFwSqwx2b9TB6c16wrHdGTGGTrNj/X5sqmfUv4lel+yeOCoWoW4SRoIxMntWSoiOJ9p0SLt4KYyHea50Jy6smFpyRbkEib5ml5UyYX/pTOf8r9J25qjArIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(66556008)(86362001)(64756008)(66476007)(66946007)(76116006)(66446008)(7416002)(33656002)(8676002)(8936002)(966005)(7696005)(478600001)(186003)(26005)(53546011)(6506007)(71200400001)(2906002)(5660300002)(110136005)(316002)(54906003)(55016002)(9686003)(52536014)(83380400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 91mPDet2vvRjt+tixBac2fTMMPA/j3YG5u19oybj5tv0UWSh7/CbLcGGz+/wakxUQGzmVc8y+vJLIjfbsk9oull6gKmQlSLyyv4LmJNHHbl7Ygxk2lYWS7rhb3DvIYERzq1dtLZtX5IMk1IoSPSDN8s/qHHCUq6VUmppc7zySO3WG//Vsj3NLvEtKLfwkQDlcBjKKoRS19p+60QhILIOruDnMCJUkylUlu62bnoFRaUXXStHAtemia70aOPBYZY+SChWMPmnPPq4fZPHjLSW3zE3mo6n+nxEYelFThYGK+Z9JZQI0Oab8Q8RBonwx5wZYeR6AAy8hfCVAIq8zR5/LBGu0c+VPfLWMyFZ/DTlV35RVm+wTe6+RnGktzEjBy8biTc6DENJKl9osLkIq15odKpBT8OfulJAIJxCBbSWSjGI85f7Ky37aUgm+FH3vXlniXTWXfoJElVQ0Qh+VBzFd35OC9dNGr9r49pGsgOKaMNHyqDWLT7wnUXhvfexYEcO700IyvN6Es0t75mwgLWxrOtRVJ2xGrm0x4PoRNkbHmnPJrNB8avfNfV/f0KHZC2JcIMsc5DyPwuure1Wh3Y1OSFoRN4DPy6uIS5pNQcyUaO4EL7MYthqs15PV/8vt5hyn5D542OMc791KCebNxoLfQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b4b191-096a-4406-c2bd-08d85463c903
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 01:58:02.2778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d+7Y/UL7HLi3Wo9ADRqtLDigULKLesgkhHpBER7u8b479yfptJNnAS9zzz4K2h8JMG6Wxfjj/z6OeD8OpytWyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2267
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 Vinod Koul <vkoul@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFyb3NsYXYgS3lzZWxh
IDxwZXJleEBwZXJleC5jej4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDgsIDIwMjAgMTA6
NDMgUE0NCj4gVG86IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gQ2M6IFZpbm9k
IEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+OyBCYXJkIExpYW8gPHl1bmctDQo+IGNodWFuLmxpYW9A
bGludXguaW50ZWwuY29tPjsgcGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyBh
bHNhLQ0KPiBkZXZlbEBhbHNhLXByb2plY3Qub3JnOyB0aXdhaUBzdXNlLmRlOyBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHJhbmph
bmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbTsNCj4gaHVpLndhbmdAY2Fub25pY2FsLmNvbTsg
c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnOw0KPiBqYW5rQGNhZGVuY2UuY29tOyBMaW4s
IE1lbmdkb25nIDxtZW5nZG9uZy5saW5AaW50ZWwuY29tPjsgS2FsZSwgU2FueW9nDQo+IFIgPHNh
bnlvZy5yLmthbGVAaW50ZWwuY29tPjsgcmFuZGVyLndhbmdAbGludXguaW50ZWwuY29tOyBMaWFv
LCBCYXJkDQo+IDxiYXJkLmxpYW9AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEv
N10gc291bmR3aXJlOiBidXM6IHVzZSBwcm9wZXJ0eSB0byBzZXQgaW50ZXJydXB0IG1hc2tzDQo+
IA0KPiBEbmUgMDguIDA5LiAyMCB2IDE2OjMzIE1hcmsgQnJvd24gbmFwc2FsKGEpOg0KPiA+IE9u
IFR1ZSwgU2VwIDA4LCAyMDIwIGF0IDAyOjI4OjQ4UE0gKzAyMDAsIEphcm9zbGF2IEt5c2VsYSB3
cm90ZToNCj4gPj4gRG5lIDA4LiAwOS4gMjAgdiAxNDoxMSBNYXJrIEJyb3duIG5hcHNhbChhKToN
Cj4gPg0KPiA+Pj4gSSBkb24ndCBoYXZlIHRoaXMgcGF0Y2ggYW5kIHNpbmNlIEkgc2VlbSB0byBn
ZXQgY29waWVkIG9uIHF1aXRlIGEgbG90IG9mDQo+ID4+PiBzb3VuZHdpcmUgb25seSBzZXJpZXNl
cyBJIGp1c3QgZGVsZXRlIHRoZW0gdW5yZWFkIG1vc3RseS4NCj4gPg0KPiA+PiBJdCBjYW4gYmUg
ZmV0Y2hlZCBmcm9tIGxvcmUgKG1ib3ggZm9ybWF0KToNCj4gPg0KPiA+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbHNhLWRldmVsLzIwMjAwODE4MTQwNjU2LjI5MDE0LTIteXVuZy0NCj4gY2h1
YW4ubGlhb0BsaW51eC5pbnRlbC5jb20vcmF3DQo+ID4NCj4gPiBTdXJlLCBJIGNhbiBnbyBnZXQg
c3R1ZmYgZnJvbSB0aGUgbGlzdCBhcmNoaXZlcyBidXQgbXkgbGlzdCBvZiB0aGluZ3MgdG8NCj4g
PiBnbyB0aHJvdWdoIGlzIGluIG15IGluYm94Lg0KPiA+DQo+IA0KPiBPa2F5LCBwbGVhc2UsIEJh
cmQgcmVzZW5kIHRoaXMgcGF0Y2hzZXQgYXMgdjIgKHdpdGggYWxyZWFkeSBhZ3JlZWQgQWNrZWQt
Ynk6KQ0KPiBvdGhlcndpc2UgaXQgd29uJ3QgYmUgYXBwbGllZC4gSSBiZWxpZXZlIHRoYXQgYW4g
YWNrIG9uIG15IGZvbGxvdy11cCB3aXRoIHRoZQ0KPiBjaGVjayBvZiB0aGUgb3JpZ2luYWwgbWVz
c2FnZSBzaG91bGQgYmUgc3VmZmljaWVudCwgYnV0IGFwcGFyZW50bHkgaXQgaXNuJ3QuDQoNCkRv
bmUuIEkgZm9yZ290IHRvIG1lbnRpb24gdGhhdCB0aGUgcGF0Y2hlcyB0aGVtc2VsdmVzIGFyZSBu
b3QgY2hhbmdlZCBpbiB0aGUNCmNvdmVyIGxldHRlci4gVGhlIG9ubHkgY2hhbmdlcyBpbiB2MiBp
cyBlZGl0aW5nIHRoZSB0aXRsZSB3aXRoICJBU29DLw0Kc291bmR3aXJlOiIgcHJlZml4Lg0KDQo+
IA0KPiAJCQlUaGFua3MsDQo+IAkJCQlKYXJvc2xhdg0KPiANCj4gLS0NCj4gSmFyb3NsYXYgS3lz
ZWxhIDxwZXJleEBwZXJleC5jej4NCj4gTGludXggU291bmQgTWFpbnRhaW5lcjsgQUxTQSBQcm9q
ZWN0OyBSZWQgSGF0LCBJbmMuDQo=
