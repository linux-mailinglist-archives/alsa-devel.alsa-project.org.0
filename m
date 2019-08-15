Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46D8E75B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 10:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3D7C165D;
	Thu, 15 Aug 2019 10:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3D7C165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565858963;
	bh=i8A9AgTwJFu5GoID9C1FQz6BXP7oEwc7blmbCxbDFC8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amC9F0gIwtp1Gn7xsGH+XwRN38HVufL2/P5VUonmr/PmZvyoEstAfgPjkaJQFhCU2
	 6aDqfCPIVTpWTvL7LNuNlebSRyKElLFiZNM8h1oV2wka7xJjYYPo9afbBGxZGxYDcs
	 GgleZEHIHel92bBIg5vTYxyHEsgRjL2SyK2iMkAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F389F80274;
	Thu, 15 Aug 2019 10:47:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3746DF80274; Thu, 15 Aug 2019 10:47:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF1E9F801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF1E9F801DF
Received: from [114.252.209.139] (helo=[192.168.1.108])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hyBPx-0007AW-1w; Thu, 15 Aug 2019 08:47:33 +0000
To: alsa-devel@alsa-project.org, tiwai@suse.de
References: <20190815083001.3793-1-hui.wang@canonical.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <27ec2712-abdf-6387-8f3d-995e14636fdd@canonical.com>
Date: Thu, 15 Aug 2019 16:47:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815083001.3793-1-hui.wang@canonical.com>
Content-Language: en-US
Cc: stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] ALSA: hda - Add a new match function
 for only undef configurations
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

