Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3516F0657
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 20:54:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D00616DB;
	Tue,  5 Nov 2019 20:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D00616DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572983690;
	bh=Of0NhPMiE+MCdAyN5+vcDU2utj/E+BKMze53T3AT7s0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JoeYgFUpF7aSHsNFBODgZq592n3GIAPc7gkpOKqjzLyLHzHEvKa3BDnog+Q9jBPDJ
	 mLi5RHlYEmJ2ggjRh2aWAN5/KbrdjiHrnjX0bwk7uH2hSpEeMimC0kFrGfg9ESiyU3
	 oUWqyg4xqVBIG4zNUFBngzEoj7Y8w3zNtLTR6zIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C39F8053B;
	Tue,  5 Nov 2019 20:53:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F20AF8049B; Tue,  5 Nov 2019 20:53:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C98C0F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 20:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C98C0F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 11:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="192214990"
Received: from asraut-mobl1.amr.corp.intel.com (HELO [10.251.136.18])
 ([10.251.136.18])
 by orsmga007.jf.intel.com with ESMTP; 05 Nov 2019 11:52:46 -0800
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2598c6a8-ce64-ad7e-ee34-8ea930b3cf7d@linux.intel.com>
Date: Tue, 5 Nov 2019 13:52:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

CgpPbiAxMS81LzE5IDE6MzYgUE0sIEphcm9zbGF2IEt5c2VsYSB3cm90ZToKPiBIaSBhbGwsCj4g
Cj4gIMKgwqDCoMKgSSBtYWtlIHNvbWUgaW50ZXJuYWwgdWNtIGNvZGUgY2xlYW51cHMgaW4gYWxz
YS1saWIgYW5kIGFkZGVkIHRocmVlIAo+IG1ham9yIGV4dGVuc2lvbnMgdG8gYWxsb3cgbW9yZSBj
b21wbGV4IGNvbmZpZ3VyYXRpb25zIHdoaWNoIHdlIHJlcXVpcmUgCj4gZm9yIHRoZSBTT0Yga2Vy
bmVsIGRyaXZlci4KCkdyZWF0LCB0aGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcyEKCj4gCj4gIMKg
wqDCoMKgVGhlIGZpcnN0IHRoaW5nIGlzIHRoZSBhZGRlZCBzdWJzdGl0dXRpb24gZm9yIHRoZSB2
YWx1ZSBzdHJpbmdzOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1s
aWIvY29tbWl0L2YxZTYzN2IyODVlOGUwNGU2NzYxMjQ4YTA3MGY1OGYzYThmZGU2ZmMgCj4gCj4g
Cj4gIMKgwqDCoMKgVGhlIHNlY29uZCB0aGluZyBpcyB0aGUgSWYgYmxvY2s6Cj4gCj4gaHR0cHM6
Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9jb21taXQvOTg1NzE1Y2U4MTQ4ZGM3
ZWY2MmM4ZTNkOGNlNWEwYzJhYzUxZjhkZiAKCmlzIGl0IHBvc3NpYmxlIGZvciB0aGUgQ29uZGl0
aW9uIHRvIGNoZWNrIGlmIHRoZSBjYXJkIGNvbnRhaW5zIHRoZSBTT0YgCnByZWZpeD8KCkZvciBC
YXl0cmFpbC9DaGVycnl0cmFpbCBzdXBwb3J0LCB3ZSBoYXZlIGEgdG9uIG9mIGV4aXN0aW5nIFVD
TSBmaWxlcywgCmFuZCB0aGUgb25seSB0aGluZyBuZWVkZWQgaXMgZS5nLgotIHRvIGNoYW5nZSBm
cm9tIGh3OmJ5dGNycnQ1NjQwIHRvIGh3OnNvZmJ5dGNydDU2NDAKLSBtYWtlIHRoZSBjb250cm9s
cyBmb3IgdGhlIGxlZ2FjeSBkcml2ZXIgY29uZGl0aW9uYWwKClNlY3Rpb25WZXJiIHsKCUVuYWJs
ZVNlcXVlbmNlIFsKCQkKCQlpZiAoY2FyZCBuYW1lIGRvZXMgbm90IGNvbnRhaW4gU09GKQoJCTxw
bGF0Zm9ybXMvYnl0Y3IvUGxhdGZvcm1FbmFibGVTZXEuY29uZj4KCQllbmRpZgoJCTxjb2RlY3Mv
cnQ1NjQwL0VuYWJsZVNlcS5jb25mPgoJXQoKTW9zdCBvZiB0aGUgaW5mb3JtYXRpb24gdGhhdCBt
YXR0ZXJzIGZvciB0aG9zZSBVQ00gZmlsZXMgaXMgdGhlIHR5cGUgb2YgCnBlcmlwaGVyYWxzIGFu
ZCB0aGUgbWF0Y2hpbmcgbWl4ZXIgY29uZmlndXJhdGlvbiBmb3IgdGhlIGNvZGVjIGRyaXZlciwg
CmFuZCB3ZSBzaG91bGQgcmV1c2UgdGhpcyBpbmZvcm1hdGlvbiBiZXR3ZWVuIGxlZ2FjeSBhbmQg
U09GLgoKPiAKPiAgwqDCoMKgwqBUaGUgdGhpcmQgdGhpbmcgaXMgdGhlIGNhcmQgLyBoYXJkd2Fy
ZSBsaWtlIHNwZWNpZmllciBwYXNzZWQgYXMgdGhlIAo+IHVjbSBuYW1lIHRvIHNuZF91c2VfY2Fz
ZV9tZ3Jfb3BlbigpIHRvIHN1cHBvcnQgbXVsdGlwbGUgY2FyZCBpbnN0YW5jZXM6Cj4gCj4gaHR0
cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9jb21taXQvNjAxNjRmYzU4ODZj
ZGM2Y2E1NWVlZWQwYzJlM2Y3NTFhN2QyYjJjMCAKPiAKPiAKPiAgwqDCoMKgwqBBbGwgdGhvc2Ug
cGF0Y2hlcyAod2l0aCBvdGhlciBjbGVhbnVwcykgYXJlIGluIHRoZSB1Y20yIGJyYW5jaCBvbiAK
PiBnaXRodWIgZm9yIGNvbW1lbnRzOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2pl
Y3QvYWxzYS1saWIvY29tbWl0cy91Y20yCj4gCj4gIMKgwqDCoMKgVGhlIHByb3Bvc2VkIFNPRiBV
Q00gY29uZmlnIGRpZmYgaXMgaGVyZToKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9q
ZWN0L2Fsc2EtdWNtLWNvbmYvY29tbWl0LzcyM2I2ZGE4ODE3MjE0ODgyMjkxNTRlOTIzZWQzNjQx
Mzk1NWEwNTEgCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1j
b25mL2NvbW1pdHMvdWNtMgo+IAo+ICDCoMKgwqDCoEkgYWRkZWQgZXZlcnl0aGluZyB0byBrZWVw
IHRoZSBpbnRlcmZhY2UgYmFja3dhcmQgY29tcGF0aWJsZSwgc28gCj4gdGhlIGN1cnJlbnQgYXBw
bGljYXRpb25zIHNob3VsZCBub3Qgb2JzZXJ2ZSBhbnkgZGlmZmVyZW50IGJlaGF2aW9yLiBUaGUg
Cj4gYXBwbGljYXRpb25zIGxpa2UgcHVsc2VhdWRpbyBzaG91bGQgdXNlIHRoZSAnaHc6Q0FSRF9J
TkRFWCcgc3BlY2lmaWVyIAo+IGZvciB0aGUgb3BlbiBjYWxsIGluIHRoZSBmdXR1cmUgYW5kIHNu
ZF91c2VfY2FzZV9wYXJzZV9jdGxfZWxlbV9pZCgpIAo+IGhlbHBlciBmb3IgdGhlIGVsZW1lbnQg
Y29udHJvbCBuYW1lcy4KPiAKPiAgwqDCoMKgwqBJZiB5b3UgaGF2ZSBhbm90aGVyIGlkZWFzIHRv
IGFkZHJlc3MgdGhvc2UgaXNzdWVzLCBwbGVhc2UsIGxldCBtZSAKPiBrbm93Lgo+IAo+ICDCoMKg
wqDCoEJUVywgTWFyazogVGhlIFNPRiBVQ00gY29uZmlncyByZWxpZXMgb24gdGhlIGRyaXZlciBu
YW1lIGNoYW5nZXMsIAo+IHNvIGl0IG1pZ2h0IGJlIHdvcnRoIHRvIHNlbmQgIkFTb0M6IGludGVs
IC0gZml4IHRoZSBjYXJkIG5hbWVzIiBwYXRjaCB0byAKPiA1LjQgdG8gbWFrZSB0aGluZ3Mgc3Rh
YmxlIG1vcmUgcXVpY2tseToKPiAKPiAgwqDCoMKgwqBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NvdW5kLmdpdC9jb21taXQvP2g9Zm9yLTUu
NSZpZD1kNzQ1Y2MxYWI2NTk0NWIyZDE3ZWM5YzU2NTJmMzgyOTljMDU0NjQ5Cj4gCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGFua3MsCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEphcm9zbGF2Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
