Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEB39997A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 18:44:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28271662;
	Thu, 22 Aug 2019 18:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28271662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566492283;
	bh=8AQ8vv9TN2cG3K3fzeFJxPARw0L+M0lyCBhC9cHUuKQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hskLTsbDfLcJqW60gNWQlMP971n3Lz9iQnXDQ26h2zZJebMAjGUye3t6cXv/BXZpA
	 2RG2J+ahCcIM2btYoZWB8UcrHtqQf8bcUN609Tlj7WvzxPazfE3/ARTwG2DPEymscd
	 kvyOiP+ZjZsBR6odQJQkpTx8HkQtEmgbY4HTq3x0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB02F8036E;
	Thu, 22 Aug 2019 18:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CF1BF8036E; Thu, 22 Aug 2019 18:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BBDCF800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 18:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BBDCF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 09:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="181443555"
Received: from aoho-mobl1.amr.corp.intel.com (HELO [10.252.135.9])
 ([10.252.135.9])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2019 09:42:46 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
 <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
Date: Thu, 22 Aug 2019 11:42:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
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

CgpPbiA4LzIyLzE5IDExOjA1IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0w
OC0yMiAxNzo1OCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDgvMjIv
MTkgNjozNiBBTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4gQXBhcnQgZnJvbSBIYXN3ZWxs
IG1hY2hpbmVzLCBhbGwgb3RoZXIgZGV2aWNlcyBoYXZlIHRoZWlyIHByaXZhdGUgZGF0YQo+Pj4g
c2V0IHRvIHNuZF9zb2NfYWNwaV9tYWNoIGluc3RhbmNlLgo+Pj4KPj4+IENoYW5nZXMgZm9yIEhT
Vy8gQkRXIGJvYXJkcyBpbnRyb2R1Y2VkIHdpdGggc2VyaWVzOgo+Pj4gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9jb3Zlci8xMDc4MjAzNS8KPj4+Cj4+PiBhZGRlZCBzdXBwb3J0IGZvciBk
YWlfbGluayBwbGF0Zm9ybV9uYW1lIGFkanVzdG1lbnRzIHdpdGhpbiBjYXJkIHByb2JlCj4+PiBy
b3V0aW5lcy4gVGhlc2UgdGFrZSBmb3IgZ3JhbnRlZCBwcml2YXRlX2RhdGEgcG9pbnRzIHRvCj4+
PiBzbmRfc29jX2FjcGlfbWFjaCB3aGVyZWFzIGZvciBIYXN3ZWxsLCBpdCdzIHNzdF9wZGF0YSBp
bnN0ZWFkLiBDaGFuZ2UKPj4+IHByaXZhdGUgY29udGV4dCBvZiBwbGF0Zm9ybV9kZXZpY2UgLSBy
ZXByZXNlbnRpbmcgbWFjaGluZSBib2FyZCAtIHRvCj4+PiBhZGRyZXNzIHRoaXMuCj4+Pgo+Pj4g
Rml4ZXM6IGU4NzA1NWQ3MzJlMyAoIkFTb0M6IEludGVsOiBoYXN3ZWxsOiBwbGF0Zm9ybSBuYW1l
IGZpeHVwIAo+Pj4gc3VwcG9ydCIpCj4+PiBGaXhlczogN2U0MGRkY2Y5NzRhICgiQVNvQzogSW50
ZWw6IGJkdy1ydDU2Nzc6IHBsYXRmb3JtIG5hbWUgZml4dXAgCj4+PiBzdXBwb3J0IikKPj4+IEZp
eGVzOiAyZDA2N2IyODA3ZjkgKCJBU29DOiBJbnRlbDogYnJvYWR3ZWxsOiBwbGF0Zm9ybSBuYW1l
IGZpeHVwIAo+Pj4gc3VwcG9ydCIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kg
PGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+Cj4+PiAtLS0KPj4+IMKgIHNvdW5kL3NvYy9pbnRl
bC9jb21tb24vc3N0LWFjcGkuYyB8IDMgKystCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9p
bnRlbC9jb21tb24vc3N0LWFjcGkuYyAKPj4+IGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3Qt
YWNwaS5jCj4+PiBpbmRleCAxNWYyYjI3ZTY0M2YuLmMzNGY2MjhjNzk4NyAxMDA2NDQKPj4+IC0t
LSBhL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWFjcGkuYwo+Pj4gKysrIGIvc291bmQvc29j
L2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+PiBAQCAtMTA5LDExICsxMDksMTIgQEAgaW50IHNz
dF9hY3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiDCoMKgwqDCoMKg
IH0KPj4+IMKgwqDCoMKgwqAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgc3N0X2FjcGkpOwo+
Pj4gK8KgwqDCoCBtYWNoLT5wZGF0YSA9IHNzdF9wZGF0YTsKPj4+IMKgwqDCoMKgwqAgLyogcmVn
aXN0ZXIgbWFjaGluZSBkcml2ZXIgKi8KPj4+IMKgwqDCoMKgwqAgc3N0X2FjcGktPnBkZXZfbWFj
aCA9Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEo
ZGV2LCBtYWNoLT5kcnZfbmFtZSwgLTEsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3N0X3BkYXRhLCBzaXplb2YoKnNzdF9wZGF0YSkpOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1h
Y2gsIHNpemVvZigqbWFjaCkpOwo+Pgo+PiBJIG5vdyBhZ3JlZSB0aGF0IHRoZSBjb2RlIEkgYWRk
ZWQgaXMgaW5jb3JyZWN0IGFuZCBwcm9iYWJseSBhY2Nlc3NlcyAKPj4gbWVtb3J5IG9mZnNldHMg
dGhhdCBhcmVuJ3QgcmlnaHQuIEkgaGF2ZSBhYnNvbHV0ZWx5IG5vIGlkZWEgd2h5IEkgCj4+IGFk
ZGVkIHRoaXMgY29tbWVudCB0aGF0ICdsZWdhY3kgZG9lcyBub3QgcGFzcyBwYXJhbWV0ZXJzJyB3
aGVuIGl0IG1vc3QgCj4+IGRlZmluaXRpdmVseSBkb2VzLiBHb29kIGNhdGNoIG9uIHlvdXIgc2lk
ZS4KPj4KPj4gVGhhdCBzYWlkLCBkb2Vzbid0IHRoZSBwcm9wb3NlZCBmaXggaW50cm9kdWNlIGFu
b3RoZXIgaXNzdWU/Cj4+Cj4+IEluIHRoZSBtYWNoaW5lIGRyaXZlcnMsIHlvdSBzdGlsbCBnZXQg
cGRhdGEgZGlyZWN0bHksIHNvIGFyZW4ndCB5b3UgCj4+IG1pc3NpbmcgYW4gaW5kaXJlY3Rpb24g
dG8gZ2V0IGJhY2sgdG8gcGRhdGEgZnJvbSBtYWNoPwo+Pgo+PiBzdGF0aWMgaW50IGJkd19ydDU2
NzdfcnRkX2luaXQoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCkKPj4gewo+PiDCoMKg
wqDCoMKgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPSBzbmRfc29jX3J0ZGNv
bV9sb29rdXAocnRkLCAKPj4gRFJWX05BTUUpOwo+PiDCoMKgwqDCoMKgc3RydWN0IHNzdF9wZGF0
YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGNvbXBvbmVudC0+ZGV2KTsKPj4gwqDCoMKgwqDC
oHN0cnVjdCBzc3RfaHN3ICpicm9hZHdlbGwgPSBwZGF0YS0+ZHNwOwo+Pgo+PiA8PDwgc28gaGVy
ZSB5b3UgdG9vayB0aGUgd3JvbmcgcG9pbnRlciwgbm8/Cj4gCj4gQm90aCBCYXl0cmFpbCBhbmQg
SGFzd2VsbCBhcmUgZW51bWVyYXRlZCBpbiBhIGJpdCBkaWZmZXJlbnQgZmFzaGlvbiB0aGFuIAo+
IFNLTCBlcXVpdmFsZW50cy4KPiAKPiBUaGVyZSBpcyBhbiBpbi1wbGFjZSByZWdpc3RyYXRpb24g
Zm9yIG1hY2hpbmUgZGV2aWNlIC0gd2hvc2UgCj4gcHJpdmF0ZV9kYXRhIGdldHMgdXNlZCBpbiBt
YWNoaW5lIHByb2JlIC0gYW5kIHBjbSBkZXZpY2Ugd2hpY2ggaGFwcGVucyAKPiBvbiBmaXJtd2Fy
ZSBsb2FkIGNhbGxiYWNrICgvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaTo2MykuIAo+
IF9ydGRfaW5pdCBtYWtlcyB1c2Ugb2YgdGhlIGxhdHRlciBvZiB0d28uCgpJIGRvbid0IGdldCB5
b3VyIGV4cGxhbmF0aW9ucy4gY2FuIHlvdSBlbGFib3JhdGUgb24gd2hhdCB0aGlzIGRvZXMgbm93
IAp0aGF0IHBkYXRhIGlzIG5vIGxvbmdlciBwYXNzZWQgYXMgYW4gYXJndW1lbnQgdG8gdGhlIG1h
Y2hpbmUgZHJpdmVyOgoKc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPSBzbmRf
c29jX3J0ZGNvbV9sb29rdXAocnRkLCBEUlZfTkFNRSk7CnN0cnVjdCBzc3RfcGRhdGEgKnBkYXRh
ID0gZGV2X2dldF9wbGF0ZGF0YShjb21wb25lbnQtPmRldik7Cgp0aGUgJ2NvbXBvbmVudCcgaGVy
ZSBpcyBub3QgdGhlIFBDTSBvbmUsIGlzIGl0PwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
