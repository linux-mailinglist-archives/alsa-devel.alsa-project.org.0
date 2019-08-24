Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8217D9BCD3
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 11:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08230166D;
	Sat, 24 Aug 2019 11:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08230166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566639818;
	bh=lEn9iOx7DAE1Y4Hnm5RD5lGmaf+gG1Tq2o9T6uTdtO0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChHt5PDkrGHIWzPkBf9QqQ65/8ka6Ghcuwwu4wfcgbHdCxmied/0S2HJEOPJukWJP
	 YHB3TFxR4+omyQzI/aoP9VXqXrDIsdJw3Bxqd0Tckh7Cb1kz6YxxtpElleK7/S3dtQ
	 vRps60DE/u/0VOcwpftGbbvMUlj8H9xJQwJzXu3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB064F80391;
	Sat, 24 Aug 2019 11:41:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 303E1F8036D; Sat, 24 Aug 2019 11:41:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A7ABF80147
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 11:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A7ABF80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 02:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,424,1559545200"; d="scan'208";a="180904485"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2019 02:41:43 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-16-cezary.rojewski@intel.com>
 <d334cfab-34c9-a75b-598a-8527ffc89f54@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a22b7910-abeb-a8be-87a9-0e6e121d054d@intel.com>
Date: Sat, 24 Aug 2019 11:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d334cfab-34c9-a75b-598a-8527ffc89f54@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 15/35] ASoC: Intel: Skylake: Use dsp
 loading functions directly
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

