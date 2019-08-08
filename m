Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B88698F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 21:08:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37481615;
	Thu,  8 Aug 2019 21:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37481615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565291320;
	bh=wXyYW6JqXUO8CN1IqS8wWJ/4e+4yKIKuY9jKu2k4+A4=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHX/pgTOmQK13ssIpPuhp5CEzn7b+F6LcVRlgZmrJ1dvDYTOwRHMG+kfT09hKWztJ
	 Fr2gxeyem37CvtsQzxW4r6Qp+yquTFcrnORAe3ssqs5v3zf3LutvH1u+bVK7yKKcyk
	 yytpHFMpadLWXwinoIOLQIvrrJsqYIJPEfIchQ/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D3B1F80534;
	Thu,  8 Aug 2019 21:06:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FEC2F80534; Thu,  8 Aug 2019 21:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EB32F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 21:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB32F803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 12:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="199154756"
Received: from jmikitka-mobl2.amr.corp.intel.com (HELO [10.252.204.174])
 ([10.252.204.174])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 12:06:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1565251120-13082-1-git-send-email-mac.chiang@intel.com>
 <334b227c-10fb-ec2e-10d0-68587806eb8c@linux.intel.com>
Message-ID: <2ec1119e-cd4c-71a6-1f52-e9a586f1aeaf@linux.intel.com>
Date: Thu, 8 Aug 2019 14:06:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <334b227c-10fb-ec2e-10d0-68587806eb8c@linux.intel.com>
Content-Language: en-US
Cc: sathya.prakash.m.r@intel.com, broonie@kernel.org, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: Add Cometlake machine
 driver support
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

Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1pbnRlbC1xdWlya3Mu
aCAKPj4gYi9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1pbnRlbC1xdWlya3MuaAo+PiBpbmRl
eCA0NzE4ZmQzLi5lNjM1N2QzIDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9u
L3NvYy1pbnRlbC1xdWlya3MuaAo+PiArKysgYi9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1p
bnRlbC1xdWlya3MuaAo+PiBAQCAtMzYsNiArMzYsNyBAQCBTT0NfSU5URUxfSVNfQ1BVKGJ5dCwg
SU5URUxfRkFNNl9BVE9NX1NJTFZFUk1PTlQpOwo+PiDCoCBTT0NfSU5URUxfSVNfQ1BVKGNodCwg
SU5URUxfRkFNNl9BVE9NX0FJUk1PTlQpOwo+PiDCoCBTT0NfSU5URUxfSVNfQ1BVKGFwbCwgSU5U
RUxfRkFNNl9BVE9NX0dPTERNT05UKTsKPj4gwqAgU09DX0lOVEVMX0lTX0NQVShnbGssIElOVEVM
X0ZBTTZfQVRPTV9HT0xETU9OVF9QTFVTKTsKPj4gK1NPQ19JTlRFTF9JU19DUFUoY21sLCBJTlRF
TF9GQU02X0tBQllMQUtFX01PQklMRSk7Cj4+IMKgIHN0YXRpYyBpbmxpbmUgYm9vbCBzb2NfaW50
ZWxfaXNfYnl0X2NyKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgIHsKPj4gQEAg
LTExMCw2ICsxMTEsMTAgQEAgc3RhdGljIGlubGluZSBib29sIHNvY19pbnRlbF9pc19nbGsodm9p
ZCkKPj4gwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+IMKgIH0KPj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBzb2NfaW50ZWxfaXNfY21sKHZvaWQpCj4+ICt7Cj4+ICvCoMKgwqAgcmV0dXJuIGZhbHNl
Owo+PiArfQo+PiDCoCAjZW5kaWYKPj4gwqDCoCAjZW5kaWYgLyogX1NORF9TT0NfSU5URUxfUVVJ
UktTX0ggKi8KPiAKPiBIdW1tLCB3aGljaCBicmFuY2ggZG9lcyB0aGlzIGFwcGx5IGFnYWluc3Q/
IEl0J3Mgbm90IGluIE1hcmsncyB0cmVlIG5vciAKPiBpbiB0aGUgU09GIHRyZWUsIHNvIGhvdyBk
aWQgeW91IHRlc3QgdGhpcz8KPiAKPiBJIHJlbWVtYmVyIHN1Ym1pdHRpbmcgdGhpcyBxdWlyayBz
dWdnZXN0aW9uIGJ1dCBpdCB3YXMgbm90IGFwcHJvdmVkIAo+IHVwc3RyZWFtLCBvciBuZWVkZWQg
bW9yZSB3b3JrICh0aGlzIHdhcyBiZWZvcmUgSSBkcm9wcGVkIGV2ZXJ5dGhpbmcgdG8gCj4gd29y
ayBvbiBTb3VuZFdpcmUpLiBZb3UgbWF5IGhhdmUgdG8gZG8gdGhpcyBtYW51YWxseSBmb3Igbm93
IHdpdGggdGhlIAo+IGNwdV9pZCBtZXRob2QsIGFuZCB3ZSdsbCByZXBsYWNlIGl0IGxhdGVyIHdp
dGggYSBiZXR0ZXIgc29sdXRpb24uCgpQbGVhc2UgaWdub3JlIHRoaXMgbGFzdCBjb21tZW50LCBJ
IG5lZWQgbW9yZSBjb2ZmZWUgYmVmb3JlIHJldmlld2luZy4gClRoZSBjb2RlIHdhcyBpbmRlZWQg
bWVyZ2VkLi4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
