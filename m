Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC5FAF69D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 09:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8130C16FB;
	Wed, 11 Sep 2019 09:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8130C16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568186660;
	bh=lnBoBND3jDwFr6ocyxAo0i3KpDsvwzecIXs4EAHOsk8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bB49fnUvP0Bxw/lWPgRcvlFMaRKbA1LfMa1fZXg4LDau4j6OBU/3kDxJunhKQpWc9
	 3fB+Ra26utx0U2z+NOGU7tTq5RMF1ilxjONyWePjyb2HuiBI+pIIS4rneePYC//MoE
	 UFHpzR27YOao/Nr5SS2YAUT4q51MPMj+ygG5ePjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6157F8044B;
	Wed, 11 Sep 2019 09:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD60F80323; Wed, 11 Sep 2019 09:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8B1BF800A9
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 09:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B1BF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bo0180qW"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8B7MQWf016939;
 Wed, 11 Sep 2019 02:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568186546;
 bh=Oyp3XcNI8qIYI8c1InjTsDNTzsqiUkGpFB+AeJPwIJc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Bo0180qW0P4GDEIpb8Lw9t+xsQU9bEHB0Wirg0lo+bUIprzpxd6ba1/yRa/HVd1jt
 PJWCRJ+4Z5bLcazNfsa3zhfDWfdC4R46ndPOu8QzEhP5ub/WrILXIGC6VCQkJ6PlFF
 lGi5vXMCgdHZyFmLx+eNvrRnginBDwt2lfO6s5gA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8B7MQRw116995
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Sep 2019 02:22:26 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 02:22:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 02:22:23 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8B7ML5M081303;
 Wed, 11 Sep 2019 02:22:22 -0500
To: Takashi Iwai <tiwai@suse.de>
References: <20190906055524.7393-1-peter.ujfalusi@ti.com>
 <s5hblvs8idi.wl-tiwai@suse.de>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <cbc3868a-6f0b-ca4a-671f-fc552181d2f3@ti.com>
Date: Wed, 11 Sep 2019 10:22:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hblvs8idi.wl-tiwai@suse.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 arthur.she@linaro.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dmaengine: Make the pcm->name equal
 to pcm->id if the name is not set
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

