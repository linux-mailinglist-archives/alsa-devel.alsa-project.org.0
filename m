Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B59C246F7C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 19:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C0016EC;
	Mon, 17 Aug 2020 19:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C0016EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597686476;
	bh=bM0NntWBYNZRe3bRp1N7yIi+IHFLFzld/shxVj94dpE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BuB4zDD2ju644Npcensy4dBOTspChrmETkMhme/YGiGNBM3FB6UuIjWCyKN1fuZWy
	 FzsWnW37E+nwDeAwlsXszonWkevyXQHzy2jU6NYnbAM2fVNfLnzFA6JJ3y8BocfJS7
	 VxgkhpOzNy7BltQREbA2JhrM7JEy3A/Jg40cEai0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20FFAF80216;
	Mon, 17 Aug 2020 19:46:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F53FF80218; Mon, 17 Aug 2020 19:46:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CCF9F800D3
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 19:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CCF9F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="MQkAdLrV"
IronPort-SDR: zIMHj+Pt8i8vLvROifXt29B3zxxFdOyy8tvri0Rc7JWvQCoiCEDN9ULXa/MJ4jxkWRCiTzpIEE
 mofNa93Cz0Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="172816303"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; d="scan'208";a="172816303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 10:46:02 -0700
IronPort-SDR: jDENFQs9nviqHWOFHlCXtxE5U8OkOcoMSK5ol1ndLyogaypt+d0xKm8tSKMCLHsILq4NcV2tmG
 19yqMGh6J8bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; d="scan'208";a="279180780"
Received: from orsmsx603-2.jf.intel.com (HELO ORSMSX603.amr.corp.intel.com)
 ([10.22.229.83])
 by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2020 10:46:02 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 10:46:00 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 17 Aug 2020 10:46:00 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX112.amr.corp.intel.com (10.22.240.13) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Aug 2020 10:46:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 17 Aug 2020 10:46:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3EId2qgG/laHKJQZGUjbALJhL/uEEYOls1ZvHb9aLm0Ho2eSabtiaInAno7wr6eGT0ff4z5Ho/fD4pIQbC8ViK1cHatvft85h/T98oSEvwra/UPH2ED8cmYshSuZSS3lWGHl1TKcBqSCdoioUim8+BKSKxIatw5O8iKPDB99T7AF4yl0YkU5jrEIPOv5IQKF8Rn+A1JAs8bIqvWyGtcZWoR4LSPGc/EMYJvAESXPH+l2DvZQH8jTNmCmbKyuHW0XJ6MPXDWViBs7gtKQAbSqRPKyS5l5NbMYPafiNkYDGvADfecHgpHPOmKpDy6dC7uZyLRzWsgN42jWJvK1MjPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM0NntWBYNZRe3bRp1N7yIi+IHFLFzld/shxVj94dpE=;
 b=BfNC6zwZTkwlkTJzkXKxxv85xpkcHaWHeGlK6BkVuIBQCrFGGlozHA1F64BnNcq5YFn1YGIoOU09Ng7a5SPrOqmGJVVQxDWjGuvx+LFKtwZsXKip3rVcI51LuThxpruJuHB3vxLdeEc/Qu2Mh0FUsrbQSiLqJlCb8/Dl3xdDQ6RLU5rWBtMCsxSNiZD8M7bOp+1RPrzrXityk9GfFEcrw4OxKyNgo84nhVZSWZNEvkLQRMDquRsvU18V4mQCXzYCIYzoDpCoUHec+HpTo8lg3qmpbBnRF83W7VMxs0ITyNcUlEGpQYJaGcWhAhEWfZlV0JeIBUeSkt0XFCTTNfSVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM0NntWBYNZRe3bRp1N7yIi+IHFLFzld/shxVj94dpE=;
 b=MQkAdLrVMSBJ5fHB9uIkSVZHnjPKBoAq0pIWQ2kZD7mu2MD2vaBbqXMX1VmCqcGNXzPoHJnSsflcPbQ/CimNa9yx+YMkbHuu2x/BSI3YIZmN8YKKr4FoM/x/kIGGH5ueWVSjnNuBH/JrpXcZsRmvRaK8BGM5Eb+xjTbPvU7eU8s=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM5PR11MB1881.namprd11.prod.outlook.com (2603:10b6:3:113::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15; Mon, 17 Aug 2020 17:45:59 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::65c9:ac55:7693:e09e]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::65c9:ac55:7693:e09e%7]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 17:45:59 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: Enabling DAPM for Dummy DAIs
