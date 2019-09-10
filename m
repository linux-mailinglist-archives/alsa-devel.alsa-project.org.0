Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A1AECE9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 16:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D909A1698;
	Tue, 10 Sep 2019 16:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D909A1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568125522;
	bh=3X73znnovKHrJO6k749xewGDpwwolCEH4bdsetGOGX8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6oHTPtKhc4MuEvI2tJtqbqHmdgmf9gr0iJdzndj8MwhAC9MQaik/xNLxWi9ekfVQ
	 pI+WXxCCbeD7yH8MKWSOvL5VPH4L3XOw3oFaNzL01qmkeNVwP1Va+Xi2cr3d4gzhk4
	 Z3NSks+7TK3EdVFkxZGmLrq1V9LfuJgGsfYnKG2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71604F80368;
	Tue, 10 Sep 2019 16:23:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DB3BF80368; Tue, 10 Sep 2019 16:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63A39F800E9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 16:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63A39F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pG7XsAxQ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AENTNK087913;
 Tue, 10 Sep 2019 09:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568125409;
 bh=Yho7vZhG1MfMKKocmFXZE8u1ypx5Toq+oTxGTrZMGYI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pG7XsAxQETNOU2wFv04Xgd8GLILM2+DR+i1/gsR8Hnwv6DI5Oj+iVUCD82oA5T9im
 OT0M6N7NT5JuLLwuS7K+vo9NpLLeE5dK/vVO4/sBQJgWszMsprmmdLVzJoAxw6gEnB
 JIT+EzgcGLMwtMNR7lECmPyoEDWOT21HhDFW87WI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AENTb3031052
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Sep 2019 09:23:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 09:23:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 09:23:29 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AENRTG007328;
 Tue, 10 Sep 2019 09:23:27 -0500
To: Takashi Iwai <tiwai@suse.de>
References: <20190906055524.7393-1-peter.ujfalusi@ti.com>
 <s5hblvs8idi.wl-tiwai@suse.de>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <f3ec79a0-e204-c5df-9fc4-e5d0465f678f@ti.com>
Date: Tue, 10 Sep 2019 17:23:59 +0300
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
MjAzNjg1NDc3NTgwOF0gWy1XcmVzdHJpY3RdCgpJIGhhdmUgbm90IHNlZW4gc3VjaCBhIHdhcm5p
bmcuCidtYXkgb3ZlcmxhcCB1cCB0byAwIGJ5dGVzJyA/CnNuZF9wY21faW5mbyB7Ci4uLgogICAg
ICAgIHVuc2lnbmVkIGNoYXIgaWRbNjRdOyAgICAgICAgICAgLyogSUQgKHVzZXIgc2VsZWN0YWJs
ZSkgKi8KICAgICAgICB1bnNpZ25lZCBjaGFyIG5hbWVbODBdOyAgICAgICAgIC8qIG5hbWUgb2Yg
dGhpcyBkZXZpY2UgKi8KICAgICAgICB1bnNpZ25lZCBjaGFyIHN1Ym5hbWVbMzJdOyAgICAgIC8q
IHN1YmRldmljZSBuYW1lICovCi4uLgp9OwoKYW5kIHN0cm5jcHkoKSBzdXBwb3NlZCB0byBiZSBz
b21ldGhpbmcgbGlrZSB0aGlzOgpjaGFyICogc3RybmNweShjaGFyICpkZXN0LCBjb25zdCBjaGFy
ICpzcmMsIHNpemVfdCBuKQp7CglzaXplX3QgaTsKCglmb3IgKGkgPSAwOyBpIDwgbiAmJiBzcmNb
aV0gIT0gJ1wwJzsgaSsrKQoJCWRlc3RbaV0gPSBzcmNbaV07Cglmb3IgKCA7IGkgPCBuOyBpKysp
CgkJZGVzdFtpXSA9ICdcMCc7CgoJcmV0dXJuIGRlc3Q7Cn0KCkkgY2FuIHNlZSBpZiBJIGNhbiBn
ZXQgbXkgY29tcGlsZXJzIHRvIHNob3cgdGhlIHdhcm5pbmcgYW5kIHRyeQpzdHJzY3B5KCkgaWYg
aXQgaGVscHMgb24gaXQuCgo+IAo+IAo+IFRha2FzaGkKPiAKPj4gIAo+PiAgCXJldHVybiAwOwo+
PiAtLSAKPj4gUGV0ZXIKPj4KPj4gVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuCj4+IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IEFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+PiBodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKPj4KCi0gUMOpdGVyCgpU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
