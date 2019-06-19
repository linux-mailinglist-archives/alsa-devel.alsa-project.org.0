Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF194B428
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 10:37:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD0116A1;
	Wed, 19 Jun 2019 10:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD0116A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560933421;
	bh=6WHLKeBNje6v+5/lBoU2Ry4B1OcJ2swd2cKgLKcMTS8=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=brZIR2PL8Ani4POq1Lp0hRwnBSc9OqDh/6CGFbWFCO2E9McsK/HulqQobZJcTATPH
	 0hYYbSSd05zI7gH3a1tkg2z/cZ4Lffv0PNRrWjAv7/H3/fgGgyiDYlg8WTQVb7TZBI
	 7BQ3+/hvUbZOGzxxdHshu+SXbghtBQgekx+FTARM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA85F89682;
	Wed, 19 Jun 2019 10:35:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5E96F896B8; Wed, 19 Jun 2019 10:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4FAFF80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 10:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4FAFF80C87
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 01:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="162147085"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga003.jf.intel.com with ESMTP; 19 Jun 2019 01:35:05 -0700
Date: Wed, 19 Jun 2019 10:38:59 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Message-ID: <20190619103859.15bf51c5@xxx>
In-Reply-To: <bd8855a7ab7a9958113631b76706120fd4427631.camel@linux.intel.com>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
 <75be86354032f4886cbaf7d430de2aa89eaab573.camel@linux.intel.com>
 <20190618130015.0fc388b4@xxx>
 <bd8855a7ab7a9958113631b76706120fd4427631.camel@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

