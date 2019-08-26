Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D09D707
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 21:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D7716B6;
	Mon, 26 Aug 2019 21:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D7716B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566849242;
	bh=/rOLtTNHnAxt1kTyvtpHoleYG6CNhXo1O5pDgPISmoc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKgS2O6jawGLZDseoyYLiXXd8jHwQV8c6B4v4vlAGaIFaRV8LHLbtKuNUk0XavOmf
	 /fOTdpPQ1wXK2BsG4M87CAZXsvZgQGNVVKljZR3YiJksOxsPbqR+uTtGFjN7iP5X3D
	 XRbyPnB0nzaEmc+yhh7YzUptKWVSFm70W1/eh6/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4454DF80362;
	Mon, 26 Aug 2019 21:52:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5087BF80362; Mon, 26 Aug 2019 21:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 806EBF801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 21:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 806EBF801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 12:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="331585271"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.150])
 ([10.252.26.150])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2019 12:50:49 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-5-cezary.rojewski@intel.com>
 <90bbda82-3988-d02d-0d5d-e63890db81dc@linux.intel.com>
 <20fea187-8a0c-c293-bbcb-e8561193bc2f@intel.com>
 <d51a0703-4a1d-e667-e29b-a4017de0a38e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <5e9940ac-7cda-9bca-1fa3-00fff6d51956@intel.com>
Date: Mon, 26 Aug 2019 21:50:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d51a0703-4a1d-e667-e29b-a4017de0a38e@linux.intel.com>
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

