Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A0F2C0A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 11:20:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19E7D1677;
	Thu,  7 Nov 2019 11:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19E7D1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573122049;
	bh=TnzlMZcDbnvFub7aqsDekqCQZJBMhvoro2QO6DLFusk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=In0OUxyH3DN0eUUAC7G3qXbUY8Jc022NWRTIpV/ALbJFFTiKulecyl4CxhRfZ+x6O
	 1AFT2q7iQtKXVFSkfGCQ5Uex7wFDMdNj5wgzBtg+hra5rvbMGo/AojHWdy1E4udfR3
	 MAOivwvH43d6qwuQ1shqW7GipPyHcYhTxGOGRjYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BCBF80508;
	Thu,  7 Nov 2019 11:19:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B41EF8049B; Thu,  7 Nov 2019 11:19:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9544FF80291
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 11:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9544FF80291
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 02:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="227786371"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2019 02:18:53 -0800
To: Jaroslav Kysela <perex@perex.cz>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <60c63704-44ce-d80b-ccbd-b23d748b009b@intel.com>
Date: Thu, 7 Nov 2019 11:18:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] UCM extensions
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

T24gMjAxOS0xMS0wNSAyMDozNiwgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOgo+IEhpIGFsbCwKPiAK
PiAgwqDCoMKgwqBJIG1ha2Ugc29tZSBpbnRlcm5hbCB1Y20gY29kZSBjbGVhbnVwcyBpbiBhbHNh
LWxpYiBhbmQgYWRkZWQgdGhyZWUgCj4gbWFqb3IgZXh0ZW5zaW9ucyB0byBhbGxvdyBtb3JlIGNv
bXBsZXggY29uZmlndXJhdGlvbnMgd2hpY2ggd2UgcmVxdWlyZSAKPiBmb3IgdGhlIFNPRiBrZXJu
ZWwgZHJpdmVyLgo+IAo+ICDCoMKgwqDCoFRoZSBmaXJzdCB0aGluZyBpcyB0aGUgYWRkZWQgc3Vi
c3RpdHV0aW9uIGZvciB0aGUgdmFsdWUgc3RyaW5nczoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20v
YWxzYS1wcm9qZWN0L2Fsc2EtbGliL2NvbW1pdC9mMWU2MzdiMjg1ZThlMDRlNjc2MTI0OGEwNzBm
NThmM2E4ZmRlNmZjIAo+IAo+IAo+ICDCoMKgwqDCoFRoZSBzZWNvbmQgdGhpbmcgaXMgdGhlIElm
IGJsb2NrOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1saWIvY29t
bWl0Lzk4NTcxNWNlODE0OGRjN2VmNjJjOGUzZDhjZTVhMGMyYWM1MWY4ZGYgCj4gCj4gCj4gIMKg
wqDCoMKgVGhlIHRoaXJkIHRoaW5nIGlzIHRoZSBjYXJkIC8gaGFyZHdhcmUgbGlrZSBzcGVjaWZp
ZXIgcGFzc2VkIGFzIHRoZSAKPiB1Y20gbmFtZSB0byBzbmRfdXNlX2Nhc2VfbWdyX29wZW4oKSB0
byBzdXBwb3J0IG11bHRpcGxlIGNhcmQgaW5zdGFuY2VzOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9hbHNhLXByb2plY3QvYWxzYS1saWIvY29tbWl0LzYwMTY0ZmM1ODg2Y2RjNmNhNTVlZWVkMGMy
ZTNmNzUxYTdkMmIyYzAgCj4gCj4gCj4gIMKgwqDCoMKgQWxsIHRob3NlIHBhdGNoZXMgKHdpdGgg
b3RoZXIgY2xlYW51cHMpIGFyZSBpbiB0aGUgdWNtMiBicmFuY2ggb24gCj4gZ2l0aHViIGZvciBj
b21tZW50czoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtbGliL2Nv
bW1pdHMvdWNtMgo+IAo+ICDCoMKgwqDCoFRoZSBwcm9wb3NlZCBTT0YgVUNNIGNvbmZpZyBkaWZm
IGlzIGhlcmU6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1j
b25mL2NvbW1pdC83MjNiNmRhODgxNzIxNDg4MjI5MTU0ZTkyM2VkMzY0MTM5NTVhMDUxIAo+IAo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9jb21taXRzL3Vj
bTIKPiAKPiAgwqDCoMKgwqBJIGFkZGVkIGV2ZXJ5dGhpbmcgdG8ga2VlcCB0aGUgaW50ZXJmYWNl
IGJhY2t3YXJkIGNvbXBhdGlibGUsIHNvIAo+IHRoZSBjdXJyZW50IGFwcGxpY2F0aW9ucyBzaG91
bGQgbm90IG9ic2VydmUgYW55IGRpZmZlcmVudCBiZWhhdmlvci4gVGhlIAo+IGFwcGxpY2F0aW9u
cyBsaWtlIHB1bHNlYXVkaW8gc2hvdWxkIHVzZSB0aGUgJ2h3OkNBUkRfSU5ERVgnIHNwZWNpZmll
ciAKPiBmb3IgdGhlIG9wZW4gY2FsbCBpbiB0aGUgZnV0dXJlIGFuZCBzbmRfdXNlX2Nhc2VfcGFy
c2VfY3RsX2VsZW1faWQoKSAKPiBoZWxwZXIgZm9yIHRoZSBlbGVtZW50IGNvbnRyb2wgbmFtZXMu
Cj4gCj4gIMKgwqDCoMKgSWYgeW91IGhhdmUgYW5vdGhlciBpZGVhcyB0byBhZGRyZXNzIHRob3Nl
IGlzc3VlcywgcGxlYXNlLCBsZXQgbWUgCj4ga25vdy4KPiAKPiAgwqDCoMKgwqBCVFcsIE1hcms6
IFRoZSBTT0YgVUNNIGNvbmZpZ3MgcmVsaWVzIG9uIHRoZSBkcml2ZXIgbmFtZSBjaGFuZ2VzLCAK
PiBzbyBpdCBtaWdodCBiZSB3b3J0aCB0byBzZW5kICJBU29DOiBpbnRlbCAtIGZpeCB0aGUgY2Fy
ZCBuYW1lcyIgcGF0Y2ggdG8gCj4gNS40IHRvIG1ha2UgdGhpbmdzIHN0YWJsZSBtb3JlIHF1aWNr
bHk6Cj4gCj4gIMKgwqDCoMKgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvYnJvb25pZS9zb3VuZC5naXQvY29tbWl0Lz9oPWZvci01LjUmaWQ9ZDc0NWNjMWFi
NjU5NDViMmQxN2VjOWM1NjUyZjM4Mjk5YzA1NDY0OQo+IAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgVGhhbmtzLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBKYXJvc2xhdgo+IAoKClRoYW5rcyBmb3IgeW91ciB3b3JrLCBKYXJvc2xhdi4KCkhvd2V2
ZXIsIEkgaGF2ZSBzb21lIGNvbmNlcm5zIGhlcmUuIEZpcnN0LCBjb3VsZCB5b3UgZWxhYm9yYXRl
IG9uICJ3ZSAKcmVxdWlyZSBmb3IgdGhlIFNPRiBrZXJuZWwgZHJpdmVyIj8KClRoZSBzdWJzdGl0
dXRpb25zIGFuZCBtdWx0aS1pbnN0YW5jZSBzdXBwb3J0IGlzIHByb2JhYmx5IHdhcm1seSB3ZWxj
b21lZCAKYnkgbWFueSwgYnV0ICJJZiIgYmxvY2tzIGFyZSB3aGF0IHdvcnJpZXMgbWUuIEVzcGVj
aWFsbHkgdGhlIG5lc3RlZCAKIklmcyIuIEFzIFRha2FzaGkgcG9pbnRlZCBhbHJlYWR5IG91dCwg
VUNNIC0gd2hpY2ggaXMgY3VycmVudGx5IGlzIAp2aWV3ZWQgYXMgYSBzaW1wbGUgY29uZmlndXJh
dGlvbiBzeW50YXggLSBpcyBiZWNvbWluZyBhIGxhbmd1YWdlIG9uIGl0cyAKb3duLiBJZiB3ZSBh
cmUgdG8ga2VlcCBleHRlbmRpbmcgVUNNIG9uIGFuZCBvbiwgd2UgbWlnaHQgYXMgd2VsbCBzd2l0
Y2ggCnRvIEpTT04vIFhNTC8gWUFNTCBlbnRpcmVseSBpbnN0ZWFkIG9mIGRldmVsb3Bpbmcgb3Vy
IG93biB0aGluZ3kuCgoiSWYiIGJsb2NrIGNvdWxkIGp1c3QgYmUgd2hhdCdzIG5lZWRlZCB0byBv
cGVuIG5ldyBwYW5kb3JhIGJveCwgYWxsb3dpbmcgCmZvciB2ZXJ5IGNvbXBsZXggYW5kIG5vIGxv
bmdlciBlYXN5LXRvLXJlYWQgY29uZmlnIGZpbGVzLiBJbiBnZW5lcmFsLCBpZiAKb25lIGlzIHRv
IGVubGlzdCBhbiAiSWYiLCB3aHkgbm90IGRlZmluZSB0d28gVUNNcyBpbnN0ZWFkPwoKTW9yZW92
ZXIsIEkgc2VlIHlvdSBtZW50aW9uaW5nIHRoZSBjYXJkLW5hbWUgZGVwZW5kZW5jeS4gVGhpcyBz
b3VuZHMgCnJhdGhlciBpbnZhc2l2ZS4gU2VwYXJhdGlvbiBvZiBkaWZmZXJlbnQgY29uZmlnLXZl
cnNpb25zIHdvdWxkIGJlIHJlcXVpcmVkLgoKQ3phcmVrCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
