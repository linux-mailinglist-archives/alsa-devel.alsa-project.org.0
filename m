Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 627D02110D9
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 18:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC3291678;
	Wed,  1 Jul 2020 18:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC3291678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593621555;
	bh=Wsv4B8iV2NV+z288YwA2mQe2RKPSvXGWJvrzZ+CKfAM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gLChTFRjPwZqaS8TxvLhyiEODQfm6KJelLSgfr9cBUc+DdXS68W8O+erd72l0U5KS
	 eR9XrTg4Es/k63dMvFNn52jmVdJjq31ILuf/1vZZ3SHqxmpsvs/sFk4dzbCivs7UMP
	 brvVlbUeyjtKSM8Dt4vo5PTKHXxVrjz7fAXtr88g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4127F8020C;
	Wed,  1 Jul 2020 18:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB36DF80217; Wed,  1 Jul 2020 18:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14519F800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 18:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14519F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Ive1cDXG"
IronPort-SDR: 76sf0xbQZHbJW71tvfGsXfo8dRZQdpdfFynrXVPxCfNa+kcj0Hn2/y4KBtUZZFL1dAFkTYriLw
 3rBllpMK40jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231499341"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="231499341"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 09:37:25 -0700
IronPort-SDR: Uc9yP0K8746GV/iqlowvu8o+v/J2w6AWkDQVBB5QfxhPvbm0QIxLcFQxruBZ94wSnSRb2Rdg7Z
 AG3auGUNVx5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="481659004"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga005.fm.intel.com with ESMTP; 01 Jul 2020 09:37:25 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 09:37:24 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX155.amr.corp.intel.com (10.22.240.21) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 09:37:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 09:37:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q14E5D2Yn3jAhTmCsXZ9Y22EWr3tX8YY4fj//KrBoXSdyt2TykULT0ttb1o4EGHEN6arV/3askpV4ZbOZZmVtUDo7KEZZawKzCN7rgfQcxPGJcnWvLPkiFpF24Q8pP2DVdaK9Re+WnDhMLzJnBONHW5zeNt8gfSaxOUvklmVK59NAGX2z0wAvl8sj9FXEyjY4KjUtIxS1X236o8PMWwmp9jFw6mtidTMC6rRCUJCW6ssc6gQUgyWEbIEBFhmmMppaihKV72yb1EFsW/ZHJPOd6dKlIy68Vd8H/On7F1EVSmLK840eW302kGhR0PFqpPEbfdZ2qQjljSPIxhlO7cmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wsv4B8iV2NV+z288YwA2mQe2RKPSvXGWJvrzZ+CKfAM=;
 b=NNluxlsOS9o76CjKyzNFtHIf2s+P4Ws1xDOFelkqmyo+erM8NLDLRk/pGLyCfU0hQr8BbDuRKo6wMdy8iy8iXw2gWoeKXJgiqRBp3wk7J8GKNZ4hT/A78BecnoxJAdlHs15Wv746LjHL36sk5o4RK6Aws5rYd/p6BUQO205lrK9ki6scmn/qplkZ8AEqPeZn538dRvzkIQuJVLQvTzKAFJMW045sTOjXgk9rz4bII3rDk7AagURGkM6GLJTLjHRwNGj9UPgKH4J3WndIGtXvaapK1vbSnfmWHeNSChgFbu1IpupBEVBN2HnLtle6S9Ds5FCgDkq9QrNdyxr7of4QGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wsv4B8iV2NV+z288YwA2mQe2RKPSvXGWJvrzZ+CKfAM=;
 b=Ive1cDXGtqzlsjStDMzQgd97WO1lOFpbmW0czskU0OvnWFqp7K9k9j19z3uW9gEFtIHGzW78RW0OANIFYnV0sfhJ02b/l5vaCKLWj8UDkdVCEFGG/ZvA7I+kQ2+lKmwkuAry/ohFLF+P3peIIVVUB7E+lukcb29/YHvr2/H4DyU=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Wed, 1 Jul
 2020 16:37:21 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3131.030; Wed, 1 Jul 2020
 16:37:21 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: =?utf-8?B?xYF1a2FzeiBNYWpjemFr?= <lma@semihalf.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Thread-Topic: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Thread-Index: AQHWTgYTwQHbv3cvDU6zdR5ijzs9kqjvzAZQgAAboACAADGLwIAC1L0A
