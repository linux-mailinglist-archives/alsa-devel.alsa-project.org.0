Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D078356F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:38:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD8521663;
	Tue,  6 Aug 2019 17:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD8521663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565105932;
	bh=RIqshJ1oJ6jlrsBYWM8f9IQog5rLzw2sFPSE9DEkL/M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7MjuLQEEC2RaR+8vxsMEHahOtPuB2jRkhJEx4xRypflE6WifTdUHLV2z5Fgx1bo1
	 uZjT1lgWkcslxeWfphlPopjC/Wlfq2M6ybhE/FffVzItVoNFx9f/0p6rTlgxauJZSk
	 ZpuXgpY+il7JdZLgCd9szE2yO9Vy9ykKOlJMwP9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDEA8F804CB;
	Tue,  6 Aug 2019 17:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 207E0F80533; Tue,  6 Aug 2019 17:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6824AF8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6824AF8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="165018862"
Received: from tremilla-mobl1.amr.corp.intel.com (HELO [10.251.15.130])
 ([10.251.15.130])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2019 08:36:32 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190806005522.22642-7-pierre-louis.bossart@linux.intel.com>
 <03b6091b-af41-ac54-43c7-196a3583a731@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <024b4fb4-bdfa-a6dc-48bb-c070f2ed36b2@linux.intel.com>
Date: Tue, 6 Aug 2019 10:36:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <03b6091b-af41-ac54-43c7-196a3583a731@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Blauciak@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 06/17] soundwire: cadence_master: use
 firmware defaults for frame shape
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

