Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4503B706
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 16:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A0E16A6;
	Mon, 10 Jun 2019 16:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A0E16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560176064;
	bh=Yt8o9785gdYPQ0F89fcx5WxpZRhE8QMhg1B32YPwEBo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LMo6qYTRQ4+DCVzX8Bu41RU453bn+cZegcoHqgOSVfMHsPQHXHgPpWjITEpCE5/O4
	 3OYS9IzoriuS9DRdaWf3z+fAIPfyRkWbb98/LEQ2851ot6Q4AdeNSjY5GZyheqtPCd
	 z3bdFTC8tEj8iCUVkT9GspFkiC3qUR1Wai7xcawA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 781A8F896E0;
	Mon, 10 Jun 2019 16:12:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11FDCF896E0; Mon, 10 Jun 2019 16:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7832F896C7
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 16:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7832F896C7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 07:12:31 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 10 Jun 2019 07:12:31 -0700
Received: from achugh-mobl.amr.corp.intel.com (unknown [10.254.100.69])
 by linux.intel.com (Postfix) with ESMTP id 4F03F5800FF;
 Mon, 10 Jun 2019 07:12:30 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-7-srinivas.kandagatla@linaro.org>
 <249f9647-94d0-41d7-3b95-64c36d90f8e8@linux.intel.com>
 <40ea774c-8aa8-295d-e91e-71423b03c88d@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7269521a-ac89-3856-c18c-ffaaf64c0806@linux.intel.com>
Date: Mon, 10 Jun 2019 09:12:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <40ea774c-8aa8-295d-e91e-71423b03c88d@linaro.org>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 6/6] soundwire: qcom: add support for
 SoundWire controller
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

