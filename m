Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66FD9B41B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 18:00:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4387F1689;
	Fri, 23 Aug 2019 17:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4387F1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566576005;
	bh=KYWy3gDlQyqOcdS+zTsKZJMqYH6mltmTd6eWM8/ih9Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ADxDEZWMuEPsqTT1jKZus3hu1kG7YwqrCbESWv5nYtUB6XCopfOCILg8jfQegpRGN
	 aHZ9yNB9+BiGZzG14MIulyZYoYD1BM8TZIhwc/4saNKC06xpm2TvvSiHQAq5lT55yz
	 OXa3KBKrpQ2OxfcFySRqQ9mz5jn1ZKZw4hcdh+vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F00F8036A;
	Fri, 23 Aug 2019 17:57:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF1BFF8036B; Fri, 23 Aug 2019 17:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CD8AF80308
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD8AF80308
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 08:57:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="181751261"
Received: from dongdon2-mobl.amr.corp.intel.com (HELO [10.254.108.232])
 ([10.254.108.232])
 by orsmga003.jf.intel.com with ESMTP; 23 Aug 2019 08:57:30 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-32-pierre-louis.bossart@linux.intel.com>
 <39318aab-b1b4-2cce-c408-792a5cc343dd@intel.com>
 <ee87d4bb-3f35-eb27-0112-e6e64a09a279@linux.intel.com>
 <20190802172843.GC12733@vkoul-mobl.Dlink>
 <7abdb0e8-b9c4-28c7-d9ed-a7db1574e0b2@linux.intel.com>
 <20190823073407.GF2672@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0658de0f-c7a5-4a38-5893-e8cb665154d5@linux.intel.com>
Date: Fri, 23 Aug 2019 10:57:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823073407.GF2672@vkoul-mobl>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 31/40] soundwire: intel: move
 shutdown() callback and don't export symbol
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