CgpPbiA4LzYvMTkgMTA6MjcgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTA2IDAyOjU1LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc291bmR3aXJlL2NhZGVuY2VfbWFzdGVyLmMgCj4+IGIvZHJpdmVycy9zb3VuZHdpcmUv
Y2FkZW5jZV9tYXN0ZXIuYwo+PiBpbmRleCA1ZDk3MjliNGQ2MzQuLjg5YzU1ZTRiYjcyYyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYwo+PiArKysgYi9k
cml2ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rlci5jCj4+IEBAIC00OCw2ICs0OCw4IEBACj4+
IMKgICNkZWZpbmUgQ0ROU19NQ1BfU1NQU1RBVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhDCj4+
IMKgICNkZWZpbmUgQ0ROU19NQ1BfRlJBTUVfU0hBUEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4
MTAKPj4gwqAgI2RlZmluZSBDRE5TX01DUF9GUkFNRV9TSEFQRV9JTklUwqDCoMKgwqDCoMKgwqAg
MHgxNAo+PiArI2RlZmluZSBDRE5TX01DUF9GUkFNRV9TSEFQRV9DT0xfTUFTS8KgwqDCoMKgwqDC
oMKgIEdFTk1BU0soMiwgMCkKPj4gKyNkZWZpbmUgQ0ROU19NQ1BfRlJBTUVfU0hBUEVfUk9XX09G
RlNFVMKgwqDCoMKgwqDCoMKgIDMKPj4gwqAgI2RlZmluZSBDRE5TX01DUF9DT05GSUdfVVBEQVRF
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE4Cj4+IMKgICNkZWZpbmUgQ0ROU19NQ1BfQ09ORklH
X1VQREFURV9CSVTCoMKgwqDCoMKgwqDCoCBCSVQoMCkKPj4gQEAgLTE3NSw3ICsxNzcsNiBAQAo+
PiDCoCAvKiBEcml2ZXIgZGVmYXVsdHMgKi8KPj4gwqAgI2RlZmluZSBDRE5TX0RFRkFVTFRfQ0xL
X0RJVklERVLCoMKgwqDCoMKgwqDCoCAwCj4+IC0jZGVmaW5lIENETlNfREVGQVVMVF9GUkFNRV9T
SEFQRcKgwqDCoMKgwqDCoMKgIDB4MzAKPj4gwqAgI2RlZmluZSBDRE5TX0RFRkFVTFRfU1NQX0lO
VEVSVkFMwqDCoMKgwqDCoMKgwqAgMHgxOAo+PiDCoCAjZGVmaW5lIENETlNfVFhfVElNRU9VVMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyMDAwCj4+IEBAIC05MDEsNiArOTAyLDIwIEBA
IGludCBzZHdfY2Ruc19wZGlfaW5pdChzdHJ1Y3Qgc2R3X2NkbnMgKmNkbnMsCj4+IMKgIH0KPj4g
wqAgRVhQT1JUX1NZTUJPTChzZHdfY2Ruc19wZGlfaW5pdCk7Cj4+ICtzdGF0aWMgdTMyIGNkbnNf
c2V0X2luaXRpYWxfZnJhbWVfc2hhcGUoaW50IG5fcm93cywgaW50IG5fY29scykKPj4gK3sKPj4g
K8KgwqDCoCB1MzIgdmFsOwo+PiArwqDCoMKgIGludCBjOwo+PiArwqDCoMKgIGludCByOwo+PiAr
Cj4+ICvCoMKgwqAgciA9IHNkd19maW5kX3Jvd19pbmRleChuX3Jvd3MpOwo+PiArwqDCoMKgIGMg
PSBzZHdfZmluZF9jb2xfaW5kZXgobl9jb2xzKSAmIENETlNfTUNQX0ZSQU1FX1NIQVBFX0NPTF9N
QVNLOwo+PiArCj4+ICvCoMKgwqAgdmFsID0gKHIgPDwgQ0ROU19NQ1BfRlJBTUVfU0hBUEVfUk9X
X09GRlNFVCkgfCBjOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHZhbDsKPj4gK30KPj4gKwo+IAo+
IEd1ZXNzIHRoaXMgaGF2ZSBiZWVuIHNhaWQgYWxyZWFkeSwgYnV0IHRoaXMgZnVuY3Rpb24gY291
bGQgYmUgc2ltcGxpZmllZCAKPiAtIHVubGVzcyB5b3UgcmVhbGx5IHdhbnQgdG8ga2VlcCBleHBs
aWNpdCB2YXJpYWJsZSBkZWNsYXJhdGlvbi4gQm90aCAiYyIgCj4gYW5kICJyIiBkZWNsYXJhdGlv
bnMgY291bGQgYmUgbWVyZ2VkIGludG8gc2luZ2xlIGxpbmUgd2hpbGUgInZhbCIgaXMgbm90IAo+
IG5lZWRlZCBhdCBhbGwuCj4gCj4gT25lIG1vcmUgdGhpbmcgLSBpcyBBTkQgYml0d2lzZSBvcCBy
ZWFsbHkgbmVlZGVkIGZvciBjb2xzIGV4cGxpY2l0bHk/IFdlIAo+IGtub3cgYWxsIGNvbCB2YWx1
ZXMgdXBmcm9udCAtIHRoZXNlIGFyZSBzdGF0aWMgYW5kIGRlY2xhcmVkIGluIGdsb2JhbCAKPiB0
YWJsZSBuZWFyYnkuIFN0YXRpYyBkZWNsYXJhdGlvbiB0YWtlcyBjYXJlIG9mICJpbml0aWFsIHJh
bmdlLWNoZWNrIi4gSXMgCj4gYW5vdGhlciBvbmUgbmVjZXNzYXJ5Pwo+IAo+IE1vcmVvdmVyLCB0
aGlzIGlzIGEgX2dldF8gYW5kIGNlcnRhaW5seSBub3QgYSBfc2V0XyB0eXBlIG9mIGZ1bmN0aW9u
LiAKPiBJJ2QgZXZlbiBjb25zaWRlciByZW5hbWluZyBpdCB0bzogImNkbnNfZ2V0X2ZyYW1lX3No
YXBlIiBhcyB0aGlzIGlzIAo+IG5laXRoZXIgYSBfc2V0XyBub3IgYW4gZXhwbGljaXQgaW5pdGlh
bCBmcmFtZSBzaGFwZSBzZXR0ZXIuCj4gCj4gSXQgbWlnaHQgYmUgZXZlbiBoZWxwZnVsIHRvIHNw
bGl0IHR3byB1c2FnZXM6Cj4gCj4gI2RlZmluZSBzZHdfZnJhbWVfc2hhcGUoY29sX2lkeCwgcm93
X2lkeCkgXAo+ICDCoMKgwqDCoCgocm93X2lkeCA8PCBDRE5TX01DUF9GUkFNRV9TSEFQRV9ST1df
T0ZGU0VUKSB8IGNvbF9pZHgpCj4gCj4gdTMyIGNkbnNfZ2V0X2ZyYW1lX3NoYXBlKHUxNiByb3dz
LCB1MTYgY29scykKPiB7Cj4gIMKgwqDCoMKgdTE2IGMsIHI7Cj4gCj4gIMKgwqDCoMKgciA9IHNk
d19maW5kX3Jvd19pbmRleChyb3dzKTsKPiAgwqDCoMKgwqBjID0gc2R3X2ZpbmRfY29sX2luZGV4
KGNvbHMpOwo+IAo+ICDCoMKgwqDCoHJldHVybiBzZHdfZnJhbWVfc2hhcGUoYywgcik7Cj4gfQo+
IAo+IFRoZSBhYm92ZSBtYXkgZXZlbiBiZSBzaW1wbGlmaWVkIGludG8gb25lLWxpbmVyLgoKVGhp
cyBpcyBhIGZ1bmN0aW9uIHVzZWQgb25jZSBvbiBzdGFydHVwLCB0aGVyZSBpcyBubyByZWFsIG5l
ZWQgdG8gCnNpbXBsaWZ5IGZ1cnRoZXIuIFRoZSBzZXBhcmF0ZSB2YXJpYWJsZXMgaGVscCBhZGQg
ZGVidWcgdHJhY2VzIGFzIG5lZWRlZCAKYW5kIGtlZXAgdGhlIGNvZGUgcmVhZGFibGUgd2hpbGUg
c2hvd2luZyBob3cgdGhlIHZhbHVlcyBhcmUgZW5jb2RlZCBpbnRvIAphIHJlZ2lzdGVyLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