Cj4+PiArI2RlZmluZSBTV1JNX0NPTVBfSFdfVkVSU0lPTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDB4MDAKPj4KPj4gQ2FuIHdlIHBsZWFzZSB1c2UgU0RXXyBvciBRQ09N
X1NEV18gYXMgcHJlZml4Pwo+Pgo+IAo+IFNXUk0gcHJlZml4IGlzIGFzIHBlciB0aGUgZGF0YSBz
aGVldCByZWdpc3RlciBuYW1lcywgSWYgaXQgaGVscCBhbSBoYXBweSAKPiB0byBhZGQgUUNPTV8g
cHJlZml4IGl0LgoKVGhhdCdkIGJlIGZpbmUuIEFzIGxvbmcgYXMgdGhlcmUgaXMgbm8gZHVwbGlj
YXRpb24gYW5kIHR3byAKdGVybXMvcHJlZml4ZXMgdXNlZCBmb3IgdGhlIHNhbWUgdGhpbmcgSSBh
bSBoYXBweS4KCj4+PiArCj4+PiArwqDCoMKgIHZhbCA9IFNXUk1fUkVHX1ZBTF9QQUNLKGNtZF9k
YXRhLCBkZXZfYWRkciwgY21kX2lkLCByZWdfYWRkcik7Cj4+PiArwqDCoMKgIHJldCA9IGN0cmwt
PnJlZ193cml0ZShjdHJsLCBTV1JNX0NNRF9GSUZPX1dSX0NNRCwgdmFsKTsKPj4+ICvCoMKgwqAg
aWYgKHJldCA8IDApIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGN0cmwtPmRldiwgIiVz
OiByZWcgMHgleCB3cml0ZSBmYWlsZWQsIGVycjolZFxuIiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF9fZnVuY19fLCB2YWwsIHJldCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7
Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgaWYgKGRldl9hZGRyID09IFNEV19CUk9B
RENBU1RfREVWX05VTSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGN0cmwtPmZpZm9fc3RhdHVzID0g
MDsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQo
JmN0cmwtPnNwX2NtZF9jb21wLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG1zZWNzX3RvX2ppZmZpZXMoVElNRU9VVF9NUykpOwo+Pgo+PiBU
aGlzIGlzIG9kZC4gVGhlIFNvdW5kV2lyZSBzcGVjIGRvZXMgbm90IGhhbmRsZSB3cml0ZXMgdG8g
YSBzaW5nbGUgCj4+IGRldmljZSBvciBicm9hZGNhc3Qgd3JpdGVzIGRpZmZlcmVudGx5LiBJIGRv
bid0IHNlZSBhIGNsZWFyIHJlYXNvbiB3aHkgCj4+IHlvdSB3b3VsZCBvbmx5IHRpbWVvdXQgZm9y
IGEgYnJvYWRjYXN0IHdyaXRlLgo+Pgo+IAo+IFRoZXJlIGlzIGRhbmdlciBvZiBibG9ja2luZyBo
ZXJlIHdpdGhvdXQgdGltZW91dC4KClJpZ2h0LCBhbmQgaXQncyBmaW5lIHRvIGFkZCBhIHRpbWVv
dXQuIFRoZSBxdWVzdGlvbiBpcyB3aHkgYWRkIGEgdGltZW91dCAKKm9ubHkqIGZvciBhIGJyb2Fk
Y2FzdCBvcGVyYXRpb24/IEl0IHNob3VsZCBiZSBhZGRlZCBmb3IgZXZlcnkgCnRyYW5zYWN0aW9u
IElNTywgdW5sZXNzIHlvdSBoYXZlIGEgcmVhc29uIG5vdCB0byBkbyBzby4KCj4+Cj4+PiArCj4+
PiArwqDCoMKgIC8qIE1hc2sgc291bmR3aXJlIGludGVycnVwdHMgKi8KPj4+ICvCoMKgwqAgY3Ry
bC0+cmVnX3dyaXRlKGN0cmwsIFNXUk1fSU5URVJSVVBUX01BU0tfQUREUiwKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTV1JNX0lOVEVSUlVQVF9TVEFUVVNfUk1T
Syk7Cj4+PiArCj4+PiArwqDCoMKgIC8qIENvbmZpZ3VyZSBObyBwaW5ncyAqLwo+Pj4gK8KgwqDC
oCB2YWwgPSBjdHJsLT5yZWdfcmVhZChjdHJsLCBTV1JNX01DUF9DRkdfQUREUik7Cj4+Cj4+IElm
IHRoZXJlIGlzIGFueSBzb3J0IG9mIFBSRVEgc2lnbmFsaW5nIGZvciBTbGF2ZS1pbml0aWF0ZWQg
aW50ZXJydXB0cywgCj4+IGRpc2FibGluZyBQSU5HcyBpcyBsaWtlbHkgYSBub24tY29uZm9ybWFu
dCBpbXBsZW1lbnRhdGlvbiBzaW5jZSB0aGUgCj4+IG1hc3RlciBpcyByZXF1aXJlZCB0byBpc3N1
ZSBhIFBJTkcgY29tbWFuZCB3aXRoaW4gMzIgZnJhbWVzLiBUaGF0J3MgCj4+IGFsc28gdGhlIG9u
bHkgd2F5IHRvIGtub3cgaWYgYSBkZXZpY2UgaXMgYXR0YWNoZWQsIHNvIGFkZGl0aW9uYWwgCj4+
IGNvbW1lbnRzIGFyZSBsaWtlbHkgcmVxdWlyZWQuCj4gVGhpcyBpcyB0aGUgdmFsdWUgb2YgTWF4
aW11bSBudW1iZXIgb2YgY29uc2llY3V0aXZlIHJlYWQvd3JpdGUgY29tbWFuZHMgCj4gd2l0aG91
dCBwaW5nIGNvbW1hbmQgaW4gYmV0d2Vlbi4gSSB3aWxsIHRyeSB0byBjb2xsZWN0IG1vcmUgZGV0
YWlscyBhbmQgCj4gYWRkIHNvbWUgY29tbWVudHMgaGVyZS4KClJpZ2h0LCBzbyBpdCdzIHByb2Jh
Ymx5IHRoZSBjb21tZW50IHRoYXQncyB0b28gc3RyaWN0LiBJdCdzIG5vdCBubyBwaW5ncyAKaXQn
cyBubyBwaW5ncyBkdXJpbmcgYSBzZXF1ZW5jZSBvZiB1cCB0byBOIHJlYWQvd3JpdGVzLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
