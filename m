Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7500998C6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 18:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B911616;
	Thu, 22 Aug 2019 18:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B911616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566490050;
	bh=PlkZynDVYO4AdlfPgHMfEHqRrdm/l2xTYThI/8rl4dk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l09BU2s+cGKQWpkcbkLiBh8Fs5aCg0C4JcZT/hfS73U5At+dsHId962KAf2jvEZCh
	 Wx97jStVOZrWptfaXQ40TwN8db7hlxU+s6d2kcet9r+pomeRyT8vs4AILWpCv5zAUW
	 02YIsEK/Pq1YhjktycygEu7yJHRuY8smoFXjGmI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA24F80391;
	Thu, 22 Aug 2019 18:05:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68CFCF8036E; Thu, 22 Aug 2019 18:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83946F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 18:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83946F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 09:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="180428307"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.2.209])
 ([10.252.2.209])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2019 09:05:30 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
Date: Thu, 22 Aug 2019 18:05:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: Haswell: Adjust machine
 device private context
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

T24gMjAxOS0wOC0yMiAxNzo1OCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMi8xOSA2OjM2IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IEFwYXJ0IGZyb20g
SGFzd2VsbCBtYWNoaW5lcywgYWxsIG90aGVyIGRldmljZXMgaGF2ZSB0aGVpciBwcml2YXRlIGRh
dGEKPj4gc2V0IHRvIHNuZF9zb2NfYWNwaV9tYWNoIGluc3RhbmNlLgo+Pgo+PiBDaGFuZ2VzIGZv
ciBIU1cvIEJEVyBib2FyZHMgaW50cm9kdWNlZCB3aXRoIHNlcmllczoKPj4gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDc4MjAzNS8KPj4KPj4gYWRkZWQgc3VwcG9ydCBmb3Ig
ZGFpX2xpbmsgcGxhdGZvcm1fbmFtZSBhZGp1c3RtZW50cyB3aXRoaW4gY2FyZCBwcm9iZQo+PiBy
b3V0aW5lcy4gVGhlc2UgdGFrZSBmb3IgZ3JhbnRlZCBwcml2YXRlX2RhdGEgcG9pbnRzIHRvCj4+
IHNuZF9zb2NfYWNwaV9tYWNoIHdoZXJlYXMgZm9yIEhhc3dlbGwsIGl0J3Mgc3N0X3BkYXRhIGlu
c3RlYWQuIENoYW5nZQo+PiBwcml2YXRlIGNvbnRleHQgb2YgcGxhdGZvcm1fZGV2aWNlIC0gcmVw
cmVzZW50aW5nIG1hY2hpbmUgYm9hcmQgLSB0bwo+PiBhZGRyZXNzIHRoaXMuCj4+Cj4+IEZpeGVz
OiBlODcwNTVkNzMyZTMgKCJBU29DOiBJbnRlbDogaGFzd2VsbDogcGxhdGZvcm0gbmFtZSBmaXh1
cCBzdXBwb3J0IikKPj4gRml4ZXM6IDdlNDBkZGNmOTc0YSAoIkFTb0M6IEludGVsOiBiZHctcnQ1
Njc3OiBwbGF0Zm9ybSBuYW1lIGZpeHVwIAo+PiBzdXBwb3J0IikKPj4gRml4ZXM6IDJkMDY3YjI4
MDdmOSAoIkFTb0M6IEludGVsOiBicm9hZHdlbGw6IHBsYXRmb3JtIG5hbWUgZml4dXAgCj4+IHN1
cHBvcnQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3Nr
aUBpbnRlbC5jb20+Cj4+IC0tLQo+PiDCoCBzb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3Bp
LmMgfCAzICsrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3Bp
LmMgCj4+IGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+IGluZGV4IDE1ZjJi
MjdlNjQzZi4uYzM0ZjYyOGM3OTg3IDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvY29t
bW9uL3NzdC1hY3BpLmMKPj4gKysrIGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5j
Cj4+IEBAIC0xMDksMTEgKzEwOSwxMiBAQCBpbnQgc3N0X2FjcGlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgc3N0X2FjcGkpOwo+PiArwqDCoMKgIG1hY2gtPnBkYXRhID0gc3N0
X3BkYXRhOwo+PiDCoMKgwqDCoMKgIC8qIHJlZ2lzdGVyIG1hY2hpbmUgZHJpdmVyICovCj4+IMKg
wqDCoMKgwqAgc3N0X2FjcGktPnBkZXZfbWFjaCA9Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwbGF0
Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0YShkZXYsIG1hY2gtPmRydl9uYW1lLCAtMSwKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNzdF9wZGF0
YSwgc2l6ZW9mKCpzc3RfcGRhdGEpKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hY2gsIHNpemVvZigqbWFjaCkpOwo+IAo+IEkgbm93IGFn
cmVlIHRoYXQgdGhlIGNvZGUgSSBhZGRlZCBpcyBpbmNvcnJlY3QgYW5kIHByb2JhYmx5IGFjY2Vz
c2VzIAo+IG1lbW9yeSBvZmZzZXRzIHRoYXQgYXJlbid0IHJpZ2h0LiBJIGhhdmUgYWJzb2x1dGVs
eSBubyBpZGVhIHdoeSBJIGFkZGVkIAo+IHRoaXMgY29tbWVudCB0aGF0ICdsZWdhY3kgZG9lcyBu
b3QgcGFzcyBwYXJhbWV0ZXJzJyB3aGVuIGl0IG1vc3QgCj4gZGVmaW5pdGl2ZWx5IGRvZXMuIEdv
b2QgY2F0Y2ggb24geW91ciBzaWRlLgo+IAo+IFRoYXQgc2FpZCwgZG9lc24ndCB0aGUgcHJvcG9z
ZWQgZml4IGludHJvZHVjZSBhbm90aGVyIGlzc3VlPwo+IAo+IEluIHRoZSBtYWNoaW5lIGRyaXZl
cnMsIHlvdSBzdGlsbCBnZXQgcGRhdGEgZGlyZWN0bHksIHNvIGFyZW4ndCB5b3UgCj4gbWlzc2lu
ZyBhbiBpbmRpcmVjdGlvbiB0byBnZXQgYmFjayB0byBwZGF0YSBmcm9tIG1hY2g/Cj4gCj4gc3Rh
dGljIGludCBiZHdfcnQ1Njc3X3J0ZF9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpy
dGQpCj4gewo+ICDCoMKgwqDCoHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0g
c25kX3NvY19ydGRjb21fbG9va3VwKHJ0ZCwgCj4gRFJWX05BTUUpOwo+ICDCoMKgwqDCoHN0cnVj
dCBzc3RfcGRhdGEgKnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0YShjb21wb25lbnQtPmRldik7Cj4g
IMKgwqDCoMKgc3RydWN0IHNzdF9oc3cgKmJyb2Fkd2VsbCA9IHBkYXRhLT5kc3A7Cj4gCj4gPDw8
IHNvIGhlcmUgeW91IHRvb2sgdGhlIHdyb25nIHBvaW50ZXIsIG5vPwoKQm90aCBCYXl0cmFpbCBh
bmQgSGFzd2VsbCBhcmUgZW51bWVyYXRlZCBpbiBhIGJpdCBkaWZmZXJlbnQgZmFzaGlvbiB0aGFu
IApTS0wgZXF1aXZhbGVudHMuCgpUaGVyZSBpcyBhbiBpbi1wbGFjZSByZWdpc3RyYXRpb24gZm9y
IG1hY2hpbmUgZGV2aWNlIC0gd2hvc2UgCnByaXZhdGVfZGF0YSBnZXRzIHVzZWQgaW4gbWFjaGlu
ZSBwcm9iZSAtIGFuZCBwY20gZGV2aWNlIHdoaWNoIGhhcHBlbnMgCm9uIGZpcm13YXJlIGxvYWQg
Y2FsbGJhY2sgKC9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3BpOjYzKS4gCl9ydGRfaW5p
dCBtYWtlcyB1c2Ugb2YgdGhlIGxhdHRlciBvZiB0d28uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
