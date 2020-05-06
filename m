Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8219D1C659B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 03:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C331774;
	Wed,  6 May 2020 03:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C331774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588729208;
	bh=+2BFkZMv5X64f4F8ErjSvh20LWxNnk+jMtZsy0gMSoM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHSkoUFxxmANTiUdnFAiQDguAreuVArrh5YnvXrdhHNCN2ZaSlm6l8XP/JLJBRMwk
	 ua/EWiwWUNe7hBQXuorOyN2ekSzeM8JIc0KymOrI7jbrvdko7YRXMIL9oGxYpITglt
	 jnyVMzFiFH/vuri2rl+OFmbHqq/UEPurKrGicoWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D574F800DE;
	Wed,  6 May 2020 03:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09ED2F80249; Wed,  6 May 2020 03:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82631F800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 03:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82631F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="JJUjI8ws"
IronPort-SDR: IrX2QxsGO20V0ooHdI90sGv5rjugTSO8eThUJuBH51eYXCezvL0fBzT6qsAPIN8X7npRZbvDJ9
 7/B908ioF0Hw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 18:38:14 -0700
IronPort-SDR: S32P4iZKpsKM/lKfsX8PB++dyXBgKRNpiYk+LuKAIMFc9CvCf0VytmJTyOtA90ObkuNnKjyKIP
 U27MELUJxe2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,357,1583222400"; d="scan'208";a="296026532"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga008.jf.intel.com with ESMTP; 05 May 2020 18:38:14 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 5 May 2020 18:38:13 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 5 May 2020 18:38:13 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 5 May 2020 18:38:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 5 May 2020 18:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt0e4TInvjfWXVUqjK8YgRdr+FdTug5HAoeortjzkC/+ozo7pALaTJ3R5MeDckudjDei1hJUp2nvPEKxnpT5sLVQHHznSis0weRfH8SHtUtHGK32cOVA4SwtXm/0WtBthhXPU9nzSAh1zZ8MkLo9fYBOqVkI9lF92WE+2vA7bqSok67J4ZVJ3LqCOJllZUO4FsyzBuXh57mmPwzTqXy5EbSYf64X+13lUomKhH2FUfJCWUtMkW/nygbHPLiT4ehZRKM3FnBEdJYxFHiAP1QvCNWMILuWKAn8hFSuR2ZNq82kQ2+0+gQ8VCSj/Zk+hTyvVzf3bVrWy/EnnaWzPQ3Gsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2BFkZMv5X64f4F8ErjSvh20LWxNnk+jMtZsy0gMSoM=;
 b=BjpqlbAjVV5iwg5//fh/UUqjDTWM1nzXVFYtk/Vmber66vr5A12dGQS4ELuBG21y/TNVjbG9YzxWZvzk4xNUVfnyPIUhogm/O0wdD6xsSzMLTZweU7ygis7VGXmsFtOLDRBR9MDkh+gkFAzhqR6T1lPkP1Du0e7SQ5Smf7hkX7B6tZGSHIUx36i3OrWtr/AdExiFHCkejRyj56dJsepk/2LHccS6eQfxRhjLvzfOU/3td+tjadGkVJXoY+ge+C+99aGjZIGBokStX0df34ATUQb4vGfyLddzsgQo3eZkV12voFPXtSGzOlm0g1l9xtKTT06H0gaibK6egw64UvY8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2BFkZMv5X64f4F8ErjSvh20LWxNnk+jMtZsy0gMSoM=;
 b=JJUjI8wsvsCfknQ1fCYJ1N1nbyNbAdJmy88ptlkoDoMMQRKhz8ViyVuiTOKm2r1BJIaXWq4Rh2ITsmrxdJIk3iJXQ8azSRcJMqExchk9h3jOecevklm0iWUFPywiRdbTXvVgfRywbmwnI53kG4gvviGWxj35Gf5GDOwtfpkW1L0=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2116.namprd11.prod.outlook.com
 (2603:10b6:405:58::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.26; Wed, 6 May
 2020 01:38:07 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27%5]) with mapi id 15.20.2979.027; Wed, 6 May 2020
 01:38:07 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, "Rojewski, Cezary"
 <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Topic: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Index: AQHWDxGPcERmvVi2FUaZ0GDzXVeqv6h4uesAgAAAnRCAAFQWgIAEY1sggAkDsACACG0YUIABciOAgAFISrCABjAVgIACoPSA
