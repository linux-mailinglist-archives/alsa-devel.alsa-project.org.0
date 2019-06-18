Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1902549972
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 08:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 953821714;
	Tue, 18 Jun 2019 08:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 953821714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560840799;
	bh=lVddD/ZVE/zsMw4ekRKjT18//Z2eTnlBEijTlXuby4c=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=impOdxhwYh86FUE82cNQvFNMeBmuUaRTKzcVI3WbX6iAztOqQBYTWhzKLG2F7HApP
	 +xTZdjvG5JodJPMlQaeUhOTrbqK88HZEeZLg3KYthvNtYkUxNs1sOyvb6V7aqU+obh
	 N5nYvy4KseDnGwEGeXTvNs14w1NAEET9TE1FOu/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61340F8971C;
	Tue, 18 Jun 2019 08:51:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D06F896F4; Tue, 18 Jun 2019 08:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 792EBF80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 08:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792EBF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 23:51:26 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 23:51:26 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id 7EC9958028E;
 Mon, 17 Jun 2019 23:51:24 -0700 (PDT)
To: Hui Wang <hui.wang@canonical.com>, Daniel Drake <drake@endlessm.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
 <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
 <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
 <210f78be-7988-0daf-1563-513a3da0ba06@canonical.com>
 <a1ba33bb-d33d-669f-861b-17f2ed1f94b1@canonical.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b1f81597-41d5-73f8-81c4-9d75f1cf0dad@linux.intel.com>