T24gMjAxOS0wOC0yNiAxODozMSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yNC8xOSA0OjM0IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IE9uIDIwMTktMDgt
MjMgMjA6NDAsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4KPj4+PiAtaW50IHNrbF9z
c3RfaW5pdF9mdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBza2xfZGV2ICpza2wpCj4+Pj4g
K2ludCBza2xfc3N0X2luaXRfZncoc3RydWN0IHNrbF9kZXYgKnNrbCkKPj4+PiDCoCB7Cj4+Pj4g
LcKgwqDCoCBpbnQgcmV0Owo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHNzdF9kc3AgKnNzdCA9IHNr
bC0+ZHNwOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gc2tsLT5kZXY7Cj4+Pj4g
K8KgwqDCoCBpbnQgKCpscF9jaGVjaykoc3RydWN0IHNzdF9kc3AgKmRzcCwgYm9vbCBzdGF0ZSk7
Cj4+Pj4gK8KgwqDCoCBpbnQgcmV0Owo+Pj4+ICsKPj4+PiArwqDCoMKgIGxwX2NoZWNrID0gc2ts
LT5pcGMub3BzLmNoZWNrX2RzcF9scF9vbjsKPj4+PiArwqDCoMKgIHNrbC0+ZW5hYmxlX21pc2Ni
ZGNnZShkZXYsIGZhbHNlKTsKPj4+PiArwqDCoMKgIHNrbC0+Y2xvY2tfcG93ZXJfZ2F0aW5nKGRl
diwgZmFsc2UpOwo+Pj4+IMKgwqDCoMKgwqAgcmV0ID0gc3N0LT5md19vcHMubG9hZF9mdyhzc3Qp
Owo+Pj4+IMKgwqDCoMKgwqAgaWYgKHJldCA8IDApIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycihkZXYsICJMb2FkIGJhc2UgZncgZmFpbGVkIDogJWRcbiIsIHJldCk7Cj4+Pj4gLcKg
wqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXhpdDsK
Pj4+PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCBpZiAoIXNrbC0+aXNfZmlyc3RfYm9v
dCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBsaWJyYXJ5X2xvYWQ7Cj4+Pj4gK8KgwqDCoCAv
KiBEaXNhYmxlIHBvd2VyIGNoZWNrIGR1cmluZyBjZmcgc2V0dXAgKi8KPj4+PiArwqDCoMKgIHNr
bC0+aXBjLm9wcy5jaGVja19kc3BfbHBfb24gPSBOVUxMOwo+Pj4KPj4+IEl0J3MgdmVyeSBvZGQg
dG8gcGxheSB3aXRoIC5vcHMgY2FsbGJhY2sgZHluYW1pY2FsbHkuIFVzdWFsbHkgb3BzIGFyZSAK
Pj4+IGNvbnN0YW50LCBhbmQgaWYgeW91IHdhbnQgdG8gZGlzYWJsZSB0aGVtIHlvdSBhZGQgYSBm
bGFnLgo+Pj4KPj4KPj4gWWV5ZSwga2VlbiBleWUhIENhbid0IGRvIGV2ZXJ5dGhpbmcgYXQgb25j
ZSB0aG91Z2ggOi8KPj4gVGhlIHBvd2VyIGNoZWNrIGlzIEFQTCsgc3BlY2lmaWMgYW5kIHNob3Vs
ZCBub3QgYmUgcGFydCBvZiBnZW5lcmljIGlwYyAKPj4gZnJhbWV3b3JrIGF0IGFsbCAoZm91bmQg
aW4gL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWlwYy5jKS4gCj4+IERpZmZlcmVudCBmYXRl
IGF3YWl0cyBzYWlkIGNoZWNrLiBGb3Igbm93LCBpbiB0aGlzIHNpbmdsZSBjYXNlIGl0IAo+PiBz
ZWVtcyBiZXN0IHRvIHNpbXBseSBkaXNhYmxlIHRoZSBjaGVjayBhbmQgcmVhcHBseSBpdCBvbmNl
IHNldHVwIGlzIGRvbmUuCj4gCj4gV2hhdCdzIHRoZSBkaWZmZXJlbmNlIHdpdGggaGF2aW5nIHRo
aXMgY2FsbGJhY2sgZG8gbm90aGluZyBmb3IgQVBMLT8KPiAKClRoZSBlbnRpcmUgY2hlY2tfZHNw
X2xwX29uIGlzIGFjdHVhbGx5IEQwaXggdGhpbmd5LgotLSBUaGUgcG93ZXItbWFuYWdlbWVudCBp
cyBiZWluZyBhZGRyZXNzZWQgaW4gZm9sbG93aW5nIHNlZ21lbnQuIC0tCgpEMGl4IGlzIGEgcG93
ZXItb3B0aW1pemF0aW9uIGZlYXR1cmUgYW5kIGltcGxlbWVudGVkIGluIEFQTCBhbmQgb253YXJk
LiAKU28gZm9yIFNLTC8gS0JMIHRoZXJlIGlzIG5vIGNoZWNrX2RzcF9scF9vbi4gWW91IGNhbiBz
ZWUgdGhlIGRpZmZlcmVuY2UgCmluIC9za3lsYWtlL3NrbC1zc3QuYzogc3RhdGljIGNvbnN0IHN0
cnVjdCBza2xfZHNwX2Z3X29wcyBza2xfZndfb3BzIAoobGFjayBvZiBzZXRfc3RhdGVfRDBpeCBo
YW5kbGVycykKCk9uY2UgZHNwLWhvc3QgaW50ZXJhY3Rpb24gY2FuIGJlIGRlc2NyaWJlZCBhcyBp
ZGxlIChlLmcuIG9uZ29pbmcgCnBsYXliYWNrIHdpdGggbm8gSVBDIHRyYWZmaWMpLCBob3N0IG1h
eSBlbmFibGUgRlcgdG8gcG93ZXIgZ2F0ZSBzb21lIApjb21wb25lbnRzIGFuZCB0aHVzIHJlZHVj
ZSBwb3dlciBjb25zdW1wdGlvbi4KCkQwaXggaXMgYWJicmV2IGZvciBEMGkwIDwtPiBEMGkzIHRy
YW5zaXRpb25zLiBPbmNlIGRzcCBlbnRlcnMgRDBpMyAKKHBvd2VyIGdhdGVkKSwgbm8gSVBDcyBj
YW4gYmUgY29uc3VtZWQgYXBhcnQgZnJvbSBvbmUgYW5kIG9ubHkgU2V0RDBpeCAtIAp0byB3YWtl
IGRzcCBiYWNrIHRvIEQwaTAgc3RhdGUuIEluIGdlbmVyYWwgeW91IGNhbiB0aGluayBvZiBEMGkw
IGFzIEQwLgpBZ2Fpbiwgc2luY2UgU0tMLyBLQkwgaGF2ZSBubyBEMGl4LCB0aGVyZSBpcyBubyBu
ZWVkIHRvIHdha2UgYW55dGhpbmcsIApubyBjaGVja3MgYXJlIHJlcXVpcmVkLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
