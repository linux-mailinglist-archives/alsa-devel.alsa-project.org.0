Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE91D491B5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 22:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B96316E6;
	Mon, 17 Jun 2019 22:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B96316E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560804817;
	bh=ekTA+EP2GkDVAy37eX55XQNVBTJLHqlHkZ2DRrMRXHg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bn4kKYyzbU1mXqTvyNwtnW9a7RzJGZyXIsQCTMP8MbD/RXwuAQ93ofCoTbkchQuH5
	 Qx238wldAValYST9/9nlu4nEhjnZq6GZ2iwK+46v5ey3YpSqS96ErjoQLwFTl3onZK
	 rqdyFDFk4XH/+xtXNQLWir13vRGCHJ3qpcNnz8Ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E969F896DA;
	Mon, 17 Jun 2019 22:51:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB50FF896C7; Mon, 17 Jun 2019 22:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1A45F8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 22:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A45F8075C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 13:51:44 -0700
X-ExtLoop1: 1
Received: from rmbutler-mobl.amr.corp.intel.com ([10.255.231.126])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 13:51:42 -0700
Message-ID: <75be86354032f4886cbaf7d430de2aa89eaab573.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:51:42 -0700
In-Reply-To: <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
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

T24gTW9uLCAyMDE5LTA2LTE3IGF0IDEzOjM2ICswMjAwLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3
cm90ZToKPiBXaGVuIHdlIHVubG9hZCBTa3lsYWtlIGRyaXZlciB3ZSBtYXkgZW5kIHVwIGNhbGxp
bmcKPiBoZGFjX2NvbXBvbmVudF9tYXN0ZXJfdW5iaW5kKCksIGl0IHVzZXMgYWNvbXAtPmF1ZGlv
X29wcywgd2hpY2ggd2UKPiBzZXQKPiBpbiBoZG1pX2NvZGVjX3Byb2JlKCksIHNvIHdlIG5lZWQg
dG8gc2V0IGl0IHRvIE5VTEwgaW4KPiBoZG1pX2NvZGVjX3JlbW92ZSgpLAo+IG90aGVyd2lzZSB3
ZSB3aWxsIGRlcmVmZXJlbmNlIG5vIGxvbmdlciBleGlzdGluZyBwb2ludGVyLgoKSGkgQW1hZGV1
c3osCgpJdCBsb29rcyBsaWtlIHRoZSBhdWRpb19vcHMgc2hvdWxkIGJlIGRlbGV0ZWQgc25kX2hk
YWNfYWNvbXBfZXhpdCgpLgpBbHNvLCB0aGlzIGRvZXNudCBzZWVtIHRvIGJlIHRoZSBjYXNlIHdp
dGggd2hlbiB0aGUgU09GIGRyaXZlciBpcwpyZW1vdmVkLgpDb3VsZCB5b3UgcGxlYXNlIGdpdmUg
YSBiaXQgbW9yZSBjb250ZXh0IG9uIHdoYXQgZXJyb3IgeW91IHNlZSB3aGVuCnRoaXMgaGFwcGVu
cz8KClRoYW5rcywKUmFuamFuaQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWE
c2tpIDwKPiBhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgc291
bmQvc29jL2NvZGVjcy9oZGFjX2hkbWkuYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9oZGFjX2hk
bWkuYwo+IGIvc291bmQvc29jL2NvZGVjcy9oZGFjX2hkbWkuYwo+IGluZGV4IDkxMWJiNmUyYTFh
Yy4uOWVlMWJmZjU0OGQ4IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvaGRhY19oZG1p
LmMKPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL2hkYWNfaGRtaS5jCj4gQEAgLTE4OTAsNiArMTg5
MCwxMiBAQCBzdGF0aWMgdm9pZCBoZG1pX2NvZGVjX3JlbW92ZShzdHJ1Y3QKPiBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50KQo+ICB7Cj4gIAlzdHJ1Y3QgaGRhY19oZG1pX3ByaXYgKmhkbWkg
PQo+IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7Cj4gIAlzdHJ1Y3Qg
aGRhY19kZXZpY2UgKmhkZXYgPSBoZG1pLT5oZGV2Owo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQg
PSBzbmRfaGRhY19hY29tcF9yZWdpc3Rlcl9ub3RpZmllcihoZGV2LT5idXMsIE5VTEwpOwo+ICsJ
aWYgKHJldCA8IDApCj4gKwkJZGV2X2VycigmaGRldi0+ZGV2LCAibm90aWZpZXIgdW5yZWdpc3Rl
ciBmYWlsZWQ6IGVycjoKPiAlZFxuIiwKPiArCQkJCXJldCk7Cj4gIAo+ICAJcG1fcnVudGltZV9k
aXNhYmxlKCZoZGV2LT5kZXYpOwo+ICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
