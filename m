Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D7155B58
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 17:04:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04CFC16A5;
	Fri,  7 Feb 2020 17:03:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04CFC16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581091463;
	bh=NkG5JCRruSgsdvXT8Vg8ES3fZGx+No/656PmT3bSuSc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ccxg1F7Ih6wdSOUf1uPLJmTHUh+6cYoJPDfY7S8K4nBgo5ySkNq0f6sNCOtcuZOex
	 vUq/mzCYWytX26tt1K9oXsljaQYKaH50unt4OXN5V87MuMBOEiohhnC7C4w6RfEVap
	 C4WHaYPwx44BLb0GhOwV4AJLa+SBQNireZPcMRzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 053A2F80142;
	Fri,  7 Feb 2020 17:02:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63EB1F80148; Fri,  7 Feb 2020 17:02:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 011CCF800B2
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 17:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 011CCF800B2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 08:02:31 -0800
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="225417280"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.153.89])
 ([10.249.153.89])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 Feb 2020 08:02:29 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20200207161533.22290-1-amadeuszx.slawinski@linux.intel.com>
 <s5hv9oih1ey.wl-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <c798da7e-df69-14f7-d661-7a39cf44d06f@linux.intel.com>
Date: Fri, 7 Feb 2020 17:02:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <s5hv9oih1ey.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Guenter Roeck <groeck@chromium.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: uapi: Replace __packed with
 __attribute__((packed))
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

