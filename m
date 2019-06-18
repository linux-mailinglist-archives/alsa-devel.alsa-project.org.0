Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA749808
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 06:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 368941708;
	Tue, 18 Jun 2019 06:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 368941708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560831669;
	bh=030Ils/dnDGj6QHrFMu5ENMjofazLKcxCftTR9wMgV0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oM4LuPNR6BIROqOEyNOPO3Fc5hWNQSI4g/YfaZ02Mp8a70prRBOkcPwKUl5LW3Tzc
	 tbBRuO+YVGrtHs2Jj+XMKkwbd+uGeIxud5bQS1FAeyhCS+bfWQ+/vSAk+BUmlcqkCD
	 HTaQs+drWoTuFHKCZCJjO22GNIpK7na/DcfC8gzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3CA2F89682;
	Tue, 18 Jun 2019 06:19:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4535EF896F4; Tue, 18 Jun 2019 06:19:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35619F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 06:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35619F80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 21:19:16 -0700
X-ExtLoop1: 1
Received: from rmbutler-mobl.amr.corp.intel.com ([10.255.231.126])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2019 21:19:15 -0700
Message-ID: <1fd4af8e1b4bad5eda6f1e2f747b7988c74408fb.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Mon, 17 Jun 2019 21:19:15 -0700
In-Reply-To: <s5h7e9jc2s1.wl-tiwai@suse.de>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
 <75be86354032f4886cbaf7d430de2aa89eaab573.camel@linux.intel.com>
 <s5h7e9jc2s1.wl-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 "\"Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski=22?="
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 09/11] ASoC: Intel: hdac_hdmi: Set ops
 to NULL on remove
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

