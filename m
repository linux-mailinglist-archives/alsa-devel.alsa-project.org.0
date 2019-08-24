Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0769BCCF
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 11:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 414AA1616;
	Sat, 24 Aug 2019 11:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 414AA1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566639414;
	bh=Z7mQk7XoWeGN3kyuDxYJSlmnyf4jkNqgkGmT70B44uU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZB7w9NArRK3lwty9tfsyFgrvG9nKA/ocq0o7Oda/K8Txwq4ivHCyL4RNSL7r3BlDf
	 dPYFyyHy+fsn+HtBsxZltTd9G48rVIRQcvLQTjg6j4U2F3ZCKvtTRDAJOVLmo8ASiq
	 LWAC9qfyAy0mj0bAFRFTmE0Y36VQot/cIlQEmXNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 036A7F803F3;
	Sat, 24 Aug 2019 11:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 016ECF8036E; Sat, 24 Aug 2019 11:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73FFF8014A
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 11:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73FFF8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 02:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,424,1559545200"; d="scan'208";a="180903767"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2019 02:35:33 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-13-cezary.rojewski@intel.com>
 <d902a188-f870-6745-be42-9df637c7634e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <49e92afb-9c4f-d771-e864-4492e7bb62f4@intel.com>
Date: Sat, 24 Aug 2019 11:35:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d902a188-f870-6745-be42-9df637c7634e@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 12/35] ASoC: Intel: Skylake: Reuse
 sst_dsp_free
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

