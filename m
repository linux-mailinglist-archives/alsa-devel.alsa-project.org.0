Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D64C2C3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 23:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19F931680;
	Wed, 19 Jun 2019 23:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19F931680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560978678;
	bh=SXKtKIV+pFK9NQYpixdYt8GFJ5i1lAFIbwYz4sqPChU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2+9lQ1gv2n0qn9qvywpu0nBtGQ24CLA7zTXDn9l/lnIKCiSompj29rCBeFS5Ofaa
	 vWYm1rvQZLac++8cQWgXF2siAGwqKPWjI/FoWtvn+RRhNMw+xvXyvPjF/5cdjJRMRw
	 HpnbIURxVvmHSBf9tuNUOr+D+Q00n2d7IUf7ZukM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63304F896C7;
	Wed, 19 Jun 2019 23:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B70F896B8; Wed, 19 Jun 2019 23:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 661EDF80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 23:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 661EDF80C87
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 14:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,394,1557212400"; d="scan'208";a="243428686"
Received: from nmendi-mobl.amr.corp.intel.com ([10.251.150.122])
 by orsmga001.jf.intel.com with ESMTP; 19 Jun 2019 14:09:22 -0700
Message-ID: <0c939329d17c50c353acacf164583ba259a775c0.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Date: Wed, 19 Jun 2019 14:09:22 -0700
In-Reply-To: <20190619103859.15bf51c5@xxx>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
 <75be86354032f4886cbaf7d430de2aa89eaab573.camel@linux.intel.com>
 <20190618130015.0fc388b4@xxx>
 <bd8855a7ab7a9958113631b76706120fd4427631.camel@linux.intel.com>
 <20190619103859.15bf51c5@xxx>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

