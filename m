Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E8282E99
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 03:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548BA1829;
	Mon,  5 Oct 2020 03:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548BA1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601860851;
	bh=LNMBpRf/DLV9MpyfKUXiASycRGVyjz+BWjJlPkHH1Cs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVvYcc1RffpnbsLdW+JS0P3q94urV6fgf3X8xHwcW2hudJ2EjATRAd8dsYEx5FVSU
	 XAarRVmjM0pMbeneUTYVgxEqpi1eouSX9oD/4/x56qiOD0xjUS54vUQlmwdtB1Gi/n
	 F9vfSI+QyH4oG9wVDPks85ph/xlnvWov3jAs/MjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF8A0F80253;
	Mon,  5 Oct 2020 03:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82B1DF80246; Mon,  5 Oct 2020 03:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 106B3F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 03:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 106B3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="JAhr5snH"
IronPort-SDR: CNcqAd6DxZos6JfFndv7ps38saw8Fvq4v5/8zX8MVPhu026pGfY9BYl8zXQh8EONVnOBiUi7By
 SLLkV5k7/kuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="151101509"
X-IronPort-AV: E=Sophos;i="5.77,337,1596524400"; d="scan'208";a="151101509"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 18:18:55 -0700
IronPort-SDR: EOTANzRrshjzo4cyzWWZkSOWMxABjdRmGnhvxLR3Hym/USrwoLqwwv+IXeIi0EoJ4iJUH8r/M7
 jYmo1kQ0DFDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,337,1596524400"; d="scan'208";a="515833431"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2020 18:18:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Oct 2020 18:18:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 4 Oct 2020 18:18:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 4 Oct 2020 18:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4tEQqIcPKGo20Akr+O5w30YlvrpR6cgs3j/hJjDVIPbfkbUDklJjMNtQdryoYgh9rju1rnl7Wv+2ArCqa36Ir71IHDtfZhsxWE8y5EWEZXw/u/rzJXunc/L+EJ3sZEfsl+iMoVY/Swf5uIlKplFfRcla8rTrbfXanfhJKyFCK2o09BONY9U7qQgKEQ5cKLygLNjhnecSexETxv7+Q/Z2Sc6OeddJmm+fGeJeubbLXAG9yf2sWMB8wDOPAU6wkh8r9uqlRZqJVkyZJ4rM9isjaPXdjC4c+XygzMEFyxIn0OUzVbyKuMYq0kpzPzdUxhmwgL6MKPe/bX+6dTc2k64yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNMBpRf/DLV9MpyfKUXiASycRGVyjz+BWjJlPkHH1Cs=;
 b=mAJQjMIFFBRuKjREFjkzrDrcGd4/zDBFGmaPP5tK1XVdsWJR8uVIASWwa216Jnisr46XBjx2Ia75QNa6v9FHPSHOID+IIquUFSbatIo38gvzQATZHlDsf/CoemcnHuJW8owfhvUUqgewA+mzlBEV0LAO8C2xIcx2WIAerxiZntPnQpIwjHv5PTexKkQvlmbAnVOM7JhL6ZWX7SrioHpA9wBYawWxtivO4R/5dD3w+jm5PCOvNqDZR8qFLYEtXAsMLKyu7hQi67uLf4nxa0mGu8I5iN/IkNNLpv0ZjHd62yeEZJdqTxnr1ciObuU3HQ6CXExyAKit5iiZ7ZOzjqfc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNMBpRf/DLV9MpyfKUXiASycRGVyjz+BWjJlPkHH1Cs=;
 b=JAhr5snHEyP/q+Gys1eKClNJKekd1aKqWvR9a9qsAJ+o6yjN4xbECtHgu2NcLCSKHKu40KsgnAJcRNzgvGZ30GJtgC58VrLcx9NwYOIm0ktOnG0p9tvL1+EISUO/ZCrdsXJRL67tny/tekdPnWXB8CAee+fvKtcbVZ9asmJQMbc=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.35; Mon, 5 Oct 2020 01:18:42 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 01:18:42 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCVeiAgAJoT9CAANxzgIACh0yAgAAVHrA=
