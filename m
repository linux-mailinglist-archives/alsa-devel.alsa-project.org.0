Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B40730BE
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 16:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2913F1944;
	Wed, 24 Jul 2019 16:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2913F1944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563976994;
	bh=xyV9RhNoLql01utAj1SB8g06BGNNi7jpQLdAuDtsXDs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XqvmA5wtWZz//Zff24befVkGYq+lprWo46pV7rIHnBcySk2ANYwLSFnBsvSM0m13q
	 kR6KS0ocI7BvxfwKx5KMk/tRwJqI1jErcYq27b4uzpp7+Wxh7D1o/WQv7YzgL1ia28
	 VY9XZVCsGpBss0btJulT8o6tCBC0p8XCc2vjtXVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77E33F8026F;
	Wed, 24 Jul 2019 16:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20C42F80368; Wed, 24 Jul 2019 16:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D93F8026F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 16:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D93F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w4UFlz7m"
Received: from localhost (unknown [171.76.105.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F2E9229ED;
 Wed, 24 Jul 2019 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563972244;
 bh=ra2RwQFmf43TULvRSzrGtoEDRXxhDN6qayUEA1P9i6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w4UFlz7mzJfldRqrmRxsgIz80UZbrv9ggOKimpplVGu5d22fnPriiTnnos8KPbg/3
 O6FqsoS87kXaqrj4e6g4E9+4gXunwXlXEEvfupE9d8gJ5c76uTphTTs9LBKiqj/TTV
 zT27/Y3lyk6+eqvaGY5XHxUxid66kDqt1+ybQhVg=
Date: Wed, 24 Jul 2019 18:12:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190724124250.GM12733@vkoul-mobl.Dlink>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723145854.8527-1-cezary.rojewski@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [RESEND PATCH v2 0/7] ASoC: Intel: Skylake: Driver
 fundaments overhaul
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

T24gMjMtMDctMTksIDE2OjU4LCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gU2t5bGFrZSBkcml2
ZXIgaXMgZGl2aWRlZCBpbnRvIHR3byBtb2R1bGVzOgo+IC0gc25kX3NvY19za2wKPiAtIHNuZF9z
b2Nfc2tsX2lwYwo+IAo+IGFuZCBub3RoaW5nIHdvdWxkIGJlIHdyb25nIGlmIG5vdCBmb3IgdGhl
IGZhY3QgdGhhdCBib3RoIGNhbm5vdCBleGlzdAo+IHdpdGhvdXQgb25lIGFub3RoZXIuIElQQyBt
b2R1bGUgaXMgbm90IHNvbWUga2luZCBvZiBleHRlbnNpb24sIGFzIGl0IGlzCj4gdGhlIGNhc2Ug
Zm9yIHNuZF9oZGFfZXh0X2NvcmUgd2hpY2ggaXMgc2VwYXJhdGVkIGZyb20gc25kX2hkYV9jb3Jl
IC0KPiBsZWdhY3kgaGRhIGludGVyZmFjZS4gSXQncyBhcyBtdWNoIGNvcmUgU2t5bGFrZSBtb2R1
bGUgYXMgc25kX3NvY19za2wKPiBpcy4KPiAKPiBTdGF0ZW1lbnQgYmFja3VwIGJ5IGV4aXN0ZW5j
ZSBvZiBjaXJjdWxhciBkZXBlbmRlbmN5IGJldHdlZW4gdGhpcyB0d28uCj4gVG8gZWxpbWluYXRl
IHNhaWQgcHJvYmxlbSwgc3RydWN0IHNrbF9zc3QgaGFzIGJlZW4gY3JlYXRlZC4gRnJvbSB0aGF0
Cj4gbW9tbWVudCwgU2t5bGFrZSBoYXMgYmVlbiBwbGFndWVkIGJ5IGhlYWRlciBlcnJvcnMgKGlu
Y29tcGxldGUgc3R1cmN0cywKPiB1bmtub3duIHJlZmVyZW5jZXMgZXRjLikgd2hlbmV2ZXIgc29t
ZXRoaW5nIG5ldyBpcyB0byBiZSBhZGRlZCBvciBjb2RlCj4gaXMgY2xlYW5lZCB1cC4KPiAKPiBG
aXggdGhpcyBmbGF3ZWQgZGVzaWduIGJ5IG1lcmdpbmcgc25kX3NvY19za2wgYW5kIHNuZF9zb2Nf
c2tsX2lwYy4KPiBBbHNvLCBkbyBub3QgZm9yZ2V0IGFib3V0IHN0cnVjdCBza2xfc3N0IHJlZHVu
ZGFuY3kuCj4gRm9sbG93dXAgY2hhbmdlcyBhZGRyZXNzIGhhcm1mdWwgYXNzdW1wdGlvbnMgYW5k
IGZhbHNlIGxvZ2ljIHdoaWNoCj4gZHJpdmVyIGN1cnJlbnRseSBpbXBsZW1lbnRzIGUuZy46IGF0
dGVtcHQgdG8gdGFrZSByb2xlIG9mIG1hc3RlciBmb3IKPiBEU1Agc2NoZWR1bGluZyB3aGVuIGlu
IGZhY3QgZW50aXJlIGNvbnRyb2wgdGFrZXMgcGxhY2UgaW4gRFNQLgo+IAo+IENoYW5nZXMgc2lu
Y2UgdjE6Cj4gLSBSZWJhc2VkIG9udG8gNS40CgpPbiBhIGxpZ2h0ZXIgbm90ZToKCkRpZCB0aGlz
IHNlcmllcyB0aW1lIHRyYXZlbCBmcm9tIHRoZSBmdXR1cmUhIERpZCB5b3UgY2hhcmdlIHRoZSBm
bHV4CmNhcGFjaXRvciB0byBnbyBiYWNrPwoKPiAKPiBBbWFkZXVzeiBTxYJhd2nFhHNraSAoMik6
Cj4gICBBU29DOiBJbnRlbDogU2t5bGFrZTogQ29tYmluZSBzbmRfc29jX3NrbF9pcGMgYW5kIHNu
ZF9zb2Nfc2tsCj4gICBBU29DOiBJbnRlbDogU2t5bGFrZTogRG8gbm90IGRpc2FibGUgRlcgbm90
aWZpY2F0aW9ucwo+IAo+IENlemFyeSBSb2pld3NraSAoNSk6Cj4gICBBU29DOiBJbnRlbDogU2t5
bGFrZTogTWVyZ2Ugc2tsX3NzdCBhbmQgc2tsIGludG8gc2tsX2RldiBzdHJ1Y3QKPiAgIEFTb0M6
IEludGVsOiBTa3lsYWtlOiBSZW1vdmUgTUNQUyBhdmFpbGFibGUgY2hlY2sKPiAgIEFTb0M6IElu
dGVsOiBTa3lsYWtlOiBSZW1vdmUgbWVtb3J5IGF2YWlsYWJsZSBjaGVjawo+ICAgQVNvQzogSW50
ZWw6IFNreWxha2U6IE1ha2UgTUNQUyBhbmQgQ1BTIHBhcmFtcyBvYnNvbGV0ZQo+ICAgQVNvQzog
SW50ZWw6IFNreWxha2U6IENsZWFudXAgc2tsX21vZHVsZV9jZmcgZGVjbGFyYXRpb24KPiAKPiAg
c291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmggICAgICAgIHwgICAxICsKPiAgc291bmQv
c29jL2ludGVsL3NreWxha2UvTWFrZWZpbGUgICAgICAgIHwgIDEyICstCj4gIHNvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL2J4dC1zc3QuYyAgICAgICB8ICA1MCArLS0KPiAgc291bmQvc29jL2ludGVs
L3NreWxha2UvY25sLXNzdC1kc3AuaCAgIHwgICA3ICstCj4gIHNvdW5kL3NvYy9pbnRlbC9za3ls
YWtlL2NubC1zc3QuYyAgICAgICB8ICAzNyArLQo+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtZGVidWcuYyAgICAgfCAgMTQgKy0KPiAgc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW1l
c3NhZ2VzLmMgIHwgMjQ1ICsrKysrKy0tLS0tLS0KPiAgc291bmQvc29jL2ludGVsL3NreWxha2Uv
c2tsLW5obHQuYyAgICAgIHwgIDE4ICstCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1w
Y20uYyAgICAgICB8ICA3NCArKy0tCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3At
Y2xrLmMgICB8ICAgNCArLQo+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LWRzcC5j
ICAgfCAgMTAgKy0KPiAgc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC1kc3AuaCAgIHwg
IDI5ICstCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3QtaXBjLmMgICB8ICAgOCAr
LQo+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LWlwYy5oICAgfCAgNTIgKy0tCj4g
IHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3QtdXRpbHMuYyB8ICAzNyArLQo+ICBzb3Vu
ZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LmMgICAgICAgfCAgNTEgKy0tCj4gIHNvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jICB8IDQ0MSArKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0KPiAgc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmggIHwgIDQzICst
LQo+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYyAgICAgICAgICAgfCAgNTQgKy0tCj4g
IHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5oICAgICAgICAgICB8IDEwMiArKysrLS0KPiAg
MjAgZmlsZXMgY2hhbmdlZCwgNTQ2IGluc2VydGlvbnMoKyksIDc0MyBkZWxldGlvbnMoLSkKPiAK
PiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCgotLSAKflZpbm9kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