U29ycnksIHBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaHNldCwgZG9uJ3QgcGxhbiB0byBzZW5kIHRo
aXMgcGF0Y2hzZXQgdG8gCnN0YWJsZSBhbmQgdGhlcmUgaXMgc29tZSBpc3N1ZSBpbiB0aGUgcGF0
Y2gsIHdpbGwgc2VuZCB2Mi4KCk9uIDIwMTkvOC8xNSDkuIvljYg0OjMwLCBIdWkgV2FuZyB3cm90
ZToKPiBXaXRoIHRoZSBleGlzdGluZyBwaW50YmwsIHdlIGFscmVhZHkgaGF2ZSBtYW55IGVudHJp
ZXMgaW4gaXQuIGl0IGlzCj4gYmV0dGVyIHRvIGZpZ3VyZSBvdXQgYSBuZXcgbWF0Y2ggdG8gcmVk
dWNlIHRoZSBzaXplIG9mIHRoZSBwaW50YmwuCj4KPiBGb3IgZXhhbXBsZSwgdGhlcmUgYXJlIG92
ZXIgMTAgZW50cmllcyBpbiB0aGUgcGludGJsIGZvcjoKPiAweDEwZWMwMjU1LCAweDEwMjgsICJE
ZWxsIiwgQUxDMjU1X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRQo+Cj4gSWYgd2UgZGVmaW5l
IGEgbmV3IHRibCBsaWtlIGJlbG93LCBhbmQgd2l0aCB0aGUgbmV3IGFkZGluZyBtYXRjaAo+IGZ1
bmN0aW9uLCB3ZSBjYW4gcmVtb3ZlIHRob3NlIG92ZXIgMTAgZW50cmllczoKPiBTTkRfSERBX1BJ
Tl9RVUlSSygweDEwZWMwMjU1LCAweDEwMjgsICJEZWxsIiwgQUxDMjU1X0ZJWFVQX0RFTEwxX01J
Q19OT19QUkVTRU5DRSwKPiAJezB4MTksIDB4NDAwMDAwMDB9LAo+IAl7MHgxYSwgMHg0MDAwMDAw
MH0sKSwKPgo+IEhlcmUgd2UgcHV0IDB4MTkgYW5kIDB4MWEgaW4gdGhlIHRibCBqdXN0IGJlY2F1
c2UgdGhlc2UgdHdvIHBpbnMgYXJlCj4gdW5kZWZpbmVkIG9uIERlbGwgbGFwdG9wcyB3aXRoIHRo
ZSBjb2RlYyBhbGMyNTUsIGFuZCB0aGVzZSB0d28gcGlucwo+IHdpbGwgYmUgb3ZlcndyaXR0ZW4g
YnkgQUxDMjU1X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRS4KPgo+IEluIHN1bW1hcnk6IHRo
ZSBuZXcgbWF0Y2ggd2lsbCBjaGVjayB2ZW5kb3IgaWQgYW5kIGNvZGVjIGlkIGZpcnN0LAo+IHRo
ZW4gY2hlY2sgdGhlIHBpbl9jZmcgZGVmaW5lZCBpbiB0aGUgdGJsLCBvbmx5IGFsbCBwaW5fY2Zn
cyBpbiB0aGUKPiB0YmwgYXJlIHVuZGVmIGFuZCB0aGUgY29ycmVzcG9uZGluZyBwaW5fY2ZncyBv
biB0aGUgbGFwdG9wIGFyZSB1bmRlZgo+IHRvbywgdGhpcyBtYXRjaCByZXR1cm5zIHRydWUuCj4K
PiBUaGlzIG5ldyBtYXRjaCBmdW5jdGlvbiBoYXMgbG93ZXIgcHJpb3JpdHkgdGhhbiBleGlzdGlu
ZyBtYXRjaAo+IGZ1bmN0aW9ucywgc28gdGhlIGV4aXN0aW5nIHRibHMgc3RpbGwgd29yayBhcyBi
ZWZvcmUgYWZ0ZXIgYXBwbHlpbmcgdGhpcwo+IHBhdGNoLgo+Cj4gTXkgcGxhbiBpcyB0byBjaGFu
Z2UgdGhlIGV4aXN0aW5nIHRibCB0byB1bmRlZiB0YmwgZm9yIE1JQ19OT19QUkVTRU5DRQo+IGZp
eHVwcyBncmFkdWFsbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIdWkgV2FuZyA8aHVpLndhbmdAY2Fu
b25pY2FsLmNvbT4KPiAtLS0KPiAgIHNvdW5kL3BjaS9oZGEvaGRhX2F1dG9fcGFyc2VyLmMgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9zb3VuZC9wY2kv
aGRhL2hkYV9hdXRvX3BhcnNlci5jIGIvc291bmQvcGNpL2hkYS9oZGFfYXV0b19wYXJzZXIuYwo+
IGluZGV4IDkyMzkwZDQ1NzU2Ny4uY2ZhZGE3NDAxYjg2IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3Bj
aS9oZGEvaGRhX2F1dG9fcGFyc2VyLmMKPiArKysgYi9zb3VuZC9wY2kvaGRhL2hkYV9hdXRvX3Bh
cnNlci5jCj4gQEAgLTkxNSw2ICs5MTUsMzYgQEAgc3RhdGljIGJvb2wgcGluX2NvbmZpZ19tYXRj
aChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKPiAgIAlyZXR1cm4gdHJ1ZTsKPiAgIH0KPiAgIAo+
ICsvKiBtYXRjaCB0aGUgcGludGJsIHdoaWNoIG9ubHkgY29udGFpbnMgc3BlY2lmaWMgcGlucyB3
aXRoIHVuZGVmIGNvbmZpZ3VyYXRpb24gKi8KPiArc3RhdGljIGJvb2wgcGluX2NvbmZpZ19tYXRj
aF91bmRlZihzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKPiArCQkJCSAgIGNvbnN0IHN0cnVjdCBo
ZGFfcGludGJsICpwaW5zKQo+ICt7Cj4gKwlib29sIG1hdGNoID0gZmFsc2U7Cj4gKwo+ICsJZm9y
ICg7IHBpbnMtPm5pZDsgcGlucysrKSB7Cj4gKwkJY29uc3Qgc3RydWN0IGhkYV9waW5jZmcgKnBp
bjsKPiArCQlpbnQgaTsKPiArCj4gKwkJaWYgKChwaW5zLT52YWwgJiAweGYwMDAwMDAwKSAhPSAw
eDQwMDAwMDAwKQo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJCW1hdGNoID0gZmFsc2U7Cj4g
KwkJc25kX2FycmF5X2Zvcl9lYWNoKCZjb2RlYy0+aW5pdF9waW5zLCBpLCBwaW4pIHsKPiArCQkJ
aWYgKHBpbi0+bmlkICE9IHBpbnMtPm5pZCkKPiArCQkJCWNvbnRpbnVlOwo+ICsJCQlpZiAoKHBp
bi0+Y2ZnICYgMHhmMDAwMDAwMCkgIT0gMHg0MDAwMDAwMCkKPiArCQkJCXJldHVybiBmYWxzZTsK
PiArCQkJbWF0Y2ggPSB0cnVlOwo+ICsJCQlicmVhazsKPiArCQl9Cj4gKwo+ICsJCWlmIChtYXRj
aCA9PSBmYWxzZSkKPiArCQkJcmV0dXJuIGZhbHNlOwo+ICsJfQo+ICsKPiArCXJldHVybiBtYXRj
aDsKPiArfQo+ICsKPiAgIC8qKgo+ICAgICogc25kX2hkYV9waWNrX3Bpbl9maXh1cCAtIFBpY2sg
dXAgYSBmaXh1cCBtYXRjaGluZyB3aXRoIHRoZSBwaW4gcXVpcmsgbGlzdAo+ICAgICogQGNvZGVj
OiB0aGUgSERBIGNvZGVjCj4gQEAgLTkzNSw3ICs5NjUsNyBAQCB2b2lkIHNuZF9oZGFfcGlja19w
aW5fZml4dXAoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCj4gICAJCQljb250aW51ZTsKPiAgIAkJ
aWYgKGNvZGVjLT5jb3JlLnZlbmRvcl9pZCAhPSBwcS0+Y29kZWMpCj4gICAJCQljb250aW51ZTsK
PiAtCQlpZiAocGluX2NvbmZpZ19tYXRjaChjb2RlYywgcHEtPnBpbnMpKSB7Cj4gKwkJaWYgKHBp
bl9jb25maWdfbWF0Y2goY29kZWMsIHBxLT5waW5zKSB8fCBwaW5fY29uZmlnX21hdGNoX3VuZGVm
KGNvZGVjLCBwcS0+cGlucykpIHsKPiAgIAkJCWNvZGVjLT5maXh1cF9pZCA9IHBxLT52YWx1ZTsK
PiAgICNpZmRlZiBDT05GSUdfU05EX0RFQlVHX1ZFUkJPU0UKPiAgIAkJCWNvZGVjLT5maXh1cF9u
YW1lID0gcHEtPm5hbWU7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
