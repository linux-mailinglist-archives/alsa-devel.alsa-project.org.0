Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6B282EE8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 04:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795401846;
	Mon,  5 Oct 2020 04:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795401846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601865674;
	bh=a5gvKYDXei+akO7CONpFV7N6V/qCI0ICE2XWJLIXvLI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IlvP2XSDrQbCcp/SpMme45R0GT+karR6JT+eE9Qy1h9PMOZL7AoqiZ8ijcnU0Mn0E
	 HWnf6dQb4KvcrLdectguNNWuT9cDGCuau2D8kfiJjr4wVsK/B/Omo3S5LIsqrANPOp
	 +5lUSsbl6ovNsVv1VFaWWGsgc/K05R8T1m+9y9xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBDE7F802DD;
	Mon,  5 Oct 2020 04:39:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF265F802DC; Mon,  5 Oct 2020 04:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F090F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 04:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F090F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Hz0bUJYh"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7a87440000>; Sun, 04 Oct 2020 19:39:00 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Oct
 2020 02:39:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 5 Oct 2020 02:39:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWJtmTnF+DWym/YutvuaHxoV+1bS2FSotkxYNwKb1QB5oOW51kwyvQUZnFhO6Wpg6YY/rEhPPIt6ZqJF8Sb6UnMGpV1YQns+w2y93/gubs45LbkVq0VH9SMmvq12V28NTVGBAtOU3nPrAyJrxncRI8ozBukHkw0JTnkxPfINr4MDxit+aBegV1QHsUOPEBKtfFiigvIkt+Zbfi9wqrIQG+AvUVqoop5RkFDI6IPswJS5kcUpqduXg5ALaq2ZcWLAyFOjrjsUxnHTwUxm9njscG3ocxejERGSRl7mt1BETEneo6Ms7QED58Jk2essY/an071gvcp/gMnXUHdfxrpjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5gvKYDXei+akO7CONpFV7N6V/qCI0ICE2XWJLIXvLI=;
 b=Ee1hKydlDpAe1ub0TZWN9SNyP/j0Vj3qEEDMr9OrMGADtNDq6V01IqOcx4ypXLslfv2ZiYmPJyANU8O8pb8igb46Fj+Ymeezl71ihZZjy/WAiBJUJuv7Zui1OnTZia4MwQEUs15cLSVOF8INvPMXfQFHBqxd7AJmMTvI/jtNRpU/5SkK+oamAdSvseWxgvWaMYOwYSmnJKWr6WDfCqhgejJxwEVy3OjNuQFP4njKww5l068tyefP6H6ENuawK922VZSqtiPuw2IO5CZFexg0peKSQ9z/Ifz5xrUSMcIdY74s1SsoYHkoWColZ35qpBncFwsE0LgtrTrDS1yyXt4CeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 by BYAPR12MB3271.namprd12.prod.outlook.com (2603:10b6:a03:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Mon, 5 Oct
 2020 02:39:10 +0000
Received: from BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105]) by BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105%6]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 02:39:10 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Ertman, David M" <david.m.ertman@intel.com>, "Williams, Dan J"
 <dan.j.williams@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3xKvomHiYgkD0WKJ7Q9Ugi47amCVemAgAJu/YCAANXFgIACh0yAgAAZ/QCAABSs4A==
