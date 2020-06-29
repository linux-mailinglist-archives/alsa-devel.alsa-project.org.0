Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3C20E88F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 00:32:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8355D1658;
	Tue, 30 Jun 2020 00:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8355D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593469929;
	bh=S/7XZYR/+KJAaW41ryPB2zgXhZXuaPo0V6e/6eYYFCI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lhy2qa1C2xMXviBdwg9CbJ3vmjr6D6T13XBoEz/lJLzasyXbcecWT9UaYubewaKgh
	 rI2GXn0jrZAZdEBy/WDWiHwKea33ibPCK9y1gMdhjQpPy2gYcZGODLAo6RuQG9wTLG
	 6oERsVHEo7M+GrXI0KEjq/4kghG0V1igE6uMKaf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F345F800EA;
	Tue, 30 Jun 2020 00:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2779F80217; Tue, 30 Jun 2020 00:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D253F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 00:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D253F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="j7xoyBeV"
IronPort-SDR: L6UpaUygXHtkaTSyZNWkekUzzfXSecxskZlfTU9J2Tfgf5wmsiDXQ7KcyqQIYKwsbMBqe5Km8K
 ocjMNBRH2sYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="145160643"
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="145160643"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 15:30:14 -0700
IronPort-SDR: ijaKqgLl7ISn6BhzUrkDswetZTP2M+gw7/YE/5U8l4jEyhyqprf9cXAFE+uGGKIEarEFOxNqMB
 /06h04pAUTDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="319875709"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 29 Jun 2020 15:30:13 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 15:30:13 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 15:30:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 29 Jun 2020 15:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc7tr3NVkHa/C0dfGWO8D8qbaTcANx1FCdhSeUYa8J31CA04AT3ZPHPEjVclCrJm+eQX0cKSWWGjSZyn18hQW9OtX2sWgz5mSkqqv9CmqYGqnf3yAbrgB6XssxaGN97TYjre3pTUzJ+gb2UxBI2Q7SYWvRkQTJQAVPsnAZaVzOlXCF9YzqocL1Z0HQoxfiOEKkpq13gTh25mPCBbB5jOzL/8ZvOtq+302MovjN1iWomWR/sfHOqJdZe4U22B5mQmCbK4ww7I8d52vq3El+qbULZPPHgFUJq3RQnc1nEB5+ewDYNZX9VHvNBZ7USPxFygeTi5sBfrwPLPv1KnGXCJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/7XZYR/+KJAaW41ryPB2zgXhZXuaPo0V6e/6eYYFCI=;
 b=f8cs8/M17GsEc0CxGM2u3piKACmLNN0UH+MdiSiyd8uwAAjcHZL7qdBIQBv057Bl9B0ExA6nNASWqi88Ks4ejqxbAOfaHwu9XvCx7VlfxB14s7rQyQ7UEzMsj0Qbjb1jWCJQGz65hMo2hqz0l0GzCkhEU90rk35Iy12f82P/ngr9D+vz6ETCLc2Ly1DF6Ehq/U4v30l9VB806zCCAPFdNDRpmohDHrA6VgV4TnqoAFDIHOP+pvu4oq65DJPFFRHZ2zMJU3pqXrtOyzLXHQ0iHbn82Tedgu4IS3pza3zZAevZXTchHswN0VAXbpx6Z6veKEY7wGNmPoIVKURP0R4dNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/7XZYR/+KJAaW41ryPB2zgXhZXuaPo0V6e/6eYYFCI=;
 b=j7xoyBeVFGJ3T0nDU7GGDahIIxz9IgIQ2KjqEzbN4p1HDgCRwK0YnhI52QYcy2tblhyAWQTmKF8Gjm09h6r2BtQI7yukN8nDtoAbKUVRwmyZzJHHim9CVIESyeMaD+3raGAnw7j4ypGKtQK/qd/DVQxUUW+F68ZMKd2N34hjB18=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BY5PR11MB4005.namprd11.prod.outlook.com (2603:10b6:a03:18c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 22:30:11 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 22:30:11 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: =?utf-8?B?xYF1a2FzeiBNYWpjemFr?= <lma@semihalf.com>
Subject: RE: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Thread-Topic: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Thread-Index: AQHWTgYTwQHbv3cvDU6zdR5ijzs9kqjvzAZQgAAboACAADGLwA==
Date: Mon, 29 Jun 2020 22:30:11 +0000
Message-ID: <BY5PR11MB4307CBA736456853777A9FD9FD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
 <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
 <CAFJ_xboUTDtnpvskb2dY4fGhGLNkEgT0sH3dU0NYJV_Cb_gqPw@mail.gmail.com>
 <BY5PR11MB4307284BAE6DA415CFC0865CFD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <CAFJ_xbq3DU8NMmymYHLjy0z+QbGRAOmB4NaiXPphAr2Zu0MPAg@mail.gmail.com>
In-Reply-To: <CAFJ_xbq3DU8NMmymYHLjy0z+QbGRAOmB4NaiXPphAr2Zu0MPAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: semihalf.com; dkim=none (message not signed)
 header.d=none;semihalf.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a4a2ded-ca28-4cb7-1b85-08d81c7bfc92
x-ms-traffictypediagnostic: BY5PR11MB4005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB400591E4407DFC2124AF2CC8FD6E0@BY5PR11MB4005.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eSXr4+htnzUuDih8OeOVmeZS6+6Pj7iV8bVHShHwspVQZHtHTAdZm7CvExJR/dHB2jIitETblDI8HccSqyhCEtIrPT3Wfr6eTLwcfSfGUGBZQSJc33aPjVj7/82t+m3G/j2pgoBrIefIx+H76tpE+nAGtadA061sAl9veMuy20XExCT09ErW4w/DCVjm2Otbkd3VkCd9uVGP02vxyYSyf5+qb3o2Cd7HtuvvCMc2ukL5MI8Hl+3u1vHrgrCg3F1/duEBGY1skAlpnpCHJjt3V1VNESfeew0FPmc1dIIB9LdVQznBu+i/Zqrc2GG0A9ueQhjQuVyTA5WQ7ceqm2smCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(2906002)(66556008)(53546011)(7696005)(9686003)(55016002)(86362001)(71200400001)(83380400001)(66446008)(76116006)(64756008)(66946007)(33656002)(8676002)(66476007)(7416002)(478600001)(8936002)(52536014)(4326008)(54906003)(6506007)(26005)(186003)(316002)(6916009)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: QAoz6VjwIcAchzjPsu0uM2aCDtQOMJk8ve4+/Sl6urC7RQHf4be0dI8UakcQAoCrx7QoCLyvA6B6ZM9hGaQVijfR8BdGNFPdvlt8SEE44iTxeigvhYw4p0F38K46xEGCIzhE5T/y4OY/4asyNycl0ENR3gGaovJtYrZW/Gqq/lgaUHCKzP9389LZAYBhz5CMEGQTsGEUiz+2OnSBmwX6zfMwYOo1CmijtTmsfW6LpOds3c7n0NNC2KO5oXv2rassWjWisAib4GvfaReNA9m2GxQRUKmCsNiIBeuZR/J/020ZLLFHl4/MF6Sb1oIwV4jXhtvkbu1iPI+QvNcTvNEO8YPz8KL2ExKLZI9j3JYvkxAhwwKB2NhYwtR723qtiRpHhZCVR4K0ttbBjobYA0j+FGhLunG8gfVhJgH0BTYCuzdiV06ySGFL95KbQauwyhb1V6b6uKcqVeReuJ/Kaq8m/0/7nd+V6W9CBSBknlwVDLeLk3dp78dLiwk+tW0cmm0Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4a2ded-ca28-4cb7-1b85-08d81c7bfc92
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 22:30:11.5784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0aBd5u5XQSoI71f1td6ywsRl4IAU+tt78UMqefSNnRNmRbgAkaBOmUvlubgwdZCejRuuur/tlPFOWt+4ykAMmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4005
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

PiANCj4gSGkgSGFyc2hhLA0KPiANCj4gSSd2ZSBwdXQgdGhlIHJlYXNvbiBmb3IgdGhpcyBjaGFu
Z2UgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiBJIGhhZCB0byBzcGxpdCBiZV9od19wYXJhbXNf
Zml4dXAgZnVuY3Rpb24gZm9yIGRpZmZlcmVudCBjb2RlY3MgYmVjYXVzZQ0KPiBjdXJyZW50IGFw
cHJvYWNoIChtYWRlIGZvciBrZXJuZWwgNC40KSB1c2VkIGluIGtlcm5lbCA1LjQsIGxlYWRzIHRv
IGNyYXNoIHdoaWxlDQo+IHRyeWluZyB0byBnZXQgc25kX3NvY19kcGNtIHdpdGggY29udGFpbmVy
X29mKCkgbWFjcm8gaW4ga2FieWxha2Vfc3NwX2ZpeHVwKCkuDQo+IFRoZSBjcmFzaCBjYWxsIHBh
dGggbG9va3MgYXMgYmVsb3c6DQo+IHNvY19wY21faHdfcGFyYW1zKCkNCj4gc25kX3NvY19kYWlf
aHdfcGFyYW1zKGNvZGVjX2RhaSwgc3Vic3RyZWFtLCAmY29kZWNfcGFyYW1zKTsNCj4gcnRkLT5k
YWlfbGluay0+YmVfaHdfcGFyYW1zX2ZpeHVwKHJ0ZCwgcGFyYW1zKQ0KPiBrYWJ5bGFrZV9zc3Bf
Zml4dXAoKQ0KPiBJbiB0aGlzIGNhc2UsIGNvZGVjX3BhcmFtcyBpcyBqdXN0IGEgY29weSBvZiBh
biBpbnRlcm5hbCBzdHJ1Y3R1cmUgYW5kIGlzIG5vdA0KPiBlbWJlZGRlZCBpbnRvIHN0cnVjdCBz
bmRfc29jX2RwY20gdGh1cyB3ZSBjYW5ub3QgdXNlDQo+IGNvbnRhaW5lcl9vZigpIG9uIGl0Lg0K
YWRkcmVzc2luZyBpdCBiZWxvdyB0byBrZWVwIHRoZSBjb250ZXh0IA0KDQo+IA0KPiBCZXN0IHJl
Z2FyZHMsDQo+IEx1a2Fzeg0KPiANCj4gcG9uLiwgMjkgY3plIDIwMjAgbyAxODo1MSBOLCBIYXJz
aGFwcml5YSA8aGFyc2hhcHJpeWEubkBpbnRlbC5jb20+DQo+IG5hcGlzYcWCKGEpOg0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogxYF1a2FzeiBNYWpj
emFrIDxsbWFAc2VtaWhhbGYuY29tPg0KPiA+ID4gU2VudDogTW9uZGF5LCBKdW5lIDI5LCAyMDIw
IDQ6MTEgQU0NCj4gPiA+IFRvOiBOLCBIYXJzaGFwcml5YSA8aGFyc2hhcHJpeWEubkBpbnRlbC5j
b20+DQo+ID4gPiBDYzogYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBQaWVycmUtTG91aXMg
Qm9zc2FydCA8cGllcnJlLQ0KPiA+ID4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+OyBK
aWUgWWFuZyA8eWFuZy5qaWVAbGludXguaW50ZWwuY29tPjsNCj4gPiA+IFJhZG9zbGF3IEJpZXJu
YWNraSA8cmFkQHNlbWloYWxmLmNvbT47IFJvc3MgWndpc2xlcg0KPiA+ID4gPHp3aXNsZXJAZ29v
Z2xlLmNvbT47IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBMaWFtIEdpcmR3b29kDQo+
ID4gPiA8bGlhbS5yLmdpcmR3b29kQGxpbnV4LmludGVsLmNvbT47DQo+ID4gPiBCb2IgQnJhbmR0
IDxicm5kdEBnb29nbGUuY29tPjsgTWFyY2luIFdvanRhcyA8bXdAc2VtaWhhbGYuY29tPjsNCj4g
QWxleA0KPiA+ID4gTGV2aW4gPGxldmluYWxlQGNocm9taXVtLm9yZz4NCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjNdIEFTb0M6IEludGVsOiBrYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODkyNzoN
Cj4gPiA+IFNwbGl0IGJlX2h3X3BhcmFtc19maXh1cCBmdW5jdGlvbg0KPiA+ID4NCj4gPiA+IEhp
IEhhcnNoYSwNCj4gPiA+DQo+ID4gPiBXZSB3b3VsZCBsaWtlIHRvIGNvbnRpbnVlIHRoZSB3b3Jr
IG9uIHRoaXMsIGNvdWxkIHlvdSBwbGVhc2Ugc3VnZ2VzdA0KPiA+ID4gdGhlIGNvcnJlY3QgYXBw
cm9hY2guDQo+ID4gPg0KPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4gTHVrYXN6DQo+ID4gPg0K
PiA+ID4gY3p3LiwgMjEgbWFqIDIwMjAgbyAyMDoxMCBQaWVycmUtTG91aXMgQm9zc2FydCA8cGll
cnJlLQ0KPiA+ID4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+IG5hcGlzYcWCKGEpOg0K
PiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPbiA1LzIxLzIwIDEyOjMwIFBNLCDF
gXVrYXN6IE1hamN6YWsgd3JvdGU6DQo+ID4gPiA+ID4gSGkgUGllcnJlDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBJZiB5b3Ugd2lsbCB0YWtlIGEgbG9vayBhdCB0aGUgb3JpZ2luYWwga2FieWxha2Vf
c3NwX2ZpeHVwKCkgeW91DQo+ID4gPiA+ID4gd2lsbCBzZWUgdGhhdCBpdCBpcyBjaGVja2luZyB3
aGV0aGVyIHRoZSByZWxhdGVkIEZFIGlzICJLYmwNCj4gPiA+ID4gPiBBdWRpbyBQb3J0IiwgIkti
bCBBdWRpbyBIZWFkc2V0IFBsYXliYWNrIiwgIktibCBBdWRpbyBDYXB0dXJlDQo+ID4gPiA+ID4g
UG9ydCIgb3IgIktibCBBdWRpbyBETUlDIGNhcCIgLSB0aGVuIGZvciB0aGUgZmlyc3QgMyBjYXNl
cyBpdA0KPiA+ID4gPiA+IHNldHMgbWluL21heCBjaGFubmVscyB0byAyIHdoaWxlIGZvciB0aGUg
IktibCBETUlDIGNhcCIgaXQgY2FuDQo+ID4gPiA+ID4gYmUgMiBvciA0LCB0aGF0J3MgaXMgd2h5
IEknbSB0cnlpbmcgdG8gc3BsaXQgdGhpcywgYnV0IG1heWJlIEknbSBtaXNzaW5nDQo+IGhlcmUg
c29tZXRoaW5nLg0KPiA+ID4gPg0KPiA+ID4gPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBjb2Rl
IGVpdGhlci4NCj4gPiA+ID4NCj4gPiA+ID4gSSBiZWxpZXZlIHRoZSBpbnRlbnQgaXMgdGhhdCBm
b3IgYWxsIFNTUDEtUlQ1NjYzIHVzYWdlcywgd2Ugc2hvdWxkDQo+ID4gPiA+IHVzZQ0KPiA+ID4g
Pg0KPiA+ID4gPiAgICAgICAgICAgICAgICAgcmF0ZS0+bWluID0gcmF0ZS0+bWF4ID0gNDgwMDA7
DQo+ID4gPiA+ICAgICAgICAgICAgICAgICBjaGFuLT5taW4gPSBjaGFuLT5tYXggPSAyOw0KPiA+
ID4gPiAgICAgICAgICAgICAgICAgc25kX21hc2tfbm9uZShmbXQpOw0KPiA+ID4gPiAgICAgICAg
ICAgICAgICAgc25kX21hc2tfc2V0X2Zvcm1hdChmbXQsIFNORFJWX1BDTV9GT1JNQVRfUzI0X0xF
KTsNCj4gPiA+ID4NCj4gPiA+ID4gVGhhdCBpcyBwcmV0dHkgZWFzeSB0byBtb3ZlIHRvIGEgZGVk
aWNhdGVkIHNzcDEgZml4dXAuDQpBZ3JlZS4gU1NQMSBjYW4gYmUgbW92ZWQgdG8gYSBzZXBhcmF0
ZSBmdW5jdGlvbiBhcyBpdCBvbmx5IGhvc3RzIGhlYWRzZXQgY29kZWMNCg0KPiA+ID4gPg0KPiA+
ID4gPiBmb3IgU1NQMCwgd2UgaGF2ZSBSVDU1MTQgZm9yIGNhcHR1cmUgYW5kIG1heDk4OTI3IGZv
ciBwbGF5YmFjaywNCj4gPiA+ID4gYnV0IHRoZSBleGlzdGluZyBjb2RlIGRvZXMgbm90IGV4cGxp
Y2l0bHkgZGVhbCB3aXRoDQo+ID4gPiA+IHJhdGUvY2hhbm5lbHMvZm9ybWF0IGZvciBhbGwgY2Fz
ZXMsIHNvIGl0J3Mgbm90IGNsZWFyIHdoYXQgc2hvdWxkIGhhcHBlbi4NCj4gPiA+ID4NCj4gPiA+
ID4gSGFyc2hhLCBjYW4geW91IGhlbHAgaGVyZT8NCj4gPiBBcG9sb2dpZXMgZm9yIG1pc3Npbmcg
dGhlIGVtYWlsIEkgaGFkIHRvIHJlc3BvbmQgdG8uDQo+ID4NCj4gPiBTU1AwIC0gaGFzIHRoZSBz
cGVha2Vycw0KPiA+IFNTUDEgLSBoYXMgaGVhZHNldCBhbmQgZG1pYw0KQ29ycmVjdGlvbiBkbWlj
IGlzIG9uIFNTUDANCg0KPiA+IEZvciBzcGVha2VycyBhbmQgaGVhZHNldHMgaXRzIDQ4S2h6LCAy
IGNoIGFuZCAyNCBiaXQgYW5kIHRoaXMgc2V0dGluZw0KPiA+IGlzIGRvbmUgYmFzZWQgb24gdGhl
IGZyb250LWVuZCBkYWkgRm9yIHNwZWFrZXJzLCBob3dldmVyIHN1cHBvcnQgb25seQ0KPiA+IDE2
IGJpdCwgc28gd2Ugc2V0IGl0IGJhY2sgdG8gMTYgYml0IElmIHRoZSBmcm9udCBlbmQgZGFpIGlz
IGRtaWMsIHRoZW4gdGhlIGNoYW5uZWwNCj4gaXMgc2V0IHRvIGVpdGhlciAyIG9yIDQgZG1pY19j
b25zdHJhaW50cy4gTm8gb3RoZXIgZm9ybWF0cyBuZWVkIHRvIGJlIHNldC4NCj4gPg0KPiA+IEFs
bCB0aGUgU1NQMSB1c2FnZXMgZG8gbm90IGhhdmUgdGhlIHNhbWUgcGFyYW1ldGVycyAoYXMgZG1p
YyBpcyBvbg0KPiA+IFNTUDEgYW5kIGl0cyBkaWZmZXJlbnQgYXMgZ2l2ZW4gYWJvdmUpIE1vc3Qg
cGFyYW1ldGVycyBhcmUgc2FtZSBmb3INCj4gc3BlYWtlcnMgYW5kIGhlYWRzZXQgd2hpY2ggYXJl
IG9uIGRpZmZlcmVudCBTU1AuIFRoaXMgaXMgdGhlIHJlYXNvbiB3ZSBoYWQgYQ0KPiBzaW5nbGUg
Zml4dXAgZnVuY3Rpb24uDQpPbiBTU1AxLCBmb3IgZG1pYyB3ZSBuZWVkIHRvIGZpeCB0aGUgY2hh
bm5lbHMgd2hpY2ggaXMgZGVyaXZlZCBmcm9tIA0KZG1pY19udW0gb2YgdGhlIHNuZF9zb2NfYWNw
aV9tYWNoIHN0cnVjdHVyZSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIGRtaWMgb24gdGhlIGJvYXJk
Lg0KVGhlIGNoYW5uZWwgaXMgc29tZXRoaW5nIHRoYXQgbWlnaHQgYmUgZGlmZmVyZW50IGZyb20g
c3BlYWtlcnMuIA0KV2UgbWlnaHQgbm90IHdhbnQgdG8gY29uc3RyYWludCB0aGUgZG1pYyBjYXB0
dXJlIHRvIGFsd2F5cyBiZSA0OEtoeiBhcyB3ZWxsLg0KR2l2ZW4gdGhpcywgdGhlcmUgc2VlbXMg
dG8gbWUsIDIgd2F5cyB0byBzZXQgaXQ6DQoxLiBEZXJpdmUgaWYgdGhlIGZpeHVwIGlzIGJlaW5n
IGNhbGxlZCBmb3IgZG1pYyBvciBzcGVha2VyDQoyLiBIYXZpbmcgYSBuZXcgZGFpbGluayANCg0K
SWYgIzIgaXMgbm90IHByZWZlcnJlZCAoZ29pbmcgYnkgUGllcnJlJ3MgY29tbWVudHMpLCBjYW4g
d2UgdXNlIHJ0ZC0+Y3B1X2RhaS9jb2RlY19kYWktPm5hbWUgdG8gDQpmaWd1cmUgb3V0IGlmIGl0
cyBmb3IgZG1pYyBvciBzcGVha2VyPyANCkkgY2FuIHRlc3QgdGhpcyBhbmQgZ2V0IGJhY2sgdG8g
eW91Lg0KDQo+ID4NCj4gPiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgdGhlIGZpeHVwIGZ1bmN0aW9u
IG5lZWRzIHRvIGJlIHNwbGl0Pw0KPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBC
ZXN0IHJlZ2FyZHMsDQo+ID4gPiA+ID4gTHVrYXN6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBjencu
LCAyMSBtYWogMjAyMCBvIDE5OjE3IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0DQo+ID4gPiA+ID4gPHBp
ZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4gbmFwaXNhxYIoYSk6DQo+ID4gPiA+
ID4+DQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IE9uIDUvMjEvMjAgMTI6MDgg
UE0sIMWBdWthc3ogTWFqY3phayB3cm90ZToNCj4gPiA+ID4gPj4+Pg0KPiA+ID4gPiA+Pj4+IGRv
bid0IGFkZCBhIG5ldyBkYWlsaW5rLCB0aGlzIGlzIG5vdCByaWdodC4NCj4gPiA+ID4gPj4+Pg0K
PiA+ID4gPiA+Pj4gQ2FuIHlvdSBhZHZpc2UgYSBiZXR0ZXIgc29sdXRpb24gaG93IHRvIGFzc2ln
biBkaWZmZXJlbnQgZml4dXANCj4gPiA+ID4gPj4+IGZ1bmN0aW9ucyB0byBtaWMgYW5kIHRvIHNw
ZWFrZXJzPyBJIHdhcyBsb29raW5nIGF0ICJkbWljMDEiDQo+ID4gPiA+ID4+PiBkYWlsaW5rIGlu
IHNrbF9uYXU4OGwyNV9tYXg5ODM1N2EuYyBhcyBhbiBleGFtcGxlLg0KPiA+ID4gPiA+Pg0KPiA+
ID4gPiA+PiBJIGFtIG5vdCBzdXJlIEkgZm9sbG93LiB0aGUgRE1JQ3MgYXJlIGhhbmRsZWQgb24g
YSBzaGFyZWQgU1NQLA0KPiA+ID4gPiA+PiBzbyBob3cgd291bGQgb25lIHNldCBhIGRpZmZlcmVu
dCBmaXh1cD8gVGhlIHdvcmQgbGVuZ3RoIGhhdmUgdG8gYmUgdGhlDQo+IHNhbWUuDQo=
