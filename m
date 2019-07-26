Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363776E42
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C8720AA;
	Fri, 26 Jul 2019 17:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C8720AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564156142;
	bh=wSthBeHB/+qqRSqD1ynYUFPNRSRdCG8ODspRSdeRhx8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O87pUKNpJYuv2tj+0RtbyE81+tpjiqnOOWNO96mdFtL8hMg2jmnEELphA991opIgd
	 nCKTal+OLzEVOTdZfwABLixyroB7Xfbyb+T27zOz8L7PeCk3IooLJvIV/5FeI4RNWw
	 /HUUXHqhjopMa4lAT9PgESWHd5rQrlNKYxJLDbPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93919F80393;
	Fri, 26 Jul 2019 17:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B84AF80393; Fri, 26 Jul 2019 17:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CDDEF800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CDDEF800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="345853999"
Received: from bcstewar-mobl1.amr.corp.intel.com (HELO [10.251.147.177])
 ([10.251.147.177])
 by orsmga005.jf.intel.com with ESMTP; 26 Jul 2019 08:47:08 -0700
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190726090929.27946-1-amadeuszx.slawinski@linux.intel.com>
 <20190726090929.27946-2-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <99dcace6-8b46-4ecf-03e5-b48a219640ae@linux.intel.com>
Date: Fri, 26 Jul 2019 10:47:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726090929.27946-2-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 1/1] ASoC: Intel: Skylake: Remove static
 table index when parsing topology
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

