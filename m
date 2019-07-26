Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396D3773DF
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 00:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B728620E4;
	Sat, 27 Jul 2019 00:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B728620E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564179090;
	bh=TVDwYuKIElSne//cRGzL+hTCVv6TcdYjNE2395e0I78=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRSgsn970ta1VolaLWtSzWH8SSQeyztoOkdNnTTC8nvKIHayM6qVgoalZRS9Ynm6A
	 K582O5VVajCRI9B19It5H94QqIahS7ADdLTP0nFNpg20qBxeUDmqDSjJBVkhaAXSdy
	 DJaCpkAClUsBZDC7F4umSl5zzP/M7fhHWXsuUPFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE3AF803D1;
	Sat, 27 Jul 2019 00:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 906B2F80393; Sat, 27 Jul 2019 00:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78594F800E8
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 00:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78594F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 15:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,312,1559545200"; d="scan'208";a="172365019"
Received: from rmfosha-mobl.amr.corp.intel.com (HELO [10.251.137.254])
 ([10.251.137.254])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2019 15:09:33 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190719203752.11151-1-pierre-louis.bossart@linux.intel.com>
 <20190719203752.11151-3-pierre-louis.bossart@linux.intel.com>
 <daaa01dc-d963-f215-90b1-132fde8e489a@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ad3ea067-f7be-ea53-e40d-c4ad62b51688@linux.intel.com>
Date: Fri, 26 Jul 2019 17:09:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <daaa01dc-d963-f215-90b1-132fde8e489a@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/5] ALSA: hda: move parts of NHLT code
 to new module
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