T24gTW9uLCAyMDE5LTA2LTE3IGF0IDIzOjM2ICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4g
T24gTW9uLCAxNyBKdW4gMjAxOSAyMjo1MTo0MiArMDIwMCwKPiBSYW5qYW5pIFNyaWRoYXJhbiB3
cm90ZToKPiA+IAo+ID4gT24gTW9uLCAyMDE5LTA2LTE3IGF0IDEzOjM2ICswMjAwLCBBbWFkZXVz
eiBTxYJhd2nFhHNraSB3cm90ZToKPiA+ID4gV2hlbiB3ZSB1bmxvYWQgU2t5bGFrZSBkcml2ZXIg
d2UgbWF5IGVuZCB1cCBjYWxsaW5nCj4gPiA+IGhkYWNfY29tcG9uZW50X21hc3Rlcl91bmJpbmQo
KSwgaXQgdXNlcyBhY29tcC0+YXVkaW9fb3BzLCB3aGljaAo+ID4gPiB3ZQo+ID4gPiBzZXQKPiA+
ID4gaW4gaGRtaV9jb2RlY19wcm9iZSgpLCBzbyB3ZSBuZWVkIHRvIHNldCBpdCB0byBOVUxMIGlu
Cj4gPiA+IGhkbWlfY29kZWNfcmVtb3ZlKCksCj4gPiA+IG90aGVyd2lzZSB3ZSB3aWxsIGRlcmVm
ZXJlbmNlIG5vIGxvbmdlciBleGlzdGluZyBwb2ludGVyLgo+ID4gCj4gPiBIaSBBbWFkZXVzeiwK
PiA+IAo+ID4gSXQgbG9va3MgbGlrZSB0aGUgYXVkaW9fb3BzIHNob3VsZCBiZSBkZWxldGVkCj4g
PiBzbmRfaGRhY19hY29tcF9leGl0KCkuCj4gCj4gSXQncyBhIGRpZmZlcmVudCBvbmUuICBUaGUg
Y29kZWMgZHJpdmVyIHJlZ2lzdGVycyAvIGRlLXJlZ2lzdGVycyB0aGUKPiBub3RpZmllciBhdCBp
dHMgcHJvYmUvcmVtb3ZlLCB3aGlsZSB0aGUgY29udHJvbGxlciBkcml2ZXIgdGFrZXMgY2FyZQo+
IG9mIHNuZF9oZGFjX2Fjb21wX2luaXQoKS4gIHNuZF9oZGFjX2Fjb21wX2V4aXQoKSBpcyB1c3Vh
bGx5IG5vdAo+IG5lZWRlZAo+IHRvIGJlIGNhbGxlZCBleHBsaWNpdGx5LCBhcyBpdCdzIG1hbmFn
ZWQgdmlhIGRldnJlcy4KCk1ha2VzIHNlbnNlLCB0aGFua3MgVGFrYXNoaS4gQnV0IEkgYW0gc3Rp
bGwgd29uZGVyaW5nIHdoeSB3ZSBoYXZlbnQKc2VlbiB0aGlzIGlzc3VlIHdpdGggU09GIHlldC4g
V2UgcnVuIHRoZSBtb2R1bGUgdW5sb2FkL3JlbG9hZCBzdHJlc3MKdGVzdCBhcyB3ZWxsIGFuZCBo
YXZlbnQgc2VlbiB0aGlzIHlldC4gCgpUaGFua3MsClJhbmphbmkKPiAKPiAKPiBUYWthc2hpCj4g
Cj4gPiBBbHNvLCB0aGlzIGRvZXNudCBzZWVtIHRvIGJlIHRoZSBjYXNlIHdpdGggd2hlbiB0aGUg
U09GIGRyaXZlciBpcwo+ID4gcmVtb3ZlZC4KPiA+IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBhIGJp
dCBtb3JlIGNvbnRleHQgb24gd2hhdCBlcnJvciB5b3Ugc2VlIHdoZW4KPiA+IHRoaXMgaGFwcGVu
cz8KPiA+IAo+ID4gVGhhbmtzLAo+ID4gUmFuamFuaQo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1i
eTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPAo+ID4gPiBhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4
LmludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBzb3VuZC9zb2MvY29kZWNzL2hkYWNfaGRtaS5j
IHwgNiArKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+ID4g
Cj4gPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL2hkYWNfaGRtaS5jCj4gPiA+IGIv
c291bmQvc29jL2NvZGVjcy9oZGFjX2hkbWkuYwo+ID4gPiBpbmRleCA5MTFiYjZlMmExYWMuLjll
ZTFiZmY1NDhkOCAxMDA2NDQKPiA+ID4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9oZGFjX2hkbWku
Ywo+ID4gPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL2hkYWNfaGRtaS5jCj4gPiA+IEBAIC0xODkw
LDYgKzE4OTAsMTIgQEAgc3RhdGljIHZvaWQgaGRtaV9jb2RlY19yZW1vdmUoc3RydWN0Cj4gPiA+
IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpCj4gPiA+ICB7Cj4gPiA+ICAJc3RydWN0IGhk
YWNfaGRtaV9wcml2ICpoZG1pID0KPiA+ID4gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEo
Y29tcG9uZW50KTsKPiA+ID4gIAlzdHJ1Y3QgaGRhY19kZXZpY2UgKmhkZXYgPSBoZG1pLT5oZGV2
Owo+ID4gPiArCWludCByZXQ7Cj4gPiA+ICsKPiA+ID4gKwlyZXQgPSBzbmRfaGRhY19hY29tcF9y
ZWdpc3Rlcl9ub3RpZmllcihoZGV2LT5idXMsIE5VTEwpOwo+ID4gPiArCWlmIChyZXQgPCAwKQo+
ID4gPiArCQlkZXZfZXJyKCZoZGV2LT5kZXYsICJub3RpZmllciB1bnJlZ2lzdGVyIGZhaWxlZDog
ZXJyOgo+ID4gPiAlZFxuIiwKPiA+ID4gKwkJCQlyZXQpOwo+ID4gPiAgCj4gPiA+ICAJcG1fcnVu
dGltZV9kaXNhYmxlKCZoZGV2LT5kZXYpOwo+ID4gPiAgfQo+ID4gCj4gPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