T24gMjAxOS0wOC0yMyAyMTowNywgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMi8xOSAyOjA0IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IFNreWxha2UgaXMg
c3N0X2RzcCBkZXNjZW5kYW50LiBSYXRoZXIgdGhhbiBieXBhc3NpbmcgZnJhbWV3b3JrJ3MgZmxv
dywKPj4gZW1icmFjZSBpdC4gc3N0X2RzcF9mcmVlIGludm9rZXMgc3N0IHNwZWNpZmljIGhhbmRs
ZXIgaW50ZXJuYWxseSBzbwo+PiBub3RoaW5nIGlzIG1pc3NlZC4KPiAKPiBmb3IgY2xhcml0eSB5
b3Ugc2hvdWxkIGFsc28gYWRkIHRoZSBmcmVlX2lycSBpcyBhbHNvIGhhbmRsZWQgaW50ZXJuYWxs
eSAKPiBpbiBzc3RfZHNwX2ZyZWUoKSwgb3RoZXJ3aXNlIHRoaXMgbG9va3MgbGlrZSBhIG1pc3Rh
a2UgdG8gdGhlIHJldmlld2VyIAo+IHRoYXQncyBub3QgZXZlbiBoYWxmLXdheSB0aHJvdWdoIHRo
ZSBzZXJpZXMuLi4KPiAKCk5vdGVkLCB0aGFua3MuIEluZGVlZCB0aGlzIGlzIGRvbmUgdG8gcmV1
c2Ugc3N0X2RzcF9mcmVlIHdoaWxlIApwcmV2ZW50aW5nIGRvdWJsZSBmcmVlX2lycSBmcm9tIG9j
Y3VycmluZy4KCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENlemFyeSBSb2pld3NraSA8Y2V6YXJ5LnJv
amV3c2tpQGludGVsLmNvbT4KPj4gLS0tCj4+IMKgIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL2Nu
bC1zc3QtZHNwLmMgfCAxIC0KPj4gwqAgc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC1k
c3AuYyB8IDEgLQo+PiDCoCBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LmPCoMKgwqDC
oCB8IDIgKy0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL2NubC1zc3Qt
ZHNwLmMgCj4+IGIvc291bmQvc29jL2ludGVsL3NreWxha2UvY25sLXNzdC1kc3AuYwo+PiBpbmRl
eCAxODljMWM3MDg2ZTMuLjQ4YjQ2NTkzOWVmOCAxMDA2NDQKPj4gLS0tIGEvc291bmQvc29jL2lu
dGVsL3NreWxha2UvY25sLXNzdC1kc3AuYwo+PiArKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFr
ZS9jbmwtc3N0LWRzcC5jCj4+IEBAIC0yMTUsNyArMjE1LDYgQEAgdm9pZCBjbmxfZHNwX2ZyZWUo
c3RydWN0IHNzdF9kc3AgKmRzcCkKPj4gwqDCoMKgwqDCoCBzc3RfaXBjX2ZpbmkoJnNrbC0+aXBj
KTsKPj4gwqDCoMKgwqDCoCBjbmxfaXBjX2ludF9kaXNhYmxlKGRzcCk7Cj4+IC3CoMKgwqAgZnJl
ZV9pcnEoZHNwLT5pcnEsIGRzcCk7Cj4+IMKgwqDCoMKgwqAgY25sX2RzcF9kaXNhYmxlX2NvcmUo
ZHNwLCBTS0xfRFNQX0NPUkUwX01BU0spOwo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0xfR1BM
KGNubF9kc3BfZnJlZSk7Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtc3N0LWRzcC5jIAo+PiBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3QtZHNwLmMK
Pj4gaW5kZXggMzQ4ZTY5MjI2ZTQ2Li4xYzRlY2JjZDdkYjcgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5k
L3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3QtZHNwLmMKPj4gKysrIGIvc291bmQvc29jL2ludGVs
L3NreWxha2Uvc2tsLXNzdC1kc3AuYwo+PiBAQCAtNDY4LDcgKzQ2OCw2IEBAIHZvaWQgc2tsX2Rz
cF9mcmVlKHN0cnVjdCBzc3RfZHNwICpkc3ApCj4+IMKgwqDCoMKgwqAgc3N0X2lwY19maW5pKCZz
a2wtPmlwYyk7Cj4+IMKgwqDCoMKgwqAgc2tsX2lwY19pbnRfZGlzYWJsZShkc3ApOwo+PiAtwqDC
oMKgIGZyZWVfaXJxKGRzcC0+aXJxLCBkc3ApOwo+PiDCoMKgwqDCoMKgIHNrbF9kc3BfZGlzYWJs
ZV9jb3JlKGRzcCwgU0tMX0RTUF9DT1JFMF9NQVNLKTsKPj4gwqAgfQo+PiDCoCBFWFBPUlRfU1lN
Qk9MX0dQTChza2xfZHNwX2ZyZWUpOwo+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLXNzdC5jIAo+PiBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3QuYwo+
PiBpbmRleCA3MmVlM2Q4YTFkN2QuLmU1NTUyMzgyNjM0NiAxMDA2NDQKPj4gLS0tIGEvc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC5jCj4+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9za3ls
YWtlL3NrbC1zc3QuYwo+PiBAQCAtNjIyLDcgKzYyMiw3IEBAIHZvaWQgc2tsX3NzdF9kc3BfY2xl
YW51cChzdHJ1Y3Qgc2tsX2RldiAqc2tsKQo+PiDCoMKgwqDCoMKgIHNrbF9jbGVhcl9tb2R1bGVf
dGFibGUoZHNwKTsKPj4gwqDCoMKgwqDCoCBza2xfZnJlZXVwX3V1aWRfbGlzdChza2wpOwo+PiAt
wqDCoMKgIGRzcC0+b3BzLT5mcmVlKGRzcCk7Cj4+ICvCoMKgwqAgc3N0X2RzcF9mcmVlKGRzcCk7
Cj4+IMKgwqDCoMKgwqAgaWYgKHNrbC0+Ym9vdF9jb21wbGV0ZSAmJiBkc3AtPmNsX2Rldi5idWZz
aXplKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkc3AtPmNsX2Rldi5vcHMuY2xfY2xlYW51cF9j
b250cm9sbGVyKGRzcCk7Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