cmVwbHlpbmcgYmVsb3cgdG8gdGhlIGZlZWRiYWNrIEkgbWlzc2VkIGVhcmxpZXIuIFdpbGwgc2Vu
ZCBhIHY0IG5leHQgd2Vlay4KCj4+IGRpZmYgLS1naXQgYS9zb3VuZC9oZGEvaW50ZWwtbmhsdC5j
IGIvc291bmQvaGRhL2ludGVsLW5obHQuYwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjdiYTg3MWU0NzBmMgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3Nv
dW5kL2hkYS9pbnRlbC1uaGx0LmMKPj4gQEAgLTAsMCArMSw5OCBAQAo+PiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gKy8vIENvcHlyaWdodCAoYykgMjAxNS0yMDE5IElu
dGVsIENvcnBvcmF0aW9uCj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+Cj4+ICsjaW5j
bHVkZSA8c291bmQvaW50ZWwtbmhsdC5oPgo+PiArCj4+ICsjZGVmaW5lIE5ITFRfQUNQSV9IRUFE
RVJfU0lHwqDCoMKgICJOSExUIgo+PiArCj4+ICsvKiBVbmlxdWUgaWRlbnRpZmljYXRpb24gZm9y
IGdldHRpbmcgTkhMVCBibG9icyAqLwo+PiArc3RhdGljIGd1aWRfdCBvc2NfZ3VpZCA9Cj4+ICvC
oMKgwqAgR1VJRF9JTklUKDB4QTY5Rjg4NkUsIDB4NkNFQiwgMHg0NTk0LAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgIDB4QTQsIDB4MUYsIDB4N0IsIDB4NUQsIDB4Q0UsIDB4MjQsIDB4QzUsIDB4NTMp
Owo+PiArCj4+ICtzdHJ1Y3QgbmhsdF9hY3BpX3RhYmxlICppbnRlbF9uaGx0X2luaXQoc3RydWN0
IGRldmljZSAqZGV2KQo+PiArewo+PiArwqDCoMKgIGFjcGlfaGFuZGxlIGhhbmRsZTsKPj4gK8Kg
wqDCoCB1bmlvbiBhY3BpX29iamVjdCAqb2JqOwo+PiArwqDCoMKgIHN0cnVjdCBuaGx0X3Jlc291
cmNlX2Rlc2PCoCAqbmhsdF9wdHIgPSBOVUxMOwo+IAo+IFN1cGVyZmx1b3VzIHNwYWNlLiBJbiBm
YWN0LCBpdHMgaW5pdGlhbGl6YXRpb24gaXMgdG9vLgoKaW5kZWVkLCB3aWxsIHJlbW92ZSBhbmQg
Zml4IHNwYWNpbmcuCgo+IAo+PiArwqDCoMKgIHN0cnVjdCBuaGx0X2FjcGlfdGFibGUgKm5obHRf
dGFibGUgPSBOVUxMOwo+PiArCj4+ICvCoMKgwqAgaGFuZGxlID0gQUNQSV9IQU5ETEUoZGV2KTsK
Pj4gK8KgwqDCoCBpZiAoIWhhbmRsZSkgewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYs
ICJEaWRuJ3QgZmluZCBBQ1BJX0hBTkRMRVxuIik7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
TlVMTDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBvYmogPSBhY3BpX2V2YWx1YXRlX2Rz
bShoYW5kbGUsICZvc2NfZ3VpZCwgMSwgMSwgTlVMTCk7Cj4+ICvCoMKgwqAgaWYgKG9iaiAmJiBv
YmotPnR5cGUgPT0gQUNQSV9UWVBFX0JVRkZFUikgewo+IAo+IFBlcnNvbmFsbHksIEkgYWx3YXlz
IGZhdm9yIGNvZGUgd2l0aCBsb3dlciBpbmRlbnRhdGlvbiBvdmVyIHRoZSBvbmUgd2l0aCAKPiBo
aWdoZXIgdGFicyAtIG1ha2VzIGl0IGVhc2llciBmb3IgcmVhZGVyIHRvIHdlbGwuLiByZWFkLgo+
IFlvdSBjb3VsZCBzaW1wbHkgcmV2ZXJ0IHRoZSBiZWhhdmlvciBvZiBpZi1zdGF0ZW1lbnQgYW5k
IGJhaWwgb3V0IAo+IGltbWVkaWF0ZWx5IHdpdGggYmVsb3cgZGV2X2RiZyBhbmQgcmV0dXJuIE5V
TEwuIEFmdGVyd2FyZCwgZW50aXJlIGJsb2NrIAo+IGNhbiBiZSBzaGlmdGVkIGxlZnQuCgp5ZXMs
IG1ha2VzIHNlbnNlLgoKPiAKPj4gK8KgwqDCoMKgwqDCoMKgIG5obHRfcHRyID0gKHN0cnVjdCBu
aGx0X3Jlc291cmNlX2Rlc2PCoCAqKW9iai0+YnVmZmVyLnBvaW50ZXI7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAobmhsdF9wdHItPmxlbmd0aCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmhs
dF90YWJsZSA9IChzdHJ1Y3QgbmhsdF9hY3BpX3RhYmxlICopCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWVtcmVtYXAobmhsdF9wdHItPm1pbl9hZGRyLCBuaGx0X3B0ci0+bGVu
Z3RoLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNRU1SRU1B
UF9XQik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBBQ1BJX0ZSRUUob2JqKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIGlmIChuaGx0X3RhYmxlICYmCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChzdHJuY21w
KG5obHRfdGFibGUtPmhlYWRlci5zaWduYXR1cmUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBOSExUX0FDUElfSEVBREVSX1NJRywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cmxlbihOSExUX0FDUElfSEVBREVSX1NJRykpICE9IDApKSB7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbXVubWFwKG5obHRfdGFibGUpOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIk5ITFQgQUNQSSBoZWFkZXIgc2lnbmF0dXJlIGlu
Y29ycmVjdFxuIik7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOwo+PiAr
wqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIG5obHRfdGFibGU7Cj4+
ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgZGV2X2RiZyhkZXYsICJObyBOSExUIHRhYmxlIGZv
dW5kXG4iKTsKPj4gK8KgwqDCoCByZXR1cm4gTlVMTDsKPiAKPiBXaGlsZSBhdCBpdCwgZG9uJ3Qg
d2UgbGVhayBvYmogaGVyZT8gU2hvdWxkbid0IHdlIEFDUElfRlJFRShvYmopIAo+IHJlZ2FyZGxl
c3Mgb2YgIm9iai0+dHlwZSA9PSBBQ1BJX1RZUEVfQlVGRkVSIiBjaGVjaydzIG91dGNvbWU/Cgp5
ZXMsIHRoYXQgbG9va3MgbGlrZSBhIGJ1Zy4gVGhpcyBpc24ndCBuZXcgY29kZSBJIHdyb3RlLCBp
dCdzIGJlZW4gdGhhdCAKd2F5IGZvciB5ZWFycy4uLgoKV2UgbWF5IHdhbnQgdG8gdHJhY2sgdGhp
cyB3aXRoIGEgZGVkaWNhdGVkIHBhdGNoLCByYXRoZXIgdGhhbiBsdW1waW5nIApmaXhlcyB3aXRo
IGluZGVudHMuCgo+IAo+PiArfQo+PiArRVhQT1JUX1NZTUJPTF9HUEwoaW50ZWxfbmhsdF9pbml0
KTsKPj4gKwo+PiArdm9pZCBpbnRlbF9uaGx0X2ZyZWUoc3RydWN0IG5obHRfYWNwaV90YWJsZSAq
bmhsdCkKPj4gK3sKPj4gK8KgwqDCoCBtZW11bm1hcCgodm9pZCAqKW5obHQpOwo+PiArfQo+PiAr
RVhQT1JUX1NZTUJPTF9HUEwoaW50ZWxfbmhsdF9mcmVlKTsKPj4gKwo+PiAraW50IGludGVsX25o
bHRfZ2V0X2RtaWNfZ2VvKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IAo+PiBuaGx0X2FjcGlf
dGFibGUgKm5obHQpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IG5obHRfZW5kcG9pbnQgKmVwbnQ7
Cj4+ICvCoMKgwqAgc3RydWN0IG5obHRfZG1pY19hcnJheV9jb25maWcgKmNmZzsKPj4gK8KgwqDC
oCB1bnNpZ25lZCBpbnQgZG1pY19nZW8gPSAwOwo+PiArwqDCoMKgIHU4IGo7Cj4+ICsKPj4gK8Kg
wqDCoCBpZiAoIW5obHQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPiAKPiBTaG91bGQg
dGhpcyBoYW5kbGVyIGV2ZW4gYXNzdW1lIHBvc3NpYmlsaXR5IG9mIG5obHQgcGFyYW0gYmVpbmcg
bnVsbD8KCnllcywgSSBhZGRlZCB0aGlzIHdoZW4gSSBhbGxvd2VkIHRoZSBkcml2ZXIgdG8gcHJv
YmUgZXZlbiB3aGVuIHRoZXJlIGlzIApubyBOSExUIG9uIHBsYWluIHZhbmlsbGEgSERhdWRpbyBz
b2x1dGlvbnMuIFRoZSBjYWxsZXIgZG9lc24ndCBjaGVjayBmb3IgCk5ITFQgaW4gdGhlIGZpcnN0
IHBsYWNlLgoKc2VlIHRoZSBwcm9iZSBzZXF1ZW5jZQoKCXNrbC0+bmhsdCA9IHNrbF9uaGx0X2lu
aXQoYnVzLT5kZXYpOwoKCWlmIChza2wtPm5obHQgPT0gTlVMTCkgewojaWYgIUlTX0VOQUJMRUQo
Q09ORklHX1NORF9TT0NfSU5URUxfU0tZTEFLRV9IREFVRElPX0NPREVDKQoJCWRldl9lcnIoYnVz
LT5kZXYsICJubyBuaGx0IGluZm8gZm91bmRcbiIpOwoJCWVyciA9IC1FTk9ERVY7CgkJZ290byBv
dXRfZnJlZTsKI2Vsc2UKCQlkZXZfd2FybihidXMtPmRldiwgIm5vIG5obHQgaW5mbyBmb3VuZCwg
Y29udGludWluZyB0byB0cnkgdG8gZW5hYmxlIApIRGF1ZGlvIGNvZGVjXG4iKTsKI2VuZGlmCgl9
IGVsc2UgewoKCQllcnIgPSBza2xfbmhsdF9jcmVhdGVfc3lzZnMoc2tsKTsKCQlpZiAoZXJyIDwg
MCkgewoJCQlkZXZfZXJyKGJ1cy0+ZGV2LCAic2tsX25obHRfY3JlYXRlX3N5c2ZzIGZhaWxlZCB3
aXRoIGVycjogJWRcbiIsIGVycik7CgkJCWdvdG8gb3V0X25obHRfZnJlZTsKCQl9CgoJCXNrbF9u
aGx0X3VwZGF0ZV90b3BvbG9neV9iaW4oc2tsKTsKCgkJLyogY3JlYXRlIGRldmljZSBmb3IgZHNw
IGNsayAqLwoJCWVyciA9IHNrbF9jbG9ja19kZXZpY2VfcmVnaXN0ZXIoc2tsKTsKCQlpZiAoZXJy
IDwgMCkgewoJCQlkZXZfZXJyKGJ1cy0+ZGV2LCAic2tsX2Nsb2NrX2RldmljZV9yZWdpc3RlciBm
YWlsZWQgd2l0aCBlcnI6ICVkXG4iLCAKZXJyKTsKCQkJZ290byBvdXRfY2xrX2ZyZWU7CgkJfQoJ
fQoKCXBjaV9zZXRfZHJ2ZGF0YShza2wtPnBjaSwgYnVzKTsKCgllcnIgPSBza2xfZmluZF9tYWNo
aW5lKHNrbCwgKHZvaWQgKilwY2lfaWQtPmRyaXZlcl9kYXRhKTsKCmluIHdoaWNoIHdlIGRpcmVj
dGx5IGNhbGwgdGhpcyBoZWxwZXIsIHNvIHNrbC0+bmh0bCBjYW4gYmUgTlVMTAoKCWlmIChwZGF0
YSkgewoJCXNrbC0+dXNlX3RwbGdfcGNtID0gcGRhdGEtPnVzZV90cGxnX3BjbTsKCQltYWNoLT5t
YWNoX3BhcmFtcy5kbWljX251bSA9IHNrbF9nZXRfZG1pY19nZW8oc2tsKTsKCX0KCml0J3MgYWN0
dWFsbHkgYSBmZWF0dXJlOiBpZiB0aGVyZSBpcyBubyBOSExUIHRhYmxlIG9yIGl0J3Mgbm90IHZh
bGlkLCAKdGhlbiB0aGVyZSBhcmUgbm8gRE1JQ3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
