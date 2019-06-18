Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2574A606
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 18:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DF1916EC;
	Tue, 18 Jun 2019 17:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DF1916EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560873616;
	bh=UnV4anonQ8eBpwzhGtEOt3NQYDkd7neIdwECi0O9hnM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lUowMt/Em4TXxYA9Jj+/NV/K8Rne6OMFHuZCQ2dzWmGyV2Q702dxY7Qtffe/Hqth5
	 r16XubKop1a+NUJormW/13OB+5r0P6PKMDiFfdN5aWSzYlFok9B38WNutqA8lYtCYF
	 2+hUq8NYIu3MNreBrfplaMOrZybP/Nlb+AhyVMRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15324F8971C;
	Tue, 18 Jun 2019 17:58:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E409F896F4; Tue, 18 Jun 2019 17:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01433F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 17:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01433F8075C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 08:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,389,1557212400"; d="scan'208";a="164740610"
Received: from rmbutler-mobl.amr.corp.intel.com ([10.255.231.126])
 by orsmga006.jf.intel.com with ESMTP; 18 Jun 2019 08:58:23 -0700
Message-ID: <bd8855a7ab7a9958113631b76706120fd4427631.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Date: Tue, 18 Jun 2019 08:58:22 -0700
In-Reply-To: <20190618130015.0fc388b4@xxx>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
 <75be86354032f4886cbaf7d430de2aa89eaab573.camel@linux.intel.com>
 <20190618130015.0fc388b4@xxx>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
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

T24gVHVlLCAyMDE5LTA2LTE4IGF0IDEzOjAwICswMjAwLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3
cm90ZToKPiBPbiBNb24sIDE3IEp1biAyMDE5IDEzOjUxOjQyIC0wNzAwCj4gUmFuamFuaSBTcmlk
aGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiBP
biBNb24sIDIwMTktMDYtMTcgYXQgMTM6MzYgKzAyMDAsIEFtYWRldXN6IFPFgmF3acWEc2tpIHdy
b3RlOgo+ID4gPiBXaGVuIHdlIHVubG9hZCBTa3lsYWtlIGRyaXZlciB3ZSBtYXkgZW5kIHVwIGNh
bGxpbmcKPiA+ID4gaGRhY19jb21wb25lbnRfbWFzdGVyX3VuYmluZCgpLCBpdCB1c2VzIGFjb21w
LT5hdWRpb19vcHMsIHdoaWNoCj4gPiA+IHdlCj4gPiA+IHNldAo+ID4gPiBpbiBoZG1pX2NvZGVj
X3Byb2JlKCksIHNvIHdlIG5lZWQgdG8gc2V0IGl0IHRvIE5VTEwgaW4KPiA+ID4gaGRtaV9jb2Rl
Y19yZW1vdmUoKSwKPiA+ID4gb3RoZXJ3aXNlIHdlIHdpbGwgZGVyZWZlcmVuY2Ugbm8gbG9uZ2Vy
IGV4aXN0aW5nIHBvaW50ZXIuICAKPiA+IAo+ID4gSGkgQW1hZGV1c3osCj4gPiAKPiA+IEl0IGxv
b2tzIGxpa2UgdGhlIGF1ZGlvX29wcyBzaG91bGQgYmUgZGVsZXRlZAo+ID4gc25kX2hkYWNfYWNv
bXBfZXhpdCgpLgo+ID4gQWxzbywgdGhpcyBkb2VzbnQgc2VlbSB0byBiZSB0aGUgY2FzZSB3aXRo
IHdoZW4gdGhlIFNPRiBkcml2ZXIgaXMKPiA+IHJlbW92ZWQuCj4gPiBDb3VsZCB5b3UgcGxlYXNl
IGdpdmUgYSBiaXQgbW9yZSBjb250ZXh0IG9uIHdoYXQgZXJyb3IgeW91IHNlZSB3aGVuCj4gPiB0
aGlzIGhhcHBlbnM/Cj4gCj4gSGksCj4gCj4gSSBnZXQgT29wcy4gVGhpcyBpcyB3aGF0IGhhcHBl
bnMgd2l0aCBhbGwgb3RoZXIgcGF0Y2hlcyBpbiB0aGlzCj4gc2VyaWVzIGFuZCBvbmx5IHRoaXMg
b25lIHJldmVydGVkOgo+IAo+IHJvb3RAQVBMOn4jIHJtbW9kIHNuZF9zb2Nfc3N0X2J4dF9ydDI5
OAo+IHJvb3RAQVBMOn4jIHJtbW9kIHNuZF9zb2NfaGRhY19oZG1pCj4gcm9vdEBBUEw6fiMgcm1t
b2Qgc25kX3NvY19za2wKClRoYW5rcywgQW1hZGV1c3ouIEkgdGhpbmsgdGhlIG9yZGVyIGluIHdo
aWNoIHRoZSBkcml2ZXJzIGFyZSByZW1vdmVkIGlzCndoYXQncyBjYXVzaW5nIHRoZSBvb3BzIGlu
IHlvdXIgY2FzZS4gV2l0aCBTT0YsIHRoZSBvcmRlciB3ZSByZW1vdmUgaXMKCjEuIHJtbW9kIHNv
Zl9wY2lfZGV2CjIuIHJtbW9kIHNuZF9zb2Nfc3N0X2J4dF9ydDI5OAozLiBybW1vZCBzbmRfc29j
X2hkYWNfaGRtaQoKVGhhbmtzLApSYW5qYW5pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCg==
