Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF1E1373C8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 17:37:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E1E816B2;
	Fri, 10 Jan 2020 17:36:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E1E816B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578674233;
	bh=Zv6eRERD+piDoHSDDMiHStZ8PpKK49gXXZbBe+WO6Jw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HMmqaKp1bwCQDZri4XJZ9cEdPz/1vi5PF8iiwYuUtQ/TNDzVKIJp5ANnWEnIxejM7
	 5lLSak1nhWpgLR/FYLv6pXYn2VFS/k3xEuPkjv9ZMSkR1cZWNLf79Lj5dD5Ze0eRjv
	 OzMB+2HtwRcYAIHC6OGHPsBFKDZUI0yEk8bBhSFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03ADCF8011C;
	Fri, 10 Jan 2020 17:35:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85E8EF8011C; Fri, 10 Jan 2020 17:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30230F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 17:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30230F8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 08:35:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; d="scan'208";a="224242394"
Received: from nehudak-mobl1.amr.corp.intel.com (HELO [10.251.145.164])
 ([10.251.145.164])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 08:35:19 -0800
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20191219092842.10885-1-srinivas.kandagatla@linaro.org>
 <20191219092842.10885-3-srinivas.kandagatla@linaro.org>
 <c791e241-cd71-4c05-dac5-04e3ecaaf995@linux.intel.com>
 <a5315861-d9b8-0852-8a3a-012f60cc3a44@linaro.org>
 <4dab7ee8-dc0e-bf61-24db-3e227c459575@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <94aefed4-9f0d-f81a-b5c0-0ad4cafc6a96@linux.intel.com>
Date: Fri, 10 Jan 2020 10:35:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4dab7ee8-dc0e-bf61-24db-3e227c459575@linaro.org>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v5 2/2] soundwire: qcom: add support for
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

Cj4+Pj4gK8KgwqDCoCBpZiAoc3RzICYgU1dSTV9JTlRFUlJVUFRfU1RBVFVTX0NNRF9FUlJPUikg
ewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjdHJsLT5yZWdfcmVhZChjdHJsLCBTV1JNX0NNRF9GSUZP
X1NUQVRVUywgJnZhbHVlKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Vycl9yYXRlbGltaXRl
ZChjdHJsLT5kZXYsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJDTUQgZXJyb3IsIGZpZm8gc3RhdHVzIDB4JXhcbiIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsdWUpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjdHJs
LT5yZWdfd3JpdGUoY3RybCwgU1dSTV9DTURfRklGT19DTUQsIDB4MSk7Cj4+Pj4gK8KgwqDCoCB9
Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYgKChzdHMgJiBTV1JNX0lOVEVSUlVQVF9TVEFUVVNfTkVX
X1NMQVZFX0FUVEFDSEVEKSB8fAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdHMgJiBTV1JNX0lOVEVS
UlVQVF9TVEFUVVNfQ0hBTkdFX0VOVU1fU0xBVkVfU1RBVFVTKQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBzY2hlZHVsZV93b3JrKCZjdHJsLT5zbGF2ZV93b3JrKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCBj
dHJsLT5yZWdfd3JpdGUoY3RybCwgU1dSTV9JTlRFUlJVUFRfQ0xFQVIsIHN0cyk7Cj4+Pgo+Pj4g
aXMgaXQgaW50ZW50aW9uYWwgdG8gY2xlYXIgdGhlIGludGVycnVwdHMgZmlyc3QsIGJlZm9yZSBk
b2luZyAKPj4+IGFkZGl0aW9uYWwgY2hlY2tzPwo+Pj4KPj4KPj4gTm8sIEkgY2FuIG1vdmUgaXQg
dG8gcmlnaHQgdG8gdGhlIGVuZCEKPiAKPiBSZWFzb24gd2h5IEkgZGlkIHRoaXMgd2FzIHRoYXQg
aWYgd2UgcnVuIGNvbXBsZXRlKCkgYmVmb3JlIGlycSBpcyAKPiBjbGVhcmVkIGNvbXBsZXRlIG1p
Z2h0IHRyaWdnZXIgYW5vdGhlciByZWFkL3dyaXRlIHdoaWNoIGNhbiByYWlzZSBhbiAKPiBpbnRl
cnJ1cHQuIEFuZCB3aXRoIGludGVycnVwdCBzdGF0dXMgbm90IGNsZWFyZWQgd2UgbWlnaHQgbWlz
cyBpdC4gVGhpcyAKPiBpcyB2ZXJ5IG11Y2ggdGltaW5nIGRlcGVuZGVudCBzcGVjaWFsbHkgd2l0
aCB0aGUgdGhyZWFkZWQgaXJxLgo+IAo+IFNvIGNvZGUgbmVlZHMgbm8gY2hhbmdlIGF0bSEKCm9r
LCBhIGNvbW1lbnQgdG8ga2VlcCB0cmFjayBvZiB0aGlzIHRpbWluZyBkZXBlbmRlbmN5IGNvdWxk
IGhlbHAgZnV0dXJlIApnZW5lcmF0aW9ucyB0aGVuLi4uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