Thread-Topic: Enabling DAPM for Dummy DAIs
Thread-Index: AQHWcZT+08Lc3mSa90ukN5oqtaKksKk3jBkAgAUNRAA=
Date: Mon, 17 Aug 2020 17:45:59 +0000
Message-ID: <1a8e6e8872692ea88bd7905ed5ae0e8e2a8c0414.camel@intel.com>
References: <DM6PR11MB290561D66CB13F86B419004CE8430@DM6PR11MB2905.namprd11.prod.outlook.com>
 <20200814123712.GB4783@sirena.org.uk>
In-Reply-To: <20200814123712.GB4783@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.151.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e9135e0-f877-4af1-ef3d-08d842d56705
x-ms-traffictypediagnostic: DM5PR11MB1881:
x-microsoft-antispam-prvs: <DM5PR11MB1881CE53AF29C6A24E834E90E85F0@DM5PR11MB1881.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P0Fnkzqm9LdTf474ip/IWYmLuAsGvHeW3s166INIr+nSHpDV0WLP6zWDtP/9ZEm1tGPNgrIkv30G4dqHREPG4kbk8OIta3X+dqq6ZlbzTBkjqOoppvT8fQPOh1XQJJazR7g7feDrFLJIc6Yu6TWfkXyYriVW7BFtP54/zuS7LavEH78XskHA4lBGDBglqryTwsYXar/IpD1IS5LC0NViC3smN0B+FEMEjxBNMq5M3ejQww+8o/SHPhUgOXVnVvtKf5hX4Qgdy79+/IcyCn8ybUjP5c/kl1HpwPCVKrypdKvP8sXCa+41H0XfJCoG3NueaRcIL0ryNtuR/3ibISe5yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(36756003)(26005)(6512007)(6486002)(6506007)(2616005)(478600001)(86362001)(54906003)(66476007)(83380400001)(2906002)(91956017)(76116006)(66946007)(66446008)(64756008)(66556008)(71200400001)(5660300002)(316002)(6916009)(8676002)(186003)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OfxNb7pXtW9yqiKmeVCi7KCDR9g78w3g99oeDK+4poTgCTS8LTd59AkkyGjzY4Mal0t36C9k3oz9yl9Dqa8+FeOezrgZxiEoUdV6e52knUPnZA7/gTTogSiIDgwwQfoHWmfX4y/ZxG1IGw8SL9I2Jj4hV+krHRDiv61w5XiYyim2xFuMDZF8mwEr29T3Zr0WTcn8QE1P8Q7JWVXf6uIrLh7GUaQ0OCPDltsZ1JPjuyYjloAYwuR/Tm0f+MD/Guq5QwpwDv5D5coA2jr+apKm5oQJyaIjD2m9Ss5ejRQVrfc9FoQyvW+jeP9rXubEZu6UmQRNrH6pdRa28hrRQuBWMikLTSUGeMeELZEGIznE/HzdC+nE0974QIcNzzzdYeUb/s/3KaXD9BEA+4erAQOu/zCNrKdeUi/NtEwEdqpokymeT193WTivh/7ZU5oJ/Xepb/Z1Y3NLi4XJ5a8JSVTngMkzR6B03O1CNEsWOpvKB9OqY7fceKh6M3klCaZDaU9dO/oMCBy2ACE5K++eDzmDvnH7/aOo52KYCm9vlZPsD6pHyHKpfwYep6D5irF8AtCzocWj5FbN68kJy6IozLFvVnqzI7krZ0kAD2NxqZJiqRKNHUoFGwZqUcKvM69JlTjYpK0kId2wRxFVKUFpB6xYVQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CD216C1EE31654BBE117B051FDEB718@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9135e0-f877-4af1-ef3d-08d842d56705
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 17:45:59.5645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EnvgJeg6snDCosg4EM+NXwTDP6jIVJ/bIVLhDe9x7tu/jMDWkEloO36fYif48N3x9KDuw7YBWi5aSXmPoxfpVi5m9usolqyQQ/93LraObrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1881
X-OriginatorOrg: intel.com
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "bard.liao@linux.intel.com" <bard.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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

