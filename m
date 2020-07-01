Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2936211178
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 19:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50FC11688;
	Wed,  1 Jul 2020 19:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50FC11688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593622963;
	bh=DixH8hAFaWYDGwnaEOUk1Qk4fsJtdQJHcdfPJ7xdtvM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8eQA9MlBGIHk3e5tp6szKMH3mxjZgG8Qp23sE6cPuEOFuooLBd02tZdlbxS0bRXZ
	 aQmP7oJ6Inw0p4jdiJlyY4A9aapL3vCXysDD0xgZLRFWG1TDCL5oEWc1PCZyZv97QM
	 2lfjOaoCczNLSqgtqW0n8TOGt6GTqKdd6E6o3PU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6427BF8020C;
	Wed,  1 Jul 2020 19:01:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 622AAF80217; Wed,  1 Jul 2020 19:01:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F12BBF801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 19:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F12BBF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="g2/WVWt/"
IronPort-SDR: ohxkwcTqzrNdqSfiigzeUtpAJoD1UQksxs10kGQU36ccCFIu8+uVVO7UNycQ70DBVTpSsZaDkS
 MTu2kutoTutw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231512434"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="231512434"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 10:00:53 -0700
IronPort-SDR: 8DflkHi3PUHyxQxgMMn8Lfx/j/oNlPGjVpVewGTnfnykF7bIis/uo6dbzpI1i8iee7tWdQrydb
 wlB5+siIq0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="455171699"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 01 Jul 2020 10:00:52 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 1 Jul 2020 10:00:52 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 1 Jul 2020 10:00:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 1 Jul 2020 10:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcjLFGcFN4h5pauly9zxx8sjkZc1Z5eiQyyF7Sx7KCpQNup39GV3tb2LzFDJVq0SpEHls3U3DKJdIzXiZoWEUJUYyUewhQaZNwb+ti6zM/6rwse5dM16BFw2ugoSpMaIsQig+DT6xXh/Phj08O1OTl5tTgXQ0X/6/N7aKZx2SltSmL2FQgE3H9JeLdQMmryWMp9pohzqNHTCcEBeP347tTIKR02gnPz9yScfJdL06zTq/3Mo9kj/vGtc9I1JwqtDERN1gSwgUk+GUuenxzCzbj9GQjK97MvOoLyVYW2Th1pWJ2zjZgS2BlQqKFwgJCB5c0l9w6CFWMqPZk+Swhke7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DixH8hAFaWYDGwnaEOUk1Qk4fsJtdQJHcdfPJ7xdtvM=;
 b=hKgiQS68GG9b+ZxXurcAMLxG5H/FROLMxlNw6DW38gd7YdnoUZIPbbiQhDCqyCF0qBzRZ5HX8AzfashjhECa5DBgLEQ7fggxX+Ie2pXBtqFqgjr1629ppEnHvgch+Q6JMxFgXgL72OeuEYyWebwzc4X+bdvaQCfzJO3p4BA5Rno7smOG3Oh2oUopkNEdmcQbzH2bvhBCtwp9nzRBSz+0H+GqPtNNkS6xwNhfOvsJLwqm8k0zldOkVDIAeH7UWU4PO1OgTt/31uG+DIiP4fggproOCtjS2gYmyKv+n4/0kqerXH8h2QAAdvk5FrtgnosXbqPHxypnS6zkkFEa4j4sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DixH8hAFaWYDGwnaEOUk1Qk4fsJtdQJHcdfPJ7xdtvM=;
 b=g2/WVWt/cN6ZKQgfm4cKRi27/TqHdPRaeP3IpVA7J1aVmiJZReXxaGOFwxucXyDWCKEiAK8Fc/75WRxn8lbDrzcwPNgi1MfRoiyP3OPpOG0hnZOp76JcZV/vjHBM6nIWgU/dEQO0oZv4og44xz1/gxvgz+R9FJng1sq34A2BVkc=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB3607.namprd11.prod.outlook.com (2603:10b6:a03:b2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 1 Jul
 2020 17:00:45 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3131.030; Wed, 1 Jul 2020
 17:00:45 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?xYF1a2FzeiBNYWpjemFr?= <lma@semihalf.com>
Subject: RE: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Thread-Topic: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Thread-Index: AQHWTgYTwQHbv3cvDU6zdR5ijzs9kqjvzAZQgAAboACAADGLwIAC1L0AgAAE2wCAAAGtAA==
Date: Wed, 1 Jul 2020 17:00:45 +0000
Message-ID: <BY5PR11MB4307BBBCAA78A0506BBC5F74FD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
 <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
 <CAFJ_xboUTDtnpvskb2dY4fGhGLNkEgT0sH3dU0NYJV_Cb_gqPw@mail.gmail.com>
 <BY5PR11MB4307284BAE6DA415CFC0865CFD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <CAFJ_xbq3DU8NMmymYHLjy0z+QbGRAOmB4NaiXPphAr2Zu0MPAg@mail.gmail.com>
 <BY5PR11MB4307CBA736456853777A9FD9FD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <BY5PR11MB4307C20278F32D17551112FAFD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <7e38bb2e-2132-d305-e94d-043fa53bd836@linux.intel.com>
In-Reply-To: <7e38bb2e-2132-d305-e94d-043fa53bd836@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [24.23.139.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72a1d23d-4fda-4212-3ad4-08d81de04c19
x-ms-traffictypediagnostic: BYAPR11MB3607:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB36078D3E317184BE70D848DAFD6C0@BYAPR11MB3607.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CilXbS3/8mctS2fuwnFEuiG004y/9vAPMQ2fQVUlpRIZtiGy7FB1pULDQNOyrPphfo1xp0rDV7OPRYIpv3+Y3iUWDk9NTsG88wnrGlmNc3xTTQQUFerKsb7ITfUS0MrofHbteETYq47p0D3/OZWJOQ3zOwSY4W67lKoFSuYiryHNFpfoYvOvopdXhDZm/oc/uQy7YhDE1H52MObTzDL6rZHkBQgSzMSTTy5x3rAd7I5MIpwAbsMSUld9gNNkIGs2MkRyiIDOA5vfBfinoMfJDJKlBjKT1GLZYCJvzMwzXOFf5sIG45DS2/n1rmLIeA5IO3hg74nYJS4VviPKyyIHBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(54906003)(110136005)(9686003)(478600001)(6506007)(86362001)(2906002)(4326008)(8676002)(71200400001)(5660300002)(316002)(8936002)(52536014)(55016002)(64756008)(66556008)(7416002)(7696005)(66446008)(66946007)(33656002)(26005)(186003)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: eAO5sKGF4LR8vI3HO6p306EiK+EAmVPNr78JktF20iQdlPttMdAf4+e6uny57+/lKy9eVY5WLEI4JRiVJcvXrBw1vD5yje93u8xmLOPKL/jmyEGaLGdaq7S+KEFe3XlhH1FNs+1NQy30oDxBfZ8fJQ2rWr1LM+w/ihzISvL0MIRZiaXNFgynz26WVijE2mizMornv3lDGvpa2Zl06HwoA+AZIFSCkNyF0py5shweEHifs/gwGpA9Qs3IDJiYBuZ2TtbseM+zbHT7xluVeoNIZmUotkjKk+OmQPzXHrErENFIrdk1LmzBXc/aEUG5clfLlJmD0pjBu5rPnF52hOFx93CtMf2T+mn0E9GF/z51FxOf3jKuyQCNg1us2Ko70+n+J7qKWw0rN31b3z2QOc6JnO0MbWV/yPBCXie53u6m1LpcIfPvBI3EN7Gy2sTRL0IQrZjU6V8jvhLlIzZpTgdkLURJGJRSFtgijHNfI4ufp5yV89q/oO8O+R0lwom/pd1A
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a1d23d-4fda-4212-3ad4-08d81de04c19
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 17:00:45.7887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSWqKr9icQhF0k/EM8J8tFoUvIr82QHQfPVKsb5c+cBq5nGw6puM2RCKIQkr+TSDcG6+JXZWYjiSmmOPdTRIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3607
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>
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

PiA+Pg0KPiA+Pj4+IEZvciBzcGVha2VycyBhbmQgaGVhZHNldHMgaXRzIDQ4S2h6LCAyIGNoIGFu
ZCAyNCBiaXQgYW5kIHRoaXMNCj4gPj4+PiBzZXR0aW5nIGlzIGRvbmUgYmFzZWQgb24gdGhlIGZy
b250LWVuZCBkYWkgRm9yIHNwZWFrZXJzLCBob3dldmVyDQo+ID4+Pj4gc3VwcG9ydCBvbmx5DQo+
ID4+Pj4gMTYgYml0LCBzbyB3ZSBzZXQgaXQgYmFjayB0byAxNiBiaXQgSWYgdGhlIGZyb250IGVu
ZCBkYWkgaXMgZG1pYywNCj4gPj4+PiB0aGVuIHRoZSBjaGFubmVsDQo+ID4+PiBpcyBzZXQgdG8g
ZWl0aGVyIDIgb3IgNCBkbWljX2NvbnN0cmFpbnRzLiBObyBvdGhlciBmb3JtYXRzIG5lZWQgdG8g
YmUgc2V0Lg0KPiA+Pj4+DQo+ID4+Pj4gQWxsIHRoZSBTU1AxIHVzYWdlcyBkbyBub3QgaGF2ZSB0
aGUgc2FtZSBwYXJhbWV0ZXJzIChhcyBkbWljIGlzIG9uDQo+ID4+Pj4gU1NQMSBhbmQgaXRzIGRp
ZmZlcmVudCBhcyBnaXZlbiBhYm92ZSkgTW9zdCBwYXJhbWV0ZXJzIGFyZSBzYW1lIGZvcg0KPiA+
Pj4gc3BlYWtlcnMgYW5kIGhlYWRzZXQgd2hpY2ggYXJlIG9uIGRpZmZlcmVudCBTU1AuIFRoaXMg
aXMgdGhlIHJlYXNvbg0KPiA+Pj4gd2UgaGFkIGEgc2luZ2xlIGZpeHVwIGZ1bmN0aW9uLg0KPiA+
PiBPbiBTU1AxLCBmb3IgZG1pYyB3ZSBuZWVkIHRvIGZpeCB0aGUgY2hhbm5lbHMgd2hpY2ggaXMg
ZGVyaXZlZCBmcm9tDQo+ID4+IGRtaWNfbnVtIG9mIHRoZSBzbmRfc29jX2FjcGlfbWFjaCBzdHJ1
Y3R1cmUgYmFzZWQgb24gdGhlIG51bWJlciBvZg0KPiA+PiBkbWljIG9uIHRoZSBib2FyZC4NCj4g
Pj4gVGhlIGNoYW5uZWwgaXMgc29tZXRoaW5nIHRoYXQgbWlnaHQgYmUgZGlmZmVyZW50IGZyb20g
c3BlYWtlcnMuDQo+ID4+IFdlIG1pZ2h0IG5vdCB3YW50IHRvIGNvbnN0cmFpbnQgdGhlIGRtaWMg
Y2FwdHVyZSB0byBhbHdheXMgYmUgNDhLaHogYXMNCj4gd2VsbC4NCj4gPj4gR2l2ZW4gdGhpcywg
dGhlcmUgc2VlbXMgdG8gbWUsIDIgd2F5cyB0byBzZXQgaXQ6DQo+ID4+IDEuIERlcml2ZSBpZiB0
aGUgZml4dXAgaXMgYmVpbmcgY2FsbGVkIGZvciBkbWljIG9yIHNwZWFrZXIgMi4gSGF2aW5nDQo+
ID4+IGEgbmV3IGRhaWxpbmsNCj4gPj4NCj4gPj4gSWYgIzIgaXMgbm90IHByZWZlcnJlZCAoZ29p
bmcgYnkgUGllcnJlJ3MgY29tbWVudHMpLCBjYW4gd2UgdXNlIHJ0ZC0NCj4gPj4+IGNwdV9kYWkv
Y29kZWNfZGFpLT5uYW1lIHRvIGZpZ3VyZSBvdXQgaWYgaXRzIGZvciBkbWljIG9yIHNwZWFrZXI/
DQo+ID4+IEkgY2FuIHRlc3QgdGhpcyBhbmQgZ2V0IGJhY2sgdG8geW91Lg0KPiA+IFRlc3RlZCBh
bmQgdGhlIGZvbGxvd2luZyBpcyBzb21ldGhpbmcgd2UgY2FuIHVzZSB3aXRob3V0IGNyZWF0aW5n
IGEgbmV3DQo+IGRhaWxpbmsuDQo+ID4gICAgICAgICAJc3RydWN0IHNuZF9zb2NfZGFpICpjb2Rl
Y19kYWkgPSBhc29jX3J0ZF90b19jb2RlYyhydGQsIDApOw0KPiA+IAlpZiAoIXN0cmNtcChjb2Rl
Y19kYWktPm5hbWUsIEtCTF9SRUFMVEVLX0RNSUNfQ09ERUNfREFJKSkgew0KPiA+IAkJaWYgKHBh
cmFtc19jaGFubmVscyhwYXJhbXMpID09IDIgfHwNCj4gRE1JQ19DSChkbWljX2NvbnN0cmFpbnRz
KSA9PSAyKQ0KPiA+IAkJCWNoYW5uZWxzLT5taW4gPSBjaGFubmVscy0+bWF4ID0gMjsNCj4gPiAJ
CWVsc2UNCj4gPiAJCQljaGFubmVscy0+bWluID0gY2hhbm5lbHMtPm1heCA9IDQ7DQo+ID4gCX0g
ZWxzZSB7DQo+ID4gCQlyYXRlLT5taW4gPSByYXRlLT5tYXggPSA0ODAwMDsNCj4gPiAJCWNoYW5u
ZWxzLT5taW4gPSBjaGFubmVscy0+bWF4ID0gMjsNCj4gPiAJCXNuZF9tYXNrX25vbmUoZm10KTsN
Cj4gPiAJCXNuZF9tYXNrX3NldF9mb3JtYXQoZm10LCBwY21fZm10KTsNCj4gPiAJfQ0KPiA+DQo+
ID4gUGllcnJlLCB0aG91Z2h0cz8NCj4gDQo+IHRoYW5rcyBIYXJzaGEsIHRoYXQgbG9va3MgbGlr
ZSB3aGF0IEkgaGFkIGluIG1pbmQsIGJ1dCBteSBlYXJsaWVyIHF1ZXN0aW9uIHdhcw0KPiB3aHkg
d2UgZGVhbCB3aXRoIHRoZSByYXRlcyBhbmQgZm9ybWF0cyBvbmx5IGluIHRoZSBsYXN0IGNhc2U/
DQpUaGUgc3BlYWtlciBjb2RlYyBzdXBwb3J0ZWQgb25seSAxNiBiaXQuICAoVmVuZG9yIG1lbnRp
b25lZCkNCkZvciBwbGF5YmFjayBvbiB0aGlzIHBsYXRmb3JtLCBvbmx5IDQ4S2h6IHdhcyB1c2Vk
Lg0KDQoNCg==
