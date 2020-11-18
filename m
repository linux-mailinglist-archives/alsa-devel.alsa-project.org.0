Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E842B856B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 21:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5BA171B;
	Wed, 18 Nov 2020 21:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5BA171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605730629;
	bh=hXSrVV3W+9TeTPLiMYtmHxvbl4bjBAIk1vG+LjM5hFw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sry9LDuroTGHixsHZI92BMVuWAUNv/wtlXetMCFToandlA3w4oufTMar2CcbeTHd+
	 17wHZcLUVOICYbrz40dLohPzEDcNGLHpo2Em/hr0jRQrwkF31Vw+woZ1O4On+K+6sl
	 v+qvlaC3T0x7SvI9CnGJ9HT9FUT+E4WxLn0VUZO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D2CF80168;
	Wed, 18 Nov 2020 21:16:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43FB8F8016D; Wed, 18 Nov 2020 21:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CA02F80168
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CA02F80168
IronPort-SDR: ZaeDpOOw6zPQIDk+0Na2MEVnUO6l1Eff1v8IwPGDetpS0TFLiTR+cKM0bmdmw6k2yW1Rlofd0e
 II9IPNBI7LYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="151025188"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="151025188"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 12:15:58 -0800
IronPort-SDR: 0dUhpEwBNWY4dKbmZ39wciF33GjS4CmoIBjP0PKrId1cJK6OYlSp5x/W1GKA+rCmwD7Ts+SgJa
 hpJvsgOsXosA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="534471254"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2020 12:15:57 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Nov 2020 20:15:56 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 18 Nov 2020 20:15:56 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai
 <tiwai@suse.de>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanF+0XggABMLQCAAASUgIAEnFAQgAAmMgCAAVQSgIAAh8aQgAAL6wCAAWXZUA==
Date: Wed, 18 Nov 2020 20:15:56 +0000
Message-ID: <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
 <20201113164946.GD4828@sirena.org.uk>
 <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
 <d462c890495e4dda8698b5ba5eb50066@intel.com>
 <f62abcd8-b67f-774b-61b5-e08cfc3d2cc7@linux.intel.com>
 <s5h1rgst6z4.wl-tiwai@suse.de> <0286c6975f24432082f609d45adaa14c@intel.com>
 <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
In-Reply-To: <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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