Cgo+Pj4+Pj4gK3ZvaWQgaW50ZWxfc2h1dGRvd24oc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpz
dWJzdHJlYW0sCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc25kX3NvY19k
YWkgKmRhaSkKPj4+Pj4+ICt7Cj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBzZHdfY2Ruc19kbWFfZGF0
YSAqZG1hOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCBkbWEgPSBzbmRfc29jX2RhaV9nZXRfZG1h
X2RhdGEoZGFpLCBzdWJzdHJlYW0pOwo+Pj4+Pj4gK8KgwqDCoCBpZiAoIWRtYSkKPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIHNuZF9zb2NfZGFp
X3NldF9kbWFfZGF0YShkYWksIHN1YnN0cmVhbSwgTlVMTCk7Cj4+Pj4+PiArwqDCoMKgIGtmcmVl
KGRtYSk7Cj4+Pj4+PiArfQo+Pj4+Pgo+Pj4+PiBDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0
IGRvIHdlIHJlYWxseSBuZWVkIHRvIF9nZXRfZG1hXyBoZXJlPwo+Pj4+PiBfc2V0X2RtYV8gc2Vl
bXMgYnVsbGV0cHJvb2YsIHNhbWUgZm9yIGtmcmVlLgo+Pj4+Cj4+Pj4gSSBtdXN0IGFkbWl0IEkg
aGF2ZSBubyBpZGVhIHdoeSB3ZSBoYXZlIGEgcmVmZXJlbmNlIHRvIERNQXMgaGVyZSwgdGhpcyBs
b29rcwo+Pj4+IGxpa2UgYW4gYWJ1c2UgdG8gc3RvcmUgYSBkYWktc3BlY2lmaWMgY29udGV4dCwg
YW5kIHRoZSBpbml0aWFsIHRlc3QgbG9va3MKPj4+PiBsaWtlIGNvcHktcGFzdGUgdG8gZGV0ZWN0
IGludmFsaWQgY29uZmlncywgYXMgZG9uZSBpbiBvdGhlciBjYWxsYmFja3MuIFZpbm9kCj4+Pj4g
YW5kIFNhbnlvZyBtaWdodCBoYXZlIG1vcmUgaGlzdG9yeSB0aGFuIG1lIGhlcmUuCj4+Pgo+Pj4g
SSBkb250IHNlZSBzbmRfc29jX2RhaV9zZXRfZG1hX2RhdGEoKSBjYWxsIGZvcgo+Pj4gc2R3X2Nk
bnNfZG1hX2RhdGEgc28gc29tdGhpbmcgaXMgbWlzc2luZyAoYXQgbGVhc3QgaW4gdXBzdHJlYW0g
Y29kZSkKPj4+Cj4+PiBJSVJDIHdlIHNob3VsZCBoYXZlIGEgc25kX3NvY19kYWlfc2V0X2RtYV9k
YXRhKCkgaW4gYWxsb2Mgb3Igc29tZQo+Pj4gaW5pdGlhbGl6YXRpb24gcm91dGluZSBhbmQgd2Ug
ZnJlZSBpdCBoZXJlLi4gU2FueW9nPwo+Pgo+PiBWaW5vZCwgSSBkb3VibGUtY2hlY2tlZCB0aGF0
IHdlIGRvIG5vdCBpbmRlZWQgaGF2ZSBhIGNhbGwgdG8KPj4gc25kX3NvY19kYWlfZG1hX2RhdGEo
KSwgYnV0IHRoZXJlIGlzIGNvZGUgaW4gY2Ruc19zZXRfc3RyZWFtKCkgdGhhdCBzZXRzIHRoZQo+
PiByZWxldmFudCBkYWktPnBsYXliYWNrL2NhcHR1cmVfZG1hX2RhdGEsIHNlZSBiZWxvdwo+Pgo+
PiBJIGFtIG5vdCBhIGJpZyBmYW4gb2YgdGhpcyBjb2RlLCB0b3VjaGluZyB0aGUgQVNvQyBjb3Jl
IGludGVybmFsIGZpZWxkcwo+PiBpc24ndCBhIGdvb2QgaWRlYSBpbiBnZW5lcmFsLgo+IAo+IElJ
UkMgYXMgbG9uZyBhcyB5b3Ugc3RpY2sgdG8gc2luZ2xlIGxpbmsgSSBkbyBub3Qgc2VlIHRoaXMg
cmVxdWlyZWQuIFRoZQo+IHF1ZXN0aW9uIGNvbWVzIGludG8gcGljdHVyZSB3aGVuIHdlIGhhdmUg
bXVsdGkgbGlua3MgYXMgeW91IHdvdWxkIG5lZWQKPiB0byBhbGxvY2F0ZSBhIHNvdW5kd2lyZSBz
dHJlYW0gYW5kIHNldCB0aGF0IGZvciBhbGwgdGhlIHNkdyBEQUlzCj4gCj4gU28sIHdoYXQgaXMg
dGhlIGN1cnJlbnQgbW9kZWwgb2Ygc291bmR3aXJlIHN0cmVhbSwgd2hpY2ggZW50aXR5IGFsbG9j
YXRlcwo+IHRoYXQgYW5kIGRvIHlvdSBzdGlsbCBjYXJlIGFib3V0IG11bHRpLWxpbms/IGlzIHRo
ZXJlIGFueSBtYWNoaW5lIGRyaXZlcgo+IHdpdGggc291bmR3aXJlIHVwc3RyZWFtIHlldD8KCnll
cywgbXVsdGktbGluayBpcyBkZWZpbml0aXZlbHkgcmVxdWlyZWQgYW5kIG9uZSBvZiB0aGUgbWFp
biBhcHBlYWxzIG9mIApTb3VuZFdpcmUuIFdlIGhhdmUgYSBwbGF0Zm9ybSB3aXRoIDIgYW1wbGlm
aWVycyBvbiBzZXBhcmF0ZSBsaW5rcyBhbmQgCnRoZXkgbmVlZCB0byBiZSBzeW5jaHJvbml6ZWQg
YW5kIGhhbmRsZWQgd2l0aCB0aGUgc3RyZWFtIGNvbmNlcHQuCgpUaGUgdGVudGF0aXZlIHBsYW4g
d291bGQgYmUgdG8gbW92ZSB0aGUgc3RyZWFtIGFsbG9jYXRpb24gdG8gdGhlIGRhaWxpbmsgCi5p
bml0IChvciBlcXVpdmFsZW50KSwgYW5kIG1ha2Ugc3VyZSBlYWNoIERBSSBpbiB0aGF0IGxpbmsg
dXNlZCB0aGUgc2FtZSAKc3RyZWFtIGluZm9ybWF0aW9uLiBUaGVyZSBhcmUgZGVwZW5kZW5jaWVz
IG9uIHRoZSBtdWx0aS1jcHUgY29uY2VwdCB0aGF0IApNb3JpbW90by1zYW4gd2FudGVkIHRvIHB1
c2gsIHNvIHdlJ2xsIGxpa2VseSBiZSB0aGUgZmlyc3QgdXNlcnMuCgpGb3IgdGhlIERBSSB0cmln
Z2VyLCB3ZSB3aWxsIG5lZWQgdG8gY2hhbmdlIHRoZSBleGlzdGluZyBBUEkgc28gdGhhdCBhIApz
ZHdfc3RyZWFtX2VuYWJsZSgpIGNhbiBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMsIGJ1dCBvbmx5
IHRha2VzIGVmZmVjdCAKd2hlbiB0aGUgLnRyaWdnZXIgb2YgdGhlIGZpcnN0IERBSSBpbiB0aGUg
c3RyZWFtIGlzIGludm9rZWQuIFRoaXMgaXMgYSAKc2ltaWxhciBiZWhhdmlvciB0aGFuIHdpdGgg
SERhdWRpbyAudHJpZ2dlciBvcGVyYXRpb25zIHdoZW4gdGhlIFNZTkMgCmJpdHMgYXJlIHVzZWQu
CgpXZSB3aWxsIGRvIHRoaXMgd2hlbiB3ZSBoYXZlIGEgZmlyc3QgcGFzcyB3b3JraW5nIHdpdGgg
YWxsIGNvZGVjIGRyaXZlcnMgCnVwc3RyZWFtIGFuZCBhIGJhc2ljIG1hY2hpbmUgZHJpdmVyIHVw
c3RyZWFtIHdpdGggYWxsIDQgbGlua3Mgd29ya2luZyAKaW5kZXBlbmRlbnRseS4KCkV2ZXJ5dGhp
bmcgaXMgZG9uZSBpbiBwdWJsaWMgYnR3LCB5b3UgY2FuIHRyYWNrIG91ciBXSVAgc29sdXRpb25z
IGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9wdWxsLzExNDAK
aHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvcHVsbC8xMTQxCmh0dHBzOi8v
Z2l0aHViLmNvbS90aGVzb2Zwcm9qZWN0L2xpbnV4L3B1bGwvMTE0MgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
