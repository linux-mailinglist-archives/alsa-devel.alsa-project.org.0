Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D175EAF
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 07:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25B51F63;
	Fri, 26 Jul 2019 07:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25B51F63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564120722;
	bh=B24exRzFmb6ULt9gZomvgAIHWq3cOj4KpoI1DcLW9LI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXmKtGsP/YNKvXpKs0q2ZiwIDpGW6qPwEYcON4V+xUQP4Jwih3wdje4wirkS+VBxP
	 ujt40dUSXZlUAlb2FBpAYFExVXS0cKsbDlLz4qh0nSlwLZvpoJv+hlZxQnjG1PzmAp
	 F6Ij/OyzluVqPAvdu964jbY2F8SLvQFYm5MTZOPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00945F80393;
	Fri, 26 Jul 2019 07:56:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3434BF80393; Fri, 26 Jul 2019 07:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7210F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 07:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7210F801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 22:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="175500246"
Received: from yuxiwan1-mobl1.ccr.corp.intel.com (HELO [10.239.197.176])
 ([10.239.197.176])
 by orsmga006.jf.intel.com with ESMTP; 25 Jul 2019 22:56:46 -0700
To: Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
 <f38a5e3a-c797-ae53-f0d4-31ac46ec360b@linux.intel.com>
From: "rander.wang" <rander.wang@linux.intel.com>
Message-ID: <552565d2-1734-3c24-3a78-379d08e35110@linux.intel.com>
Date: Fri, 26 Jul 2019 13:56:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f38a5e3a-c797-ae53-f0d4-31ac46ec360b@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 26/40] soundwire: cadence_master: fix
 divider setting in clock register
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