T24gMjAxOS0wOC0yMyAyMToxNywgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMi8xOSAyOjA0IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IE5vbmUgb2Ygc2ts
X2RzcF9sb2FkZXJfb3BzIGFyZSBhY3R1YWxseSBleHRlbmRlZCBhcyBhbnkgcGFyYW1ldGVyIHRo
YXQKPj4gY291bGQgYmUgImV4dGVuZGVkIiBpcyBhbHJlYWR5IHBhcnQgb2YgZ2l2ZW4gZnVuY3Rp
b24ncyBwYXJhbWV0ZXIgbGlzdC4KPj4gUmF0aGVyIHRoYW4gb2JmdXN0YWNlIG5vbi1kZXJpdmVk
IGNhbGxzIHdpdGggb3BzIGFuZCBkZXJlZmVyZW5jZXMsIG1ha2UKPiAKPiBBIHR5cG8gb24gb2Jm
dXNjYXRlIGNvdWxkIGJlIGludGVudGlvbmFsPwo+IAo+PiB1c2Ugb2Ygc2FpZCBvcGVyYXRpb24g
ZGlyZWN0bHkuIFRha2VzIHBhcnQgaW4gcmVtYWwgb2YKPiAKPiByZW1vdmFsPwo+IAoKQWNrIG9u
IGJvdGguCgo+PiBza2xfZHNwX2xvYWRlcl9vcHMgc3RydWN0dXJlLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+Cj4+IC0tLQo+
PiDCoCBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9ieHQtc3N0LmPCoMKgwqDCoMKgwqAgfCAxOCAr
KysrKysrKystLS0tLS0tLS0KPj4gwqAgc291bmQvc29jL2ludGVsL3NreWxha2UvY25sLXNzdC5j
wqDCoMKgwqDCoMKgIHwgMTAgKysrKystLS0tLQo+PiDCoCBzb3VuZC9zb2MvaW50ZWwvc2t5bGFr
ZS9za2wtbWVzc2FnZXMuY8KgIHwgMTAgKysrKystLS0tLQo+PiDCoCBzb3VuZC9zb2MvaW50ZWwv
c2t5bGFrZS9za2wtc3N0LWNsZG1hLmMgfCAxMCArKysrKy0tLS0tCj4+IMKgIHNvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL3NrbC1zc3QtZHNwLmjCoMKgIHzCoCA5ICsrKysrKysrKwo+PiDCoCA1IGZp
bGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3NreWxha2UvYnh0LXNzdC5jIAo+PiBiL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL2J4dC1zc3QuYwo+PiBpbmRleCBhOGEyNzgzZjliMzcuLjFjYTRmYmEw
ZjM1ZiAxMDA2NDQKPj4gLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2UvYnh0LXNzdC5jCj4+
ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL2J4dC1zc3QuYwo+PiBAQCAtNjAsNyArNjAs
NyBAQCBieHRfbG9hZF9saWJyYXJ5KHN0cnVjdCBzc3RfZHNwICpjdHgsIHN0cnVjdCAKPj4gc2ts
X2xpYl9pbmZvICpsaW5mbywgaW50IGxpYl9jb3VudCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChyZXQgPCAwKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGxvYWRfbGlicmFy
eV9mYWlsZWQ7Cj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJlYW1fdGFnID0gY3R4LT5kc3Bfb3BzLnBy
ZXBhcmUoY3R4LT5kZXYsIDB4NDAsCj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJlYW1fdGFnID0gc2ts
X2RzcF9wcmVwYXJlKGN0eC0+ZGV2LCAweDQwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RyaXBwZWRfZncuc2l6ZSwgJmRtYWIpOwo+IAo+IGZpdHMgb24g
b25lIGxpbmUgbm93Pwo+IAoKV2lsbCBjaGVjaywgdGhhbmtzLgoKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChzdHJlYW1fdGFnIDw9IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycihjdHgtPmRldiwgIkxpYiBwcmVwYXJlIERNQSBlcnI6ICV4XG4iLAo+PiBAQCAtNzIs
MTQgKzcyLDE0IEBAIGJ4dF9sb2FkX2xpYnJhcnkoc3RydWN0IHNzdF9kc3AgKmN0eCwgc3RydWN0
IAo+PiBza2xfbGliX2luZm8gKmxpbmZvLCBpbnQgbGliX2NvdW50KQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZG1hX2lkID0gc3RyZWFtX3RhZyAtIDE7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1j
cHkoZG1hYi5hcmVhLCBzdHJpcHBlZF9mdy5kYXRhLCBzdHJpcHBlZF9mdy5zaXplKTsKPj4gLcKg
wqDCoMKgwqDCoMKgIGN0eC0+ZHNwX29wcy50cmlnZ2VyKGN0eC0+ZGV2LCB0cnVlLCBzdHJlYW1f
dGFnKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHNrbF9kc3BfdHJpZ2dlcihjdHgtPmRldiwgdHJ1ZSwg
c3RyZWFtX3RhZyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBza2xfc3N0X2lwY19sb2Fk
X2xpYnJhcnkoJnNrbC0+aXBjLCBkbWFfaWQsIGksIHRydWUpOwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKHJldCA8IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoY3R4
LT5kZXYsICJJUEMgTG9hZCBMaWIgZm9yICVzIGZhaWw6ICVkXG4iLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGluZm9baV0ubmFtZSwgcmV0KTsKPiAKPiBp
bmRlbnQ/Cj4gCgpIbW0gbG9va3MgbGlrZSB0aGlzIGhhcyBiZWVuIGhlcmUgYmVmb3JlIGJ1dCBp
bmRlZWQgY2FuIGJlIGNvcnJlY3RlZC4KCj4+IC3CoMKgwqDCoMKgwqDCoCBjdHgtPmRzcF9vcHMu
dHJpZ2dlcihjdHgtPmRldiwgZmFsc2UsIHN0cmVhbV90YWcpOwo+PiAtwqDCoMKgwqDCoMKgwqAg
Y3R4LT5kc3Bfb3BzLmNsZWFudXAoY3R4LT5kZXYsICZkbWFiLCBzdHJlYW1fdGFnKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgIHNrbF9kc3BfdHJpZ2dlcihjdHgtPmRldiwgZmFsc2UsIHN0cmVhbV90YWcp
Owo+PiArwqDCoMKgwqDCoMKgwqAgc2tsX2RzcF9jbGVhbnVwKGN0eC0+ZGV2LCAmZG1hYiwgc3Ry
ZWFtX3RhZyk7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IEBA
IC0xMDAsNyArMTAwLDcgQEAgc3RhdGljIGludCBzc3RfYnh0X3ByZXBhcmVfZncoc3RydWN0IHNz
dF9kc3AgKmN0eCwKPj4gwqAgewo+PiDCoMKgwqDCoMKgIGludCBzdHJlYW1fdGFnLCByZXQ7Cj4+
IC3CoMKgwqAgc3RyZWFtX3RhZyA9IGN0eC0+ZHNwX29wcy5wcmVwYXJlKGN0eC0+ZGV2LCAweDQw
LCBmd3NpemUsIAo+PiAmY3R4LT5kbWFiKTsKPj4gK8KgwqDCoCBzdHJlYW1fdGFnID0gc2tsX2Rz
cF9wcmVwYXJlKGN0eC0+ZGV2LCAweDQwLCBmd3NpemUsICZjdHgtPmRtYWIpOwo+PiDCoMKgwqDC
oMKgIGlmIChzdHJlYW1fdGFnIDw9IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIo
Y3R4LT5kZXYsICJGYWlsZWQgdG8gcHJlcGFyZSBETUEgRlcgbG9hZGluZyBlcnI6ICV4XG4iLAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cmVhbV90YWcpOwo+PiBAQCAt
MTYyLDcgKzE2Miw3IEBAIHN0YXRpYyBpbnQgc3N0X2J4dF9wcmVwYXJlX2Z3KHN0cnVjdCBzc3Rf
ZHNwICpjdHgsCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqAgYmFzZV9md19sb2FkX2Zh
aWxlZDoKPj4gLcKgwqDCoCBjdHgtPmRzcF9vcHMuY2xlYW51cChjdHgtPmRldiwgJmN0eC0+ZG1h
Yiwgc3RyZWFtX3RhZyk7Cj4+ICvCoMKgwqAgc2tsX2RzcF9jbGVhbnVwKGN0eC0+ZGV2LCAmY3R4
LT5kbWFiLCBzdHJlYW1fdGFnKTsKPj4gwqDCoMKgwqDCoCBza2xfZHNwX2NvcmVfcG93ZXJfZG93
bihjdHgsIFNLTF9EU1BfQ09SRV9NQVNLKDEpKTsKPj4gwqDCoMKgwqDCoCBza2xfZHNwX2Rpc2Fi
bGVfY29yZShjdHgsIFNLTF9EU1BfQ09SRTBfTUFTSyk7Cj4gCj4gdGhvc2UgbWFjcm9zIGxvb2sg
Y29uZnVzaW5nLiBDT1JFeF9NQVNLIG9yIENPUkVfTUFTSyh4KSwgY2hvb3NlIG9uZS4KPiAKCkh1
aCwgaGF2ZW4ndCB0b3VjaGVkIGFueSBfQ09SRV9NQVNLPyBTZWVpbmcgdGhhdCB5b3UgYXJlIGN1
cmlvdXMsIGxldCBtZSAKZG8gYSBsaXR0bGUgc25lYWsgcGVhazogbWFueSBtYWNyb3MgYXJlIG5v
IGxvbmdlciB3aXRoIHVzIGFuZCBzb29uIG5vIApsb25nZXIgb24gdXBzdHJlYW0hIFRoYXQgaW5j
bHVkZXMgc29tZSBmaWxlcyB0b28gOiBECl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