Date: Mon, 5 Oct 2020 02:39:10 +0000
Message-ID: <BY5PR12MB4322C77F2B801F3B8DD5065BDC0C0@BY5PR12MB4322.namprd12.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
 <DM6PR11MB2841D1ED2C3A812536BA7FEDDD0C0@DM6PR11MB2841.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB2841D1ED2C3A812536BA7FEDDD0C0@DM6PR11MB2841.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [49.207.195.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76e085ba-46e8-4996-ac90-08d868d7d6bd
x-ms-traffictypediagnostic: BYAPR12MB3271:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB32711138B232071C0A04EF4FDC0C0@BYAPR12MB3271.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nb9VwOZGiQi99cf4Mc9t2a/qUbtw4jOLqHoxwVYZTWsiCEwQ/bhw4lUD8sD/TWFSitRcQAz79rSHzK3U+dejMZXKYqqXbSI92QrNBBN8rTbSbV/tL9WHNcV2rgs+e29nw1mApFMLw9+SYG7fi0s0HwWAjTqtHz4+RRHDFjUB+75K3mYZeB7AnQKKrV8EC5zwHf9ZRf8yD48dcRRjnKeXvegjA2YkGlAR+df44fd8XCEYfAh8w2TkPL1xvkFXPs0WH4pIHvVVIOzHErPYoxy/UuMJS6B5PIQDniNJu+Hy6IXxYRXqUvqFSqKnU1mWiXXP6oFmmgp8rruThVTrQztlDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4322.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(52536014)(316002)(110136005)(54906003)(5660300002)(6506007)(66946007)(76116006)(4326008)(53546011)(71200400001)(55236004)(7696005)(86362001)(66446008)(64756008)(66556008)(66476007)(478600001)(186003)(26005)(33656002)(8936002)(8676002)(55016002)(83380400001)(9686003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0tOSWdqGEmzdlYcy8jU5DsuVK8vwA8xyc7s8w11kCIDEj1+QjUp1N/nVnJ/w4HT0a7trMgElH1D2YoUolLCLQDr6VasRU0oAdVljKE68B2AH/D6rCmCSxu2vTzAr2XIJYJb2dMFg9kb9dOKFNUE58TazIJflWFjbWD+m2qIMgwRoE++Tg+kAgxrou3C/Dj6nImGmfoo/JfS23/Z5lgTnOZgKgwtIfxvtjUZ7thocIoKP8bnGXbIZ6w+cchV08Tl1yY2zcxmIu7WsL9xBdgSEdmvb4fMRxXNX+l81jRF5uKcBreqFmRK1jJHlYxEIuiXZPDJg3sK9rHWx1JIXkTC7mGMwRTCWRWT47zpkIS3ygcEvCcIkQ+9ICi08OXyf22I6U8acS4XWCKBF6Zd64JbEjJmNVnaPh1DxAddljCS3mDo2gsFLXYKl2Ad0ZqPG5EKL60HfeJXAQr2JrpVbFdkvSfJUW3QwFmP7vtcvpV4ZH0y6A5vAJ9oi5CManqmir9xj80B5xF3sbFr1SBVGiReLetEFN5+425mLJHVrezpNVh2RxFEGmCPO5BE8BG2gAdOwV2fabPXKhgkoA0eWTHHrijS2n0UOhBDFP43Et/a9tf3uRuqyrDsYTQ/BAIV/9kzRO6StIde2pYPBNSKuqQsL1g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e085ba-46e8-4996-ac90-08d868d7d6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 02:39:10.1324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7+pFZDVWj70ussHYpILux+logm7vq2Qya4NQ4GF9GI8KZPLgcXFQ6Adpwiglg3JpH33tdE9BCMyUvaY6P7Lyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3271
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601865540; bh=a5gvKYDXei+akO7CONpFV7N6V/qCI0ICE2XWJLIXvLI=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:Content-Type:
 Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=Hz0bUJYhswJJS6jMB7t//yJxa9Tbd8AhbPtNNdnfvzRws/sZSOPkuXUlCtAwf7AIh
 eaf9j+BO6prHM/Sss6wqtgcChep+uNMHc7V2yraXo6OeyxOt6nVPN9fVZdox1xm5E9
 ZNfIQx4/mGS/VrYRc9ejENCg1Px+pcNK8yey6BzpFs8iFkWASUkoRnhDdg7Xen8ZxQ
 +6wd2G4+0dt4lgiWtv33jTfCMLXip7U+uY9TJrx65o8STOAR7LQrtDkmY/oHgT9oLL
 b4Av2IVNSNiwRmy1R3RA500HOfLe9/2bs8sHMIsLbIj226hU0yRMDFt/FDqAi54u/U
 +IiNCAlDTqHaw==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
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

DQoNCj4gRnJvbTogRXJ0bWFuLCBEYXZpZCBNIDxkYXZpZC5tLmVydG1hbkBpbnRlbC5jb20+DQo+
IFNlbnQ6IE1vbmRheSwgT2N0b2JlciA1LCAyMDIwIDY6NDkgQU0NCj4gDQo+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBXaWxsaWFtcywgRGFuIEogPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4NCj4gPiBTZW50OiBTdW5kYXksIE9jdG9iZXIgNCwgMjAyMCA0OjQ2IFBN
DQo+ID4gVG86IEVydG1hbiwgRGF2aWQgTSA8ZGF2aWQubS5lcnRtYW5AaW50ZWwuY29tPjsNCj4g
PiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZw0KPiA+IENjOiBwaWVycmUtbG91aXMuYm9zc2Fy
dEBsaW51eC5pbnRlbC5jb207IHBhcmF2QG52aWRpYS5jb207DQo+ID4gYnJvb25pZUBrZXJuZWwu
b3JnOyBqZ2dAbnZpZGlhLmNvbTsgU3JpZGhhcmFuLCBSYW5qYW5pDQo+ID4gPHJhbmphbmkuc3Jp
ZGhhcmFuQGludGVsLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gPiB0aXdh
aUBzdXNlLmRlDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzZdIEFuY2lsbGFyeSBidXMgaW1w
bGVtZW50YXRpb24gYW5kIFNPRg0KPiA+IG11bHRpLWNsaWVudCBzdXBwb3J0DQo+ID4NCj4gPiBb
IFVnaCwgYXMgb3RoZXIgaGF2ZSBsYW1lbmV0ZWQsIEkgd2FzIG5vdCBjb3BpZWQgb24gdGhpcyB0
aHJlYWQgc28gSQ0KPiA+IGNvdWxkIG5vdCByZXNwb25kIGluIHJlYWwgdGltZS4gTGV0IG1lIGJl
IGFub3RoZXIgdG8gc2F5LCBwbGVhc2UgY29weQ0KPiA+IGFsbCBpbXBhY3RlZCBsaXN0cyBhbmQg
c3Rha2Vob2xkZXJzIG9uIHBhdGNoZXMuIF0NCj4gPg0KPiA+IE9uIFNhdCwgMjAyMC0xMC0wMyBh
dCAxMTowOCArMDIwMCwgR3JlZyBLSCB3cm90ZToNCj4gPiBbLi5dDQo+ID4gPg0KPiA+ID4gPiBT
ZXZlcmFsIG5hbWVzIHdlcmUgc3VnZ2VzdGVkIChsaWtlIHBlZXIgYnVzLCB3aGljaCB3YXMgc2hv
dCBkb3duDQo+ID4gPiA+IGJlY2F1c2UgaW4gcGFydHMgb24gdGhlIEVuZ2xpc2ggc3BlYWtpbmcg
d29ybGQgdGhlIHBlZXJhZ2UgbWVhbnMNCj4gPiA+ID4gbm9iaWxpdHkpLCBmaW5hbGx5ICJhbmNp
bGxhcnkgYnVzIiB3YXMgYXJyaXZlZCBhdCBieSBjb25zZW5zdXMgb2YNCj4gPiA+ID4gbm90IGhh
dGluZyBpdC4NCj4gPiA+DQo+ID4gPiAibm90IGhhdGluZyBpdCIsIHdoaWxlIHNvbWV0aW1lcyBp
cyBhIGdvb2QgdGhpbmcsIGZvciBzb21ldGhpbmcgdGhhdA0KPiA+ID4gSSBhbSBnb2luZyB0byBo
YXZlIHRvIHRlbGwgZXZlcnlvbmUgdG8gZ28gdXNlLCBJIHdvdWxkIGxpa2UgdG8gYXQNCj4gPiA+
IGxlYXN0ICJsaWtlIGl0Ii4gIEFuZCByaWdodCBub3cgSSBkb24ndCBsaWtlIGl0Li4uDQo+ID4g
Pg0KPiA+ID4gSSB0aGluayB3ZSBzaG91bGQgZ28gYmFjayB0byAidmlydHVhbCIgZm9yIG5vdywg
b3IsIGlmIHRoZSBwZW9wbGUNCj4gPiA+IHdobyBkaWRuJ3QgbGlrZSBpdCBvbiB5b3VyICJpbnRl
cm5hbCIgcmV2aWV3cyB3aXNoIHRvIHBhcnRpY2lwYXRlDQo+ID4gPiBoZXJlIGFuZCBkZWZlbmQg
dGhlaXIgY2hvaWNlLCBJIHdvdWxkIGJlIGdsYWQgdG8gbGlzdGVuIHRvIHRoYXQNCj4gPiA+IHJl
YXNvbmluZy4NCj4gPg0KPiA+IEkgY2FtZSBvdXQgc3Ryb25nbHkgYWdhaW5zdCAidmlydHVhbCIg
YmVjYXVzZSB0aGVyZSBpcyBub3RoaW5nIHZpcnR1YWwNCj4gPiBhYm91dCB0aGVzZSBkZXZpY2Vz
LCB0aGV5IGFyZSBmdW5jdGlvbmFsIHBhcnRpdGlvbnMgb2YgdGhlIHBhcmVudA0KPiA+IGRldmlj
ZS4gQWxzbywgL3N5cy9kZXZpY2VzL3ZpcnR1YWwgaXMgYWxyZWFkeSB0aGUgbGFuZCBvZiB1bnBh
cmVudGVkDQo+ID4gLyBzb2Z0d2FyZS1kZWZpbmVkIGRldmljZXMuIEhhdmluZyAvc3lzL2Rldmlj
ZXMvdmlydHVhbCBhbG9uZ3NpZGUgdGhhdA0KPiA+IGlzICBub3QgcXVpdGUgYSBuYW1lc3BhY2Ug
Y29sbGlzaW9uLCBidXQgaXQncyBjZXJ0YWlubHkgbmFtZXNwYWNlDQo+ID4gY29uZnVzaW9uIGlu
IG15IHZpZXcuDQo+ID4NCj4gPiBJIHByb3Bvc2VkIG90aGVyIG5hbWVzLCB0aGUgdGVhbSBjYW1l
IGJhY2sgd2l0aCAiYW5jaWxsYXJ5IiB3aGljaCB3YXMNCj4gPiBub3QgbXkgZmlyc3QgY2hvaWNl
LCBidXQgcGVyZmVjdGx5IHN1aXRhYmxlLiBJbiBkZWZlcmVuY2UgdG8gdGhlDQo+ID4gcGVvcGxl
IGRvaW5nIHRoZSB3b3JrIEkgbGV0IHRoZWlyIGNob2ljZSBzdGFuZC4NCj4gPg0KPiA+IEl0IGlz
IGFuIHVuY29tZm9ydGFibGUgcG9zaXRpb24gYmVpbmcgYSBtaWRkbGUgdGllciByZXZpZXdlciBv
ZiBwcmUtDQo+ID4gcmVsZWFzZSBwYXRjaCBzZXRzIHdoZW4gdGhlIHBhdGNoIHNldCBjYW4gc3Rp
bGwgYmUgZGUtcmFpbGVkIGJ5DQo+ID4gcHJlZmVyZW5jZSBuaXRzLiBBIGxhY2sgb2YgZGVmZXJl
bmNlIG1ha2VzIGl0IGEgZGlmZmljdWx0IGpvYiB0bw0KPiA+IGNvbnZpbmNlIHBlb3BsZSAiaGV5
IG15IGludGVybmFsIHJldmlldyB3aWxsIHNhdmUgeW91IHNvbWUgdGltZQ0KPiA+IHVwc3RyZWFt
Iiwgd2hlbiBpbiBwcmFjdGljZSB0aGV5IGNhbiBzZWUgdGhlIG9wcG9zaXRlIGlzIHRydWUuDQo+
IA0KPiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIGFtIGJpYXNlZCB0b3dhcmRzIHRoZSB2aXJ0dWFs
IGJ1cyAob3IgdmlydGJ1cykgbmFtZSBhcw0KPiB0aGF0IGlzIHdoYXQgSSB3YXMgdXNpbmcgZHVy
aW5nIHRoZSBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIGNvZGUuDQo+IA0KPiBUaGF0
IGJlaW5nIHNhaWQsIEkgY2FuIGFsc28gdW5kZXJzdGFuZCBEYW4ncyBvYmplY3Rpb24gdG8gdGhl
IG5hbWUuDQo+IA0KPiBBdCBmaXJzdCwgSSBkaWRuJ3Qgb2JqZWN0IHRvIFBhcmF2J3Mgc3VnZ2Vz
dGlvbiBvZiBzdWJkZXYgYnVzLCBidXQgdGhlIG1vcmUgSQ0KPiB0aGluayBvZiBpdCwgSSBkb24n
dCB3YW50IHRvIGhhdmUgdG8gZGVzY3JpYmUgdG8gc29tZW9uZSBob3cgdG8gdXNlIGEgc3ViZGV2
DQo+IGRldmljZSdzIHN1YiBkZXZpY2UgZWxlbWVudCAoeWlrZXMsIHdoYXQgYSBtb3V0aGZ1bCEp
Lg0KV2UgaGF2ZSBmYWlyIGRvY3VtZW50YXRpb24gdGhhdCBkZXNjcmliZXMgd2hhdCBhbiBhbmNp
bGxhcnkgZGV2aWNlIGlzIGluIHRoZSBEb2N1bWVudGF0aW9uIGZpbGUgb2YgdGhpcyBwYXRjaC4N
CkRvIHlvdSBwbGFuIHRvIHJlbW92ZSB0aGF0IGFmdGVyIHJlbmFtaW5nIHRoZSBidXMgaW4gc3Bp
cml0IG9mIG5vdCBkZXNjcmliaW5nIGNvbW1lbnQgYWJvdmU/DQoNCkFzIERhbiBjbGVhcmx5IGRl
c2NyaWJlZCB3aGF0IGRldmljZXMgYXJlIGFuY2lsbGFyeSBkZXZpY2UgaW4gcHJldmlvdXMgZW1h
aWwgLT4gIiB0aGV5IGFyZSBmdW5jdGlvbmFsIHBhcnRpdGlvbnMgb2YgdGhlIHBhcmVudCBkZXZp
Y2UgIiwNCkhvdyBhYm91dCBzdWJmdW5jdGlvbl9idXMgb3IgcGFydGRldl9idXM/DQoNClNvIEkg
aGF2ZSAzIHNpbXBsZXIgbmFtZXMgdGhhdCBkZXNjcmliZXMgaXQgbXVsdGlwbGUgdXNlIGNhc2Vz
Lg0KKGEpIHN1YmRldl9idXMNCihiKSBzdWJmdW5jdGlvbl9idXMNCihjKSBwYXJ0ZGV2X2J1cw0K
DQo=