T24gV2VkLCAyMDE5LTA2LTE5IGF0IDEwOjM4ICswMjAwLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3
cm90ZToKPiBPbiBUdWUsIDE4IEp1biAyMDE5IDA4OjU4OjIyIC0wNzAwCj4gUmFuamFuaSBTcmlk
aGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiBP
biBUdWUsIDIwMTktMDYtMTggYXQgMTM6MDAgKzAyMDAsIEFtYWRldXN6IFPFgmF3acWEc2tpIHdy
b3RlOgo+ID4gPiBPbiBNb24sIDE3IEp1biAyMDE5IDEzOjUxOjQyIC0wNzAwCj4gPiA+IFJhbmph
bmkgU3JpZGhhcmFuIDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+
ID4gPiAgIAo+ID4gPiA+IE9uIE1vbiwgMjAxOS0wNi0xNyBhdCAxMzozNiArMDIwMCwgQW1hZGV1
c3ogU8WCYXdpxYRza2kgd3JvdGU6ICAKPiA+ID4gPiA+IFdoZW4gd2UgdW5sb2FkIFNreWxha2Ug
ZHJpdmVyIHdlIG1heSBlbmQgdXAgY2FsbGluZwo+ID4gPiA+ID4gaGRhY19jb21wb25lbnRfbWFz
dGVyX3VuYmluZCgpLCBpdCB1c2VzIGFjb21wLT5hdWRpb19vcHMsCj4gPiA+ID4gPiB3aGljaAo+
ID4gPiA+ID4gd2UKPiA+ID4gPiA+IHNldAo+ID4gPiA+ID4gaW4gaGRtaV9jb2RlY19wcm9iZSgp
LCBzbyB3ZSBuZWVkIHRvIHNldCBpdCB0byBOVUxMIGluCj4gPiA+ID4gPiBoZG1pX2NvZGVjX3Jl
bW92ZSgpLAo+ID4gPiA+ID4gb3RoZXJ3aXNlIHdlIHdpbGwgZGVyZWZlcmVuY2Ugbm8gbG9uZ2Vy
IGV4aXN0aW5nIHBvaW50ZXIuICAgIAo+ID4gPiA+IAo+ID4gPiA+IEhpIEFtYWRldXN6LAo+ID4g
PiA+IAo+ID4gPiA+IEl0IGxvb2tzIGxpa2UgdGhlIGF1ZGlvX29wcyBzaG91bGQgYmUgZGVsZXRl
ZAo+ID4gPiA+IHNuZF9oZGFjX2Fjb21wX2V4aXQoKS4KPiA+ID4gPiBBbHNvLCB0aGlzIGRvZXNu
dCBzZWVtIHRvIGJlIHRoZSBjYXNlIHdpdGggd2hlbiB0aGUgU09GIGRyaXZlcgo+ID4gPiA+IGlz
Cj4gPiA+ID4gcmVtb3ZlZC4KPiA+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIGdpdmUgYSBiaXQgbW9y
ZSBjb250ZXh0IG9uIHdoYXQgZXJyb3IgeW91IHNlZQo+ID4gPiA+IHdoZW4gdGhpcyBoYXBwZW5z
PyAgCj4gPiA+IAo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IEkgZ2V0IE9vcHMuIFRoaXMgaXMgd2hh
dCBoYXBwZW5zIHdpdGggYWxsIG90aGVyIHBhdGNoZXMgaW4gdGhpcwo+ID4gPiBzZXJpZXMgYW5k
IG9ubHkgdGhpcyBvbmUgcmV2ZXJ0ZWQ6Cj4gPiA+IAo+ID4gPiByb290QEFQTDp+IyBybW1vZCBz
bmRfc29jX3NzdF9ieHRfcnQyOTgKPiA+ID4gcm9vdEBBUEw6fiMgcm1tb2Qgc25kX3NvY19oZGFj
X2hkbWkKPiA+ID4gcm9vdEBBUEw6fiMgcm1tb2Qgc25kX3NvY19za2wgIAo+ID4gCj4gPiBUaGFu
a3MsIEFtYWRldXN6LiBJIHRoaW5rIHRoZSBvcmRlciBpbiB3aGljaCB0aGUgZHJpdmVycyBhcmUK
PiA+IHJlbW92ZWQKPiA+IGlzIHdoYXQncyBjYXVzaW5nIHRoZSBvb3BzIGluIHlvdXIgY2FzZS4g
V2l0aCBTT0YsIHRoZSBvcmRlciB3ZQo+ID4gcmVtb3ZlIGlzCj4gPiAKPiA+IDEuIHJtbW9kIHNv
Zl9wY2lfZGV2Cj4gPiAyLiBybW1vZCBzbmRfc29jX3NzdF9ieHRfcnQyOTgKPiA+IDMuIHJtbW9k
IHNuZF9zb2NfaGRhY19oZG1pCj4gPiAKPiAKPiBXZWxsLCB0aGVyZSBpcyBub3RoaW5nIGVuZm9y
Y2luZyB0aGUgb3JkZXIgaW4gd2hpY2ggbW9kdWxlcyBjYW4gYmUKPiB1bmxvYWRlZCAoYW5kIEkg
c2VlIG5vIHJlYXNvbiB0byBmb3JjZSBpdCksIGFzIHlvdSBjYW4gc2VlIGZyb20KPiBmb2xsb3dp
bmcgZXhjZXJwdCwgeW91IGNhbiBlaXRoZXIgc3RhcnQgdW5sb2FkaW5nIGZyb20KPiBzbmRfc29j
X3NzdF9ieHRfcnQyOTggb3Igc25kX3NvY19za2wsIGFuZCB5ZXMgaWYgeW91IHN0YXJ0IGZyb20K
PiBzbmRfc29jX3NrbCwgdGhlcmUgaXMgbm8gcHJvYmxlbS4KPiAKSSBhbSBnb29kIHdpdGggdGhp
cyBwYXRjaC4gSSBqdXN0IHdhbnRlZCB0byB1bmRlcnN0YW5kIHdoeSB3ZSB3ZXJlbnQKc2VlaW5n
IHRoaXMgZXJyb3Igd2l0aCBTT0YuIFN1cmUsIHRoZXJlJ3Mgbm90aGluZyBlbmZvcmNpbmcgdGhl
IG9yZGVyCmluIHdoaWNoIG1vZHVsZXMgYXJlIHVubG9hZGVkICBidXQgdGhlcmUgbXVzdCBiZSBh
IGxvZ2ljYWwgb3JkZXIgZm9yCnRlc3RpbmcgcHVycG9zZXMuIAoKUGllcnJlLCBjYW4geW91IHBs
ZWFzZSBjb21tZW50IG9uIGl0LiBJIHZhZ3VlbHkgcmVtZW1iZXIgZGlzY3Vzc2luZwp0aGlzIHdp
dGggeW91IGxhc3QgeWVhci4KClRoYW5rcywKUmFuamFuaQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