Date: Wed, 1 Jul 2020 16:37:21 +0000
Message-ID: <BY5PR11MB4307C20278F32D17551112FAFD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
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
In-Reply-To: <BY5PR11MB4307CBA736456853777A9FD9FD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: semihalf.com; dkim=none (message not signed)
 header.d=none;semihalf.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [24.23.139.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 963a7e5d-0858-4a43-3bfb-08d81ddd06e5
x-ms-traffictypediagnostic: BY5PR11MB4182:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB41827CC973DAC9D07EDE46E1FD6C0@BY5PR11MB4182.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: itQ1i5I5m3uxVgrjZehBG2EacsvztlRtbbyYxgS4v/UkXTmfBE2Occ5clilfJkAzSYiijz4acDr8vFemRYzf2nWLRgwI5lEUSzTqSWg9GplYxIZtF5Itn1iBAGRFblbtUZKOPf7+jaOuay8WwTGUE6npl9/Q8wnCcp++U7TeEQbt+x7Xqpnz1Z+61u8cLrXzTWketgAMWzjLfU5YQqR0Zg7kbxF2TTNLwqyyHvbGqIh5fa0lsLvb5+BISNZDJ4oDo8whmN6q7I4/P99tzdEvhQV0YlEG/z6lDoAHpEYEX87wlcsWXFvFwTs6W3fiZhN0mk/YmdpdzEwI8y3nWHZmng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(8936002)(7416002)(9686003)(55016002)(76116006)(66556008)(478600001)(5660300002)(64756008)(66446008)(66946007)(8676002)(4326008)(66476007)(52536014)(26005)(2906002)(86362001)(33656002)(7696005)(71200400001)(316002)(110136005)(54906003)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kz61TV2eCxKjHekr0SysGCkhr4DESbijs0br4LGrHs4D+0Ok8uLoTJ/QHva21kcGMWuw7HHsxRnvZeCxcIwlBSl8q7ZLfJn2o6ODv6HtcynombRqJBseFAQF1IfeVoGT/U7AXdMuy9CVmZPxgJXmmJplF3lcyp5VC0OrNXxF1WH9PNASF2XETIikSav9JlADwA5G+AS/d/aDsNVpRRVZk/F7Ve0zISRy0HYq3GqXQlpOYac8R7SBMIsWCuEwv0iPuNL5NrjyzxP7qiPymjR5ldKeulvoGjCnLOPT4Bbp/b0v5HuDctSYlf1v2mto9R+GmSbG3B9PRYNxpBotc2ISi3JNbzqD5M4JG8VAWFVt9Zag4lOJM/WPqMM4Fi4pyqfmfFVKKnlzCHGyMbkXxialr8im+9zvk+/yB5Fc8UvTt86Ok86tFjA6CfQcYEqYbHxlaFXDQ47BkKSBqiC7xsJSEd6q3DtPOvG3pw6e+9d1s5t5d/tlAJMRRpDFRentKHjW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963a7e5d-0858-4a43-3bfb-08d81ddd06e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 16:37:21.2420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9gX3TiOGP9aNYGdvv8GA8KgCr8uiwZX4PM/anN9PFAw7rdPBYy2EQK6GL3F/0fXHrbeqM/1T4UH3Pqh/pXbXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4182
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "M R, Sathya
 Prakash" <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>, Marcin
 Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>
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

PiANCj4gPiA+IEZvciBzcGVha2VycyBhbmQgaGVhZHNldHMgaXRzIDQ4S2h6LCAyIGNoIGFuZCAy
NCBiaXQgYW5kIHRoaXMNCj4gPiA+IHNldHRpbmcgaXMgZG9uZSBiYXNlZCBvbiB0aGUgZnJvbnQt
ZW5kIGRhaSBGb3Igc3BlYWtlcnMsIGhvd2V2ZXINCj4gPiA+IHN1cHBvcnQgb25seQ0KPiA+ID4g
MTYgYml0LCBzbyB3ZSBzZXQgaXQgYmFjayB0byAxNiBiaXQgSWYgdGhlIGZyb250IGVuZCBkYWkg
aXMgZG1pYywNCj4gPiA+IHRoZW4gdGhlIGNoYW5uZWwNCj4gPiBpcyBzZXQgdG8gZWl0aGVyIDIg
b3IgNCBkbWljX2NvbnN0cmFpbnRzLiBObyBvdGhlciBmb3JtYXRzIG5lZWQgdG8gYmUgc2V0Lg0K
PiA+ID4NCj4gPiA+IEFsbCB0aGUgU1NQMSB1c2FnZXMgZG8gbm90IGhhdmUgdGhlIHNhbWUgcGFy
YW1ldGVycyAoYXMgZG1pYyBpcyBvbg0KPiA+ID4gU1NQMSBhbmQgaXRzIGRpZmZlcmVudCBhcyBn
aXZlbiBhYm92ZSkgTW9zdCBwYXJhbWV0ZXJzIGFyZSBzYW1lIGZvcg0KPiA+IHNwZWFrZXJzIGFu
ZCBoZWFkc2V0IHdoaWNoIGFyZSBvbiBkaWZmZXJlbnQgU1NQLiBUaGlzIGlzIHRoZSByZWFzb24g
d2UNCj4gPiBoYWQgYSBzaW5nbGUgZml4dXAgZnVuY3Rpb24uDQo+IE9uIFNTUDEsIGZvciBkbWlj
IHdlIG5lZWQgdG8gZml4IHRoZSBjaGFubmVscyB3aGljaCBpcyBkZXJpdmVkIGZyb20gZG1pY19u
dW0NCj4gb2YgdGhlIHNuZF9zb2NfYWNwaV9tYWNoIHN0cnVjdHVyZSBiYXNlZCBvbiB0aGUgbnVt
YmVyIG9mIGRtaWMgb24gdGhlDQo+IGJvYXJkLg0KPiBUaGUgY2hhbm5lbCBpcyBzb21ldGhpbmcg
dGhhdCBtaWdodCBiZSBkaWZmZXJlbnQgZnJvbSBzcGVha2Vycy4NCj4gV2UgbWlnaHQgbm90IHdh
bnQgdG8gY29uc3RyYWludCB0aGUgZG1pYyBjYXB0dXJlIHRvIGFsd2F5cyBiZSA0OEtoeiBhcyB3
ZWxsLg0KPiBHaXZlbiB0aGlzLCB0aGVyZSBzZWVtcyB0byBtZSwgMiB3YXlzIHRvIHNldCBpdDoN
Cj4gMS4gRGVyaXZlIGlmIHRoZSBmaXh1cCBpcyBiZWluZyBjYWxsZWQgZm9yIGRtaWMgb3Igc3Bl
YWtlciAyLiBIYXZpbmcgYSBuZXcgZGFpbGluaw0KPiANCj4gSWYgIzIgaXMgbm90IHByZWZlcnJl
ZCAoZ29pbmcgYnkgUGllcnJlJ3MgY29tbWVudHMpLCBjYW4gd2UgdXNlIHJ0ZC0NCj4gPmNwdV9k
YWkvY29kZWNfZGFpLT5uYW1lIHRvIGZpZ3VyZSBvdXQgaWYgaXRzIGZvciBkbWljIG9yIHNwZWFr
ZXI/DQo+IEkgY2FuIHRlc3QgdGhpcyBhbmQgZ2V0IGJhY2sgdG8geW91Lg0KVGVzdGVkIGFuZCB0
aGUgZm9sbG93aW5nIGlzIHNvbWV0aGluZyB3ZSBjYW4gdXNlIHdpdGhvdXQgY3JlYXRpbmcgYSBu
ZXcgZGFpbGluay4NCiAgICAgICAJc3RydWN0IHNuZF9zb2NfZGFpICpjb2RlY19kYWkgPSBhc29j
X3J0ZF90b19jb2RlYyhydGQsIDApOw0KCWlmICghc3RyY21wKGNvZGVjX2RhaS0+bmFtZSwgS0JM
X1JFQUxURUtfRE1JQ19DT0RFQ19EQUkpKSB7DQoJCWlmIChwYXJhbXNfY2hhbm5lbHMocGFyYW1z
KSA9PSAyIHx8ICBETUlDX0NIKGRtaWNfY29uc3RyYWludHMpID09IDIpDQoJCQljaGFubmVscy0+
bWluID0gY2hhbm5lbHMtPm1heCA9IDI7DQoJCWVsc2UNCgkJCWNoYW5uZWxzLT5taW4gPSBjaGFu
bmVscy0+bWF4ID0gNDsNCgl9IGVsc2Ugew0KCQlyYXRlLT5taW4gPSByYXRlLT5tYXggPSA0ODAw
MDsNCgkJY2hhbm5lbHMtPm1pbiA9IGNoYW5uZWxzLT5tYXggPSAyOw0KCQlzbmRfbWFza19ub25l
KGZtdCk7DQoJCXNuZF9tYXNrX3NldF9mb3JtYXQoZm10LCBwY21fZm10KTsNCgl9DQoNClBpZXJy
ZSwgdGhvdWdodHM/DQoNCg==