CgpPbiA3LzI2LzE5IDQ6MDkgQU0sIEFtYWRldXN6IFPFgmF3acWEc2tpIHdyb3RlOgo+IEN1cnJl
bnRseSB3aGVuIHdlIHJlbW92ZSBhbmQgcmVsb2FkIGRyaXZlciB3ZSB1c2UgcHJldmlvdXMgcmVm
X2NvdW50Cj4gdmFsdWUgdG8gc3RhcnQgaXRlcmF0aW5nIG92ZXIgc2tsLT5tb2R1bGVzIHdoaWNo
IGxlYWRzIHRvIG91dCBvZiB0YWJsZQo+IGFjY2Vzcy4gVG8gZml4IHRoaXMganVzdCBpbmxpbmUg
dGhlIGZ1bmN0aW9uIGFuZCBjYWxjdWxhdGUgaW5kZXhlcwo+IGV2ZXJ5dGltZSB3ZSBwYXJzZSBV
VUlEIHRva2VuLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFk
ZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBQaWVycmUtTG91
aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgoKPiAtLS0K
PiAgIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jIHwgMzQgKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAy
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uv
c2tsLXRvcG9sb2d5LmMgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuYwo+
IGluZGV4IDExODg2NmNkNTA3NS4uYzFjMzdjZTc1OWJkIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jCj4gKysrIGIvc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLXRvcG9sb2d5LmMKPiBAQCAtMzMzMywyNSArMzMzMyw2IEBAIHN0YXRpYyBpbnQg
c2tsX3RwbGdfZ2V0X2ludF90a24oc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCXJldHVybiB0a25f
Y291bnQ7Cj4gICB9Cj4gICAKPiAtc3RhdGljIGludCBza2xfdHBsZ19nZXRfbWFuaWZlc3RfdXVp
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gLQkJCQlzdHJ1Y3Qgc2tsX2RldiAqc2tsLAo+IC0JCQkJ
c3RydWN0IHNuZF9zb2NfdHBsZ192ZW5kb3JfdXVpZF9lbGVtICp1dWlkX3RrbikKPiAtewo+IC0J
c3RhdGljIGludCByZWZfY291bnQ7Cj4gLQlzdHJ1Y3Qgc2tsX21vZHVsZSAqbW9kOwo+IC0KPiAt
CWlmICh1dWlkX3Rrbi0+dG9rZW4gPT0gU0tMX1RLTl9VVUlEKSB7Cj4gLQkJbW9kID0gc2tsLT5t
b2R1bGVzW3JlZl9jb3VudF07Cj4gLQkJZ3VpZF9jb3B5KCZtb2QtPnV1aWQsIChndWlkX3QgKikm
dXVpZF90a24tPnV1aWQpOwo+IC0JCXJlZl9jb3VudCsrOwo+IC0JfSBlbHNlIHsKPiAtCQlkZXZf
ZXJyKGRldiwgIk5vdCBhbiBVVUlEIHRva2VuIHRrbiAlZFxuIiwgdXVpZF90a24tPnRva2VuKTsK
PiAtCQlyZXR1cm4gLUVJTlZBTDsKPiAtCX0KPiAtCj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0KPiAg
IC8qCj4gICAgKiBGaWxsIHRoZSBtYW5pZmVzdCBzdHJ1Y3R1cmUgYnkgcGFyc2luZyB0aGUgdG9r
ZW5zIGJhc2VkIG9uIHRoZQo+ICAgICogdHlwZS4KPiBAQCAtMzM2Miw2ICszMzQzLDcgQEAgc3Rh
dGljIGludCBza2xfdHBsZ19nZXRfbWFuaWZlc3RfdGtuKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAg
IHsKPiAgIAlpbnQgdGtuX2NvdW50ID0gMCwgcmV0Owo+ICAgCWludCBvZmYgPSAwLCB0dXBsZV9z
aXplID0gMDsKPiArCXU4IHV1aWRfaW5kZXggPSAwOwo+ICAgCXN0cnVjdCBzbmRfc29jX3RwbGdf
dmVuZG9yX2FycmF5ICphcnJheTsKPiAgIAlzdHJ1Y3Qgc25kX3NvY190cGxnX3ZlbmRvcl92YWx1
ZV9lbGVtICp0a25fZWxlbTsKPiAgIAo+IEBAIC0zMzg0LDkgKzMzNjYsMTcgQEAgc3RhdGljIGlu
dCBza2xfdHBsZ19nZXRfbWFuaWZlc3RfdGtuKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgIAkJCWNv
bnRpbnVlOwo+ICAgCj4gICAJCWNhc2UgU05EX1NPQ19UUExHX1RVUExFX1RZUEVfVVVJRDoKPiAt
CQkJcmV0ID0gc2tsX3RwbGdfZ2V0X21hbmlmZXN0X3V1aWQoZGV2LCBza2wsIGFycmF5LT51dWlk
KTsKPiAtCQkJaWYgKHJldCA8IDApCj4gLQkJCQlyZXR1cm4gcmV0Owo+ICsJCQlpZiAoYXJyYXkt
PnV1aWQtPnRva2VuICE9IFNLTF9US05fVVVJRCkgewo+ICsJCQkJZGV2X2VycihkZXYsICJOb3Qg
YW4gVVVJRCB0b2tlbjogJWRcbiIsCj4gKwkJCQkJYXJyYXktPnV1aWQtPnRva2VuKTsKPiArCQkJ
CXJldHVybiAtRUlOVkFMOwo+ICsJCQl9Cj4gKwkJCWlmICh1dWlkX2luZGV4ID49IHNrbC0+bnJf
bW9kdWxlcykgewo+ICsJCQkJZGV2X2VycihkZXYsICJUb28gbWFueSBVVUlEIHRva2Vuc1xuIik7
Cj4gKwkJCQlyZXR1cm4gLUVJTlZBTDsKPiArCQkJfQo+ICsJCQlndWlkX2NvcHkoJnNrbC0+bW9k
dWxlc1t1dWlkX2luZGV4KytdLT51dWlkLAo+ICsJCQkJICAoZ3VpZF90ICopJmFycmF5LT51dWlk
LT51dWlkKTsKPiAgIAo+ICAgCQkJdHVwbGVfc2l6ZSArPSBzaXplb2YoKmFycmF5LT51dWlkKTsK
PiAgIAkJCWNvbnRpbnVlOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