Date: Mon, 5 Oct 2020 01:18:42 +0000
Message-ID: <DM6PR11MB2841D1ED2C3A812536BA7FEDDD0C0@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
In-Reply-To: <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 590b4693-e71c-46fc-b910-08d868cc9953
x-ms-traffictypediagnostic: DM6PR11MB2841:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB28412785D99AF4901CFE886FDD0C0@DM6PR11MB2841.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZkKqGCORNU/iUH1QLNoWDiS/c9W/f6rsJuwBiEbXnQcUmfqY6bSDxkYNeRs4ShBt9tqo5D083ZSJgkMqFQ8fo9onLhQRwMB8UQ6ESs14Qka7fAHHrHVDocy6GZDdXSBALQwc1POJFOd+yjEZxed1AaDdMxnJoNY9OEcq2xf4BErJL5gDFNTwfcUm5FmJiClZANgiZI8uWNbGEQOopE52PWAdDVk2zWdW6CVjDeepU+5AAv7raivlx7MOV7FYqmSYcnC6fArx5742mU0WmbYWELq/JieIE6jg6VG/KH+eTpC/sl3GYHHclZa/7gerwfhlZcuiK9RXqmiXQ0yyldwroA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(4326008)(66476007)(76116006)(66946007)(478600001)(2906002)(64756008)(8676002)(110136005)(54906003)(66556008)(66446008)(83380400001)(7696005)(186003)(53546011)(6506007)(316002)(26005)(8936002)(86362001)(33656002)(52536014)(71200400001)(55016002)(9686003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mp2zGM5BJwijsAC5MkndOSHE7MCdJUJXFudNEuRxxGUR1YBptzHTyfxEUAu8jPmbtW7zI/gmCSFjm0JImDUhs/RG51l1S1EmTKeqEBzgbU2wsX10m4ztC7KN9Z2k4AQxsWH80LH5ZzVdGCUbMbv0Xcw6/IRD9X0r3Ba7Iw5XwO5lkfRyFmIqD1SVKbUAG8A78hTDP8arQXupXJ+tzGBkV+H3M3aTv3kWhBpAe9T08nr+ABCUiEI8RiBzNF6qPpVy8uzS+aQQvVNkleS0lSmlsbSyZadscL6n7zx5Vqa3NUI06uyxA69pDYPK3NYRCyiBm5+q0agyruP2nf6bGVhZdl9TJlaKE1vHQEEP6Rfbgxl/ibB1aXeplPICGzdO7KktYEQC1fQ9E6sYataT69/DyVPAnQHCvGWUkufhSCt73kvNLaw9X1P/y9MzeT4jTFPTkqftxZkaftfSvF8BRVLyXBqWWTsKUzIr+83Q1POeVPnCkpXQfHHKJZKw3GgNvbNPvIqKLXoTYd8q2/NCOK8ljQpAk/SpwtMdOdi7MYO+pwYCWhzCIcBp+G/9bAdNJUK62l29A6/qTkCeFkn9lAAYtvU4zpvr+57SQsuwkAPHOke3b0KO8smpWwSxtbREMw/Lg+pvNvlhkd6EeAY9qyJqAw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590b4693-e71c-46fc-b910-08d868cc9953
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 01:18:42.5934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3rzWs1i5HTPaFm1r747SKSZCmZX8qSnQ6IU6fChOk4VQgU/5FsGD2H3vbcf/n+9GzTCUgkNlPuJtNaq9AAMR0Eb/cxrwiED5XM+4gJQGJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2841
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXaWxsaWFtcywgRGFuIEogPGRh
bi5qLndpbGxpYW1zQGludGVsLmNvbT4NCj4gU2VudDogU3VuZGF5LCBPY3RvYmVyIDQsIDIwMjAg
NDo0NiBQTQ0KPiBUbzogRXJ0bWFuLCBEYXZpZCBNIDxkYXZpZC5tLmVydG1hbkBpbnRlbC5jb20+
Ow0KPiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZw0KPiBDYzogcGllcnJlLWxvdWlzLmJvc3Nh
cnRAbGludXguaW50ZWwuY29tOyBwYXJhdkBudmlkaWEuY29tOw0KPiBicm9vbmllQGtlcm5lbC5v
cmc7IGpnZ0BudmlkaWEuY29tOyBTcmlkaGFyYW4sIFJhbmphbmkNCj4gPHJhbmphbmkuc3JpZGhh
cmFuQGludGVsLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgdGl3YWlAc3VzZS5k
ZQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNl0gQW5jaWxsYXJ5IGJ1cyBpbXBsZW1lbnRhdGlv
biBhbmQgU09GIG11bHRpLWNsaWVudA0KPiBzdXBwb3J0DQo+IA0KPiBbIFVnaCwgYXMgb3RoZXIg
aGF2ZSBsYW1lbmV0ZWQsIEkgd2FzIG5vdCBjb3BpZWQgb24gdGhpcyB0aHJlYWQgc28gSQ0KPiBj
b3VsZCBub3QgcmVzcG9uZCBpbiByZWFsIHRpbWUuIExldCBtZSBiZSBhbm90aGVyIHRvIHNheSwg
cGxlYXNlIGNvcHkNCj4gYWxsIGltcGFjdGVkIGxpc3RzIGFuZCBzdGFrZWhvbGRlcnMgb24gcGF0
Y2hlcy4gXQ0KPiANCj4gT24gU2F0LCAyMDIwLTEwLTAzIGF0IDExOjA4ICswMjAwLCBHcmVnIEtI
IHdyb3RlOg0KPiBbLi5dDQo+ID4NCj4gPiA+IFNldmVyYWwgbmFtZXMgd2VyZSBzdWdnZXN0ZWQg
KGxpa2UgcGVlciBidXMsIHdoaWNoIHdhcyBzaG90IGRvd24NCj4gPiA+IGJlY2F1c2UgaW4NCj4g
PiA+IHBhcnRzIG9uIHRoZSBFbmdsaXNoIHNwZWFraW5nIHdvcmxkIHRoZSBwZWVyYWdlIG1lYW5z
IG5vYmlsaXR5KSwNCj4gPiA+IGZpbmFsbHkNCj4gPiA+ICJhbmNpbGxhcnkgYnVzIiB3YXMgYXJy
aXZlZCBhdCBieSBjb25zZW5zdXMgb2Ygbm90IGhhdGluZyBpdC4NCj4gPg0KPiA+ICJub3QgaGF0
aW5nIGl0Iiwgd2hpbGUgc29tZXRpbWVzIGlzIGEgZ29vZCB0aGluZywgZm9yIHNvbWV0aGluZyB0
aGF0DQo+ID4gSQ0KPiA+IGFtIGdvaW5nIHRvIGhhdmUgdG8gdGVsbCBldmVyeW9uZSB0byBnbyB1
c2UsIEkgd291bGQgbGlrZSB0byBhdCBsZWFzdA0KPiA+ICJsaWtlIGl0Ii4gIEFuZCByaWdodCBu
b3cgSSBkb24ndCBsaWtlIGl0Li4uDQo+ID4NCj4gPiBJIHRoaW5rIHdlIHNob3VsZCBnbyBiYWNr
IHRvICJ2aXJ0dWFsIiBmb3Igbm93LCBvciwgaWYgdGhlIHBlb3BsZSB3aG8NCj4gPiBkaWRuJ3Qg
bGlrZSBpdCBvbiB5b3VyICJpbnRlcm5hbCIgcmV2aWV3cyB3aXNoIHRvIHBhcnRpY2lwYXRlIGhl
cmUNCj4gPiBhbmQNCj4gPiBkZWZlbmQgdGhlaXIgY2hvaWNlLCBJIHdvdWxkIGJlIGdsYWQgdG8g
bGlzdGVuIHRvIHRoYXQgcmVhc29uaW5nLg0KPiANCj4gSSBjYW1lIG91dCBzdHJvbmdseSBhZ2Fp
bnN0ICJ2aXJ0dWFsIiBiZWNhdXNlIHRoZXJlIGlzIG5vdGhpbmcgdmlydHVhbA0KPiBhYm91dCB0
aGVzZSBkZXZpY2VzLCB0aGV5IGFyZSBmdW5jdGlvbmFsIHBhcnRpdGlvbnMgb2YgdGhlIHBhcmVu
dA0KPiBkZXZpY2UuIEFsc28sIC9zeXMvZGV2aWNlcy92aXJ0dWFsIGlzIGFscmVhZHkgdGhlIGxh
bmQgb2YgdW5wYXJlbnRlZCAgLw0KPiBzb2Z0d2FyZS1kZWZpbmVkIGRldmljZXMuIEhhdmluZyAv
c3lzL2RldmljZXMvdmlydHVhbCBhbG9uZ3NpZGUgdGhhdCBpcw0KPiAgbm90IHF1aXRlIGEgbmFt
ZXNwYWNlIGNvbGxpc2lvbiwgYnV0IGl0J3MgY2VydGFpbmx5IG5hbWVzcGFjZQ0KPiBjb25mdXNp
b24gaW4gbXkgdmlldy4NCj4gDQo+IEkgcHJvcG9zZWQgb3RoZXIgbmFtZXMsIHRoZSB0ZWFtIGNh
bWUgYmFjayB3aXRoICJhbmNpbGxhcnkiIHdoaWNoIHdhcw0KPiBub3QgbXkgZmlyc3QgY2hvaWNl
LCBidXQgcGVyZmVjdGx5IHN1aXRhYmxlLiBJbiBkZWZlcmVuY2UgdG8gdGhlIHBlb3BsZQ0KPiBk
b2luZyB0aGUgd29yayBJIGxldCB0aGVpciBjaG9pY2Ugc3RhbmQuDQo+IA0KPiBJdCBpcyBhbiB1
bmNvbWZvcnRhYmxlIHBvc2l0aW9uIGJlaW5nIGEgbWlkZGxlIHRpZXIgcmV2aWV3ZXIgb2YgcHJl
LQ0KPiByZWxlYXNlIHBhdGNoIHNldHMgd2hlbiB0aGUgcGF0Y2ggc2V0IGNhbiBzdGlsbCBiZSBk
ZS1yYWlsZWQgYnkNCj4gcHJlZmVyZW5jZSBuaXRzLiBBIGxhY2sgb2YgZGVmZXJlbmNlIG1ha2Vz
IGl0IGEgZGlmZmljdWx0IGpvYiB0bw0KPiBjb252aW5jZSBwZW9wbGUgImhleSBteSBpbnRlcm5h
bCByZXZpZXcgd2lsbCBzYXZlIHlvdSBzb21lIHRpbWUNCj4gdXBzdHJlYW0iLCB3aGVuIGluIHBy
YWN0aWNlIHRoZXkgY2FuIHNlZSB0aGUgb3Bwb3NpdGUgaXMgdHJ1ZS4NCg0KSSBoYXZlIHRvIGFk
bWl0IHRoYXQgSSBhbSBiaWFzZWQgdG93YXJkcyB0aGUgdmlydHVhbCBidXMgKG9yIHZpcnRidXMp
IG5hbWUgDQphcyB0aGF0IGlzIHdoYXQgSSB3YXMgdXNpbmcgZHVyaW5nIHRoZSBvcmlnaW5hbCBp
bXBsZW1lbnRhdGlvbiBvZiB0aGlzIGNvZGUuDQoNClRoYXQgYmVpbmcgc2FpZCwgSSBjYW4gYWxz
byB1bmRlcnN0YW5kIERhbidzIG9iamVjdGlvbiB0byB0aGUgbmFtZS4NCg0KQXQgZmlyc3QsIEkg
ZGlkbid0IG9iamVjdCB0byBQYXJhdidzIHN1Z2dlc3Rpb24gb2Ygc3ViZGV2IGJ1cywgYnV0IHRo
ZSBtb3JlIEkNCnRoaW5rIG9mIGl0LCBJIGRvbid0IHdhbnQgdG8gaGF2ZSB0byBkZXNjcmliZSB0
byBzb21lb25lIGhvdyB0byB1c2UgYQ0Kc3ViZGV2IGRldmljZSdzIHN1YiBkZXZpY2UgZWxlbWVu
dCAoeWlrZXMsIHdoYXQgYSBtb3V0aGZ1bCEpLg0KDQpBdCB0aGlzIHBvaW50LCBJIGp1c3Qgd2Fu
dCBhIG5hbWUgdGhhdCBpcyBlYXN5IHRvIHVuZGVyc3RhbmQgYW5kIGRvZXNuJ3QNCmdlbmVyYXRl
IGEgbG90IG9mIGNvbmZ1c2lvbiBvciB0b25ndWUgdHdpc3RpbmcgYWxsaXRlcmF0aW9uLg0KDQpD
YW4gd2UgY2FsbCBpdCB0aGUgc3VwZXJfdXNlZnVsIGJ1cz8gKGovayDwn5iKICkuDQoNClNvbWUg
cG9zc2libGUgbmFtZXM6DQphZ2dyZWdhdGUgKHVzZWFibGUgYWNyb3NzIHN1YnN5c3RlbXMpDQpn
b2IgKGJ1bmNoIGdyb3VwIG9yIGJsb2NrIC0ga2luZGEgcmVtaW5kcyBtZSBvZiBnaXQpDQpjb2xs
ZWN0IChicmluZ3MgdG9nZXRoZXIgZHJpdmVycyBmcm9tIGRpZmZlcmVudCBzdWJzeXN0ZW1zKQ0K
ZmxvY2sNCmhlYXANCnNlY3QgKHNwbGludGVyIGdyb3VwKQ0Kbm90X3BsYXRmb3JtIPCfmIkNCg0K
QW55IG9mIHRoZXNlIGludGVyZXN0IGFueWJvZHk/DQo=
