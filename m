Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C14282E66
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 01:47:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9CA1827;
	Mon,  5 Oct 2020 01:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9CA1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601855267;
	bh=4CfPQWa5yXlAk5GTQoC++qyjf6bfgLyJzMpCzijPXDE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIuqRVQwJN/WT5TRzQX+HAK9hQdDvTzWhQ1gpfPcEpurkiNEuKBGAP79yV4ivlXxR
	 6ww7KPZJso0H0VN2yknf5V2oW7e6H35zp3dMR1SxVvK0STeaWsFxGQ3IUnTDwh8ZoD
	 rJfLUiDXwVzmwl/aC8DhYH86/1q/DFmC0woVQi8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F10E7F80121;
	Mon,  5 Oct 2020 01:45:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF895F80246; Mon,  5 Oct 2020 01:45:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4C67F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 01:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4C67F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="aMZJczW3"
IronPort-SDR: fbHsQbociUTUDheCuHfdK4H+DRwVWIqzR5DO7s0jfHV/sZRWGPc1hCuqURp+cRQB0PHwCWW9d6
 CE5C2Lksdwyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="142703048"
X-IronPort-AV: E=Sophos;i="5.77,337,1596524400"; d="scan'208";a="142703048"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 16:45:46 -0700
IronPort-SDR: OARE4c7PsX7OMl+bGM787W5n+8vi0ddZIFK5V9Zsn7vi0EQXIC8LyS0B8NnlzJ6a7la60DF2x/
 QSqibzDu6gOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,337,1596524400"; d="scan'208";a="416944042"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2020 16:45:46 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Oct 2020 16:45:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Oct 2020 16:45:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 4 Oct 2020 16:45:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 4 Oct 2020 16:45:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvsxbaltSWAXheRPLZs/ZSF3uG3piL4RcFXU4ZwqwM49liIqAMjNipWKaKBKEkHIzcQVIYFCd4uA51pO3gPT6hdaSnNse67IvFgptEEta+8L2cmN9YFT79FW7TK6QZ6HqDTskitJ6T82QaF6tw9R1zLjSOs2htpq6IfGucR9e1aQsWj/xMcOEbqaAw4+56ua49nqyciCs05y9fSCleKsUKbT9uNjzpjF+n293R6VbjsXAb6whmIU8qY9uIW3lvLIsERvbBKsDallAei/hJQD//cT/kYuQx5zsGu9kfAgD53gx6emXjQRj8zVStDm/VOZBmviTgYAyHsfvHkDXWpFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CfPQWa5yXlAk5GTQoC++qyjf6bfgLyJzMpCzijPXDE=;
 b=Vk3qEBcAC120AYzxMYxFSDIPmAAwEvMlOlK4/pMlmq80qpETsg5gu3Fu/gDw69pLR0dlcYEfBN0XQyMkMXarQeyKmfARRzNryE7vE8xNvwiiBhvCWXf8IUd9qPRWudaRvU9aU1Virdpo0mi5GUc81AwSFg65kKUvU0OgKy47Bjd6IL/5LsibHM4PVjTJcfjV56/SAM7Idvh2+tFSwR33LPWXmUY4o2QfoNSCOybCq4Tc3KS3ZBkY5okvyE39IaqVH+ebk5zN9fAbwLTrBsC72/MysyiVBL3oQx6IbyFF22CtLhgfzcxbi0//o/DQRv6Zwi0km7WSQebULV6SKP52Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CfPQWa5yXlAk5GTQoC++qyjf6bfgLyJzMpCzijPXDE=;
 b=aMZJczW36AdzQA7JAv3kMqaVSUNddhb5YCVM+QuxxPGVTyasJSikZLNnY3PwNlyDVjO+2V/p6gObt3PGN4I42Xn9s890RAvbWn91ePtMYZvpvh6CZ/oKnjw42cDSOqG86NaalOHJf1ozGx/GAFQCGl1XEbSznM55mcQ5AegIj5c=
