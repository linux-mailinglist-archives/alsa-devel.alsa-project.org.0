Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5392D233937
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 21:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F4D1672;
	Thu, 30 Jul 2020 21:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F4D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596138303;
	bh=vBuZYJkIstsh/ZO72IodfiM9y7eEW4rbnxyWU/eWX1c=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvpwN99ZL10JN01aYaGGkB/kNDw94iVOkqf6Pq//KkOhvY+d7f0mdtAMxzOpzU5ma
	 43xVKFx1rrslA2S/m9mlcEP2M/KeM1FWnC1mTuWwkSPyp7bNWBRSlCugn0rxs3+xV7
	 ke+czyEUwwLrai2TbNuOyLKZPL9sK3iZMwZjTgJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 916DCF8012F;
	Thu, 30 Jul 2020 21:43:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC94F80240; Thu, 30 Jul 2020 21:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 623D9F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 21:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 623D9F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ZBBeTiB1"
IronPort-SDR: 2cYLtU5fvWDo+olNgVM4NJwnhh+W0FgOHDeK8NsGXHZkCTuelKK+4XMBPznkWigZo18jtlXW1c
 6gxL4sqxMeSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="131250116"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="131250116"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 12:43:35 -0700
IronPort-SDR: oM+P4Nt/zAAmZ+lVDWMUFLG54rWlEaRhlj1eM9S2/33FM6TPBP2ZKxzHG70snkmPnCNWNlw1/0
 TFKiYD80heNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="395095582"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2020 12:43:32 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 12:43:32 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 12:43:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 30 Jul 2020 12:43:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IySVaUVY9AjNY+H/mXM9RQvPT1FPvt42yrZ2uaI4HNXw0uDpzUnrrkhjYcfUW+uAAaZRNUVe+0BG2L57ASwQi+hA5knn+hn3x60swGyhhr3wWXqQEBQgXNBQwhmNuEK2UAz/UOOg4FoMphyK83lXAyn74M2cXbn5GaUT+rCgpwPz/dzXv9A6Gw91SH86ejkIed9HPrDZEa8IiB/UMyMSlVbKVeJp8k9Uh8JCtufBcYCzGzZQAPKXCbizBlqDfvzHdcO4PAPWtlShqlxSpVY88+En8yLd8GwwkNEZGtvEHKwMCX5J/0RVbDDs/R3jmCUWBGwa/AsFyd5A9gDr5keGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBuZYJkIstsh/ZO72IodfiM9y7eEW4rbnxyWU/eWX1c=;
 b=hVr3f9msp4vcI4GzHqGf1+c0WMwkEsdoWHe+kAt+nRC8z1NEwcgep6e93PPKQ9UmTPVD4JthCYLR3N3jIe8/EgK2A3U5TlaHIpJtKaxzrsWUSwkNmfeXUQP5kXLqJ4dLHlkn6doBFrhsX3H/HJ1AD6nL9tLRw1NMDchyhYvmzyXajQG/5O19noLZ796iZT6iiSuP5ljazkC4X376PvhO7Syb7G6tOV3q6mFCGT82373CoxBNQ+aH3aQNQnDwi632ZNDgqqdxUHn2gUm1/1j0tSJJ64/RLvlEmxZ7VYLJxXevGC+5JJPwGhVKr6vstUQThSob0LOoLz274GydMnOtlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBuZYJkIstsh/ZO72IodfiM9y7eEW4rbnxyWU/eWX1c=;
 b=ZBBeTiB1oSii6FHXSHtpAMMgaqaktdsi1ILC3ZbRYYlPHpeaI4RNLqUfusKkEWx0D5mQJ9eLw8XY4mLNwJoiiD1BsY1W2eIGcC6csByM8c5ZwnnCbRgcg+vWXCvIws9vw/5GFq2jlqKUDO9euVP1IBGHjrpCspTZdMQ71FuwQQk=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB3351.namprd11.prod.outlook.com (2603:10b6:a03:7c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 19:43:30 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 19:43:30 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Topic: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Index: AQHWZpabwQv8AEaOYUq8HJOMkq6/wqkgYrOAgAAMXdCAAATggIAAERxA
Date: Thu, 30 Jul 2020 19:43:30 +0000
Message-ID: <BY5PR11MB43079D50776444A1C0FBAD57FD710@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
 <2788f0fd-adaa-c56d-6801-503432ba7ee6@linux.intel.com>
 <BY5PR11MB4307932CDA8DD4C0F594BCA2FD710@BY5PR11MB4307.namprd11.prod.outlook.com>
 <8cd83872-c6d3-faf2-bd1a-963af90d7d2a@linux.intel.com>
In-Reply-To: <8cd83872-c6d3-faf2-bd1a-963af90d7d2a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [24.23.139.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19f0dec8-49c5-403c-fd4d-08d834c0d66d
x-ms-traffictypediagnostic: BYAPR11MB3351:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB33515D378AE32460A43BDEC7FD710@BYAPR11MB3351.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aq+G0l3c0NGVngj3P/FPZ2UjBIFvd8mbPoJ2lPZxRmx0PopAm46k44Dq/2ayIQlKJRVtAho4HdI6sQh5StOi8aPqja3rAT10jxQXDhRF/Wil3ICD2wp8ZUtpl+yxGI/Z/cDSdhhTH/MDDk70bErz+kcCOic0lIn6BOBMWkviwWTMKjgkOGFwWDGUkutkDjXynB6LcMxo21hIkzWjgc9yfecEx8HLJxzKBvoZi53Y4EeBKsRUV6vogoa8QqR4f+ihERrBAKqrwTeEp5RQy8nARhSQp51Oh+G1+V0kX9/KkROLftMYDcxk76jy562i7oJR/DrLDokUehcmL2QklKYiCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(478600001)(4326008)(6506007)(186003)(7696005)(26005)(86362001)(83380400001)(76116006)(54906003)(66556008)(33656002)(9686003)(55016002)(316002)(66446008)(66476007)(66946007)(64756008)(5660300002)(71200400001)(52536014)(110136005)(8676002)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tjR2NY+CbvKPx49Tp4AEQM8pzVVxFeGoVnDH2uNoJolzIMvdMtgjntq6vRV6hhI6warO3q5CeqbbrdYMv8ShlQ+dYLZH4TyqEX4YnXmjfsPrhE3CWTHVujdZBOVZhIEaroi2fRgJg/oMgKON8GzdDFO7tQRqWP+7h5U1QHQkNfFylv5zKzyNmZJ/a8fihqSv1OngueBjNRCUpr0okCTYDsQ99E1sBnb599xRPwc0rjjtHHTc/2M5l2McEvHrXc3+AulRa3oBrxxaXQZfYxndiSyoGBBi9kw7QAzQtufdXiM/Jq+wcYpxLsombe7aBASiBaaYt7AjSCfqFVO2cI3FHWjjQSQWautHt3eicr80iQtP0HpRZ5xo087bDN3wx0TNR+9eTD/bAYAiTOQykJaZLq4z3jye9kMcmL0JRbPqfbxzX8f9G0ZBbZofbOUs1tJQdWDW3obasw+Y4YrzeNxBc1z14iSjbmVkiQtfGYokle/q1Rns/79+CwOEwVHTykZN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f0dec8-49c5-403c-fd4d-08d834c0d66d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 19:43:30.7273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShFu8cK9qMDzRB3tlZf9W1BDlQZIxjygoweg6kUc71h/ZsiUkHxlTIucIOcmQkt7NeEgXL8K1dun9qyxeKAe1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3351
X-OriginatorOrg: intel.com
Cc: "Lu, Brent" <brent.lu@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

PiANCj4gPj4+ICAgIAljYXNlIFNORF9TT0NfREFQTV9QT1NUX1BNRDoNCj4gPj4+IC0JCWNsa19k
aXNhYmxlX3VucHJlcGFyZShwcml2LT5tY2xrKTsNCj4gPj4+IC0JCWNsa19kaXNhYmxlX3VucHJl
cGFyZShwcml2LT5zY2xrKTsNCj4gPj4+ICsJCWlmIChfX2Nsa19pc19lbmFibGVkKHByaXYtPm1j
bGspKQ0KPiA+Pj4gKwkJCWNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5tY2xrKTsNCj4gPj4+
ICsNCj4gPj4NCj4gPj4gWzFdIHRoaXMgc2VlbXMgd3JvbmcgaW4gY2FzZSB5b3UgaGF2ZSB0d28g
U1NQcyB3b3JraW5nLCBhbmQgc3RvcCBvbmUuDQo+ID4+IFRoaXMgd291bGQgdHVybiBvZmYgdGhl
IG1jbGsgd2hpbGUgb25lIG9mIHRoZSB0d28gU1NQcyBpcyBzdGlsbCB3b3JraW5nLg0KPiA+IEZv
ciB0aGlzIHBsYXRmb3JtIHdlIHVzZSBlaXRoZXIgaGVhZHNldCBvciBkbWljLg0KPiA+IFRoZXJl
IGlzIG5vIHdheSB3ZSBjYW4gcmVjb3JkIHNpbXVsdGFuZW91c2x5IHVzaW5nIGRpZmZlcmVudCBk
ZXZpY2VzLg0KPiA+IFNvIGRpc2FibGluZyBtY2xrIG1pZ2h0IG5vdCBiZSBoYXJtZnVsIGhlcmUu
IEJ1dCB0aGlzIGNhc2Ugd2lsbCBhbHdheXMgYmUgdHJ1ZQ0KPiB0b28gOikuDQo+IA0KPiBNYXli
ZSBDUkFTIHByZXZlbnRzIHlvdSBmcm9tIHJlY29yZGluZyBvbiB0d28gaW5wdXRzLCBidXQgaXQg
bG9va3MgbGlrZSB5b3UNCj4gaGF2ZSBpbmRlcGVuZGVudCBmcm9udC1lbmRzIHNvIGluIHRoZW9y
eSBjb3VsZG4ndCB5b3UgcmVjb3JkIGF0IHRoZSBhbHNhIGh3Og0KPiBkZXZpY2UgbGV2ZWw/IElz
IHRoaXMgcmVhbGx5IG11dHVhbGx5IGV4Y2x1c2l2ZSBhdCB0aGUgaGFyZHdhcmUgbGV2ZWw/DQpU
cnVlLiBJdHMgbm90IG11dHVhbGx5IGV4Y2x1c2l2ZSBhdCBoYXJkd2FyZSBsZXZlbC4gdGhlIGZv
bGxvd2luZyBtaWdodCBiZSBzYWZlDQppZiAoIV9fY2xrX2lzX2VuYWJsZWQocHJpdi0+c2NsazAp
KSAmJiAgKCFfX2Nsa19pc19lbmFibGVkKHByaXYtPnNjbGsxKSkNCgljbGtfZGlzYWJsZV91bnBy
ZXBhcmUocHJpdi0+bWNsayk7DQo+IA0KPiBBbHNvIGlzIHRoZSBjbG9jayBvbmx5IG5lZWRlZCBm
b3IgdGhlIHJ0NTY2MyBhbmQgcnQ1NTE0LCB0aGUgYW1wbGlmaWVyIGRvZXMgbm90DQo+IG5lZWQg
aXQ/DQpUaGF04oCZcyByaWdodC4gbWF4OTg5MjcgZG9lcyBub3QgbmVlZCBtY2xrLg0KPiANCj4g
Pj4NCj4gPj4+ICsJCWlmIChfX2Nsa19pc19lbmFibGVkKHNjbGspKQ0KPiA+Pg0KPiA+PiBbMl0g
QWdhaW4gaXMgdGhpcyB0ZXN0IG5lZWRlZCBzaW5jZSBzY2xrIGlzIG5vdCBzaGFyZWQgYmV0d2Vl
biBTU1BzDQo+ID4gU2FtZSB0aG91Z2h0IHByb2Nlc3MgdG8gY2hlY2sgaWYgaXRzIGVuYWJsZWQg
b3Igbm90LiBXaWxsIHJlbW92ZSB0aGF0Lg0KPiA+Pg0KPiA+Pj4gKwkJCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShzY2xrKTsNCj4gPg0K