CgpPbiAxMC8wOS8yMDE5IDE1LjA3LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gRnJpLCAwNiBT
ZXAgMjAxOSAwNzo1NToyNCArMDIwMCwKPiBQZXRlciBVamZhbHVzaSB3cm90ZToKPj4KPj4gU29t
ZSB0b29scyB1c2UgdGhlIHNuZF9wY21faW5mb19nZXRfbmFtZSgpIHRvIHRyeSB0byBpZGVudGlm
eSBQQ01zIG9yIGZvcgo+PiBvdGhlciBwdXJwb3Nlcy4KPj4KPj4gQ3VycmVudGx5IGl0IGlzIGxl
ZnQgZW1wdHkgd2l0aCB0aGUgZG1hZW5naW5lLXBjbSwgaW4gdGhpcyBjYXNlIGNvcHkgdGhlCj4+
IHBjbS0+aWQgc3RyaW5nIGFzIHBjbS0+bmFtZS4KPj4KPj4gRm9yIGV4YW1wbGUgSUdUIGlzIHVz
aW5nIHRoaXMgdG8gZmluZCB0aGUgSERNSSBQQ00gZm9yIHRlc3RpbmcgYXVkaW8gb24gaXQuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+
Cj4+IFJlcG9ydGVkLWJ5OiBBcnRodXIgU2hlIDxhcnRodXIuc2hlQGxpbmFyby5vcmc+Cj4+IC0t
LQo+PiBIaSwKPj4KPj4gdGhpcyB3YXMgYWN0dWFsbHkgcmVwb3J0ZWQgZm9yIDQuMTQga2VybmVs
IHdpdGggb21hcC1wY20gKHJlcGxhY2VkIGJ5IHNkbWEtcGNtCj4+IGluIHY0LjE4KSwgc2luY2Ug
dGhlbiB3ZSBvbmx5IHVzZSB0aGUgZ2VuZXJpYyBkbWFlbmdpbmUgUENNIGJ1dCB0aGUgc2FtZSBp
c3N1ZQo+PiBhcHBsaWVzIHRvZGF5Lgo+Pgo+PiBSZWdhcmRzLAo+PiBQZXRlcgo+Pgo+PiAgc291
bmQvc29jL3NvYy1nZW5lcmljLWRtYWVuZ2luZS1wY20uYyB8IDYgKysrKysrCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29j
LWdlbmVyaWMtZG1hZW5naW5lLXBjbS5jIGIvc291bmQvc29jL3NvYy1nZW5lcmljLWRtYWVuZ2lu
ZS1wY20uYwo+PiBpbmRleCA3NDhmNWY2NDEwMDIuLmQ5M2RiMmMyYjUyNyAxMDA2NDQKPj4gLS0t
IGEvc291bmQvc29jL3NvYy1nZW5lcmljLWRtYWVuZ2luZS1wY20uYwo+PiArKysgYi9zb3VuZC9z
b2Mvc29jLWdlbmVyaWMtZG1hZW5naW5lLXBjbS5jCj4+IEBAIC0zMDYsNiArMzA2LDEyIEBAIHN0
YXRpYyBpbnQgZG1hZW5naW5lX3BjbV9uZXcoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0
ZCkKPj4gIAo+PiAgCQlpZiAoIWRtYWVuZ2luZV9wY21fY2FuX3JlcG9ydF9yZXNpZHVlKGRldiwg
cGNtLT5jaGFuW2ldKSkKPj4gIAkJCXBjbS0+ZmxhZ3MgfD0gU05EX0RNQUVOR0lORV9QQ01fRkxB
R19OT19SRVNJRFVFOwo+PiArCj4+ICsJCWlmIChydGQtPnBjbS0+c3RyZWFtc1tpXS5wY20tPm5h
bWVbMF0gPT0gJ1wwJykgewo+PiArCQkJc3RybmNweShydGQtPnBjbS0+c3RyZWFtc1tpXS5wY20t
Pm5hbWUsCj4+ICsJCQkJcnRkLT5wY20tPnN0cmVhbXNbaV0ucGNtLT5pZCwKPj4gKwkJCQlzaXpl
b2YocnRkLT5wY20tPnN0cmVhbXNbaV0ucGNtLT5uYW1lKSk7Cj4+ICsJCX0KPiAKPiBBbnkgcmVh
c29uIHRvIHVzZSBzdHJuY3B5KCkgaW5zdGVhZCBvZiBzdHJzY3B5KCk/Cj4gQWZ0ZXIgbWVyZ2lu
ZyBNYXJrJ3MgYnJhbmNoLCBJIGdvdCBhIGNvbXBpbGUgd2FybmluZyBsaWtlOgo+ICAgc291bmQv
c29jL3NvYy1nZW5lcmljLWRtYWVuZ2luZS1wY20uYzozMTE6NDogd2FybmluZzogJ3N0cm5jcHkn
Cj4gICBhY2Nlc3NpbmcgODAgYnl0ZXMgYXQgb2Zmc2V0cyA4OCBhbmQgMjQgbWF5IG92ZXJsYXAg
dXAgdG8gMCBieXRlcyBhdAo+ICAgb2Zmc2V0IFs5MjIzMzcyMDM2ODU0Nzc1ODA3LCAtOTIyMzM3
MjAzNjg1NDc3NTgwOF0gWy1XcmVzdHJpY3RdCgpmd2l3IEkgcnVuIGl0IGFnYWluIHdpdGggc3Bh
cnNlIGFuZCBpdCBvbmx5IHJlcG9ydHMgdGhlc2U6CiBDSEVDSyAgIHNvdW5kL3NvYy9zb2MtZ2Vu
ZXJpYy1kbWFlbmdpbmUtcGNtLmMKc291bmQvc29jL3NvYy1nZW5lcmljLWRtYWVuZ2luZS1wY20u
YzoxNzc6NDI6IHdhcm5pbmc6IHJlc3RyaWN0ZWQgc25kX3BjbV9mb3JtYXRfdCBkZWdyYWRlcyB0
byBpbnRlZ2VyCnNvdW5kL3NvYy9zb2MtZ2VuZXJpYy1kbWFlbmdpbmUtcGNtLmM6MTc3OjQ3OiB3
YXJuaW5nOiByZXN0cmljdGVkIHNuZF9wY21fZm9ybWF0X3QgZGVncmFkZXMgdG8gaW50ZWdlcgpz
b3VuZC9zb2Mvc29jLWdlbmVyaWMtZG1hZW5naW5lLXBjbS5jOjE3Nzo3MTogd2FybmluZzogcmVz
dHJpY3RlZCBzbmRfcGNtX2Zvcm1hdF90IGRlZ3JhZGVzIHRvIGludGVnZXIKICBDQyAgICAgIHNv
dW5kL3NvYy9zb2MtZ2VuZXJpYy1kbWFlbmdpbmUtcGNtLm8KCmdjYyA2LjQuMC4uLjkuMi4wCnNw
YXJzZSAwLjYuMAoKPiAKPiAKPiBUYWthc2hpCj4gCj4+ICAKPj4gIAlyZXR1cm4gMDsKPj4gLS0g
Cj4+IFBldGVyCj4+Cj4+IFRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmth
dHUgMjIsIDAwMTgwIEhlbHNpbmtpLgo+PiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00
LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQo+Pgo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+
PiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCj4+CgotIFDDqXRlcgoKVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
