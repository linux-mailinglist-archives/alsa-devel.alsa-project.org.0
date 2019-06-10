Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A83B0A6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 10:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E58616BE;
	Mon, 10 Jun 2019 10:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E58616BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560154875;
	bh=X/tvVC29FTeZMmenlnPMyZHtMENRf6voTvAI3Hm0cZE=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ypq4e8hIHAsQK4no/l6bKCQ6pq3o2P3QBk4dFe3qGCRqIO98IjbvepFLdDVtoX0Ht
	 +4DUFWclIgSwKpvbXDuluMuAIVLkWkiBzOkU3IxZhOyRtbZciHGrWyYZLG4GrSVu9m
	 lHnEhTXojiTIEyJhrXPm+9XFL8jJLGVqz4SFICVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42195F80791;
	Mon, 10 Jun 2019 10:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F90DF896E0; Mon, 10 Jun 2019 10:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00385F8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 10:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00385F8070E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 01:19:18 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2019 01:19:15 -0700
Date: Mon, 10 Jun 2019 10:23:10 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190610102310.572abe45@xxx>
In-Reply-To: <36e24c2a-feb4-4c6f-7bc5-76b13ff625a3@intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
 <20190605134556.10322-9-amadeuszx.slawinski@linux.intel.com>
 <36e24c2a-feb4-4c6f-7bc5-76b13ff625a3@intel.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 08/14] ASoC: Intel: Skylake: Properly
 cleanup on component removal
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gTW9uLCAxMCBKdW4gMjAxOSAwOToxNzoyMSArMDIwMApDZXphcnkgUm9qZXdza2kgPGNlemFy
eS5yb2pld3NraUBpbnRlbC5jb20+IHdyb3RlOgoKPiBPbiAyMDE5LTA2LTA1IDE1OjQ1LCBBbWFk
ZXVzeiBTxYJhd2nFhHNraSB3cm90ZToKPiA+IFdoZW4gd2UgcmVtb3ZlIGNvbXBvbmVudCB3ZSBu
ZWVkIHRvIHJldmVyc2UgdGhpbmdzIHdoaWNoIHdlcmUgZG9uZQo+ID4gb24gaW5pdCwgdGhpcyBj
b25zaXN0cyBvZiB0b3BvbG9neSBjbGVhbnVwLCBsaXN0cyBjbGVhbnVwIGFuZAo+ID4gcmVsZWFz
aW5nIGZpcm13YXJlLgo+ID4gCj4gPiBDdXJyZW50bHkgY2xlYW51cCBoYW5kbGVycyBhcmUgcHV0
IGluIHdyb25nIHBsYWNlcyBvciBvdGhlcndpc2UKPiA+IG1pc3NpbmcuIFNvIGFkZCBwcm9wZXIg
Y29tcG9uZW50IGNsZWFudXAgZnVuY3Rpb24gYW5kIHBlcmZvcm0KPiA+IGNsZWFudXBzIGluIGl0
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraQo+ID4gPGFtYWRl
dXN6eC5zbGF3aW5za2lAbGludXguaW50ZWwuY29tPiAtLS0KPiA+ICAgc291bmQvc29jL2ludGVs
L3NreWxha2Uvc2tsLXBjbS5jICAgICAgfCAgOCArKysrKystLQo+ID4gICBzb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuYyB8IDE1ICsrKysrKysrKysrKysrKwo+ID4gICBzb3Vu
ZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuaCB8ICAyICsrCj4gPiAgIHNvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC5jICAgICAgICAgIHwgIDIgLS0KPiA+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXBjbS5jCj4gPiBiL3NvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC1wY20uYyBpbmRleAo+ID4gNDQwNjI4MDZmYmVkLi43ZTgxMTBjMTUyNTgg
MTAwNjQ0IC0tLQo+ID4gYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMgKysrCj4g
PiBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYyBAQCAtMTQ1OSw4ICsxNDU5LDEy
IEBAIHN0YXRpYwo+ID4gaW50IHNrbF9wbGF0Zm9ybV9zb2NfcHJvYmUoc3RydWN0IHNuZF9zb2Nf
Y29tcG9uZW50ICpjb21wb25lbnQpIAo+ID4gICBzdGF0aWMgdm9pZCBza2xfcGNtX3JlbW92ZShz
dHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkKPiA+ICAgewo+ID4gLQkvKiByZW1v
dmUgdG9wb2xvZ3kgKi8KPiA+IC0Jc25kX3NvY190cGxnX2NvbXBvbmVudF9yZW1vdmUoY29tcG9u
ZW50LAo+ID4gU05EX1NPQ19UUExHX0lOREVYX0FMTCk7Cj4gPiArCXN0cnVjdCBoZGFjX2J1cyAq
YnVzID0gZGV2X2dldF9kcnZkYXRhKGNvbXBvbmVudC0+ZGV2KTsKPiA+ICsJc3RydWN0IHNrbCAq
c2tsID0gYnVzX3RvX3NrbChidXMpOwo+ID4gKwo+ID4gKwlza2xfdHBsZ19leGl0KGNvbXBvbmVu
dCwgYnVzKTsKPiA+ICsKPiA+ICsJc2tsX2RlYnVnZnNfZXhpdChza2wpOwo+ID4gICB9Cj4gPiAg
IAo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50X2RyaXZlciBza2xf
Y29tcG9uZW50ICA9IHsKPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtdG9wb2xvZ3kuYwo+ID4gYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3ku
YyBpbmRleAo+ID4gNDRmM2IyOWE3MjEwLi4zOTY0MjYyMTA5YWMgMTAwNjQ0IC0tLQo+ID4gYS9z
b3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuYyArKysKPiA+IGIvc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmMgQEAgLTM3NDgsMyArMzc0OCwxOCBAQCBpbnQK
PiA+IHNrbF90cGxnX2luaXQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsIHN0
cnVjdCBoZGFjX2J1cwo+ID4gKmJ1cykgcmV0dXJuIDA7Cj4gPiAgIH0KPiA+ICsKPiA+ICt2b2lk
IHNrbF90cGxnX2V4aXQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsIHN0cnVj
dAo+ID4gaGRhY19idXMgKmJ1cykgK3sKPiA+ICsJc3RydWN0IHNrbCAqc2tsID0gYnVzX3RvX3Nr
bChidXMpOwo+ID4gKwlzdHJ1Y3Qgc2tsX3BpcGVsaW5lICpwcGwsICp0bXA7Cj4gPiArCj4gPiAr
CWlmICghbGlzdF9lbXB0eSgmc2tsLT5wcGxfbGlzdCkpCj4gPiArCQlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUocHBsLCB0bXAsICZza2wtPnBwbF9saXN0LAo+ID4gbm9kZSkKPiA+ICsJCQlsaXN0
X2RlbCgmcHBsLT5ub2RlKTsKPiA+ICsKPiA+ICsJLyogY2xlYW4gdXAgdG9wb2xvZ3kgKi8KPiA+
ICsJc25kX3NvY190cGxnX2NvbXBvbmVudF9yZW1vdmUoY29tcG9uZW50LAo+ID4gU05EX1NPQ19U
UExHX0lOREVYX0FMTCk7ICsKPiA+ICsJcmVsZWFzZV9maXJtd2FyZShza2wtPnRwbGcpOwo+ID4g
K30gIAo+IAo+IEluIGRlYnVnZnMgY2xlYW51cCBwYXRjaDoKPiBbUEFUQ0ggMDcvMTRdIEFTb0M6
IEludGVsOiBTa3lsYWtlOiBBZGQgZnVuY3Rpb24gdG8gY2xlYW51cCBkZWJ1Z2ZzIAo+IGludGVy
ZmFjZQo+IAo+IHlvdSBkZWZpbmUgc2tsX2RlYnVnZnNfZXhpdCBzZXBhcmF0ZWx5IC0gaXRzIHVz
YWdlIGlzIHNwbGl0IGFuZAo+IHByZXNlbnQgaW4gdGhpcyB2ZXJ5IHBhdGNoIGluc3RlYWQuIEhv
d2V2ZXIsIGZvciB0cGxnIGNvdW50ZXJwYXJ0IC0gCj4gc2tsX3RwbGdfZXhpdCAtIHlvdSd2ZSBk
ZWNpZGVkIHRvIGNvbWJpbmUgYm90aCB0b2dldGhlci4gV2h5IG5vdCAKPiBzZXBhcmF0ZSB0cGxn
IGNsZWFudXAgdG9vPwo+IAoKVGhpcyBpcyBkb25lIGJlY2F1c2Ugc2tsX2RlYnVnZnNfZXhpdCgp
IGNhbiBiZSBpbnRyb2R1Y2VkIHN0YW5kYWxvbmUuCkhvd2V2ZXIgc2tsX3RwbGdfZXhpdCgpIGhh
cyBjb2RlIHRoYXQgaXMgYmVpbmcgbW92ZWQgZnJvbSBvdGhlciBwbGFjZXMuCklmIEkgaW50cm9k
dWNlZCBpdCBpbiBzZXBhcmF0ZSBjb21taXQsIG90aGVyIG9uZSB3b3VsZCBiZSBhZGRpbmcgY2Fs
bAp0byB0aGlzIGZ1bmN0aW9uIHdoaWxlIHJlbW92aW5nIHRoaW5ncyB0aGF0IGhhcHBlbiBpbnNp
ZGUsIGxvc2luZyBwYXJ0Cm9mIGluZm9ybWF0aW9uLCBhYm91dCB0aGUgZmFjdCB0aGF0IGNvZGUg
aXMgYWN0dWFsbHkganVzdCBiZWluZyBtb3ZlZC4KCj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmgKPiA+IGIvc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLXRvcG9sb2d5LmggaW5kZXgKPiA+IDgyMjgyY2FjOTc1MS4uN2QzMmM2MWM3M2U3IDEw
MDY0NCAtLS0KPiA+IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmggKysr
Cj4gPiBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5oIEBAIC00NzEsNiAr
NDcxLDggQEAgdm9pZAo+ID4gc2tsX3RwbGdfc2V0X2JlX2RtaWNfY29uZmlnKHN0cnVjdCBzbmRf
c29jX2RhaSAqZGFpLCBzdHJ1Y3QKPiA+IHNrbF9waXBlX3BhcmFtcyAqcGFyYW1zLCBpbnQgc3Ry
ZWFtKTsgaW50IHNrbF90cGxnX2luaXQoc3RydWN0Cj4gPiBzbmRfc29jX2NvbXBvbmVudCAqY29t
cG9uZW50LCBzdHJ1Y3QgaGRhY19idXMgKmVidXMpOwo+ID4gK3ZvaWQgc2tsX3RwbGdfZXhpdChz
dHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPiA+ICsJCQkJc3RydWN0IGhkYWNf
YnVzICpidXMpOwo+ID4gICBzdHJ1Y3Qgc2tsX21vZHVsZV9jZmcgKnNrbF90cGxnX2ZlX2dldF9j
cHJfbW9kdWxlKAo+ID4gICAJCXN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLCBpbnQgc3RyZWFtKTsK
PiA+ICAgaW50IHNrbF90cGxnX3VwZGF0ZV9waXBlX3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmMKPiA+IGIvc291
bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmMgaW5kZXggNmQ2NDAxNDEwMjUwLi5lNDg4MWZmNDI3
ZWEKPiA+IDEwMDY0NCAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYwo+ID4gKysr
IGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmMKPiA+IEBAIC0xMTE5LDE0ICsxMTE5LDEy
IEBAIHN0YXRpYyB2b2lkIHNrbF9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBjaSkKPiA+ICAgCXN0
cnVjdCBza2wgKnNrbCA9IGJ1c190b19za2woYnVzKTsKPiA+ICAgCj4gPiAgIAljYW5jZWxfd29y
a19zeW5jKCZza2wtPnByb2JlX3dvcmspOwo+ID4gLQlyZWxlYXNlX2Zpcm13YXJlKHNrbC0+dHBs
Zyk7Cj4gPiAgIAo+ID4gICAJcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoJnBjaS0+ZGV2KTsKPiA+
ICAgCj4gPiAgIAkvKiBjb2RlYyByZW1vdmFsLCBpbnZva2UgYnVzX2RldmljZV9yZW1vdmUgKi8K
PiA+ICAgCXNuZF9oZGFjX2V4dF9idXNfZGV2aWNlX3JlbW92ZShidXMpOwo+ID4gICAKPiA+IC0J
c2tsLT5kZWJ1Z2ZzID0gTlVMTDsKPiA+ICAgCXNrbF9wbGF0Zm9ybV91bnJlZ2lzdGVyKCZwY2kt
PmRldik7Cj4gPiAgIAlza2xfZnJlZV9kc3Aoc2tsKTsKPiA+ICAgCXNrbF9tYWNoaW5lX2Rldmlj
ZV91bnJlZ2lzdGVyKHNrbCk7Cj4gPiAgIAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
