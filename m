Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230F9604B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 15:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F39166E;
	Tue, 20 Aug 2019 15:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F39166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566308421;
	bh=/lVqBuSRV0z7DNmUGqtmFvZyrxlOweWkuO7wVdZ7zSc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CM4q/EmG4xy3KxTOWzonSrBtp+DKusFwHQoHQJHphoaTLfyLK6Xi8/Erp07+tmZs6
	 1yv8jQ/y+osOrbw1sPZMMvdMM8odP24mgh3h5UJAuTW0X/ZSiA+VBn6s/OAWXmy5kk
	 PyTtYcx56e03RMZyGUNmcYvDa1wCf8XiaYNr26Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE610F802E0;
	Tue, 20 Aug 2019 15:38:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E2B5F8036E; Tue, 20 Aug 2019 15:38:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45294F800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 15:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45294F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 06:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="189868688"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga002.jf.intel.com with ESMTP; 20 Aug 2019 06:38:27 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
 <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
 <27f25fb3-1d50-2b60-3e3b-da61eef1f6ad@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <1bbf24d4-c6cb-00ee-ffbe-18da53d1f942@intel.com>
Date: Tue, 20 Aug 2019 15:38:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27f25fb3-1d50-2b60-3e3b-da61eef1f6ad@linux.intel.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 09/25] ASoC: soc-core: tidyup for
 snd_soc_dapm_add_routes()
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

