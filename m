Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E288EC6F5
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 17:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C991E21C1;
	Fri,  1 Nov 2019 17:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C991E21C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572626509;
	bh=yzHKtzjq5mvN13IO23jSYNasBTqEsQvcJt0eQvTaFt8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iz8Z2PSUkJCssj4J1V8mZpkT9dNag825ov31Ri4VnEc5V3DeT9FF77yboJasxSveN
	 f+hWCpnukSD4q/sbb8stfLTeNntJYn3uv4VEm/xyMF6Azg0t3+3F08Zj9yX7pvMLT+
	 +0ISbargAvKr2xXUJwH0PujklIBVL1GYnaGGwB6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A1A1F800C9;
	Fri,  1 Nov 2019 17:40:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A202F803D6; Fri,  1 Nov 2019 17:39:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C833EF800C9
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 17:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C833EF800C9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 09:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="199860587"
Received: from ggarreto-mobl1.amr.corp.intel.com (HELO [10.255.92.243])
 ([10.255.92.243])
 by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2019 09:39:38 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh@kernel.org,
 vkoul@kernel.org
References: <20191030153150.18303-1-srinivas.kandagatla@linaro.org>
 <20191030153150.18303-3-srinivas.kandagatla@linaro.org>
 <af29ec6e-d89e-7fa4-a8cd-29ab944ecd5c@linux.intel.com>
 <926bd15f-e230-8f5e-378d-355bfeeecf27@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3d17a2a2-3033-e740-a466-e6cf7919adb2@linux.intel.com>
Date: Fri, 1 Nov 2019 11:39:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <926bd15f-e230-8f5e-378d-355bfeeecf27@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v4 2/2] soundwire: qcom: add support for
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