Date: Wed, 6 May 2020 01:38:07 +0000
Message-ID: <BN6PR1101MB2132246F9496A9CE1A99627397A40@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
 <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <5e84c48c-a5d1-b2ff-c197-5efa478c5916@linux.intel.com>
 <BN6PR1101MB2132D23B042284DDA667642A97AC0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <9d003948-a651-9920-86b6-307e912dd8ed@linux.intel.com>
 <BN6PR1101MB21325FA4FB1446DC2CAF6C6797AA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <a0648aff-1c85-cc76-650c-1880381c026f@linux.intel.com>
In-Reply-To: <a0648aff-1c85-cc76-650c-1880381c026f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.10.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0ef091c-c8b1-4fa1-74b2-08d7f15e20df
x-ms-traffictypediagnostic: BN6PR1101MB2116:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB21161BF6A971E0551A64783197A40@BN6PR1101MB2116.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eRrc1RCrUc+I2Wxa9HHz2O7ICDRpov9BzehfUvwsjvkw4UAI23gdJK33Rad4QbUMadfxiCGegUdvkbkO4/uCurocJBMgtVLz25vvGrqyCoiknDaCroQmPQwsMba/kD8/06FfbnXW/cohrZGKS45v5Zt3YtJeekhOeRzXtmoku9ZsM2oYJR6Tc4zJw5riobQoOMlX5dSkVjQoAkS2/dKuwQqT+3ThNgCeWqdikIf/X4fkmy23cFNha4RmTAxfODfaZwyj4p/ksAf/JSM564m85PU3FQZKh8gmdJAmVJTzGs/qHK1zv8VevZ2NCRiuxUWoMoUSGsQWH/D5bWb53Z229nJcFbPRJLz9yzojN6f+Ltz2iQAy5qGS5/Jw8jSzpNGB6OwEAkgGoDuX0gU3oQWN0ePSP8/6UOQHHWWapdzub/xOjHoP2+IT/YWuXMi0hgKa9XAFVrkQjrHle7ybl948hPnL0JZM/SpgGoY6LtFQEu4RTgUzHciLoAlIVfyhDNLbCvWC3FIrVWXZUdt2gqt3oA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(136003)(366004)(396003)(346002)(33430700001)(186003)(9686003)(8676002)(26005)(66946007)(6506007)(76116006)(316002)(7696005)(7416002)(66556008)(66476007)(55016002)(64756008)(33440700001)(8936002)(33656002)(66446008)(5660300002)(2906002)(4326008)(478600001)(110136005)(52536014)(71200400001)(54906003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 7vJ/ZWmWafPs5bltS90jZ9lVFGG8y2cjXmOa2nDQmv5yD0eSOn0lB9jJWrFCEaQimji6JijlKkIxD6qzZ4BBsZhxwgSnjvSNcsunEvOueGWE9r/cfPgLHB1qM1vbg4SZXTYNllTDK8IJU40Yz05L1yxvwBnG13ol1z0iAFlKIu87IZL/LaSrg6yzNEtZe4r8h+CLALSFGcyY9qrXOwtGi3rd8Hk7Nh78ctBg8QARe2kpJNW+k8hkYeoENMP25JJc7ZkSkttQq7KefF5QgujM1O6AeyvLG+Pc7S1M0IuhRPHxOTDUdeQzxEhGMFoeVzK5lk1vOIBraGxHOip/hQ0wlWau3hyrHdT7HnTmnHvXAYv9TX2+uiwBnsPScV94567DXyYlr1EVJg9D7LahslF+Qw8EhbPZqyX0DL3SiZYR226yEFQuglJsRbNLrQVf2MOMtK8InG9YOG16xEupvcFlNMBz3HCeRWHm9o1L3s1ep+DmMjIrWd9EIa5piYzv2c18usqmT4FztWrqDoTmXzpMtUoKEbV8DtrYzlcxT8CeguwWiPRyVqfaS7DNPzbKzhql1tr6E6kxiA15lXtHYAAUGtID+szzTZA4uNEHIFDAX3PSLNEDm/1mEV+S9/vY/KqGHLkliU1VGrk7Mj1m8JL/QjrX4LqCe0hbE/LMaqxsg9dvDkrZ1QrVmOJ320ZLbJCVsHakHizTZT7WPNS3sKJjmeadGTcyanadUhlZ176nJ5n0ZQ/oFyzmwel4Jx3qLc8aLL/B2wWWBSatrjVdczo4WVKFZuS3uuqNh1kxIrFO5dY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ef091c-c8b1-4fa1-74b2-08d7f15e20df
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 01:38:07.5580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+P3wO+L7EoOfV37jZll29MrR1nFW2ktM5fKeGQ+WA/+6bWUVHEmfYVJWzYZCfmB7DYt9i7WxM4rWj1pRBZEcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2116
X-OriginatorOrg: intel.com
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jie
 Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

PiANCj4gSGksDQo+IA0KPiBUaGF0J3Mgd2h5IEkgd291bGQgc3VnZ2VzdCB0cnlpbmcgd2l0aCBy
ZWFkcSwgaXQgc2hvdWxkIGFsc28gZ2VuZXJhdGUgb25lDQo+IGluc3RydWN0aW9uIHJlYWQgeDg2
XzY0IHBsYXRmb3JtcywgSSBsb29rZWQgYSBiaXQgbW9yZSBhbmQgdGhlcmUgaXMgZmFsbGJhY2sg
dG8NCj4gZ2VuZXJhdGUgdHdvIDMyIGJpdCByZWFkcyBvbiAzMmJpdCBwbGF0Zm9ybXMsIHNvIG15
IHByZXZpb3VzIGNvbmNlcm4gYWJvdXQNCj4gaGF2aW5nIHRvIHdyaXRlIHNlcGFyYXRlIGhhbmRs
aW5nIGZvciB0aG9zZSBwbGF0Zm9ybXMgd2FzIHVubmVlZGVkLiBTbyBJDQo+IHdvdWxkIHJlY29t
bWVuZCBjaGVja2luZyB1c2luZyBpdC4NCkhpLA0KDQpUaGUgcmVhZHEvd3JpdGVxIHdvcmtzLiBD
b2RlIGlzIG9wdGltaXplZCB1bmxpa2UgbWVtY3B5X2Zyb21pby9tZW1jcHlfdG9pbw0KYW5kIHRo
ZSBkZWZlY3QgaXMgbm90IGFibGUgdG8gcmVwcm9kdWNlLg0KDQooZ2RiKSBkaXNhcyBzc3Rfc2hp
bTMyX3JlYWQ2NA0KRHVtcCBvZiBhc3NlbWJsZXIgY29kZSBmb3IgZnVuY3Rpb24gc3N0X3NoaW0z
Ml9yZWFkNjQ6DQogICAweDAwMDAwMDAwMDAwMDA5NmMgPCswPjogICAgIGNhbGwgICAweDk3MSA8
c3N0X3NoaW0zMl9yZWFkNjQrNT4NCiAgIDB4MDAwMDAwMDAwMDAwMDk3MSA8KzU+OiAgICAgcHVz
aCAgIHJicA0KICAgMHgwMDAwMDAwMDAwMDAwOTcyIDwrNj46ICAgICBtb3YgICAgcmJwLHJzcA0K
ICAgMHgwMDAwMDAwMDAwMDAwOTc1IDwrOT46ICAgICBtb3YgICAgZWF4LGVzaQ0KICAgMHgwMDAw
MDAwMDAwMDAwOTc3IDwrMTE+OiAgICBtb3YgICAgcmF4LFFXT1JEIFBUUiBbcmRpK3JheCoxXQ0K
ICAgMHgwMDAwMDAwMDAwMDAwOTdiIDwrMTU+OiAgICBwb3AgICAgcmJwDQogICAweDAwMDAwMDAw
MDAwMDA5N2MgPCsxNj46ICAgIHJldA0KRW5kIG9mIGFzc2VtYmxlciBkdW1wLg0KKGdkYikgZGlz
YXMgc3N0X3NoaW0zMl93cml0ZTY0DQpEdW1wIG9mIGFzc2VtYmxlciBjb2RlIGZvciBmdW5jdGlv
biBzc3Rfc2hpbTMyX3dyaXRlNjQ6DQogICAweDAwMDAwMDAwMDAwMDA5NWIgPCswPjogICAgIGNh
bGwgICAweDk2MCA8c3N0X3NoaW0zMl93cml0ZTY0KzU+DQogICAweDAwMDAwMDAwMDAwMDA5NjAg
PCs1PjogICAgIHB1c2ggICByYnANCiAgIDB4MDAwMDAwMDAwMDAwMDk2MSA8KzY+OiAgICAgbW92
ICAgIHJicCxyc3ANCiAgIDB4MDAwMDAwMDAwMDAwMDk2NCA8Kzk+OiAgICAgbW92ICAgIGVheCxl
c2kNCiAgIDB4MDAwMDAwMDAwMDAwMDk2NiA8KzExPjogICAgbW92ICAgIFFXT1JEIFBUUiBbcmRp
K3JheCoxXSxyZHgNCiAgIDB4MDAwMDAwMDAwMDAwMDk2YSA8KzE1PjogICAgcG9wICAgIHJicA0K
ICAgMHgwMDAwMDAwMDAwMDAwOTZiIDwrMTY+OiAgICByZXQNCkVuZCBvZiBhc3NlbWJsZXIgZHVt
cC4NCg0KDQpSZWdhcmRzLA0KQnJlbnQNCg0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9p
bnRlbC9jb21tb24vc3N0LWRzcC5jDQo+IGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtZHNw
LmMNCj4gaW5kZXggZWM2NmJlMjY5YjY5Li5lOTZmNjM2Mzg3ZDkgMTAwNjQ0DQo+IC0tLSBhL3Nv
dW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWRzcC5jDQo+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9j
b21tb24vc3N0LWRzcC5jDQo+IEBAIC0zNCwxNiArMzQsMTMgQEAgRVhQT1JUX1NZTUJPTF9HUEwo
c3N0X3NoaW0zMl9yZWFkKTsNCj4gDQo+ICAgdm9pZCBzc3Rfc2hpbTMyX3dyaXRlNjQodm9pZCBf
X2lvbWVtICphZGRyLCB1MzIgb2Zmc2V0LCB1NjQgdmFsdWUpDQo+ICAgew0KPiAtICAgICAgIG1l
bWNweV90b2lvKGFkZHIgKyBvZmZzZXQsICZ2YWx1ZSwgc2l6ZW9mKHZhbHVlKSk7DQo+ICsgICAg
ICAgd3JpdGVxKHZhbHVlLCBhZGRyICsgb2Zmc2V0KTsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJP
TF9HUEwoc3N0X3NoaW0zMl93cml0ZTY0KTsNCj4gDQo+ICAgdTY0IHNzdF9zaGltMzJfcmVhZDY0
KHZvaWQgX19pb21lbSAqYWRkciwgdTMyIG9mZnNldCkNCj4gICB7DQo+IC0gICAgICAgdTY0IHZh
bDsNCj4gLQ0KPiAtICAgICAgIG1lbWNweV9mcm9taW8oJnZhbCwgYWRkciArIG9mZnNldCwgc2l6
ZW9mKHZhbCkpOw0KPiAtICAgICAgIHJldHVybiB2YWw7DQo+ICsgICAgICAgcmV0dXJuIHJlYWRx
KGFkZHIgKyBvZmZzZXQpOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQTChzc3Rfc2hpbTMy
X3JlYWQ2NCk7DQo+IA0KPiANCj4gVGhhbmtzLA0KPiBBbWFkZXVzeg0K