Date: Tue, 18 Jun 2019 08:51:27 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a1ba33bb-d33d-669f-861b-17f2ed1f94b1@canonical.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@google.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
 are detected
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Cj4+Pj4+IEkgYW0gbm90IHN1cmUgaWYgaXQncyBhIGdvb2QgaWRlYSB0byBlbmFibGUgdGhpcyBi
eSBkZWZhdWx0LCB0aGUKPj4+Pj4gZXhwZXJpZW5jZSBvZiB0aGUgZmlyc3Qgcm91bmQgc2hvd2Vk
IGl0J3Mgcmlza3kgdG8gbWFrZSBhc3N1bXB0aW9ucyBvbgo+Pj4+PiB3aGF0IEJJT1MgdmVuZG9y
cyBpbXBsZW1lbnRlZC4KPj4+Pgo+Pj4+IENhbiB5b3UgY2xhcmlmeSB3aGF0IHlvdSBtZWFuIGhl
cmUsIGFyZSB5b3Ugc2F5aW5nIHlvdSBkb24ndCB3YW50IHRvCj4+Pj4gZW5hYmxlIHRoaXMgbmV3
IERNSUMgaGFyZHdhcmUgc3VwcG9ydCBieSBkZWZhdWx0Pwo+Pj4KPj4+IE5vLiBXaGF0IEkgYW0g
c2F5aW5nIGlzIHRoYXQKPj4+IGEpIHRoZSBsZWdhY3kgSERhdWRpbyBkcml2ZXIgZG9lcyBub3Qg
c3VwcG9ydCBETUlDcwo+Pj4gYikgdGhlIGRlY2lzaW9uIHRvIGFib3J0IHRoZSBIRGF1ZGlvIGxl
Z2FjeSBkcml2ZXIgcHJvYmUgc2hvdWxkIG5vdCAKPj4+IGJlIHRoZSBkZWZhdWx0LCBzaW5jZSBp
dCBkZXBlbmRzIG9uIEJJT1MgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgCj4+PiB3cm9uZyBhbmQg
b24gd2hpY2ggSSBoYXZlICp6ZXJvKiBjb250cm9sLgo+Pj4KPj4+IFRoZXJlIGFyZSA0IGNhc2Vz
IHJlYWxseToKPj4+Cj4+PiAxLiBETUlDcyBhdHRhY2hlZCB0byBQQ0ggYW5kIEJJT1MvTkhMVCBy
ZXBvcnRzIERNSUNTIC0+IGFib3J0IEhEYXVkaW8gCj4+PiBsZWdhY3kgcHJvYmUKPj4+IDIuIE5v
IERNSUNzIGF0dGFjaGVkIHRvIFBDSCBhbmQgQklPUy9OSExUIGRvZXMgbm90IHJlcG9ydCBETUlD
cyAtPiAKPj4+IGNvbnRpbnVlIHByb2JlIGFuZCB1c2UgSERBdWRpbyBsZWdhY3kuCj4+PiAzLiBE
TUlDcyBhdHRhY2hlZCB0byBQQ0ggYW5kIEJJT1MvTkhMVCBkb2VzIG5vdCByZXBvcnQgRE1JQ3Mg
LT4gCj4+PiBicm9rZW4gY29uZmlnLCB3ZSB3aWxsIG5lZWQgYW4gb3B0aW9uIHRvIGFib3J0IHRo
ZSBwcm9iZSBieSBmb3JjZSBhbmQgCj4+PiBpZ25vcmUgdGhlIEJJT1MgaWYgeW91IGNhcmUgYWJv
dXQgYXVkaW8gY2FwdHVyZS4KPj4+IDQuIG5vIERNSUNzIGF0dGFjaGVkIHRvIFBDSCBhbmQgQklP
Uy9OSExUIHJlcG9ydHMgRE1JQ3MgLT4gYnJva2VuIAo+Pj4gY29uZmlnLCB3ZSBuZWVkIGFuIG9w
dGlvbiB0byBpZ25vcmUgdGhlIEJJT1MgYW5kIGNvbnRpbnVlIHRoZSBwcm9iZS4KPj4KPj4gR290
IGl0LMKgIHdlIHdpbGwgZG8gYSB0ZXN0IG9uIGEgY291cGxlIG9mIG1hY2hpbmVzLCBsZXQgdXMg
c2VlIGlmIHdlIAo+PiBjYW4gbWVldCAzIGFuZCA0IGluIHJlYWxpdHkuCj4gCj4gSSBiYWNrcG9y
dGVkIHRoZXNlIDYgcGF0Y2hlcyB0byBvdXIgNS4wIGtlcm5lbCB3aXRoIHRoZSBzb2YgZHJpdmVy
IGluIAo+IGl0LCBhbmQgdGVzdGVkIG9uIDMgbWFjaGluZXMgd2hpY2ggaGF2ZSBkbWljIGNvbm5l
Y3RlZCB0byBQQ0ggKGF1ZGlvIAo+IGNvbnRyb2xsZXIgcGNpaWQgMHg5ZGM4KSwgd2l0aG91dCB0
aGVzZSA2IHBhdGNoZXMsIEkgbmVlZCB0byBibGFja2xpc3QgCj4gc25kX2hkYV9pbnRlbC5rbyBh
bmQgc25kX3NvY19za2wua28gdG8gbWFrZSB0aGUgc29mIGRyaXZlciB3b3JrLCBhZnRlciAKPiBi
YWNrcG9ydGluZyB0aGVzZSA2IHBhdGNoZXMsIEkgZG9uJ3QgbmVlZCB0byBibGFja2xpc3Qgc25k
X2hkYV9pbnRlbC5rbywgCj4gYnV0IHN0aWxsIG5lZWQgdG8gYmxhY2tsaXN0IHNuZF9zb2Nfc2ts
LmtvLCBvdGhlcndpc2UgdGhlIHNvZiBkcml2ZXIgCj4gZG9lc24ndCB3b3JrLgo+IAoKVGhhbmtz
IGZvciB0ZXN0aW5nLiBJJ3ZlIGRvbmUgYWRkaXRpb25hbCB1cGRhdGVzIG9uIG15IHNpZGUgYW5k
IEkgYW0gCnJlYXNvbmFibHkgY29uZmlkZW50IHdlIGNhbiBtYWtlIHRoaXMgU09GL2xlZ2FjeSBh
dXRvZGV0ZWN0IHdvcmsuCgo+IEFuZCBJIGFsc28gdGVzdGVkIHRoZXNlIDYgcGF0Y2hlcyBvbiAz
IG1hY2hpbmVzIHdpdGhvdXQgZG1pYywgSSBkb24ndCAKPiBuZWVkIHRvIGJsYWNrbGlzdCBhbnl0
aGluZywgdGhlIGF1ZGlvIHdvcmtzIHdlbGwgdmlhIGxlZ2FjeSBoZGF1ZGlvLgo+IAo+IFNvIGZv
ciBjb2V4aXN0ZW5jZcKgIG9mIHNvY19za2wgYW5kIHNvY19zb2YgZHJpdmVycywgZG8gd2UgaGF2
ZSBhbnkgcGxhbj8KCkhEYXVkaW8gaXMgbm90IHdlbGwgc3VwcG9ydGVkIGJ5IHRoZSBTS0wgZHJp
dmVyLiBXZSBpbnRyb2R1Y2VkIHRoaXMgCnN1cHBvcnQgaW4gdjQuMTksIGJ1dCB0aGVyZSBhcmUg
cXVpdGUgYSBmZXcgaXNzdWVzIG9uIHNwZWNpZmljIHBsYXRmb3JtcyAKdGhhdCBhcmUgbm90IHdl
bGwgaGFuZGxlZCAocXVlc3Rpb25hYmxlIHByb2JlIHdoaWNoIGxlYWQgdG8gYnJlYWtpbmcgCmF1
ZGlvIG9uIExpbnVzJyBsYXB0b3AsIGludGVycnVwdCBpc3N1ZXMgZml4ZWQgd2l0aCBTT0YgYW5k
IGxlZ2FjeSwgCmV0YykuIFNpbmNlIFNPRiBpcyB3ZWxsIHN1cHBvcnRlZCBvbiB0aG9zZSBwbGF0
Zm9ybXMsIEkgYW0gaG9uZXN0bHkgCmxlYW5pbmcgdG8gZGUtZmVhdHVyZSBIREF1ZGlvIHN1cHBv
cnQgZnJvbSB0aGUgU0tMIGRyaXZlciAoYXMgaW4gbWFrZSAKdGhlIEhEYXVkaW8gY29kZWMgS2Nv
bmZpZyBvcHRpb24gbm90IHJlY29tbWVuZGVkKSBhbmQgYXBwbHkgdGhlIHNhbWUgCnRyaWNrIGFz
IGZvciB0aGUgbGVnYWN5IHRvIGFib3J0IHRoZSBwcm9iZSBpZiB0aGVyZSBpcyBubyBJMlMgY29k
ZWMgYW5kIApETUlDcyBhcmUgZGV0ZWN0ZWQuIEl0IHdvdWxkIGhhdmUgbm8gZWZmZWN0IG9uIGFu
eSB1c2VycyBhbmQgd291bGQgaGVscCAKZGlzdHJvcyBsaWtlIFVidW50dSBhdm9pZCB0aGUgbmVl
ZCBmb3IgYmxhY2tsaXN0cy4gV2UgY2FuIGFsc28gYXBwbHkgCkRNSS1iYXNlZCBxdWlya3MgZm9y
IENocm9tZSwgZS5nLiBmb3Igbm93IGFsbCBwbGF0Zm9ybXMgcHJpb3IgdG8gR0xLIApzaG91bGQg
dXNlIFNLTCBhbmQgbW9yZSByZWNlbnQgb25lcyBTT0YuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
