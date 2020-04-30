Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283141C008B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 17:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C8F1673;
	Thu, 30 Apr 2020 17:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C8F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588261199;
	bh=PSrCV9xRv/rNmhEpSAjA0iDg6QNdxN2TVQWl4fSyHEA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UpcduEbgl8BBG1G7WHCkJtunUmq+0XVGCDHgaiVysBFCvgCP6DbcuGLwxeLxadg3l
	 Hit5cfS9fgyl95usKvvxzGhYgp5p8Fx6AD/zv3+78NmiUoD806ux5OYqFpij24eSgU
	 oHLguclOjh8O0Ncvd0Okl/DSEhXvt5KTZql+aUJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDC1F801EB;
	Thu, 30 Apr 2020 17:38:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97386F801DB; Thu, 30 Apr 2020 17:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4FB4F800B6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 17:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FB4F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="FneWcy0H"
IronPort-SDR: 3Z4eeBa8nfj5CtB7x6uE8CHvUm030RrOnIELP/a6uDJBewJTiEQOtnsjBIBRnjtO+Ol+Hq9G6/
 UHNnGmaxrtiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 08:38:07 -0700
IronPort-SDR: +8XPAG27qspHIHR7Z3++TW0YKYWPQEtpCId02dXbj8tDqoIJkSgZtGg4OUzf64QbsebNL31Wqc
 yQkJhuDBRIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="368180078"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2020 08:38:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Apr 2020 08:38:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Apr 2020 08:38:07 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 30 Apr 2020 08:38:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 30 Apr 2020 08:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0HmpRCm8cHfZ+DyCbRQaEET89c4DxXr7ZERYsl/nsiEWP++H1WPH690HDJkp0cv0zxF950088O1+Fqicn5PgxsGHXcKlF5I1PyBdq0u9wZJAH+7H+10mAUAhlLQ3u2sCN+z8LMQfdXYsVzlwMAV3OAsfvAcy+ia2eECEB4dNvjOwpQPvYwym9gX+mEb8MMimudgGYBB9iyP6EisTKjiFEOHPJjELv2BX7CWvegdFHGQNJYO5isiZ/uuMLosBJ5NuXw6Iabbaxt3KZbLRLa8TLBIiQy4arVJ8fTONyDX6J8qS4YXk3lEo+zmOEh3IrvGUGLo/VZOc/iUuzpZmaj8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSrCV9xRv/rNmhEpSAjA0iDg6QNdxN2TVQWl4fSyHEA=;
 b=hDC1iVDWdpnzkqHpbIbEH5DXm5Df595ubp8jhURpTAhnhDQeHWHpw05y9ZVUhj8USk0gbKsECkm1ML6M5NTj5LJUvNP4jT4GCh1xQ+9T+haBWN006vw5bQli1NgXSrU39ks8aAPjlZGNojesqRHXE+DD6poH7vMBKVTkrsx6CO2Icr8INuHO0juuAQR5SC0vlT5MEy68irl0ylK0Q+Y0tFk8z07YDWghc2FsgCQuen8MlP1mnakMLbzM99SIFt4Gi0iyVAYhxORAeHjakIvKvpf0T8r7kZdTPovW6x3rr1wecWOKdORQ+Wh/ZdXm2w7/ps/gdbHMN54oySTewlSWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSrCV9xRv/rNmhEpSAjA0iDg6QNdxN2TVQWl4fSyHEA=;
 b=FneWcy0H9sjPtjaFXCAPrYdkVwwzcguUccnNG4waZoPyJdDI8DRVADnqyFxvaYRnu0tMPy4uzazwHefm+7pESJmK1cLnwi6rb11XiS3FapZQTJfz9zbSgYyQJpHKMeqrMvMcQCv0NNPts9Vxf5tToR7RwUylymrFR8stifnZOfQ=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2241.namprd11.prod.outlook.com
 (2603:10b6:405:51::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 15:38:05 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6%11]) with mapi id 15.20.2937.026; Thu, 30 Apr
 2020 15:38:04 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, "Rojewski, Cezary"
 <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Topic: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Index: AQHWDxGPcERmvVi2FUaZ0GDzXVeqv6h4uesAgAAAnRCAAFQWgIAEY1sggAkDsACACG0YUIABciOAgAFISrA=
