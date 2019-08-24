Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7E9BCCE
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 11:36:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34043165D;
	Sat, 24 Aug 2019 11:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34043165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566639367;
	bh=eHahEo7d9jmVO0IPzgZ7dnlSfv/XI4EYqFDlMYpPojk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OFYTSgOBrrXXAychlNzQgK172qEBSoeTP0dcTgDwHNpEemrBonqQd9tGCkEwuL+0F
	 cFSDHscCeMvseGENsB9HHwDMNSAkjWv+hilFdpS9Iuqw1yIvS9oKq73rGAs3BxKpYz
	 LqleFkdU2l7yGuQLl891neXhYkHU6WT3Wqwuan9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DCEBF803D5;
	Sat, 24 Aug 2019 11:34:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8477F8036E; Sat, 24 Aug 2019 11:34:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7236F80145
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 11:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7236F80145
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 02:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,424,1559545200"; d="scan'208";a="180903620"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2019 02:34:10 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-5-cezary.rojewski@intel.com>
 <90bbda82-3988-d02d-0d5d-e63890db81dc@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20fea187-8a0c-c293-bbcb-e8561193bc2f@intel.com>
Date: Sat, 24 Aug 2019 11:34:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <90bbda82-3988-d02d-0d5d-e63890db81dc@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 04/35] ASoC: Intel: Skylake: Unify firmware
 loading mechanism
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

T24gMjAxOS0wOC0yMyAyMDo0MCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+IC1p
bnQgc2tsX3NzdF9pbml0X2Z3KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNrbF9kZXYgKnNr
bCkKPj4gK2ludCBza2xfc3N0X2luaXRfZncoc3RydWN0IHNrbF9kZXYgKnNrbCkKPj4gwqAgewo+
PiAtwqDCoMKgIGludCByZXQ7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHNzdF9kc3AgKnNzdCA9IHNr
bC0+ZHNwOwo+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHNrbC0+ZGV2Owo+PiArwqDC
oMKgIGludCAoKmxwX2NoZWNrKShzdHJ1Y3Qgc3N0X2RzcCAqZHNwLCBib29sIHN0YXRlKTsKPj4g
K8KgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqAgbHBfY2hlY2sgPSBza2wtPmlwYy5vcHMu
Y2hlY2tfZHNwX2xwX29uOwo+PiArwqDCoMKgIHNrbC0+ZW5hYmxlX21pc2NiZGNnZShkZXYsIGZh
bHNlKTsKPj4gK8KgwqDCoCBza2wtPmNsb2NrX3Bvd2VyX2dhdGluZyhkZXYsIGZhbHNlKTsKPj4g
wqDCoMKgwqDCoCByZXQgPSBzc3QtPmZ3X29wcy5sb2FkX2Z3KHNzdCk7Cj4+IMKgwqDCoMKgwqAg
aWYgKHJldCA8IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiTG9hZCBi
YXNlIGZ3IGZhaWxlZCA6ICVkXG4iLCByZXQpOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXhpdDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8Kg
wqDCoCBpZiAoIXNrbC0+aXNfZmlyc3RfYm9vdCkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gbGli
cmFyeV9sb2FkOwo+PiArwqDCoMKgIC8qIERpc2FibGUgcG93ZXIgY2hlY2sgZHVyaW5nIGNmZyBz
ZXR1cCAqLwo+PiArwqDCoMKgIHNrbC0+aXBjLm9wcy5jaGVja19kc3BfbHBfb24gPSBOVUxMOwo+
IAo+IEl0J3MgdmVyeSBvZGQgdG8gcGxheSB3aXRoIC5vcHMgY2FsbGJhY2sgZHluYW1pY2FsbHku
IFVzdWFsbHkgb3BzIGFyZSAKPiBjb25zdGFudCwgYW5kIGlmIHlvdSB3YW50IHRvIGRpc2FibGUg
dGhlbSB5b3UgYWRkIGEgZmxhZy4KPiAKCllleWUsIGtlZW4gZXllISBDYW4ndCBkbyBldmVyeXRo
aW5nIGF0IG9uY2UgdGhvdWdoIDovClRoZSBwb3dlciBjaGVjayBpcyBBUEwrIHNwZWNpZmljIGFu
ZCBzaG91bGQgbm90IGJlIHBhcnQgb2YgZ2VuZXJpYyBpcGMgCmZyYW1ld29yayBhdCBhbGwgKGZv
dW5kIGluIC9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1pcGMuYykuIERpZmZlcmVudCAKZmF0
ZSBhd2FpdHMgc2FpZCBjaGVjay4gRm9yIG5vdywgaW4gdGhpcyBzaW5nbGUgY2FzZSBpdCBzZWVt
cyBiZXN0IHRvIApzaW1wbHkgZGlzYWJsZSB0aGUgY2hlY2sgYW5kIHJlYXBwbHkgaXQgb25jZSBz
ZXR1cCBpcyBkb25lLgoKPj4gKwo+PiArwqDCoMKgIHJldCA9IHNrbF9pcGNfZndfY2ZnX2dldCgm
c2tsLT5pcGMsICZza2wtPmZ3X2NmZyk7Cj4+ICvCoMKgwqAgaWYgKHJldCA8IDApIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBmdyBjZmc6ICVkXG4iLCBy
ZXQpOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBleGl0Owo+PiArwqDCoMKgIH0KPj4gKwo+PiAr
wqDCoMKgIHJldCA9IHNrbF9pcGNfaHdfY2ZnX2dldCgmc2tsLT5pcGMsICZza2wtPmh3X2NmZyk7
Cj4+ICvCoMKgwqAgaWYgKHJldCA8IDApIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGdldCBodyBjZmc6ICVkXG4iLCByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqAg
Z290byBleGl0Owo+PiDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBza2xfZHNwX2luaXRfY29y
ZV9zdGF0ZShzc3QpOwo+PiArbGlicmFyeV9sb2FkOgo+PiDCoMKgwqDCoMKgIGlmIChza2wtPmxp
Yl9jb3VudCA+IDEpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHNzdC0+Zndfb3BzLmxv
YWRfbGlicmFyeShzc3QsIHNrbC0+bGliX2luZm8sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNrbC0+bGliX2NvdW50KTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9l
cnIoZGV2LCAiTG9hZCBMaWJyYXJ5IGZhaWxlZCA6ICV4XG4iLCByZXQpOwo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZf
ZXJyKGRldiwgIkxvYWQgbGlicmFyeSBmYWlsZWQgOiAleFxuIiwgcmV0KTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ290byBleGl0Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKg
wqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIHNrbC0+aXNfZmlyc3RfYm9vdCA9IGZhbHNlOwo+
PiArZXhpdDoKPj4gK8KgwqDCoCBza2wtPmlwYy5vcHMuY2hlY2tfZHNwX2xwX29uID0gbHBfY2hl
Y2s7Cj4+ICvCoMKgwqAgc2tsLT5lbmFibGVfbWlzY2JkY2dlKGRldiwgdHJ1ZSk7Cj4+ICvCoMKg
wqAgc2tsLT5jbG9ja19wb3dlcl9nYXRpbmcoZGV2LCB0cnVlKTsKPj4gLcKgwqDCoCByZXR1cm4g
MDsKPj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0xfR1BM
KHNrbF9zc3RfaW5pdF9mdyk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
