Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3A70B96
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 23:39:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05FD41856;
	Mon, 22 Jul 2019 23:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05FD41856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563831578;
	bh=tzwmRnKp9AN6BA0N5HdmJBWaEzghCzXFBH/OJ7bwbcs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4gDErwY80DBYrkaqxWZxwFJZagQMtj+M22XqS+ZnLAdOwPulUL63jS3QALTJ4/zn
	 OaBW1yLb/dL4jePiD3PSvR+bRN0EZFHBg5FD+mQCfKcp5G6VJp43xlj6AED0Fg6P85
	 Y3QgLEiSx3AWKmomE4KxW/JrTJTnTgsIB2Y32kKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36AEBF803D5;
	Mon, 22 Jul 2019 23:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C29CF803D5; Mon, 22 Jul 2019 23:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 347F0F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 23:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 347F0F800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 14:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,296,1559545200"; d="scan'208";a="320807930"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga004.jf.intel.com with ESMTP; 22 Jul 2019 14:37:41 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
 <48015f53-e650-1e77-9217-3a65250673ac@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <887f681f-a329-6fbc-08be-74ee12f7d59d@intel.com>
Date: Mon, 22 Jul 2019 23:37:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <48015f53-e650-1e77-9217-3a65250673ac@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH 0/5] ASoC: Intel: IPC framework updates
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

CgpPbiAyMDE5LTA3LTIyIDIzOjEyLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
PiBPbiA3LzIwLzE5IDI6NDUgUE0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4gRXhpc3Rpbmcg
SVBDIGZyYW1ld29yayBvbWl0cyBjcnVjaWFsIHBhcnQgb2YgdGhlIGVudGlyZSBjb21tdW5pY2F0
aW9uOgo+PiByZXBseSBoZWFkZXIuIFNvbWUgSVBDcyBjYW5ub3QgZnVuY3Rpb24gYXQgYWxsIHdp
dGhvdXQgdGhlIGFjY2VzcyB0bwo+PiBzYWlkIGhlYWRlci4gVXBkYXRlIHRoZSBzc3QtaXBjIHdp
dGggbmV3IHNzdF9pcGNfbWVzc2FnZSBzdHJ1Y3R1cmUgdG8KPj4gcmVwcmVzZW50IGJvdGggcmVx
dWVzdCBhbmQgcmVwbHkgYWxsb3dpbmcgcmVwbHktcHJvY2Vzc2luZyBoYW5kbGVycyB0bwo+PiBz
YXZlIHJlY2VpdmVkIHJlc3BvbnNlcy4KPj4KPj4gRGVzcGl0ZSB0aGUgcmFuZ2Ugb2YgY2hhbmdl
cyByZXF1aXJlZCBmb3IgbW9kZWwgdG8gYmUgdXBkYXRlZCwgbm8KPj4gZnVuY3Rpb25hbCBjaGFu
Z2VzIGFyZSBtYWRlIGZvciBjb3JlIGhhbnN3ZWxsLCBiYXl0cmFpbCBhbmQgc2t5bGFrZQo+PiBt
ZXNzYWdlIGhhbmRsZXJzLiBSZXBseS1wcm9jZXNzaW5nIGhhbmRsZXJzIG5vdyBzYXZlIHJlY2Vp
dmVkIHJlc3BvbnNlCj4+IGhlYWRlciB5ZXQgbm8gdXNhZ2UgaXMgYWRkZWQgYnkgZGVmYXVsdC4K
Pj4KPj4gVG8gYWxsb3cgZm9yIGZ1dHVyZSBjaGFuZ2VzLCByaWdoZnVsIGtpbmdzIG9mIElQQyBr
aW5nZG9tIG5lZWQgdG8gYmUgcHV0Cj4+IGJhY2sgb24gdGhlIHRocm9uZS4gVGhpcyB1cGRhdGUg
YWRkcmVzc2VzIG9uZSBvZiB0aGVtOiBMQVJHRV9DT05GSUdfR0VULgo+Pgo+PiBDZXphcnkgUm9q
ZXdza2kgKDUpOgo+PiDCoMKgIEFTb0M6IEludGVsOiBVcGRhdGUgcmVxdWVzdC1yZXBseSBJUEMg
bW9kZWwKPiAKPiBJIGhhZCBhIGRvdWJ0IG9uIHRoZSBzdHJ1Y3R1cmUgb2YgdGhpcyBwYXRjaHNl
dCBzaW5jZSB5b3UgZmlyc3QgY2hhbmdlIAo+IHRoZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbnMvcHJv
dG90eXBlcyBhbmQgdGhlbiB1c2UgdGhlbSBpbiBmb2xsb3ctdXAgCj4gcGF0Y2hlcywgYW5kIHN1
cmUgZW5vdWdoIGlmIEkgYXBwbHkgdGhlIGZpcnN0IHBhdGNoIG9ubHkgdGhlIGNvbXBpbGF0aW9u
IAo+IGlzIGJyb2tlbiwgc2VlIGJlbG93Lgo+IAo+IFRoZSBydWxlIGlzIHRoYXQgd2UgY2FuJ3Qg
YnJlYWsgZ2l0IGJpc2VjdC4gQW5kIGlmIHlvdSBzcXVhc2ggdGhlIAo+IHBhdGNoZXMgdG9nZXRo
ZXIsIHRoZW4geW91IGhhdmUgYSByZWFsbHkgY29tcGxpY2F0ZWQgcGF0Y2ggdG8gCj4gcmV2aWV3
L3Rlc3QsIHNvIGxpa2UgSSBzYWlkIGVhcmxpZXIgc3VjaCBpbnZhc2l2ZSBjaGFuZ2VzIGluIHNo
YXJlZCAKPiBwcm90b3R5cGVzIGFyZSByZWFsbHkgcGFpbmZ1bC4KClRoYW5rcyBmb3IgeW91ciB0
aW1lIGFuZCBpbnB1dCwgUGllcnJlIQoKQWdyZWVkIG9uIHRoZSBwYXRjaHNldCBzdHJ1Y3R1cmUu
IFRoaXMgd2Fzbid0IGEgcmFuZG9tIG1pc3Rha2UsIHRob3VnaC4gCktuZXcgdGhhdCBtZXNoaW5n
IHRoZW0gYWxsIHRvZ2V0aGVyIGltbWVkaWF0ZWx5ICh2MSkgd291bGQgYmUgdmVyeSBoYXJkIApm
b3IgcmVhZGVycyB0byByZXZpZXcsIGRlc3BpdGUgdGhlIF9zaW1wbGljaXR5XyBvZiBhY3R1YWwg
c29sdXRpb246IApleHBsaWNpdCBsaXN0aW5nIG9mIG1lc3NhZ2UgcGFydHMgLT4gY29udGFpbm1l
bnQgd2l0aGluIHNzdF9pcGNfbWVzc2FnZS4KCkknbGwgY29tYmluZSB0aGVtIHRvZ2V0aGVyIC0g
ZXhjZXB0IGZvciB0aGUgbGFyZ2VfY29uZmlnX2dldCBvbmUuIEhhZCAKdGhlc2UgaXNzdWVzIGJl
ZW4gYWRkcmVzc2VkIGVhcmxpZXIsIHBhdGNoZXMgc3VjaCBhcyB0aGlzIHdvdWxkbid0IGhhdmUg
CmJlZW4gbmVlZGVkIGF0IGFsbCA7LwoKQ3phcmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
