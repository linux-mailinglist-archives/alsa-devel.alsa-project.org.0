Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDF55B69
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 00:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648B91662;
	Wed, 26 Jun 2019 00:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648B91662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561502412;
	bh=lokXh4DlgTqQ/y/ibj9wCrkurSsCUi74ZG3TA5WENhc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtF1l3C6+Xna1KGbANFmG1slf1SimfnykGB8+IlEk6bslLKx11kTjcCTse/wZ69Gb
	 Pt3WhCRkri2Wzs6asacVKDmT55YTDGjhAiRbs63AygKCuNq5KZSQ0wGJr928O4rFa0
	 LViB9qyaCZgzClpG/Hes3iApRVsjJ2TK7VtogVvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A56E1F896FC;
	Wed, 26 Jun 2019 00:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA9EF896F9; Wed, 26 Jun 2019 00:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BB76F8071F
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 00:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB76F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="lCGuudjL"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d12a25d0000>; Tue, 25 Jun 2019 15:38:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 25 Jun 2019 15:38:18 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 25 Jun 2019 15:38:18 -0700
Received: from [10.26.11.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Jun
 2019 22:38:17 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>
References: <87y33aaluu.wl-kuninori.morimoto.gx@renesas.com>
 <87r292alro.wl-kuninori.morimoto.gx@renesas.com>
 <cb3a6d0a-ca7b-d6b6-72db-5dff520acfc9@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <374e71f7-b49c-ec79-f3ca-ae630a383521@nvidia.com>
Date: Tue, 25 Jun 2019 23:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <cb3a6d0a-ca7b-d6b6-72db-5dff520acfc9@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1561502301; bh=IbMAqbxmQOxup47m/oBr9tWB4Q6AVv96KeE9VVQ8/qQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=lCGuudjLKmUyNe6FOqomnuqJbu0X/uhag1pKzh1E80ZFkXTSBeZYXI6SgpFCAapCm
 5jFa/y5Ik00Oj0GB35kRTt4UYSdiTwob/zsX/BE/mHak01DtCMmlNrCr2CIrcCE0sd
 7GBvtAkKRXjHrA+zVcGRd++NtoGdIovyGsgHGftuDGZX6hOHxXumPGLOGBW/Orc1tt
 +rGt26mv8Nlux/ne347CI3cJ4HAmpbhypqSI4Jhg9XjnK/deKCIgVH2Oes0LSXokfS
 WwQbC8RaumY0NgeT66iQyVFIYQ6Y5qeb34bavdWrXME33kLcQrKhNTd/OVZiuiJTU2
 9i4cgeGIuXgSA==
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: soc-core: use
 soc_find_component() at snd_soc_get_dai_id()
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

Ck9uIDI1LzA2LzIwMTkgMjE6NDcsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAxMy4wNS4yMDE5
IDEwOjA3LCBLdW5pbm9yaSBNb3JpbW90byDQv9C40YjQtdGCOgo+PiBGcm9tOiBLdW5pbm9yaSBN
b3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+Cj4+Cj4+IHNvYy1jb3Jl
IGNvcmUgYWxyZWFkeSBoYXMgc29jX2ZpbmRfY29tcG9uZW50KCkgd2hpY2ggZmluZAo+PiBjb21w
b25lbnQgZnJvbSBkZXZpY2Ugbm9kZS4KPj4gTGV0J3MgdXNlIGV4aXN0aW5nIGZ1bmN0aW9uIHRv
IGZpbmQgY29tcG9uZW50Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90byA8
a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+Cj4+IC0tLQo+PiAgc291bmQvc29jL3Nv
Yy1jb3JlLmMgfCAxNyArKysrKy0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
c29jLWNvcmUuYyBiL3NvdW5kL3NvYy9zb2MtY29yZS5jCj4+IGluZGV4IGU1NTE3MGMuLmU4M2Vk
YmUgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5kL3NvYy9zb2MtY29yZS5jCj4+ICsrKyBiL3NvdW5kL3Nv
Yy9zb2MtY29yZS5jCj4+IEBAIC0zNzUxLDcgKzM3NTEsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChz
bmRfc29jX29mX3BhcnNlX2RhaWZtdCk7Cj4+ICAKPj4gIGludCBzbmRfc29jX2dldF9kYWlfaWQo
c3RydWN0IGRldmljZV9ub2RlICplcCkKPj4gIHsKPj4gLQlzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnQgKnBvczsKPj4gKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudDsKPj4gIAlz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7Cj4+ICAJaW50IHJldDsKPj4gIAo+PiBAQCAtMzc2NSwx
NyArMzc2NSwxMCBAQCBpbnQgc25kX3NvY19nZXRfZGFpX2lkKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
ZXApCj4+ICAJICovCj4+ICAJcmV0ID0gLUVOT1RTVVBQOwo+PiAgCW11dGV4X2xvY2soJmNsaWVu
dF9tdXRleCk7Cj4+IC0JZm9yX2VhY2hfY29tcG9uZW50KHBvcykgewo+PiAtCQlzdHJ1Y3QgZGV2
aWNlX25vZGUgKmNvbXBvbmVudF9vZl9ub2RlID0gc29jX2NvbXBvbmVudF90b19ub2RlKHBvcyk7
Cj4+IC0KPj4gLQkJaWYgKGNvbXBvbmVudF9vZl9ub2RlICE9IG5vZGUpCj4+IC0JCQljb250aW51
ZTsKPj4gLQo+PiAtCQlpZiAocG9zLT5kcml2ZXItPm9mX3hsYXRlX2RhaV9pZCkKPj4gLQkJCXJl
dCA9IHBvcy0+ZHJpdmVyLT5vZl94bGF0ZV9kYWlfaWQocG9zLCBlcCk7Cj4+IC0KPj4gLQkJYnJl
YWs7Cj4+IC0JfQo+PiArCWNvbXBvbmVudCA9IHNvY19maW5kX2NvbXBvbmVudChub2RlLCBOVUxM
KTsKPj4gKwlpZiAoY29tcG9uZW50ICYmCj4+ICsJICAgIGNvbXBvbmVudC0+ZHJpdmVyLT5vZl94
bGF0ZV9kYWlfaWQpCj4+ICsJCXJldCA9IGNvbXBvbmVudC0+ZHJpdmVyLT5vZl94bGF0ZV9kYWlf
aWQoY29tcG9uZW50LCBlcCk7Cj4+ICAJbXV0ZXhfdW5sb2NrKCZjbGllbnRfbXV0ZXgpOwo+PiAg
Cj4+ICAJb2Zfbm9kZV9wdXQobm9kZSk7Cj4+Cj4gCj4gSGksCj4gCj4gVGhpcyBwYXRjaCBjYXVz
ZXMgY3Jhc2ggb24gdG9kYXkncyBsaW51eC1uZXh0IGFwcGFyZW50bHkgYmVjYXVzZSAiQ1BVIERB
SSIgaXMgbm90Cj4gcmVnaXN0ZXJlZCBub3csIGFueSBpZGVhcz8KCkZXSVcgSSBhbSBzZWVpbmcg
dGhlIHNhbWUgY3Jhc2gvcmVncmVzc2lvbiwgaG93ZXZlciwgdGhlIGJpc2VjdCBpcwpwb2ludGlu
ZyB0byBjb21taXQgYjlmMmUyNWM1OTliYmJmMDY0Njk1N2UwN2ViYjcyYjk0MmMyODZjYyAoIkFT
b0M6CnNvYy1jb3JlOiB1c2Ugc29jX2ZpbmRfY29tcG9uZW50KCkgYXQgc25kX3NvY19maW5kX2Rh
aSgpIikgYW5kIHJldmVydGluZwp0aGlzIGNvbW1pdCBmaXhlcyB0aGUgcHJvYmxlbSBmb3IgbWUu
CgpEbWl0cnksIGFyZSB5b3Ugc3VyZSBpdCBpcyB0aGlzIGNvbW1pdD8gVGhleSBkbyBoYXZlIGEg
c2ltaWxhciBuYW1lLgoKQ2hlZXJzCkpvbgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