T24gMjAyMC0xMS0xNyAxMTo1MyBQTSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+IE9u
IDExLzE3LzIwIDQ6MTMgUE0sIFJvamV3c2tpLCBDZXphcnkgd3JvdGU6DQo+PiBPbiAyMDIwLTEx
LTE3IDM6MDQgUE0sIFRha2FzaGkgSXdhaSB3cm90ZToNCi4uLg0KDQo+Pj4gSSBndWVzcyBDZXph
cnkgbWVhbiB0aGUgbW9kcHJvYmUgYmxhY2tsaXN0PyAgVGhpcyB3YXMgdXNlZCBpbiB0aGUNCj4+
PiBlYXJseSBzdGFnZSBvZiBBU29DIFNreWxha2UgZHJpdmVyIGRldmVsb3BtZW50LCBidXQgaW4g
dGhlIGVuZCwgaXQncw0KPj4+IG1vcmUgY3VtYmVyc29tZSBiZWNhdXNlIHVzZXIgbmVlZHMgdG8g
Y2hhbmdlIG11bHRpcGxlIHBsYWNlcy4gIFRoZQ0KPj4+IHNpbmdsZSBtb2R1bGUgcGFyYW1ldGVy
IHdhcyBlYXNpZXIgdG8gaGFuZGxlLg0KPj4+DQo+Pg0KPj4gVGhhbmtzIGZvciBqb2luaW5nIHRo
ZSBkaXNjdXNzaW9uLCBUYWthc2hpLg0KPj4NCj4+IElmIHRoZSBzd2l0Y2ggb2Ygc29sdXRpb24g
Zm9yIGF0b20tYmFzZWQgcHJvZHVjdHMgaXMgaW1taW5lbnQsIHdoeSBhZGQNCj4+IGNvZGUgd2hp
Y2ggYmVjb21lcyByZWR1bmRhbnQgc29vbiBhZnRlcj8NCj4gDQo+IFRvIGJlIGNsZWFyOiB0aGVy
ZSBpcyAqbm8gcGxhbiogdG8gKnJlbW92ZSogdGhlIEF0b20vc3N0IGNvZGUgYW55IHRpbWUgDQo+
ICdzb29uJywgb25seSB0byAqZGVwcmVjYXRlKiBpdC4NCj4gDQo+IEluIHRoZSBiZXN0IGNhc2Ug
ZGlzdHJpYnV0aW9ucyB3b3VsZCB0cmFuc2l0aW9uIGluIDIwMjEuIFNvbWUgZGlzdHJvcyANCj4g
YXJlIGZhc3RlciB0aGFuIG90aGVycywgbmVpdGhlciB5b3Ugbm9yIEkgaGF2ZSBhbnkgY29udHJv
bCBvdmVyIHRoaXMuDQo+IA0KPiBSZW1vdmluZyBjb2RlIGZyb20gdGhlIGtlcm5lbCBpcyBub3Qg
c29tZXRoaW5nIHdlIGNhbiBkbyB1bmxlc3MgdGhlcmUgaXMgDQo+IGRlbW9uc3RyYXRlZCBldmlk
ZW5jZSB0aGF0IHRoZSBudW1iZXIgb2YgaW1wYWN0ZWQgdXNlcnMgaXMgY2xvc2UgdG8gemVybyAN
Cj4gYW5kIGRpc3RyaWJ1dGlvbnMgbm8gbG9uZ2VyIHN1cHBvcnQgdGhhdCBjb2RlLiBUaGUgY2Fz
ZSBvZiBCYXl0cmFpbCANCj4gbGVnYWN5IGlzIHRlbGxpbmcsIHlvdSByZW1vdmVkIGl0IGVhcmxp
ZXIgdGhpcyBGYWxsIGJ1dCBhZnRlciBhIA0KPiByZWNvbW1lbmRlZCBhbHRlcm5hdGl2ZSB3YXMg
cHJvdmlkZWQgZm9yIG1vcmUgdGhhbiAzIHllYXJzLg0KPiANCj4gQWdhaW4sIHRoZXJlIGlzIG5v
IHBsYW5uZWQgJ3N3aXRjaCcgYnV0IGEgZ3JhZHVhbCB0cmFuc2l0aW9uLCBhbmQgdGhhdCANCj4g
cGF0Y2hzZXQgaGVscHMgd2l0aCB0aGUgdHJhbnNpdGlvbi4NCg0KSG1tLCB0aGVuIG1heWJlIEkg
bWlzdW5kZXJzdG9vZCBIYW5zLiBHaXZlbiBoaXMgZmVlZGJhY2sgaXQgc2VlbWVkIGxpa2UNCkZl
ZG9yYSBpcyBhYm91dCB0byBzd2l0Y2ggdG8gU09GIHJpZ2h0IG5vdy4NCg0KSW5kZWVkLCBiZWZv
cmUgSSd2ZSBzZW50IHBhdGNoZXMgcmVtb3ZpbmcgQmF5dHJhaWwsIGJhc2ljYWxseSBldmVyeQ0K
c3VwcG9ydC10ZWFtIGhhZCBiZWVuIGFza2VkIGFib3V0IGl0cyB1c2FnZSBhbmQgdGhlIGFuc3dl
cnMgd2VyZQ0KbmVnYXRpdmUuIC9hdG9tLyB3YXMgY292ZXJpbmcgYmFzaWNhbGx5IGV2ZXJ5IGNh
c2UgYW55d2F5IGxpa2UgeW91DQpwb2ludGVkIG91dCBzbyAvYmF5dHJhaWwvIHNvbHV0aW9uIGZl
bHQgbW9yZSBsaWtlIGEgZHVwbGljYXRpb24uDQoNCkFzIFNPRiBpcyB0aGUgZGVzaXJlZCBzb2x1
dGlvbiBmb3IgYXRvbS1iYXNlZCBwcm9kdWN0cywgSSBjYW4gc2VlIHRoZQ0KbmVlZCBmb3Igc29t
ZSBzb3J0IG9mIHNlbGVjdGlvbiBtZWNoYW5pc20uIFRoZSBzYW1lIGNhbm5vdCBiZSBzYWlkIGZv
cg0KaHN3L2JkdyB0aG91Z2guIExldCdzIGxlYXZlIGNhdHB0IG91dCB0aGlzLCBzaGFsbCB3ZT8N
Cg0KQ3phcmVrDQoNCg==