Date: Thu, 30 Apr 2020 15:38:04 +0000
Message-ID: <BN6PR1101MB21325FA4FB1446DC2CAF6C6797AA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
 <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <5e84c48c-a5d1-b2ff-c197-5efa478c5916@linux.intel.com>
 <BN6PR1101MB2132D23B042284DDA667642A97AC0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <9d003948-a651-9920-86b6-307e912dd8ed@linux.intel.com>
In-Reply-To: <9d003948-a651-9920-86b6-307e912dd8ed@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.113.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7662647-83bf-4300-9221-08d7ed1c797b
x-ms-traffictypediagnostic: BN6PR1101MB2241:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB22411C7BA1E77BDAC0E5030897AA0@BN6PR1101MB2241.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0389EDA07F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BLbQWfc1cGQFkcKRNip92VRQWZAQB/HeWgmraLiXQ0lWXbOgHPSGZ/1SwTJG2DyJabtEt6Thjr4OhpnpqMpPwypbdUKwzxR3qOJuFBJcvvUp6id7iziTNxBsEgr7kCnHfwbcOUOHGr4SWXTPxCQuovHsAG4KULMjzXTbdEtvNb3f0njQsAiJiuNpOVkN60yDII+bZHhfhj5nREw17P1REK5Jgow2qaSvnbV9Tkfm6Fuv51MyL71OP9wMy6HjcyuGlbPakR16WLw/Z4601Mpf+IpR0Yjn3axyK8myyoBHxJ3HKeKb3XHKM+wHR+usUn4HfWPps3LfzeVMwl+YokRA+goVS0VNXLPnk+i2SRZR6AX4xhJmBS/TnDRPpXzpljrQVLcXpb9kZTOpap+AHqY2PuQIH7IT+R1xmx8SupyN6JNRnO7W4Sjb1FNgyCLHhGIO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(376002)(136003)(346002)(39860400002)(52536014)(26005)(7416002)(4326008)(186003)(2906002)(6506007)(86362001)(54906003)(66946007)(8936002)(5660300002)(316002)(71200400001)(110136005)(478600001)(66556008)(8676002)(66476007)(33656002)(64756008)(76116006)(55016002)(9686003)(7696005)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: W0D8mwL25KwBOejIC+8/WzMb3f/ReMAjYpkP3QM5VMpjXo3Ac3V2zBupxrWjJAa1126CTitAb12s24OKFDbvdnF3aNqVloYuEgQr/eRE84FHT8IvycxmUXe0cEvMoTg3xTo/4zUp0W2pYvFC8KIPWmCntnCz13eMvKr/nC3JSk4l8VwhGO3pg/3Le6XSX5cvRdXprVRqQuEUIY2UzIv2I0FR/XwSYGv15vG2cGdNH4ilmMxebOpf1mdQoy37vYSFJNlOi/Zn+g0+taykBkbYMFW4NNaI6BSH4X7VOUHyl/00ey2n7KsR+h4jodxYuWJpdAoij/LXJvYrSUXyzGVTZhnshHZ9kTVn5mVBBdnlhxt4Ci2PsxvQQV4aUePXZc06hZbnWb50Ds4u2ge1cq+ZLkFOfPR+0Y28ko85WBICvpfE9YbmAByS48j3IsdouWzhnZWLFM35VLyIamJZsM2ExuytnCw8ZjIpaDAU7BLXJGQUpFK+ABA9ZX/qCa900K9WCfIzhKqnsa2akbytnoEZSKwZ17+TPAsW9CGhHDPBCACZWdgpbKorEDNjywRH3iajj8pZwbDD9vmZOrVje44kuEWOOoplh1SQw0ZsYRBa+Y/qDQF+plfaJCIsKJcxnq/+ej2c3cVcblZr/eaYWE9GAsi04tvVJ0zjtxz/CF/DvsEsZS3S2Ep/aR8iNKT3iw+rVu2LchW05KXi0Gyfa+wBAjiYbE1IvSfRfJAlbXMNf65g96nSg/HmUkyW1K14sR36Hptnh7oIqKfiJjrJI19v6D8n1uudvqkxhuWZJAvh970=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a7662647-83bf-4300-9221-08d7ed1c797b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 15:38:04.6924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwH/5KTsjqhhDPZlqQBdgatsFChapAWbXSxA7JIUFJGme8wpa37svy0W6VPN9LZ1jf4FjRKb4PYU+kz2hXbPhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2241
X-OriginatorOrg: intel.com
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
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

