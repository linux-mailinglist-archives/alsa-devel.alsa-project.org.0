Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE33CB11
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 14:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50741706;
	Tue, 11 Jun 2019 14:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50741706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560255797;
	bh=2FzAdmfdp8922cG5pvY+jr2pPB/ApGNaglqQXK4YL4s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvHOifo4UhydIWCWIyi46QOXqciVwG+Fzz9Ov8si15+ca6vy/sVOPxOGn+S2mb9Qw
	 67QRMQ/AeUIK1m+hAmYBKyci1SowIFbp5MWS1mtH32/JN+0nO090nNDMBQxw+wlugk
	 WLaFwldTZOgnnUKd3Dh/SNrEDfo+NUIhgbRnHRfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 512EAF89712;
	Tue, 11 Jun 2019 14:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA0AEF8970F; Tue, 11 Jun 2019 14:21:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18F1EF8961D
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 14:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F1EF8961D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 05:21:21 -0700
X-ExtLoop1: 1
Received: from rrgarris-mobl1.amr.corp.intel.com (HELO [10.252.136.137])
 ([10.252.136.137])
 by orsmga003.jf.intel.com with ESMTP; 11 Jun 2019 05:21:20 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-7-srinivas.kandagatla@linaro.org>
 <249f9647-94d0-41d7-3b95-64c36d90f8e8@linux.intel.com>
 <40ea774c-8aa8-295d-e91e-71423b03c88d@linaro.org>
 <7269521a-ac89-3856-c18c-ffaaf64c0806@linux.intel.com>
 <462620fc-ac91-6a36-46c7-7af0080f06cb@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0e836692-2297-4cb7-d681-76692db78a56@linux.intel.com>
Date: Tue, 11 Jun 2019 07:21:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <462620fc-ac91-6a36-46c7-7af0080f06cb@linaro.org>
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

CgpPbiA2LzExLzE5IDU6MjkgQU0sIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6Cj4gCj4gCj4g
T24gMTAvMDYvMjAxOSAxNToxMiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4+ICsK
Pj4+Pj4gK8KgwqDCoCBpZiAoZGV2X2FkZHIgPT0gU0RXX0JST0FEQ0FTVF9ERVZfTlVNKSB7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBjdHJsLT5maWZvX3N0YXR1cyA9IDA7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmN0cmwtPnNwX2NtZF9j
b21wLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbXNlY3NfdG9famlmZmllcyhUSU1FT1VUX01TKSk7Cj4+Pj4KPj4+PiBUaGlzIGlzIG9k
ZC4gVGhlIFNvdW5kV2lyZSBzcGVjIGRvZXMgbm90IGhhbmRsZSB3cml0ZXMgdG8gYSBzaW5nbGUg
Cj4+Pj4gZGV2aWNlIG9yIGJyb2FkY2FzdCB3cml0ZXMgZGlmZmVyZW50bHkuIEkgZG9uJ3Qgc2Vl
IGEgY2xlYXIgcmVhc29uIAo+Pj4+IHdoeSB5b3Ugd291bGQgb25seSB0aW1lb3V0IGZvciBhIGJy
b2FkY2FzdCB3cml0ZS4KPj4+Pgo+Pj4KPj4+IFRoZXJlIGlzIGRhbmdlciBvZiBibG9ja2luZyBo
ZXJlIHdpdGhvdXQgdGltZW91dC4KPj4KPj4gUmlnaHQsIGFuZCBpdCdzIGZpbmUgdG8gYWRkIGEg
dGltZW91dC4gVGhlIHF1ZXN0aW9uIGlzIHdoeSBhZGQgYSAKPj4gdGltZW91dCAqb25seSogZm9y
IGEgYnJvYWRjYXN0IG9wZXJhdGlvbj8gSXQgc2hvdWxkIGJlIGFkZGVkIGZvciBldmVyeSAKPj4g
dHJhbnNhY3Rpb24gSU1PLCB1bmxlc3MgeW91IGhhdmUgYSByZWFzb24gbm90IHRvIGRvIHNvLgo+
Pgo+IAo+IEkgZGlkIHRyeSB0aGlzIGJlZm9yZSwgdGhlIGlzc3VlIGlzIHdoZW4gd2UgcmVhZC93
cml0ZSByZWdpc3RlcnMgZnJvbSAKPiBpbnRlcnJ1cHQgaGFuZGxlciwgdGhlc2UgY2FuIGJlIGRl
YWRsb2NrZWQgYXMgd2Ugd2lsbCBiZSBpbnRlcnJ1cHQgCj4gaGFuZGxlciB3YWl0aW5nIGZvciBh
bm90aGVyIGNvbXBsZXRpb24gaW50ZXJydXB0LCB3aGljaCB3aWxsIG5ldmVyIAo+IGhhcHBlbiB1
bmxlc3Mgd2UgcmV0dXJuIGZyb20gdGhlIGZpcnN0IGludGVycnVwdC4KCkkgZG9uJ3QgcXVpdGUg
Z2V0IHRoZSBpc3N1ZS4gV2l0aCB0aGUgSW50ZWwgaGFyZHdhcmUgd2Ugb25seSBkZWFsIHdpdGgg
Ck1hc3RlciByZWdpc3RlcnMgKHNvbWUgb2Ygd2hpY2ggbWlycm9yIHRoZSBidXMgc3RhdGUpIGlu
IHRoZSBoYW5kbGVyIGFuZCAKd2lsbCBvbmx5IG1vZGlmeSBTbGF2ZSByZWdpc3RlcnMgaW4gdGhl
IHRocmVhZC4gQWxsIGNoYW5nZXMgdG8gU2xhdmUgCnJlZ2lzdGVycyB3aWxsIGJlIHN1YmplY3Qg
dG8gYSB0aW1lb3V0IGFzIHdlbGwgYXMgYSBjaGVjayBmb3Igbm8gCnJlc3BvbnNlIG9yIE5BSy4g
Tm90IHN1cmUgd2hhdCBpcyBzcGVjaWZpYyBhYm91dCB5b3VyIHNvbHV0aW9uIHRoYXQgCnJlcXVp
cmVzIGEgZGlmZmVyZW50IGhhbmRsaW5nIG9mIGNvbW1hbmRzIGRlcGVuZGluZyBvbiB3aGljaCBk
ZXZpY2UgCm51bWJlciBpcyB1c2VkLiBJdCBjb3VsZCB2ZXJ5IHdlbGwgYmUgdGhhdCB5b3UndmUg
dW5jb3ZlcmVkIGEgZmxhdyBpbiAKdGhlIGJ1cyBkZXNpZ24gYnV0IEkgc3RpbGwgZG9uJ3Qgc2Vl
IGhvdyBpdCB3b3VsZCBiZSBRdWFsY29tbS1zcGVjaWZpYz8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