T24gRnJpLCAyMDIwLTA4LTE0IGF0IDEzOjM3ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBUaHUsIEF1ZyAxMywgMjAyMCBhdCAwNToyMTo0MFBNICswMDAwLCBTcmlkaGFyYW4sIFJhbmph
bmkgd3JvdGU6DQo+ID4gSGkgTWFyay9UYWthc2hpLA0KPiANCj4gUGxlYXNlIGZpeCB5b3VyIG1h
aWwgY2xpZW50IHRvIHdvcmQgd3JhcCB3aXRoaW4gcGFyYWdyYXBocyBhdA0KPiBzb21ldGhpbmcN
Cj4gc3Vic3RhbnRpYWxseSBsZXNzIHRoYW4gODAgY29sdW1ucy4gIERvaW5nIHRoaXMgbWFrZXMg
eW91ciBtZXNzYWdlcw0KPiBtdWNoDQo+IGVhc2llciB0byByZWFkIGFuZCByZXBseSB0by4NCj4g
DQo+ID4gV2hhdCB3b3VsZCB5b3VyIHJlY29tbWVuZGF0aW9uIGJlIHRvIGdldCBhcm91bmQgdGhp
cyBwcm9ibGVtIGluDQo+ID4gU09GPyBUaGFua3MgZm9yIHlvdXIgaGVscC4NCj4gDQo+IEFjdGl2
ZWx5IHVzaW5nIHRoZSBkdW1teSBDT0RFQyBhdCBydW50aW1lIGlzbid0IGEgZ3JlYXQgaWRlYSBh
dCB0aGUNCj4gYmVzdA0KPiBvZiB0aW1lcywgdGhpbmdzIHdvdWxkIGJlIGEgbG90IGVhc2llciBp
ZiB5b3UgdXNlZCBzb21ldGhpbmcgd2l0aA0KPiBhY3R1YWwNCj4gYXVkaW8gcGF0aHMgZm9yIHRl
c3RpbmcgLSBhcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBpc3N1ZSBpcyB0aGF0DQo+IHlvdSd2ZQ0K
PiB0b2xkIHRoZSBzeXN0ZW0gdGhhdCB0aGVyZSdzIG5vdGhpbmcgY29ubmVjdGVkIHdoaWNoIGlz
IHJlYXNvbmFibHkNCj4gYmVpbmcNCj4gaW50ZXJwcmV0ZWQgYXMgdGhlcmUgYmVpbmcgbm8gbmVl
ZCB0byBwb3dlciBhbnl0aGluZyBvbi4gIElmIHlvdQ0KPiBpbnRlbmQNCj4gdGhpcyB0byByZXBy
ZXNlbnQgYW4gYWN0dWFsIGNvbm5lY3Rpb24gaXQgd291bGQgYmUgYmV0dGVyIHRvIHVzZSBhDQo+
IHNpbXBsZSBDT0RFQyB3aXRoIG5vIHNvZnR3YXJlIGNvbnRyb2wgcmF0aGVyIHRoYW4gc29tZXRo
aW5nIHRoYXQNCj4gZXhwbGljaXRseSBtZWFucyB0aGVyZSBpcyBub3RoaW5nIGNvbm5lY3RlZC4N
ClRoYW5rcywgTWFyay4gQnV0IEkgYW0gc3RpbGwgY29uZnVzZWQgYnkgd2hhdCB5b3UgbWVhbiBi
eSBhIHNpbXBsZQ0KY29kZWMgaGVyZS4gV291bGQgdGhpcyBzaW1wbGUgY29kZWMgYmUgcmVnaXN0
ZXJlZCBieSB0aGUgU09GIHBsYXRmb3JtDQpkcml2ZXI/DQoNClRoYW5rcywNClJhbmphbmkNCg==