Received: from BN6PR11MB4132.namprd11.prod.outlook.com (2603:10b6:405:81::10)
 by BN6PR1101MB2354.namprd11.prod.outlook.com (2603:10b6:404:9b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Sun, 4 Oct
 2020 23:45:41 +0000
Received: from BN6PR11MB4132.namprd11.prod.outlook.com
 ([fe80::8189:cff:4996:ef83]) by BN6PR11MB4132.namprd11.prod.outlook.com
 ([fe80::8189:cff:4996:ef83%6]) with mapi id 15.20.3433.043; Sun, 4 Oct 2020
 23:45:41 +0000
From: "Williams, Dan J" <dan.j.williams@intel.com>
To: "Ertman, David M" <david.m.ertman@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWmqh3VcQdpLURHUWLLdHwMyffCA==
Date: Sun, 4 Oct 2020 23:45:41 +0000
Message-ID: <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
In-Reply-To: <20201003090855.GD114893@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cab6ed56-c164-42eb-a583-08d868bf9a8d
x-ms-traffictypediagnostic: BN6PR1101MB2354:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB235466C23F1047299A90F2BAC60F0@BN6PR1101MB2354.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DIyFtVEapq4IvXWvphAb67cuZZMkpNOOyahLpuL+aRbb6aEgf0z63EZTQcA/jMdZl8JGgnrfEF0bNiou/eYyIAG3A65iuZa5lAK4ONGWc0DCcwEluxFQUGptRUulJP/N1OopdGc0jDF4rQEjAopRLczwBptRN7slFlRlZlUg6bF9ZtXto+jf693NPsDYbJK0CsNUTwvkQpKPglgScM2qf6s6cTs22zY6Ic1jCkh50lcJvWLmrGW/bdltNGkS7WBXfg0w2QvYx6+TKZBkoijaI65buqnQvteuClVmeSLGbkSVwgDdbWHbnCn3QaHc2A08F6gda+hOxh8bqceAAskOfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(2616005)(91956017)(76116006)(8676002)(5660300002)(478600001)(6512007)(316002)(66556008)(6486002)(6506007)(66446008)(64756008)(66476007)(186003)(66946007)(110136005)(54906003)(86362001)(4326008)(2906002)(36756003)(8936002)(71200400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: L5C6IUfQd28n2wzNfEqw55gKCCkfxetj8ndBO2uhg0ZYcgni/LxYoJspSZ4byjg0aYLXqf+yZLOlhPAm70ZzSmEGq2YxuMCp9W4uXUkL+noojjzgCewOaAlgyO+uq5bOxhlJR2h11QvA6jNtBij6guHwcIdbL2n0C0p9Z9/QgiQcy6Zkxhb4gSZgXpwMzzWxxzfPCTzSSzPEM42IC4z1AfUbKzlNOEizuFWPqql5mS3CUGUOcOVQY2CLThNlTtcEZBzm2ATiceYcl7s3Mxit1bFp/aWNkRZ6Hk+7ydR2gVYK6fJfzhe7iTV8KZopKSOjmf2zmA+y9705HL3U/yxEg3jH3OlSZMdOGAhfU0HjrqpG33U7Zl/igY58eyTdx+nrIX7MUWH4DF33LUrh602dXJxWYCvA8Lvvc+XQMRk5zY9GYe+F88KlmeYcGv05q/FTfOZa62VjRX1sRM6RZFRB6+Ko6YzSRwQUKDfynWFOOPChmqr60srgc+FMC7t7VSOMnTNcAFt+ahZdHAIs8bz+UfqnXZWxY9mgBKapWzTje6TFVANJcV11d0Xm+owbaCh5DWGsmCu5BrC6UJVCqILNZ4uObKuC+exufpk0ORazmO/e6pnQvw6HbMU3LgE8avU8URImH0bPCbZybXZQUhzjNw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <006D1547BFCBB9459CE2A1CD1F0B4C55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab6ed56-c164-42eb-a583-08d868bf9a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2020 23:45:41.3242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guALBEPn8/iN15qLvAxSq2qmOCmZXpIxyAQvDTdptKeTHOg1ToORFH2juOOKVhW3Tn/otmI64sgo/eMuoREjuRgWSM8roAhLD8mpmUmdkzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2354
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

WyBVZ2gsIGFzIG90aGVyIGhhdmUgbGFtZW5ldGVkLCBJIHdhcyBub3QgY29waWVkIG9uIHRoaXMg
dGhyZWFkIHNvIEkNCmNvdWxkIG5vdCByZXNwb25kIGluIHJlYWwgdGltZS4gTGV0IG1lIGJlIGFu
b3RoZXIgdG8gc2F5LCBwbGVhc2UgY29weQ0KYWxsIGltcGFjdGVkIGxpc3RzIGFuZCBzdGFrZWhv
bGRlcnMgb24gcGF0Y2hlcy4gXQ0KDQpPbiBTYXQsIDIwMjAtMTAtMDMgYXQgMTE6MDggKzAyMDAs
IEdyZWcgS0ggd3JvdGU6DQpbLi5dDQo+IA0KPiA+IFNldmVyYWwgbmFtZXMgd2VyZSBzdWdnZXN0
ZWQgKGxpa2UgcGVlciBidXMsIHdoaWNoIHdhcyBzaG90IGRvd24NCj4gPiBiZWNhdXNlIGluDQo+
ID4gcGFydHMgb24gdGhlIEVuZ2xpc2ggc3BlYWtpbmcgd29ybGQgdGhlIHBlZXJhZ2UgbWVhbnMg
bm9iaWxpdHkpLA0KPiA+IGZpbmFsbHkNCj4gPiAiYW5jaWxsYXJ5IGJ1cyIgd2FzIGFycml2ZWQg
YXQgYnkgY29uc2Vuc3VzIG9mIG5vdCBoYXRpbmcgaXQuDQo+IA0KPiAibm90IGhhdGluZyBpdCIs
IHdoaWxlIHNvbWV0aW1lcyBpcyBhIGdvb2QgdGhpbmcsIGZvciBzb21ldGhpbmcgdGhhdA0KPiBJ
DQo+IGFtIGdvaW5nIHRvIGhhdmUgdG8gdGVsbCBldmVyeW9uZSB0byBnbyB1c2UsIEkgd291bGQg
bGlrZSB0byBhdCBsZWFzdA0KPiAibGlrZSBpdCIuICBBbmQgcmlnaHQgbm93IEkgZG9uJ3QgbGlr
ZSBpdC4uLg0KPiANCj4gSSB0aGluayB3ZSBzaG91bGQgZ28gYmFjayB0byAidmlydHVhbCIgZm9y
IG5vdywgb3IsIGlmIHRoZSBwZW9wbGUgd2hvDQo+IGRpZG4ndCBsaWtlIGl0IG9uIHlvdXIgImlu
dGVybmFsIiByZXZpZXdzIHdpc2ggdG8gcGFydGljaXBhdGUgaGVyZQ0KPiBhbmQNCj4gZGVmZW5k
IHRoZWlyIGNob2ljZSwgSSB3b3VsZCBiZSBnbGFkIHRvIGxpc3RlbiB0byB0aGF0IHJlYXNvbmlu
Zy4NCg0KSSBjYW1lIG91dCBzdHJvbmdseSBhZ2FpbnN0ICJ2aXJ0dWFsIiBiZWNhdXNlIHRoZXJl
IGlzIG5vdGhpbmcgdmlydHVhbA0KYWJvdXQgdGhlc2UgZGV2aWNlcywgdGhleSBhcmUgZnVuY3Rp
b25hbCBwYXJ0aXRpb25zIG9mIHRoZSBwYXJlbnQNCmRldmljZS4gQWxzbywgL3N5cy9kZXZpY2Vz
L3ZpcnR1YWwgaXMgYWxyZWFkeSB0aGUgbGFuZCBvZiB1bnBhcmVudGVkICAvDQpzb2Z0d2FyZS1k
ZWZpbmVkIGRldmljZXMuIEhhdmluZyAvc3lzL2RldmljZXMvdmlydHVhbCBhbG9uZ3NpZGUgdGhh
dCBpcw0KIG5vdCBxdWl0ZSBhIG5hbWVzcGFjZSBjb2xsaXNpb24sIGJ1dCBpdCdzIGNlcnRhaW5s
eSBuYW1lc3BhY2UNCmNvbmZ1c2lvbiBpbiBteSB2aWV3Lg0KDQpJIHByb3Bvc2VkIG90aGVyIG5h
bWVzLCB0aGUgdGVhbSBjYW1lIGJhY2sgd2l0aCAiYW5jaWxsYXJ5IiB3aGljaCB3YXMNCm5vdCBt
eSBmaXJzdCBjaG9pY2UsIGJ1dCBwZXJmZWN0bHkgc3VpdGFibGUuIEluIGRlZmVyZW5jZSB0byB0
aGUgcGVvcGxlDQpkb2luZyB0aGUgd29yayBJIGxldCB0aGVpciBjaG9pY2Ugc3RhbmQuDQoNCkl0
IGlzIGFuIHVuY29tZm9ydGFibGUgcG9zaXRpb24gYmVpbmcgYSBtaWRkbGUgdGllciByZXZpZXdl
ciBvZiBwcmUtDQpyZWxlYXNlIHBhdGNoIHNldHMgd2hlbiB0aGUgcGF0Y2ggc2V0IGNhbiBzdGls
bCBiZSBkZS1yYWlsZWQgYnkNCnByZWZlcmVuY2Ugbml0cy4gQSBsYWNrIG9mIGRlZmVyZW5jZSBt
YWtlcyBpdCBhIGRpZmZpY3VsdCBqb2IgdG8NCmNvbnZpbmNlIHBlb3BsZSAiaGV5IG15IGludGVy
bmFsIHJldmlldyB3aWxsIHNhdmUgeW91IHNvbWUgdGltZQ0KdXBzdHJlYW0iLCB3aGVuIGluIHBy
YWN0aWNlIHRoZXkgY2FuIHNlZSB0aGUgb3Bwb3NpdGUgaXMgdHJ1ZS4NCg==