T24gMjAxOS0wOC0yMCAxNDozNiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMC8xOSA2OjE4IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IE9uIDIwMTktMDgt
MDcgMDM6MzEsIEt1bmlub3JpIE1vcmltb3RvIHdyb3RlOgo+Pj4KPj4+IEZyb206IEt1bmlub3Jp
IE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KPj4+Cj4+PiBzbmRf
c29jX2RhcG1fYWRkX3JvdXRlcygpIHJlZ2lzdGVycyByb3V0ZXMgYnkgdXNpbmcKPj4+IGZvcigu
Li4gaSA8IG51bTsgLi4uKS4gSWYgcm91dGVzIHdhcyBOVUxMLCBudW0gc2hvdWxkIGJlIHplcm8u
Cj4+PiBUaHVzLCB3ZSBkb24ndCBuZWVkIHRvIGNoZWNrIGFib3V0IHJvdXRlIHBvaW50ZXIuCj4+
PiBUaGlzIHBhdGNoIGFsc28gY2FyZXMgbWlzc2luZyByZXR1cm4gdmFsdWUuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVz
YXMuY29tPgo+Pj4gLS0tCj4+PiB2MSAtPiB2Mgo+Pj4KPj4+IMKgwqDCoMKgLSBjaGVjayByZXR1
cm4gdmFsdWUKPj4+IMKgwqDCoMKgLSBjaGFuZ2UgU3ViamVjdAo+Pj4KPj4+IMKgIHNvdW5kL3Nv
Yy9zb2MtY29yZS5jIHwgMjMgKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvc291bmQvc29jL3NvYy1jb3JlLmMgYi9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+Pj4gaW5k
ZXggMjFjZGQzYy4uY2ExYjA0YyAxMDA2NDQKPj4+IC0tLSBhL3NvdW5kL3NvYy9zb2MtY29yZS5j
Cj4+PiArKysgYi9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+Pj4gQEAgLTEzMTAsMTAgKzEzMTAsMTEg
QEAgc3RhdGljIGludCBzb2NfcHJvYmVfY29tcG9uZW50KHN0cnVjdCAKPj4+IHNuZF9zb2NfY2Fy
ZCAqY2FyZCwKPj4+IMKgwqDCoMKgwqAgaWYgKHJldCA8IDApCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byBlcnJfcHJvYmU7Cj4+PiAtwqDCoMKgIGlmIChjb21wb25lbnQtPmRyaXZlci0+ZGFw
bV9yb3V0ZXMpCj4+PiAtwqDCoMKgwqDCoMKgwqAgc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMoZGFw
bSwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wb25lbnQt
PmRyaXZlci0+ZGFwbV9yb3V0ZXMsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29tcG9uZW50LT5kcml2ZXItPm51bV9kYXBtX3JvdXRlcyk7Cj4+PiArwqDCoMKg
IHJldCA9IHNuZF9zb2NfZGFwbV9hZGRfcm91dGVzKGRhcG0sCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvbmVudC0+ZHJpdmVyLT5kYXBtX3JvdXRl
cywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcG9u
ZW50LT5kcml2ZXItPm51bV9kYXBtX3JvdXRlcyk7Cj4+PiArwqDCoMKgIGlmIChyZXQgPCAwKQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX3Byb2JlOwo+Pj4gwqDCoMKgwqDCoCBsaXN0X2Fk
ZCgmZGFwbS0+bGlzdCwgJmNhcmQtPmRhcG1fbGlzdCk7Cj4+PiDCoMKgwqDCoMKgIC8qIHNlZSBm
b3JfZWFjaF9jYXJkX2NvbXBvbmVudHMgKi8KPj4+IEBAIC0yMDYwLDEzICsyMDYxLDE1IEBAIHN0
YXRpYyBpbnQgc25kX3NvY19pbnN0YW50aWF0ZV9jYXJkKHN0cnVjdCAKPj4+IHNuZF9zb2NfY2Fy
ZCAqY2FyZCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzbmRfc29jX2FkZF9jYXJkX2NvbnRyb2xz
KGNhcmQsIGNhcmQtPmNvbnRyb2xzLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjYXJkLT5udW1fY29udHJvbHMpOwo+Pj4gLcKgwqDCoCBpZiAoY2Fy
ZC0+ZGFwbV9yb3V0ZXMpCj4+PiAtwqDCoMKgwqDCoMKgwqAgc25kX3NvY19kYXBtX2FkZF9yb3V0
ZXMoJmNhcmQtPmRhcG0sIGNhcmQtPmRhcG1fcm91dGVzLAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhcmQtPm51bV9kYXBtX3JvdXRlcyk7Cj4+PiArwqDCoMKg
IHJldCA9IHNuZF9zb2NfZGFwbV9hZGRfcm91dGVzKCZjYXJkLT5kYXBtLCBjYXJkLT5kYXBtX3Jv
dXRlcywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2Fy
ZC0+bnVtX2RhcG1fcm91dGVzKTsKPj4+ICvCoMKgwqAgaWYgKHJldCA8IDApCj4+PiArwqDCoMKg
wqDCoMKgwqAgZ290byBwcm9iZV9lbmQ7Cj4+PiAtwqDCoMKgIGlmIChjYXJkLT5vZl9kYXBtX3Jv
dXRlcykKPj4+IC3CoMKgwqDCoMKgwqDCoCBzbmRfc29jX2RhcG1fYWRkX3JvdXRlcygmY2FyZC0+
ZGFwbSwgY2FyZC0+b2ZfZGFwbV9yb3V0ZXMsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2FyZC0+bnVtX29mX2RhcG1fcm91dGVzKTsKPj4+ICvCoMKgwqAgcmV0
ID0gc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMoJmNhcmQtPmRhcG0sIGNhcmQtPm9mX2RhcG1fcm91
dGVzLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXJk
LT5udW1fb2ZfZGFwbV9yb3V0ZXMpOwo+Pj4gK8KgwqDCoCBpZiAocmV0IDwgMCkKPj4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIHByb2JlX2VuZDsKPj4+IMKgwqDCoMKgwqAgLyogdHJ5IHRvIHNldCBz
b21lIHNhbmUgbG9uZ25hbWUgaWYgRE1JIGlzIGF2YWlsYWJsZSAqLwo+Pj4gwqDCoMKgwqDCoCBz
bmRfc29jX3NldF9kbWlfbmFtZShjYXJkLCBOVUxMKTsKPj4+Cj4+Cj4+IEhlbGxvIHRoZXJlLAo+
Pgo+PiBJJ3ZlIHJ1biBhIHZhbGlkYXRpb24gY3ljbGUgb24gcmVjZW50IGJyb29uaWUvZm9yLW5l
eHQgYW5kIHRoaXMgY29tbWl0IAo+PiBjYXVzZWQgcmVncmVzc2lvbi4gSG93ZXZlciwgaXQgbWF5
IGJlIHNpbXBseSBhbiBlcnJvciBvbiBib2FyZCBzaWRlIAo+PiBpbnN0ZWFkLgo+Pgo+PiBQcmV2
aW91c2x5LCByZXQgZnJvbSBzbmRfc29jX2RhcG1fYWRkX3JvdXRlcyBoYXMgYmVlbiBpZ25vcmVk
IHRodXMgaXQgCj4+IHdhcyBwZXJtaXNzaXZlIGZvciBhZGRpdGlvbiBvZiBzZXZlcmFsIHJvdXRl
cyB0byBmYWlsLiBBcyBsb25nIGFzIHNvbWUgCj4+IHJvdXRlcyBzdWNjZWVkZWQsIGNhcmQgd2Fz
IHdvcmtpbmcganVzdCBmaW5lLiBOb3cgaXQncyBubyBsb25nZXIgdGhlIAo+PiBjYXNlIC0gYmVo
YXZpb3Igb2YgdGhlIGNhcmQgaW5pdGlhbGl6YXRpb24gaGFzIGNoYW5nZWQ6IGl0IGlzIHJlcXVp
cmVkIAo+PiBmb3IgQUxMIHJvdXRlcyB0byBzdWNjZWVkIGJlZm9yZSBjYXJkIGNhbiBiZSBmdWxs
eSBpbnN0YW50aWF0ZWQuCj4+Cj4+IE11c3Qgc2F5IGNvbGxhcHNpbmcgc25kX3NvY19pbnN0YW50
aWF0ZV9jYXJkIGlzIGEgd29uZGVyZnVsIHdheSB0byAKPj4gdGVzdCB5b3VyIGNhcmQncyByZW1v
dmFsIGZsb3cgKHNvY19fY2xlYW51cF9jYXJkX3Jlc291cmNlcyBhbmQgZnJpZW5kcykuLgo+Pgo+
PiBRdWVzdGlvbiBpcyBzaW1wbGU6IGFyZSB3ZSBzdGF5aW5nIHdpdGggYWxsLWZvci1vbmUvIG9u
ZS1mb3ItYWxsIAo+PiBhcHByb2FjaCBvciB3ZSByZXZlcnRpbmcgdG8gcGVybWlzc2l2ZSBiZWhh
dmlvcj8KPiAKPiBDYW4geW91IGVsYWJvcmF0ZSBpbiB3aGljaCB0ZXN0IGNhc2UgdGhpcyBwYXRj
aCBjcmVhdGVzIGEgcHJvYmxlbT8gSnVzdCAKPiBjdXJpb3VzIHdoeSB0aGUgcm91dGUgYWRkaXRp
b24gZmFpbHMgaW4gdGhlIGZpcnN0IHBsYWNlLgoKSWYgc25kX3NvY19pbnN0YW50aWF0ZV9jYXJk
IGZhaWxzIHNvIGRvZXMgYW55IHRlc3QsIHJlYWxseS4gUmVkIHdhbGwgd2FzIAplYXN5IHRvIHNw
b3QgZXZlbiBmb3IgYSBodW5ncnkgZGV2ZWxvcGVyIDogKQoKT3VyIGNubF9ydDI3NCBib2FyZCBk
ZWNsYXJlcyBzZXZlcmFsIHJvdXRlcywgeWV0IG91ciB0b3BvbG9neSBkb2VzIG5vdCAKcHJvdmlk
ZSBuZWNlc3NhcnkgaW5mbyBmb3IgYWxsIG9mIHRoZW0uIEFuZCB0aHVzLCBhZGRpdGlvbiBvZiBz
b21lIApyb3V0ZXMgZmFpbHMuIFRoaXMgd2FzIGZpbmUgdGlsbCBub3cuIFRoYXQncyBhbHNvIHdo
eSBJJ2QgbWVudGlvbmVkIGluIAp0aGUgdmVyeSBmaXJzdCBzZW50ZW5jZTogaXQgbWlnaHQgYmUg
c2ltcGx5IGEgYm9hcmQgaXNzdWUuIE1heWJlIHdlIApzaG91bGQgaGF2ZSBuZXZlciBhYnVzZWQg
cGVybWlzc2l2ZSBiZWhhdmlvciBpbiB0aGUgZmlyc3QgcGxhY2UuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
