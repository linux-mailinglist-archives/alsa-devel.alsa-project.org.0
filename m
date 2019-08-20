Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A995EEA
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 14:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14871675;
	Tue, 20 Aug 2019 14:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14871675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566304680;
	bh=Yu5/Ya9CSiMfPOhYOw1V/k8GjJLHOw4G5OoybtJVvHg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O51HLk5fx7WdwYMCU6tTnvAhczNAuYxAN8s+U2kXPgCtC2NBt5CUBOAEL/YecWMip
	 FT8q1izRzpA1kN80Z/olibSpb7RKrszwTY6gCKEFXFfmnFj/J5AdXOOkvED1uBbZaD
	 cdn4grPeM7XUm7DUSooHzjOdixEfI2paQJ+mauAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F80F805E1;
	Tue, 20 Aug 2019 14:36:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4510F805A1; Tue, 20 Aug 2019 14:36:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F48F8036D
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 14:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F48F8036D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 05:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="329695859"
Received: from jlisowie-mobl.ger.corp.intel.com (HELO [10.251.134.21])
 ([10.251.134.21])
 by orsmga004.jf.intel.com with ESMTP; 20 Aug 2019 05:36:03 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
 <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27f25fb3-1d50-2b60-3e3b-da61eef1f6ad@linux.intel.com>
Date: Tue, 20 Aug 2019 07:36:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
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