CuWcqCA3LzI2LzIwMTkgMToxOSBQTSwgQmFyZCBsaWFvIOWGmemBkzoKPgo+IE9uIDcvMjYvMjAx
OSA3OjQwIEFNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gRnJvbTogUmFuZGVyIFdh
bmcgPHJhbmRlci53YW5nQGxpbnV4LmludGVsLmNvbT4KPj4KPj4gVGhlIGV4aXN0aW5nIGNvZGUg
dXNlcyBhbiBPUiBvcGVyYXRpb24gd2hpY2ggd291bGQgbWl4IHRoZSBvcmlnaW5hbAo+PiBkaXZp
ZGVyIHNldHRpbmcgd2l0aCB0aGUgbmV3IG9uZSwgcmVzdWx0aW5nIGluIGFuIGludmFsaWQKPj4g
Y29uZmlndXJhdGlvbiB0aGF0IGNhbiBtYWtlIGNvZGVjcyBoYW5nLgo+Pgo+PiBBZGQgdGhlIG1h
c2sgZGVmaW5pdGlvbiBhbmQgdXNlIGNkbnNfdXBkYXRlbCB0byB1cGRhdGUgZGl2aWRlcgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBSYW5kZXIgV2FuZyA8cmFuZGVyLndhbmdAbGludXguaW50ZWwuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCAKPj4gPHBpZXJyZS1sb3Vp
cy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvc291bmR3aXJl
L2NhZGVuY2VfbWFzdGVyLmMgfCAxMiArKysrKysrLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc291bmR3aXJlL2NhZGVuY2VfbWFzdGVyLmMgCj4+IGIvZHJpdmVycy9zb3VuZHdpcmUvY2Fk
ZW5jZV9tYXN0ZXIuYwo+PiBpbmRleCAxMGViY2VmMmU4NGUuLjE4YzZhYzAyNmU4NSAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYwo+PiArKysgYi9kcml2
ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rlci5jCj4+IEBAIC01Nyw2ICs1Nyw3IEBACj4+IMKg
ICNkZWZpbmUgQ0ROU19NQ1BfU1NQX0NUUkwxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDI4Cj4+
IMKgICNkZWZpbmUgQ0ROU19NQ1BfQ0xLX0NUUkwwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDMw
Cj4+IMKgICNkZWZpbmUgQ0ROU19NQ1BfQ0xLX0NUUkwxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
eDM4Cj4+ICsjZGVmaW5lIENETlNfTUNQX0NMS19NQ0xLRF9NQVNLwqDCoMKgwqDCoMKgwqAgR0VO
TUFTSyg3LCAwKQo+PiDCoCDCoCAjZGVmaW5lIENETlNfTUNQX1NUQVTCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHg0MAo+PiDCoCBAQCAtOTg4LDkgKzk4OSwxMSBAQCBpbnQgc2R3X2Nk
bnNfaW5pdChzdHJ1Y3Qgc2R3X2NkbnMgKmNkbnMpCj4+IMKgwqDCoMKgwqAgLyogU2V0IGNsb2Nr
IGRpdmlkZXIgKi8KPj4gwqDCoMKgwqDCoCBkaXZpZGVywqDCoMKgID0gKHByb3AtPm1jbGtfZnJl
cSAvIHByb3AtPm1heF9jbGtfZnJlcSkgLSAxOwo+PiDCoMKgwqDCoMKgIHZhbCA9IGNkbnNfcmVh
ZGwoY2RucywgQ0ROU19NQ1BfQ0xLX0NUUkwwKTsKPgo+Cj4gRG8gd2Ugc3RpbGwgbmVlZCB0byBy
ZWFkIGNkbnNfcmVhZGwoY2RucywgQ0ROU19NQ1BfQ0xLX0NUUkwwKQo+Cj4gYWZ0ZXIgdGhpcyBj
aGFuZ2U/Cj4KVGhlIHZhbCBpcyB1c2VkIHRvIHByaW50IGRlYnVnIG1lc3NhZ2UswqAgYW5kIG15
IG9waW5pb24gaXMgdG8gY2hhbmdlIHRoZSBsb2cKCmZyb20gcHJfZXJyKCJwbGI6IC4uLi4uLi4u
IikgdG8gZGV2X2RiZyhidXMtPmRldiwgIi4uLi4uLi4uIikgdG8gZm9sbG93IAp0aGUgZGV2X2Ri
ZwoKdXNhZ2UgaW4gdGhpcyBmaWxlLgoKPgo+PiAtwqDCoMKgIHZhbCB8PSBkaXZpZGVyOwo+PiAt
wqDCoMKgIGNkbnNfd3JpdGVsKGNkbnMsIENETlNfTUNQX0NMS19DVFJMMCwgdmFsKTsKPj4gLcKg
wqDCoCBjZG5zX3dyaXRlbChjZG5zLCBDRE5TX01DUF9DTEtfQ1RSTDEsIHZhbCk7Cj4+ICsKPj4g
K8KgwqDCoCBjZG5zX3VwZGF0ZWwoY2RucywgQ0ROU19NQ1BfQ0xLX0NUUkwwLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIENETlNfTUNQX0NMS19NQ0xLRF9NQVNLLCBkaXZpZGVyKTsKPj4g
K8KgwqDCoCBjZG5zX3VwZGF0ZWwoY2RucywgQ0ROU19NQ1BfQ0xLX0NUUkwxLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIENETlNfTUNQX0NMS19NQ0xLRF9NQVNLLCBkaXZpZGVyKTsKPj4g
wqAgwqDCoMKgwqDCoCBwcl9lcnIoInBsYjogbWNsayAlZCBtYXhfZnJlcSAlZCBkaXZpZGVyICVk
IHJlZ2lzdGVyICV4XG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvcC0+bWNsa19m
cmVxLAo+PiBAQCAtMTA2NCw4ICsxMDY3LDcgQEAgaW50IGNkbnNfYnVzX2NvbmYoc3RydWN0IHNk
d19idXMgKmJ1cywgc3RydWN0IAo+PiBzZHdfYnVzX3BhcmFtcyAqcGFyYW1zKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgbWNwX2Nsa2N0cmxfb2ZmID0gQ0ROU19NQ1BfQ0xLX0NUUkwwOwo+PiDCoCDC
oMKgwqDCoMKgIG1jcF9jbGtjdHJsID0gY2Ruc19yZWFkbChjZG5zLCBtY3BfY2xrY3RybF9vZmYp
Owo+Cj4KPiBTYW1lIGhlcmUuCj4KQWxzbyByZWZpbmUgdGhlIGRlYnVnIGxvZy4KPgo+PiAtwqDC
oMKgIG1jcF9jbGtjdHJsIHw9IGRpdmlkZXI7Cj4+IC3CoMKgwqAgY2Ruc193cml0ZWwoY2Rucywg
bWNwX2Nsa2N0cmxfb2ZmLCBtY3BfY2xrY3RybCk7Cj4+ICvCoMKgwqAgY2Ruc191cGRhdGVsKGNk
bnMsIG1jcF9jbGtjdHJsX29mZiwgQ0ROU19NQ1BfQ0xLX01DTEtEX01BU0ssIAo+PiBkaXZpZGVy
KTsKPj4gwqAgwqDCoMKgwqDCoCBwcl9lcnIoInBsYjogbWNsayAqIDIgJWQgY3Vycl9kcl9mcmVx
ICVkIGRpdmlkZXIgJWQgcmVnaXN0ZXIgCj4+ICV4XG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcHJvcC0+bWNsa19mcmVxICogU0RXX0RPVUJMRV9SQVRFX0ZBQ1RPUiwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
