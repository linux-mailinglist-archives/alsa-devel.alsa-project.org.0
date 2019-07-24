Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB8F7305F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 15:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7E31938;
	Wed, 24 Jul 2019 15:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7E31938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563976693;
	bh=dKzNpYr9+IFvxRpeMtIjgCsBk4Az4qLMJhyFUFyV/CI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snhb0exZxnv7DmD2lb54au2jw/VoCTjyHGhHkmbo8sIVQ++I18rXgoNzwtE6PcMjI
	 XGBNz2Gx41efRjsGcUMWD1pnORHPNlkPVroNZ7lSwkYhnoDrc4QiDrbuB3nnpnZSL7
	 HlhyiSD+F6zaXAVcrMhbAPXwnJxza/JB6RjrDAqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 166A3F803D6;
	Wed, 24 Jul 2019 15:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02B14F803D1; Wed, 24 Jul 2019 15:56:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D750F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 15:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D750F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0bT/KuKS"
Received: from localhost (unknown [171.76.105.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49EEB22387;
 Wed, 24 Jul 2019 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563972019;
 bh=k6Ver8RYhkfiTWHzdQ6NwBRj98J1mPlEtrhsuFLEteI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0bT/KuKS7uy1ov0Rj+InSX+1NalFTSS1Y/a7/0Kj57j8eBYAMJjOlHrq4//+LvnYH
 DSWMhfZXDlgJNIypTayKs3enqv7uI2+nvFoUf7Fle7MRZtsT+uVF5W5ihIcB1xyRuN
 Q77KDrK7DuxPxViCW5RBK2+KOvb8Y9J6CkxL+mnM=
Date: Wed, 24 Jul 2019 18:09:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com
Message-ID: <20190724123906.GL12733@vkoul-mobl.Dlink>
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
bGUgYXMgc25kX3NvY19za2wKPiBpcy4KCldlbGwgaXQgaXMgYW4gZXh0ZW5zaW9uIGFzIGl0IHJl
cHJlc2VudHMgdGhlIHZpZXcgb2YgdGhlIGZpcm13YXJlIGFuZCB3ZQphbHdheXMgaGFkIG1vdmlu
ZyBJUENzISBFdmVuIHdoZW4gc2t5bGFrZSB3YXMgZGV2ZWxvcGVkIHdlIGhhZCB0d28KZGlmZmVy
ZW50IHZlcnNpb25zIGFuZCBldmVuIHdoZW4gaSBsZWZ0IHdlIGhhZCB0d28gKHNvZiBiZWluZyBv
dGhlciBvbmUKYXQgdGhhdCB0aW1lKQoKVGhlIHJlYXNvbiBmb3Igc3BsaXQgd2FzIHRvIGVuc3Vy
ZSB3ZSBjYW4gbW9kdWxhcml6ZSBsb3dlciBsZXZlbCBJUENzLgpXZSBoYXZlIGhhcmR3YXJlIGxh
eW91dHMgY2hhbmdlLCBmdyBmb3JtYXRzIGNoYW5nZSBzbyBpdCBoZWxwZWQgaWYgdGhhdApyb3V0
ZSB3YXMgYWdhaW4gdGFrZW4hIElJUkMgZXZlbiB0aGUgSVBDIHdhcyBidWlsdCBvbiBnZW5lcmlj
CklQQyB3b3JrIGJ5IExpYW0sIHNvIHllcyB0aGVyZSBhcmUgbGF5ZXJzIGJ1dCBmb3IgYSByZWFz
b24uCgpJZiB5b3UgZmVlbCBtZXJnaW5nIHRoZSB0d28gaGVscHMsIEkgYW0gb2theSB3aXRoIHRo
ZSBjaGFuZ2UuCgo+IFN0YXRlbWVudCBiYWNrdXAgYnkgZXhpc3RlbmNlIG9mIGNpcmN1bGFyIGRl
cGVuZGVuY3kgYmV0d2VlbiB0aGlzIHR3by4KPiBUbyBlbGltaW5hdGUgc2FpZCBwcm9ibGVtLCBz
dHJ1Y3Qgc2tsX3NzdCBoYXMgYmVlbiBjcmVhdGVkLiBGcm9tIHRoYXQKPiBtb21tZW50LCBTa3ls
YWtlIGhhcyBiZWVuIHBsYWd1ZWQgYnkgaGVhZGVyIGVycm9ycyAoaW5jb21wbGV0ZSBzdHVyY3Rz
LAo+IHVua25vd24gcmVmZXJlbmNlcyBldGMuKSB3aGVuZXZlciBzb21ldGhpbmcgbmV3IGlzIHRv
IGJlIGFkZGVkIG9yIGNvZGUKPiBpcyBjbGVhbmVkIHVwLgoKQW55IHJlYXNvbiB3aHkgbmV3IGlz
IGJlaW5nIGFkZGVkIGhlcmUsIGFyZW4ndCB5b3UgZ3V5cyBtb3ZpbmcgdG8gU09GPwoKPiBGaXgg
dGhpcyBmbGF3ZWQgZGVzaWduIGJ5IG1lcmdpbmcgc25kX3NvY19za2wgYW5kIHNuZF9zb2Nfc2ts
X2lwYy4KPiBBbHNvLCBkbyBub3QgZm9yZ2V0IGFib3V0IHN0cnVjdCBza2xfc3N0IHJlZHVuZGFu
Y3kuCj4gRm9sbG93dXAgY2hhbmdlcyBhZGRyZXNzIGhhcm1mdWwgYXNzdW1wdGlvbnMgYW5kIGZh
bHNlIGxvZ2ljIHdoaWNoCj4gZHJpdmVyIGN1cnJlbnRseSBpbXBsZW1lbnRzIGUuZy46IGF0dGVt
cHQgdG8gdGFrZSByb2xlIG9mIG1hc3RlciBmb3IKPiBEU1Agc2NoZWR1bGluZyB3aGVuIGluIGZh
Y3QgZW50aXJlIGNvbnRyb2wgdGFrZXMgcGxhY2UgaW4gRFNQLgoKV2hlcmUgaXMgdGhlIGJhc2lz
IG9mIHRoYXQgYXNzdW1wdGlvbiwgZHJpdmVyIHdhcyBhIG1lcmUgYWNjb21wbGljZSwKZ2V0dGlu
ZyB0aGUgZGF0YSBvZiB0b3BvbG9neSBhbmQgcGFzc2luZyBpdCBkb3duIHRvIGZpcm13YXJlLCB3
aGlsc3QgdHJ5CnRvIGRvIHNvbWUgYm9vayBrZWVwaW5nIGFuZCBrZWVwIHRoaW5ncyBmb3IgZmFs
bGluZyEKCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIFJlYmFzZWQgb250byA1LjQKPiAKPiBB
bWFkZXVzeiBTxYJhd2nFhHNraSAoMik6Cj4gICBBU29DOiBJbnRlbDogU2t5bGFrZTogQ29tYmlu
ZSBzbmRfc29jX3NrbF9pcGMgYW5kIHNuZF9zb2Nfc2tsCj4gICBBU29DOiBJbnRlbDogU2t5bGFr
ZTogRG8gbm90IGRpc2FibGUgRlcgbm90aWZpY2F0aW9ucwo+IAo+IENlemFyeSBSb2pld3NraSAo
NSk6Cj4gICBBU29DOiBJbnRlbDogU2t5bGFrZTogTWVyZ2Ugc2tsX3NzdCBhbmQgc2tsIGludG8g
c2tsX2RldiBzdHJ1Y3QKPiAgIEFTb0M6IEludGVsOiBTa3lsYWtlOiBSZW1vdmUgTUNQUyBhdmFp
bGFibGUgY2hlY2sKPiAgIEFTb0M6IEludGVsOiBTa3lsYWtlOiBSZW1vdmUgbWVtb3J5IGF2YWls
YWJsZSBjaGVjawo+ICAgQVNvQzogSW50ZWw6IFNreWxha2U6IE1ha2UgTUNQUyBhbmQgQ1BTIHBh
cmFtcyBvYnNvbGV0ZQo+ICAgQVNvQzogSW50ZWw6IFNreWxha2U6IENsZWFudXAgc2tsX21vZHVs
ZV9jZmcgZGVjbGFyYXRpb24KPiAKPiAgc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmgg
ICAgICAgIHwgICAxICsKPiAgc291bmQvc29jL2ludGVsL3NreWxha2UvTWFrZWZpbGUgICAgICAg
IHwgIDEyICstCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL2J4dC1zc3QuYyAgICAgICB8ICA1
MCArLS0KPiAgc291bmQvc29jL2ludGVsL3NreWxha2UvY25sLXNzdC1kc3AuaCAgIHwgICA3ICst
Cj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL2NubC1zc3QuYyAgICAgICB8ICAzNyArLQo+ICBz
b3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtZGVidWcuYyAgICAgfCAgMTQgKy0KPiAgc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMgIHwgMjQ1ICsrKysrKy0tLS0tLS0KPiAg
c291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW5obHQuYyAgICAgIHwgIDE4ICstCj4gIHNvdW5k
L3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYyAgICAgICB8ICA3NCArKy0tCj4gIHNvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC1zc3AtY2xrLmMgICB8ICAgNCArLQo+ICBzb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wtc3N0LWRzcC5jICAgfCAgMTAgKy0KPiAgc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLXNzdC1kc3AuaCAgIHwgIDI5ICstCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtl
L3NrbC1zc3QtaXBjLmMgICB8ICAgOCArLQo+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wt
c3N0LWlwYy5oICAgfCAgNTIgKy0tCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3Qt
dXRpbHMuYyB8ICAzNyArLQo+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LmMgICAg
ICAgfCAgNTEgKy0tCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jICB8
IDQ0MSArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgc291bmQvc29jL2ludGVsL3NreWxha2Uv
c2tsLXRvcG9sb2d5LmggIHwgIDQzICstLQo+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wu
YyAgICAgICAgICAgfCAgNTQgKy0tCj4gIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5oICAg
ICAgICAgICB8IDEwMiArKysrLS0KPiAgMjAgZmlsZXMgY2hhbmdlZCwgNTQ2IGluc2VydGlvbnMo
KyksIDc0MyBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCgotLSAKflZpbm9kCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