CgpPbiA4LzIwLzE5IDY6MTggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTA3IDAzOjMxLCBLdW5pbm9yaSBNb3JpbW90byB3cm90ZToKPj4KPj4gRnJvbTogS3VuaW5vcmkg
TW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+Pgo+PiBzbmRfc29j
X2RhcG1fYWRkX3JvdXRlcygpIHJlZ2lzdGVycyByb3V0ZXMgYnkgdXNpbmcKPj4gZm9yKC4uLiBp
IDwgbnVtOyAuLi4pLiBJZiByb3V0ZXMgd2FzIE5VTEwsIG51bSBzaG91bGQgYmUgemVyby4KPj4g
VGh1cywgd2UgZG9uJ3QgbmVlZCB0byBjaGVjayBhYm91dCByb3V0ZSBwb2ludGVyLgo+PiBUaGlz
IHBhdGNoIGFsc28gY2FyZXMgbWlzc2luZyByZXR1cm4gdmFsdWUuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4K
Pj4gLS0tCj4+IHYxIC0+IHYyCj4+Cj4+IMKgwqDCoMKgLSBjaGVjayByZXR1cm4gdmFsdWUKPj4g
wqDCoMKgwqAtIGNoYW5nZSBTdWJqZWN0Cj4+Cj4+IMKgIHNvdW5kL3NvYy9zb2MtY29yZS5jIHwg
MjMgKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3Nv
Yy1jb3JlLmMgYi9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+PiBpbmRleCAyMWNkZDNjLi5jYTFiMDRj
IDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+PiArKysgYi9zb3VuZC9zb2Mv
c29jLWNvcmUuYwo+PiBAQCAtMTMxMCwxMCArMTMxMCwxMSBAQCBzdGF0aWMgaW50IHNvY19wcm9i
ZV9jb21wb25lbnQoc3RydWN0IAo+PiBzbmRfc29jX2NhcmQgKmNhcmQsCj4+IMKgwqDCoMKgwqAg
aWYgKHJldCA8IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9wcm9iZTsKPj4gLcKg
wqDCoCBpZiAoY29tcG9uZW50LT5kcml2ZXItPmRhcG1fcm91dGVzKQo+PiAtwqDCoMKgwqDCoMKg
wqAgc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMoZGFwbSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvbmVudC0+ZHJpdmVyLT5kYXBtX3JvdXRlcywKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvbmVudC0+ZHJpdmVyLT5u
dW1fZGFwbV9yb3V0ZXMpOwo+PiArwqDCoMKgIHJldCA9IHNuZF9zb2NfZGFwbV9hZGRfcm91dGVz
KGRhcG0sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29t
cG9uZW50LT5kcml2ZXItPmRhcG1fcm91dGVzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvbmVudC0+ZHJpdmVyLT5udW1fZGFwbV9yb3V0ZXMpOwo+
PiArwqDCoMKgIGlmIChyZXQgPCAwKQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfcHJvYmU7
Cj4+IMKgwqDCoMKgwqAgbGlzdF9hZGQoJmRhcG0tPmxpc3QsICZjYXJkLT5kYXBtX2xpc3QpOwo+
PiDCoMKgwqDCoMKgIC8qIHNlZSBmb3JfZWFjaF9jYXJkX2NvbXBvbmVudHMgKi8KPj4gQEAgLTIw
NjAsMTMgKzIwNjEsMTUgQEAgc3RhdGljIGludCBzbmRfc29jX2luc3RhbnRpYXRlX2NhcmQoc3Ry
dWN0IAo+PiBzbmRfc29jX2NhcmQgKmNhcmQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzbmRfc29j
X2FkZF9jYXJkX2NvbnRyb2xzKGNhcmQsIGNhcmQtPmNvbnRyb2xzLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhcmQtPm51bV9jb250cm9scyk7Cj4+
IC3CoMKgwqAgaWYgKGNhcmQtPmRhcG1fcm91dGVzKQo+PiAtwqDCoMKgwqDCoMKgwqAgc25kX3Nv
Y19kYXBtX2FkZF9yb3V0ZXMoJmNhcmQtPmRhcG0sIGNhcmQtPmRhcG1fcm91dGVzLAo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FyZC0+bnVtX2RhcG1fcm91dGVz
KTsKPj4gK8KgwqDCoCByZXQgPSBzbmRfc29jX2RhcG1fYWRkX3JvdXRlcygmY2FyZC0+ZGFwbSwg
Y2FyZC0+ZGFwbV9yb3V0ZXMsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY2FyZC0+bnVtX2RhcG1fcm91dGVzKTsKPj4gK8KgwqDCoCBpZiAocmV0IDwgMCkK
Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gcHJvYmVfZW5kOwo+PiAtwqDCoMKgIGlmIChjYXJkLT5v
Zl9kYXBtX3JvdXRlcykKPj4gLcKgwqDCoMKgwqDCoMKgIHNuZF9zb2NfZGFwbV9hZGRfcm91dGVz
KCZjYXJkLT5kYXBtLCBjYXJkLT5vZl9kYXBtX3JvdXRlcywKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhcmQtPm51bV9vZl9kYXBtX3JvdXRlcyk7Cj4+ICvCoMKg
wqAgcmV0ID0gc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMoJmNhcmQtPmRhcG0sIGNhcmQtPm9mX2Rh
cG1fcm91dGVzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNhcmQtPm51bV9vZl9kYXBtX3JvdXRlcyk7Cj4+ICvCoMKgwqAgaWYgKHJldCA8IDApCj4+ICvC
oMKgwqDCoMKgwqDCoCBnb3RvIHByb2JlX2VuZDsKPj4gwqDCoMKgwqDCoCAvKiB0cnkgdG8gc2V0
IHNvbWUgc2FuZSBsb25nbmFtZSBpZiBETUkgaXMgYXZhaWxhYmxlICovCj4+IMKgwqDCoMKgwqAg
c25kX3NvY19zZXRfZG1pX25hbWUoY2FyZCwgTlVMTCk7Cj4+Cj4gCj4gSGVsbG8gdGhlcmUsCj4g
Cj4gSSd2ZSBydW4gYSB2YWxpZGF0aW9uIGN5Y2xlIG9uIHJlY2VudCBicm9vbmllL2Zvci1uZXh0
IGFuZCB0aGlzIGNvbW1pdCAKPiBjYXVzZWQgcmVncmVzc2lvbi4gSG93ZXZlciwgaXQgbWF5IGJl
IHNpbXBseSBhbiBlcnJvciBvbiBib2FyZCBzaWRlIAo+IGluc3RlYWQuCj4gCj4gUHJldmlvdXNs
eSwgcmV0IGZyb20gc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMgaGFzIGJlZW4gaWdub3JlZCB0aHVz
IGl0IAo+IHdhcyBwZXJtaXNzaXZlIGZvciBhZGRpdGlvbiBvZiBzZXZlcmFsIHJvdXRlcyB0byBm
YWlsLiBBcyBsb25nIGFzIHNvbWUgCj4gcm91dGVzIHN1Y2NlZWRlZCwgY2FyZCB3YXMgd29ya2lu
ZyBqdXN0IGZpbmUuIE5vdyBpdCdzIG5vIGxvbmdlciB0aGUgCj4gY2FzZSAtIGJlaGF2aW9yIG9m
IHRoZSBjYXJkIGluaXRpYWxpemF0aW9uIGhhcyBjaGFuZ2VkOiBpdCBpcyByZXF1aXJlZCAKPiBm
b3IgQUxMIHJvdXRlcyB0byBzdWNjZWVkIGJlZm9yZSBjYXJkIGNhbiBiZSBmdWxseSBpbnN0YW50
aWF0ZWQuCj4gCj4gTXVzdCBzYXkgY29sbGFwc2luZyBzbmRfc29jX2luc3RhbnRpYXRlX2NhcmQg
aXMgYSB3b25kZXJmdWwgd2F5IHRvIHRlc3QgCj4geW91ciBjYXJkJ3MgcmVtb3ZhbCBmbG93IChz
b2NfX2NsZWFudXBfY2FyZF9yZXNvdXJjZXMgYW5kIGZyaWVuZHMpLi4KPiAKPiBRdWVzdGlvbiBp
cyBzaW1wbGU6IGFyZSB3ZSBzdGF5aW5nIHdpdGggYWxsLWZvci1vbmUvIG9uZS1mb3ItYWxsIAo+
IGFwcHJvYWNoIG9yIHdlIHJldmVydGluZyB0byBwZXJtaXNzaXZlIGJlaGF2aW9yPwoKQ2FuIHlv
dSBlbGFib3JhdGUgaW4gd2hpY2ggdGVzdCBjYXNlIHRoaXMgcGF0Y2ggY3JlYXRlcyBhIHByb2Js
ZW0/IEp1c3QgCmN1cmlvdXMgd2h5IHRoZSByb3V0ZSBhZGRpdGlvbiBmYWlscyBpbiB0aGUgZmly
c3QgcGxhY2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