T24gVHVlLCAxOCBKdW4gMjAxOSAwODo1ODoyMiAtMDcwMApSYW5qYW5pIFNyaWRoYXJhbiA8cmFu
amFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gT24gVHVlLCAyMDE5LTA2
LTE4IGF0IDEzOjAwICswMjAwLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3cm90ZToKPiA+IE9uIE1v
biwgMTcgSnVuIDIwMTkgMTM6NTE6NDIgLTA3MDAKPiA+IFJhbmphbmkgU3JpZGhhcmFuIDxyYW5q
YW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gT24gTW9u
LCAyMDE5LTA2LTE3IGF0IDEzOjM2ICswMjAwLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3cm90ZTog
IAo+ID4gPiA+IFdoZW4gd2UgdW5sb2FkIFNreWxha2UgZHJpdmVyIHdlIG1heSBlbmQgdXAgY2Fs
bGluZwo+ID4gPiA+IGhkYWNfY29tcG9uZW50X21hc3Rlcl91bmJpbmQoKSwgaXQgdXNlcyBhY29t
cC0+YXVkaW9fb3BzLCB3aGljaAo+ID4gPiA+IHdlCj4gPiA+ID4gc2V0Cj4gPiA+ID4gaW4gaGRt
aV9jb2RlY19wcm9iZSgpLCBzbyB3ZSBuZWVkIHRvIHNldCBpdCB0byBOVUxMIGluCj4gPiA+ID4g
aGRtaV9jb2RlY19yZW1vdmUoKSwKPiA+ID4gPiBvdGhlcndpc2Ugd2Ugd2lsbCBkZXJlZmVyZW5j
ZSBubyBsb25nZXIgZXhpc3RpbmcgcG9pbnRlci4gICAgCj4gPiA+IAo+ID4gPiBIaSBBbWFkZXVz
eiwKPiA+ID4gCj4gPiA+IEl0IGxvb2tzIGxpa2UgdGhlIGF1ZGlvX29wcyBzaG91bGQgYmUgZGVs
ZXRlZAo+ID4gPiBzbmRfaGRhY19hY29tcF9leGl0KCkuCj4gPiA+IEFsc28sIHRoaXMgZG9lc250
IHNlZW0gdG8gYmUgdGhlIGNhc2Ugd2l0aCB3aGVuIHRoZSBTT0YgZHJpdmVyIGlzCj4gPiA+IHJl
bW92ZWQuCj4gPiA+IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBhIGJpdCBtb3JlIGNvbnRleHQgb24g
d2hhdCBlcnJvciB5b3Ugc2VlCj4gPiA+IHdoZW4gdGhpcyBoYXBwZW5zPyAgCj4gPiAKPiA+IEhp
LAo+ID4gCj4gPiBJIGdldCBPb3BzLiBUaGlzIGlzIHdoYXQgaGFwcGVucyB3aXRoIGFsbCBvdGhl
ciBwYXRjaGVzIGluIHRoaXMKPiA+IHNlcmllcyBhbmQgb25seSB0aGlzIG9uZSByZXZlcnRlZDoK
PiA+IAo+ID4gcm9vdEBBUEw6fiMgcm1tb2Qgc25kX3NvY19zc3RfYnh0X3J0Mjk4Cj4gPiByb290
QEFQTDp+IyBybW1vZCBzbmRfc29jX2hkYWNfaGRtaQo+ID4gcm9vdEBBUEw6fiMgcm1tb2Qgc25k
X3NvY19za2wgIAo+IAo+IFRoYW5rcywgQW1hZGV1c3ouIEkgdGhpbmsgdGhlIG9yZGVyIGluIHdo
aWNoIHRoZSBkcml2ZXJzIGFyZSByZW1vdmVkCj4gaXMgd2hhdCdzIGNhdXNpbmcgdGhlIG9vcHMg
aW4geW91ciBjYXNlLiBXaXRoIFNPRiwgdGhlIG9yZGVyIHdlCj4gcmVtb3ZlIGlzCj4gCj4gMS4g
cm1tb2Qgc29mX3BjaV9kZXYKPiAyLiBybW1vZCBzbmRfc29jX3NzdF9ieHRfcnQyOTgKPiAzLiBy
bW1vZCBzbmRfc29jX2hkYWNfaGRtaQo+IAoKV2VsbCwgdGhlcmUgaXMgbm90aGluZyBlbmZvcmNp
bmcgdGhlIG9yZGVyIGluIHdoaWNoIG1vZHVsZXMgY2FuIGJlCnVubG9hZGVkIChhbmQgSSBzZWUg
bm8gcmVhc29uIHRvIGZvcmNlIGl0KSwgYXMgeW91IGNhbiBzZWUgZnJvbQpmb2xsb3dpbmcgZXhj
ZXJwdCwgeW91IGNhbiBlaXRoZXIgc3RhcnQgdW5sb2FkaW5nIGZyb20Kc25kX3NvY19zc3RfYnh0
X3J0Mjk4IG9yIHNuZF9zb2Nfc2tsLCBhbmQgeWVzIGlmIHlvdSBzdGFydCBmcm9tCnNuZF9zb2Nf
c2tsLCB0aGVyZSBpcyBubyBwcm9ibGVtLgoKc25kX3NvY19zc3RfYnh0X3J0Mjk4ICAgIDQwOTYw
ICAwCnNuZF9zb2NfaGRhY19oZG1pICAgICAgNDUwNTYgIDEgc25kX3NvY19zc3RfYnh0X3J0Mjk4
CnNuZF9zb2NfZG1pYyAgICAgICAgICAgMTYzODQgIDEKc25kX3NvY19ydDI5OCAgICAgICAgICA2
NTUzNiAgMiBzbmRfc29jX3NzdF9ieHRfcnQyOTgKc25kX3NvY19ydDI4NiAgICAgICAgICA2MTQ0
MCAgMApzbmRfc29jX3JsNjM0N2EgICAgICAgIDE2Mzg0ICAyIHNuZF9zb2NfcnQyOTgsc25kX3Nv
Y19ydDI4NgpzbmRfc29jX3NrbCAgICAgICAgICAgMzcyNzM2ICAwCnNuZF9zb2Nfc3N0X2lwYyAg
ICAgICAgMjA0ODAgIDEgc25kX3NvY19za2wKc25kX3NvY19zc3RfZHNwICAgICAgICAzNjg2NCAg
MSBzbmRfc29jX3NrbApzbmRfaGRhX2V4dF9jb3JlICAgICAgIDI4NjcyICAyIHNuZF9zb2NfaGRh
Y19oZG1pLHNuZF9zb2Nfc2tsCnNuZF9oZGFfY29yZSAgICAgICAgICAxMzkyNjQgIDMKc25kX2hk
YV9leHRfY29yZSxzbmRfc29jX2hkYWNfaGRtaSxzbmRfc29jX3NrbApzbmRfc29jX2FjcGlfaW50
ZWxfbWF0Y2ggICAgNTMyNDggIDEgc25kX3NvY19za2wgc25kX3NvY19hY3BpCjE2Mzg0ICAyIHNu
ZF9zb2NfYWNwaV9pbnRlbF9tYXRjaCxzbmRfc29jX3NrbCBzbmRfc29jX2NvcmUKNDA1NTA0ICA2
CnNuZF9zb2NfcnQyOTgsc25kX3NvY19ydDI4NixzbmRfc29jX2hkYWNfaGRtaSxzbmRfc29jX3Nr
bCxzbmRfc29jX2RtaWMsc25kX3NvY19zc3RfYnh0X3J0Mjk4CnNuZF9jb21wcmVzcyAgICAgICAg
ICAgMzY4NjQgIDIgc25kX3NvY19jb3JlLHNuZF9zb2Nfc2tsCnNuZF9wY21fZG1hZW5naW5lICAg
ICAgMTYzODQgIDEgc25kX3NvY19jb3JlIHNuZF9wY20KMTYzODQwICAxMApzbmRfc29jX3J0Mjk4
LHNuZF9zb2NfcnQyODYsc25kX2hkYV9leHRfY29yZSxzbmRfc29jX2hkYWNfaGRtaSxzbmRfY29t
cHJlc3Msc25kX3NvY19jb3JlLHNuZF9zb2Nfc2tsLHNuZF9oZGFfY29yZSxzbmRfc29jX3NzdF9i
eHRfcnQyOTgsc25kX3BjbV9kbWFlbmdpbmUKc25kX3RpbWVyICAgICAgICAgICAgICA1MzI0OCAg
MSBzbmRfcGNtCgpBbWFkZXVzegpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