Cj4+PiArc3RhdGljIGludCBxY29tX3N3cm1fcHJlcGFyZShzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJl
YW0gKnN1YnN0cmVhbSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3Qgc25kX3NvY19kYWkgKmRhaSkKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBxY29tX3N3cm1f
Y3RybCAqY3RybCA9IGRldl9nZXRfZHJ2ZGF0YShkYWktPmRldik7Cj4+PiArCj4+PiArwqDCoMKg
IGlmICghY3RybC0+c3J1bnRpbWVbZGFpLT5pZF0pCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7Cj4+PiArCj4+PiArwqDCoMKgIHJldHVybiBzZHdfZW5hYmxlX3N0cmVhbShjdHJs
LT5zcnVudGltZVtkYWktPmlkXSk7Cj4+Cj4+IFNvIGluIGh3X3BhcmFtcyB5b3UgY2FsbCBzZHdf
cHJlcGFyZV9zdHJlYW0oKSBhbmQgaW4gX3ByZXBhcmUgeW91IGNhbGwgCj4+IHNkd19lbmFibGVf
c3RyZWFtKCk/Cj4+Cj4+IFNob3VsZG4ndCB0aGlzIGJlIGhhbmRsZWQgaW4gYSAudHJpZ2dlciBv
cGVyYXRpb24gYXMgcGVyIHRoZSAKPj4gZG9jdW1lbnRhdGlvbiAiRnJvbSBBU29DIERQQ00gZnJh
bWV3b3JrLCB0aGlzIHN0cmVhbSBzdGF0ZSBpcyBsaW5rZWQgdG8KPj4gLnRyaWdnZXIoKSBzdGFy
dCBvcGVyYXRpb24uIgo+IAo+IElmIEkgbW92ZSBzZHdfZW5hYmxlL2Rpc2FibGVfc3RyZWFtKCkg
dG8gdHJpZ2dlciBJIGdldCBhIGJpZyBjbGljayBub2lzZSAKPiBvbiBteSBzcGVha2VycyBhdCBz
dGFydCBhbmQgZW5kIG9mIGV2ZXJ5IHBsYXliYWNrLiBUcmllZCBkaWZmZXJlbnQgCj4gdGhpbmdz
IGJ1dCBub3RoaW5nIGhlbHBlZCBzbyBmYXIhLiBFbmFibGluZyBTcGVha2VyIERBQ3Mgb25seSBh
ZnRlciAKPiBTb3VuZFdpcmUgcG9ydHMgYXJlIGVuYWJsZWQgaXMgd29ya2luZyBmb3IgbWUhCj4g
VGhlcmUgaXMgbm90aGluZyBjb21wbGljYXRlZCBvbiBXU0E4ODF4IGNvZGVjIHNpZGUgYWxsIHRo
ZSBEQUNzIGFyZSAKPiBlbmFibGVkL2Rpc2FibGVkIGFzIHBhcnQgb2YgREFQTS4KCnRoYXQgbG9v
a3MgbGlrZSBhIHdvcmstYXJvdW5kIHRvIG1lPyBJZiB5b3UgZG8gYSBiYW5rIHN3aXRjaCB3aXRo
b3V0IAphbnl0aGluZyB0cmlnZ2VyZWQsIHlvdSBhcmUgbW9zdCBsaWtlbHkgc2VuZGluZyBhIGJ1
bmNoIG9mIHplcm9lcyB0byAKeW91ciBhbXBsaWZpZXIgYW5kIGVuYWJsaW5nIGNsaWNrL3BvcCBy
ZW1vdmFscyBzb21laG93LgoKSXQnZCBiZSB3b3J0aCBsb29raW5nIGludG8gdGhpcywgbWF5YmUg
dGhlcmUncyBhIG1pc3NpbmcgZGlnaXRhbCAKbXV0ZS91bm11dGUgdGhhdCdzIG5vdCBkb25lIGlu
IHRoZSByaWdodCBvcmRlcj8KCj4gCj4+Cj4+IEl0J3MgYWxzbyBteSB1bmRlcnN0YW5kaW5nIHRo
YXQgLnByZXBhcmUgd2lsbCBiZSBjYWxsZWQgbXVsdGlwbGVzIHRpbWVzLCAKPiAKPiBJIGFncmVl
LCBuZWVkIHRvIGFkZCBzb21lIGV4dHJhIGNoZWNrcyBpbiB0aGUgcHJlcGFyZSB0byBkZWFsIHdp
dGggdGhpcyEKPiAKPj4gaW5jbHVkaW5nIGZvciB1bmRlcmZsb3dzIGFuZCByZXN1bWUgaWYgeW91
IGRvbid0IHN1cHBvcnQgSU5GT19SRVNVTUUuCj4gCj4+Cj4+IHRoZSBzZHdfZGlzYWJsZV9zdHJl
YW0oKSBpcyBpbiAuaHdfZnJlZSwgd2hpY2ggaXMgbm90IG5lY2Vzc2FyaWx5IAo+PiBjYWxsZWQg
YnkgdGhlIGNvcmUsIHNvIHlvdSBtYXkgaGF2ZSBhIHJpc2sgb2Ygbm90IGJlaW5nIGFibGUgdG8g
cmVjb3Zlcj8KPiAKPiBIbW0sIEkgdGhvdWdodCBod19mcmVlIGlzIGFsd2F5cyBjYWxsZWQgdG8g
cmVsZWFzZSByZXNvdXJjZXMgYWxsb2NhdGVkIAo+IGluIGh3X3BhcmFtcy4KPiAKPiBJbiB3aGF0
IGNhc2VzIGRvZXMgdGhlIGNvcmUgbm90IGNhbGwgdGhpcz8KCnllcywgYnV0IHByZXBhcmUgY2Fu
IGJlIGNhbGxlZCB3aXRob3V0IGh3X2ZyZWUgY2FsbGVkIGZpcnN0LiB0aGF0J3Mgd2h5IAp3ZSB1
cGRhdGVkIHRoZSBzdGF0ZSBtYWNoaW5lIHRvIGFsbG93IGZvciBESVNBQkxFRHxERVBSRVBBUkVE
IC0+IApQUkVQQVJFRCB0cmFuc2l0aW9ucy4KCj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZf
cG1fb3BzIHFjb21fc3dybV9kZXZfcG1fb3BzID0gewo+Pj4gK8KgwqDCoCBTRVRfUlVOVElNRV9Q
TV9PUFMocWNvbV9zd3JtX3J1bnRpbWVfc3VzcGVuZCwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHFjb21fc3dybV9ydW50aW1lX3Jlc3VtZSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIE5VTEwKPj4+ICvCoMKgwqAgKQo+Pj4gK307Cj4+Cj4+IE1heWJlIGRlZmlu
ZSBwbV9ydW50aW1lIGF0IGEgbGF0ZXIgdGltZSB0aGVuPyBXZSd2ZSBoYWQgYSBsb3Qgb2YgcmFj
ZSAKPj4gY29uZGl0aW9ucyB0byBkZWFsIHdpdGgsIGFuZCBpdCdzIG9kZCB0aGF0IHlvdSBkb24n
dCBzdXBwb3J0IHBsYWluIAo+PiB2YW5pbGxhIHN1c3BlbmQgZmlyc3Q/Cj4+Cj4gVHJ5aW5nIHRv
IGtlZXAgdGhpbmdzIHNpbXBsZSBmb3IgdGhlIGZpcnN0IHBhdGNoc2V0ISBhZGRlZCB0aGlzIGR1
bW1pZXMgCj4gdG8ga2VlcCB0aGUgc291bmR3aXJlIGNvcmUgaGFwcHkhCgpJZiB5b3UgYXJlIHJl
ZmVycmluZyB0byB0aGUgZXJyb3JzIHdoZW4gcG1fcnVudGltZSBpcyBub3QgZW5hYmxlZCwgd2Ug
CmZpeGVkIHRoaXMgaXMgdGhlIHNlcmllcyB0aGF0J3MgYmVlbiBvdXQgZm9yIHJldmlldyBmb3Ig
MTAgZGF5cyBub3cuLi4KCnNlZSAnW1BBVENIIDAzLzE4XSBzb3VuZHdpcmU6IGJ1czogYWRkIFBN
L25vLVBNIHZlcnNpb25zIG9mIHJlYWQvd3JpdGUgCmZ1bmN0aW9ucycsIHRoYXQgc2hvdWxkIHJl
bW92ZSB0aGUgbmVlZCBmb3IgZHVtbXkgZnVuY3Rpb25zLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