PiANCj4gSGksDQo+IHllcyB0aGF0IHNlZW1zIGJpdCB3ZWlyZC4gSXQgaXMgYml0IGJldHRlciBh
cyBpdCBkb2VzIG5vdCBtb2RpZnkgY29tbW9uIGNvZGUsDQo+IGJ1dCBzdGlsbC4uLiBNYXliZSBn
b2luZyBiYWNrIHRvIHlvdXIgb3JpZ2luYWwgaWRlYSBvZiByZXBsYWNpbmcgbWVtY3B5LCB0cnkN
Cj4gcmVwbGFjaW5nIGl0IHdpdGggcmVhZHE/IEl0IHNob3VsZCBnZW5lcmF0ZSBvbmUgaW5zdHJ1
Y3Rpb24gcmVhZCAoYWx0aG91Z2ggaXQgaXMNCj4gb25seSBmb3IgeDY0XzY0LCBmb3IgMzIgYml0
IGtlcm5lbCB3ZSB3b3VsZCBzdGlsbCBuZWVkIHRvIGRvIHNvbWV0aGluZyBlbHNlKS4NCj4gDQo+
IFRoYW5rcywNCj4gQW1hZGV1c3oNCg0KSGksDQoNCkkndmUgY29tcGFyZWQgdGhlIGFzc2VtYmx5
IHRvIHNlZSBpZiB0aGVyZSBpcyBjbHVlLiBCb3RoIGtlcm5lbHMgYXJlIHVzaW5nIDY0LWJpdA0K
bW92IHRvIHJlYWQgcmVnaXN0ZXIgYW5kIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgb3B0aW1pemVk
IG9yIG5vdC4gQm90aA0KaW1wbGVtZW50YXRpb25zIGFyZSBsb29raW5nIGdvb2QgdG8gbWUuIEN1
cnJlbnRseSBJIGRvbid0IGhhdmUgYW5zd2VyIHdoeQ0Kc2xvd2VyIGtlcm5lbCBoaXRzIHRoZSBw
cm9ibGVtIHdoaWxlIG9wdGltaXplZCBvbmUgc3Vydml2ZWQuDQoNCjEuIE9sZCBrZXJuZWwuIENv
ZGUgaXMgb3B0aW1pemVkIGFuZCBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIG9uIHRo
aXMga2VybmVsLg0KDQooZ2RiKSBkaXNhcyBzc3Rfc2hpbTMyX3JlYWQ2NA0KRHVtcCBvZiBhc3Nl
bWJsZXIgY29kZSBmb3IgZnVuY3Rpb24gc3N0X3NoaW0zMl9yZWFkNjQ6DQogICAweDAwMDAwMDAw
MDAwMDA5NmMgPCswPjogICAgIGNhbGwgICAweDk3MSA8c3N0X3NoaW0zMl9yZWFkNjQrNT4NCj0+
IGNhbGwgX19mZW50cnlfXw0KICAgMHgwMDAwMDAwMDAwMDAwOTcxIDwrNT46ICAgICBwdXNoICAg
cmJwDQogICAweDAwMDAwMDAwMDAwMDA5NzIgPCs2PjogICAgIG1vdiAgICByYnAscnNwDQogICAw
eDAwMDAwMDAwMDAwMDA5NzUgPCs5PjogICAgIG1vdiAgICBlYXgsZXNpDQogICAweDAwMDAwMDAw
MDAwMDA5NzcgPCsxMT46ICAgIG1vdiAgICByYXgsUVdPUkQgUFRSIFtyZGkrcmF4KjFdDQo9PiBw
ZXJmb3JtIDY0LWJpdCBtb3YNCiAgIDB4MDAwMDAwMDAwMDAwMDk3YiA8KzE1PjogICAgcG9wICAg
IHJicA0KICAgMHgwMDAwMDAwMDAwMDAwOTdjIDwrMTY+OiAgICByZXQNCkVuZCBvZiBhc3NlbWJs
ZXIgZHVtcC4NCg0KMi4gTmV3IGtlcm5lbDogb2J2aW91c2x5IG9wdGltaXphdGlvbiBpcyBkaXNh
YmxlZCBhbmQgaXQgY2FsbHMgbWVtY3B5IHRvIGRvIHRoZSByZWFkIG9wZXJhdGlvbi4NCg0KKGdk
YikgZGlzYXMgc3N0X3NoaW0zMl9yZWFkNjQNCkR1bXAgb2YgYXNzZW1ibGVyIGNvZGUgZm9yIGZ1
bmN0aW9uIHNzdF9zaGltMzJfcmVhZDY0Og0KICAgMHgwMDAwMDAwMDAwMDAwOWE4IDwrMD46ICAg
ICBjYWxsICAgMHg5YWQgPHNzdF9zaGltMzJfcmVhZDY0KzU+DQo9PiBjYWxsIF9fZmVudHJ5X18N
CiAgIDB4MDAwMDAwMDAwMDAwMDlhZCA8KzU+OiAgICAgcHVzaCAgIHJicA0KICAgMHgwMDAwMDAw
MDAwMDAwOWFlIDwrNj46ICAgICBtb3YgICAgcmJwLHJzcA0KICAgMHgwMDAwMDAwMDAwMDAwOWIx
IDwrOT46ICAgICBwdXNoICAgcmJ4DQogICAweDAwMDAwMDAwMDAwMDA5YjIgPCsxMD46ICAgIHN1
YiAgICByc3AsMHgxMA0KICAgMHgwMDAwMDAwMDAwMDAwOWI2IDwrMTQ+OiAgICBtb3YgICAgcmF4
LFFXT1JEIFBUUiBnczoweDI4DQogICAweDAwMDAwMDAwMDAwMDA5YmYgPCsyMz46ICAgIG1vdiAg
ICBRV09SRCBQVFIgW3JicC0weDEwXSxyYXgNCiAgIDB4MDAwMDAwMDAwMDAwMDljMyA8KzI3Pjog
ICAgbW92YWJzIHJheCwweGFhYWFhYWFhYWFhYWFhYWENCiAgIDB4MDAwMDAwMDAwMDAwMDljZCA8
KzM3PjogICAgbGVhICAgIHJieCxbcmJwLTB4MThdDQogICAweDAwMDAwMDAwMDAwMDA5ZDEgPCs0
MT46ICAgIG1vdiAgICBRV09SRCBQVFIgW3JieF0scmF4DQogICAweDAwMDAwMDAwMDAwMDA5ZDQg
PCs0ND46ICAgIG1vdiAgICBlc2ksZXNpDQogICAweDAwMDAwMDAwMDAwMDA5ZDYgPCs0Nj46ICAg
IGFkZCAgICByc2kscmRpDQogICAweDAwMDAwMDAwMDAwMDA5ZDkgPCs0OT46ICAgIG1vdiAgICBl
ZHgsMHg4DQogICAweDAwMDAwMDAwMDAwMDA5ZGUgPCs1ND46ICAgIG1vdiAgICByZGkscmJ4DQog
ICAweDAwMDAwMDAwMDAwMDA5ZTEgPCs1Nz46ICAgIGNhbGwgICAweDllNiA8c3N0X3NoaW0zMl9y
ZWFkNjQrNjI+DQo9PiBjYWxsIG1lbWNweQ0KDQpUaGUgbWVtY3B5IGlzIGltcGxlbWVudGVkIGlu
IGFyY2gveDg2L2xpYi9tZW1jcHlfNjQuUw0KDQooZ2RiKSBkaXNhcyBtZW1jcHkNCkR1bXAgb2Yg
YXNzZW1ibGVyIGNvZGUgZm9yIGZ1bmN0aW9uIG1lbWNweToNCiAgIDB4ZmZmZmZmZmY4MTM1MTlj
MCA8KzA+OiAgICAgam1wICAgIDB4ZmZmZmZmZmY4MTM1MTlmMCA8bWVtY3B5X29yaWc+DQo9PiBq
dW1wIHRvIG1lbWNweV9vcmlnIGZ1bmN0aW9uDQoNClg4Nl9GRUFUVVJFX0VSTVMgaXMgZGlzYWJs
ZWQgc28gaXQganVtcHMgdG8gbWVtY3B5X29yaWcNCg0KKGdkYikgZGlzYXMgbWVtY3B5X29yaWcN
CkR1bXAgb2YgYXNzZW1ibGVyIGNvZGUgZm9yIGZ1bmN0aW9uIG1lbWNweV9vcmlnOg0KICAgMHhm
ZmZmZmZmZjgxMzUxOWYwIDwrMD46ICAgICBtb3YgICAgcmF4LHJkaQ0KICAgMHhmZmZmZmZmZjgx
MzUxOWYzIDwrMz46ICAgICBjbXAgICAgcmR4LDB4MjANCiAgIDB4ZmZmZmZmZmY4MTM1MTlmNyA8
Kzc+OiAgICAgamIgICAgIDB4ZmZmZmZmZmY4MTM1MWE3NyA8bWVtY3B5X29yaWcrMTM1Pg0KPT4g
anVtcCBiZWNhdXNlIG91ciByZWFkIHNpemUgaXMgOA0KLi4uDQogICAweGZmZmZmZmZmODEzNTFh
NzcgPCsxMzU+OiAgIGNtcCAgICBlZHgsMHgxMA0KICAgMHhmZmZmZmZmZjgxMzUxYTdhIDwrMTM4
PjogICBqYiAgICAgMHhmZmZmZmZmZjgxMzUxYWEwIDxtZW1jcHlfb3JpZysxNzY+DQo9PiBqdW1w
IGJlY2F1c2Ugb3VyIHJlYWQgc2l6ZSBpcyA4DQouLi4NCiAgIDB4ZmZmZmZmZmY4MTM1MWFhMCA8
KzE3Nj46ICAgY21wICAgIGVkeCwweDgNCiAgIDB4ZmZmZmZmZmY4MTM1MWFhMyA8KzE3OT46ICAg
amIgICAgIDB4ZmZmZmZmZmY4MTM1MWFjMCA8bWVtY3B5X29yaWcrMjA4Pg0KICAgMHhmZmZmZmZm
ZjgxMzUxYWE1IDwrMTgxPjogICBtb3YgICAgcjgsUVdPUkQgUFRSIFtyc2ldDQogICAweGZmZmZm
ZmZmODEzNTFhYTggPCsxODQ+OiAgIG1vdiAgICByOSxRV09SRCBQVFIgW3JzaStyZHgqMS0weDhd
DQogICAweGZmZmZmZmZmODEzNTFhYWQgPCsxODk+OiAgIG1vdiAgICBRV09SRCBQVFIgW3JkaV0s
cjgNCiAgIDB4ZmZmZmZmZmY4MTM1MWFiMCA8KzE5Mj46ICAgbW92ICAgIFFXT1JEIFBUUiBbcmRp
K3JkeCoxLTB4OF0scjkNCj0+IHBlcmZvcm0gNjQtYml0IG1vdiB0d2ljZSBvdmVyIHNhbWUgYWRk
cmVzcyAocmR4PTB4OCkNCiAgIDB4ZmZmZmZmZmY4MTM1MWFiNSA8KzE5Nz46ICAgcmV0DQoNClJl
Z2FyZHMsDQpCcmVudA0K