T24gMi83LzIwMjAgNDoxNyBQTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIEZyaSwgMDcgRmVi
IDIwMjAgMTc6MTU6MzMgKzAxMDAsCj4gQW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6Cj4+Cj4+
IFVzZXJzcGFjZSBkb2Vzbid0IGtub3cgd2hhdCBfX3BhY2tlZCBpcywgY2hhbmdlIGl0IHRvCj4+
IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpLCBsaWtlIGluIHRoZSByZXN0IG9mIGEgaGVhZGVyLgo+
Pgo+PiBGaXhlczogMzQ4ZjQ4MjIwYjk3IChBU29DOiB0b3BvbG9neTogTW92ZSB2NCBtYW5pZmVz
dCBoZWFkZXIgZGF0YSBzdHJ1Y3R1cmVzIHRvIHVhcGkpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFt
YWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4K
PiAKPiBJcyBpdCBhIGdlbmVyYWwgY29uc2Vuc3VzIHRoYXQgd2UgaGF2ZSB0byByZXBsYWNlIHRo
YXQ/CgpXZWxsLCBpdCBhbGlnbnMgdGhlIHBhY2tlZCBzdHJ1Y3RzIGRlZmluaXRpb24gd2l0aCB0
aGUgcmVzdCBvZiB0aGUgZmlsZSAKYW5kIHRoZSBwcm9ncmFtIEkgdHJpZWQgY29tcGlsaW5nIGJ1
aWx0IGZpbmUgYWZ0ZXIgdGhpcyBhZGp1c3RtZW50LgoKQXMgSSB1bmRlcnN0YW5kLCB1YXBpIGZp
bGVzIGFyZSB1c3VhbGx5IGluc3RhbGxlZCBieSAKc2NyaXB0cy9oZWFkZXJzX2luc3RhbGwucGws
IHdoaWNoIHRha2VzIGNhcmUgb2YgcmVwbGFjaW5nIF9fcGFja2VkIHdpdGggCl9fYXR0cmlidXRl
KChwYWNrZWQpKS4gSG93ZXZlciBpZiBJIGRvICdtYWtlIGluc3RhbGwnIGluIGFsc2EtbGliIGl0
IApzZWVtcyB0byBpbnN0YWxsIHRoaXMgb25lIGhlYWRlciBjb250YWluaW5nIF9fcGFja2VkLgpJ
biB0aGVvcnkgYWxzYS1saWIgYWxzbyBpbnN0YWxscyAvdXNyL2luY2x1ZGUvYWxzYS9zb3VuZC90
eXBlX2NvbXBhdC5oCmJ1dCB0byBtZSBpdCBzZWVtcyBtb3JlIGxpa2UgYSB3b3JrYXJvdW5kIGlm
IEkgY2FuIGhhdmUgd29ya2luZyBoZWFkZXIgCndpdGhvdXQgYWRkaXRpb25hbCBpbmNsdWRlcy4K
QWxzbyB3aGlsZSB0aGVyZSBpcyBhIGZldyBtb3JlIGhlYWRlcnMgaW4ga2VybmVsIHdpdGggX19w
YWNrZWQsIHRoaXMgb25lIAppcyB0aGUgb25seSBvbmUgaW5jbHVkZWQgaW4gYWxzYS1saWIgYW5k
IGJlaW5nIGluc3RhbGxlZCBieSBpdDoKCiQgcHdkCi4uLi9hbHNhLWxpYgokIGdyZXAgLVJJIF9f
cGFja2VkICoKaW5jbHVkZS9zb3VuZC90eXBlX2NvbXBhdC5oOiNpZm5kZWYgX19wYWNrZWQKaW5j
bHVkZS9zb3VuZC90eXBlX2NvbXBhdC5oOiNkZWZpbmUgX19wYWNrZWQgX19hdHRyaWJ1dGVfXygo
cGFja2VkKSkKaW5jbHVkZS9zb3VuZC91YXBpL2Fzb2MuaDp9IF9fcGFja2VkOwppbmNsdWRlL3Nv
dW5kL3VhcGkvYXNvYy5oOn0gX19wYWNrZWQ7CmluY2x1ZGUvc291bmQvdWFwaS9hc29jLmg6fSBf
X3BhY2tlZDsKaW5jbHVkZS9zb3VuZC91YXBpL2Fzb2MuaDp9IF9fcGFja2VkOwokIHB3ZAouLi4v
bGludXgKJCBncmVwIC1SSSBfX3BhY2tlZCBpbmNsdWRlL3VhcGkvc291bmQKaW5jbHVkZS91YXBp
L3NvdW5kL2Fzb2MuaDp9IF9fcGFja2VkOwppbmNsdWRlL3VhcGkvc291bmQvYXNvYy5oOn0gX19w
YWNrZWQ7CmluY2x1ZGUvdWFwaS9zb3VuZC9hc29jLmg6fSBfX3BhY2tlZDsKaW5jbHVkZS91YXBp
L3NvdW5kL2Fzb2MuaDp9IF9fcGFja2VkOwppbmNsdWRlL3VhcGkvc291bmQvc29mL2Z3Lmg6fSBf
X3BhY2tlZDsKaW5jbHVkZS91YXBpL3NvdW5kL3NvZi9mdy5oOn0gX19wYWNrZWQ7CmluY2x1ZGUv
dWFwaS9zb3VuZC9zb2YvZncuaDp9IF9fcGFja2VkOwppbmNsdWRlL3VhcGkvc291bmQvc29mL2hl
YWRlci5oOn0gIF9fcGFja2VkOwppbmNsdWRlL3VhcGkvc291bmQvc2tsLXRwbGctaW50ZXJmYWNl
Lmg6fSBfX3BhY2tlZDsKaW5jbHVkZS91YXBpL3NvdW5kL3NrbC10cGxnLWludGVyZmFjZS5oOn0g
X19wYWNrZWQ7CmluY2x1ZGUvdWFwaS9zb3VuZC9za2wtdHBsZy1pbnRlcmZhY2UuaDp9IF9fcGFj
a2VkOwppbmNsdWRlL3VhcGkvc291bmQvc2tsLXRwbGctaW50ZXJmYWNlLmg6fSBfX3BhY2tlZDsK
aW5jbHVkZS91YXBpL3NvdW5kL3NrbC10cGxnLWludGVyZmFjZS5oOn0gX19wYWNrZWQ7CmluY2x1
ZGUvdWFwaS9zb3VuZC9za2wtdHBsZy1pbnRlcmZhY2UuaDp9IF9fcGFja2VkOwokIGdyZXAgLVJJ
IF9fcGFja2VkIGluY2x1ZGUvdWFwaS9zb3VuZCB8IHdjIC1sCjE0CiQgZ3JlcCAtUkkgX19hdHRy
aWJ1dGVfX1woXChwYWNrZWQgaW5jbHVkZS91YXBpL3NvdW5kIHwgd2MgLWwKNDAKCkkgd291bGQg
c2F5IGl0IGlzIGJldHRlciB0byBiZSBjb25zaXN0ZW50LgoKID4gVXNlcnNwYWNlIGRvZXNuJ3Qg
a25vdyBvZiBfX3UxNiB1bmxlc3MgaXQncyBkZWZpbmVkLCBlaXRoZXIsIGZvcgogPiBleGFtcGxl
LgoKVGhlIGhlYWRlciBpdHNlbGYgaGFzIDxsaW51eC90eXBlcy5oPiBpbmNsdWRlIHdoaWNoIHNl
ZW1zIHRvIGJlIGVub3VnaCAKdG8gdGFrZSBjYXJlIG9mIGludGVnZXIgdHlwZSBkZWZpbml0aW9u
cy4KCkFtYWRldXN6Cgo+IAo+IHRoYW5rcywKPiAKPiBUYWthc2hpCj4gCj4+IC0tLQo+PiAgIGlu
Y2x1ZGUvdWFwaS9zb3VuZC9hc29jLmggfCA4ICsrKystLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9zb3VuZC9hc29jLmggYi9pbmNsdWRlL3VhcGkvc291bmQvYXNvYy5oCj4+IGluZGV4
IDYwNDg1NTNjMTE5ZC4uMWFlOGIwNjY5MWNiIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL3VhcGkv
c291bmQvYXNvYy5oCj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9zb3VuZC9hc29jLmgKPj4gQEAgLTU4
Niw3ICs1ODYsNyBAQCBzdHJ1Y3Qgc25kX3NvY190cGxnX21hbmlmZXN0X3Y0IHsKPj4gICAJX19s
ZTMyIHBjbV9lbGVtczsJLyogbnVtYmVyIG9mIFBDTSBlbGVtZW50cyAqLwo+PiAgIAlfX2xlMzIg
ZGFpX2xpbmtfZWxlbXM7CS8qIG51bWJlciBvZiBEQUkgbGluayBlbGVtZW50cyAqLwo+PiAgIAlz
dHJ1Y3Qgc25kX3NvY190cGxnX3ByaXZhdGUgcHJpdjsKPj4gLX0gX19wYWNrZWQ7Cj4+ICt9IF9f
YXR0cmlidXRlKChwYWNrZWQpKTsKPj4gICAKPj4gICAvKiBTdHJlYW0gQ2FwYWJpbGl0aWVzIHY0
ICovCj4+ICAgc3RydWN0IHNuZF9zb2NfdHBsZ19zdHJlYW1fY2Fwc192NCB7Cj4+IEBAIC02MDQs
NyArNjA0LDcgQEAgc3RydWN0IHNuZF9zb2NfdHBsZ19zdHJlYW1fY2Fwc192NCB7Cj4+ICAgCV9f
bGUzMiBwZXJpb2Rfc2l6ZV9tYXg7CS8qIG1heCBwZXJpb2Qgc2l6ZSBieXRlcyAqLwo+PiAgIAlf
X2xlMzIgYnVmZmVyX3NpemVfbWluOwkvKiBtaW4gYnVmZmVyIHNpemUgYnl0ZXMgKi8KPj4gICAJ
X19sZTMyIGJ1ZmZlcl9zaXplX21heDsJLyogbWF4IGJ1ZmZlciBzaXplIGJ5dGVzICovCj4+IC19
IF9fcGFja2VkOwo+PiArfSBfX2F0dHJpYnV0ZSgocGFja2VkKSk7Cj4+ICAgCj4+ICAgLyogUENN
IHY0ICovCj4+ICAgc3RydWN0IHNuZF9zb2NfdHBsZ19wY21fdjQgewo+PiBAQCAtNjE5LDcgKzYx
OSw3IEBAIHN0cnVjdCBzbmRfc29jX3RwbGdfcGNtX3Y0IHsKPj4gICAJc3RydWN0IHNuZF9zb2Nf
dHBsZ19zdHJlYW0gc3RyZWFtW1NORF9TT0NfVFBMR19TVFJFQU1fQ09ORklHX01BWF07IC8qIGZv
ciBEQUkgbGluayAqLwo+PiAgIAlfX2xlMzIgbnVtX3N0cmVhbXM7CS8qIG51bWJlciBvZiBzdHJl
YW1zICovCj4+ICAgCXN0cnVjdCBzbmRfc29jX3RwbGdfc3RyZWFtX2NhcHNfdjQgY2Fwc1syXTsg
LyogcGxheWJhY2sgYW5kIGNhcHR1cmUgZm9yIERBSSAqLwo+PiAtfSBfX3BhY2tlZDsKPj4gK30g
X19hdHRyaWJ1dGUoKHBhY2tlZCkpOwo+PiAgIAo+PiAgIC8qIFBoeXNpY2FsIGxpbmsgY29uZmln
IHY0ICovCj4+ICAgc3RydWN0IHNuZF9zb2NfdHBsZ19saW5rX2NvbmZpZ192NCB7Cj4+IEBAIC02
MjcsNiArNjI3LDYgQEAgc3RydWN0IHNuZF9zb2NfdHBsZ19saW5rX2NvbmZpZ192NCB7Cj4+ICAg
CV9fbGUzMiBpZDsgICAgICAgICAgICAgIC8qIHVuaXF1ZSBJRCAtIHVzZWQgdG8gbWF0Y2ggKi8K
Pj4gICAJc3RydWN0IHNuZF9zb2NfdHBsZ19zdHJlYW0gc3RyZWFtW1NORF9TT0NfVFBMR19TVFJF
QU1fQ09ORklHX01BWF07IC8qIHN1cHBvcnRlZCBjb25maWdzIHBsYXliYWNrIGFuZCBjYXB0cnVy
ZSAqLwo+PiAgIAlfX2xlMzIgbnVtX3N0cmVhbXM7ICAgICAvKiBudW1iZXIgb2Ygc3RyZWFtcyAq
Lwo+PiAtfSBfX3BhY2tlZDsKPj4gK30gX19hdHRyaWJ1dGUoKHBhY2tlZCkpOwo+PiAgIAo+PiAg
ICNlbmRpZgo+PiAtLSAKPj4gMi4xNy4xCj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+IEFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCg==
