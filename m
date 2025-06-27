Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB2AEB8F7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E1FC6031F;
	Fri, 27 Jun 2025 15:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E1FC6031F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751031003;
	bh=ioWUImYH/NHoRctZbvnT74UnjKm9PIAYzlU7tSarR6A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EljbbrdkwIMRLu/fG5sdp9QXd1XCtItly5xfiYpMIRWnBuT3KFkc99WVam/xjTsHt
	 kvuN3C14+7VP0Z5A/T0kshNAuCyzeOkbFdR0fNeiqYLaV8Am/RRKWTfWJVFVJ7LpZP
	 hdjpnBllH8gi096yiLSI+BYAfI8aW0qzbtpV+1Xk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CACF6F8067E; Fri, 27 Jun 2025 15:24:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A72A0F89710;
	Fri, 27 Jun 2025 15:24:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BC4CF80217; Fri, 27 Jun 2025 06:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 115A9F80100
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 06:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 115A9F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=wmfGUjYM
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55R4vUu52650629;
	Thu, 26 Jun 2025 23:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751000250;
	bh=ioWUImYH/NHoRctZbvnT74UnjKm9PIAYzlU7tSarR6A=;
	h=From:To:CC:Subject:Date;
	b=wmfGUjYMefVao4i02x2/u7u6UYIEe2e4LFCNQaDBFD1t3vVSbGd6rT8ycswCbtxxQ
	 hEgHg61dEigc7p78eOeG65ax/SXn6/Yk5owvou8b3JL5doxOL8IUip+2AD1nW4gTc5
	 C5MLF9XhmnzHsN/xazAsSsxxAwWXNujHLlGV7DAQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55R4vUS9073281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 23:57:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 23:57:29 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Thu, 26 Jun 2025 23:57:29 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "tiwai@suse.de" <tiwai@suse.de>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Ding,
 Shenghao" <shenghao-ding@ti.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family of
 codecs
Thread-Topic: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family
 of codecs
Thread-Index: AdvnF9HmTFLrcLE5ScmquuxsqrwJVA==
Date: Fri, 27 Jun 2025 04:57:29 +0000
Message-ID: <3c54f7d51e1941cbb8a15147c99d64ee@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.133.122]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YL6BL2XREJSDQLMFP2CSTXDUQE5SQJJ2
X-Message-ID-Hash: YL6BL2XREJSDQLMFP2CSTXDUQE5SQJJ2
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:24:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YL6BL2XREJSDQLMFP2CSTXDUQE5SQJJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmtzIGZvciBxdWljayByZXZpZXcuDQo+IEZyb206IFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSAyNywgMjAyNSAxOjA5IEFNDQo+IFRv
OiBIb2xhbHUgWW9nZW5kcmEsIE5pcmFuamFuIDxuaXJhbmphbi5oeUB0aS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjMgMi80XSBkdC1iaW5kaW5nczogc291bmQ6IGJpbmRpbmdzIGZvcg0K
PiB0YWM1eDF4IGZhbWlseSBvZiBjb2RlY3MNCj4gT24gVGh1LCAyNiBKdW4gMjAyNSAyMzo0Mzoz
MSArMDUzMCwgTmlyYW5qYW4gSCBZIHdyb3RlOg0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC90aSx0YWM1eDF4LnlhbWwNCi4uLg0KPiB5YW1sbGludCB3YXJuaW5n
cy9lcnJvcnM6DQo+IA0KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0KPiBXYXJuaW5n
OiBEdXBsaWNhdGUgY29tcGF0aWJsZSAidGksdGFhNTQxMiIgZm91bmQgaW4gc2NoZW1hcyBtYXRj
aGluZw0KPiBXYXJuaW5nOiBEdXBsaWNhdGUgY29tcGF0aWJsZSAidGksdGFhNTIxMiIgZm91bmQg
aW4gc2NoZW1hcyBtYXRjaGluZw0KPiBXYXJuaW5nOiBEdXBsaWNhdGUgY29tcGF0aWJsZSAidGks
dGFkNTIxMiIgZm91bmQgaW4gc2NoZW1hcyBtYXRjaGluZw0KVGhlIGR1cGxpY2F0ZSBjb21wYXRp
YmxlIGFyZSBhbHJlYWR5IHJlbW92ZWQgYXMgcGFydCBvZiB0aGUgcGF0Y2ggc2VyaWVzIA0KaW4g
cGF0Y2ggW3YzLDQvNF0gZHQtYmluZGluZ3M6IHNvdW5kOiBkZXZpY2Ugc3VwcG9ydCBsaXN0IGZv
ciBwY202MjQwIC4NCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0
cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjUwNjI2MTgxMzM0LjEyMDAtNS1uaXJhbmphbi5oeUB0aS5j
b20vDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgc3RpbGwgYWRkaXRpb25hbCBhY3Rpb24gaXMgcmVx
dWlyZWQuIA0KDQpSZWdhcmRzDQpOaXJhbmphbiBIIFkNCg==
