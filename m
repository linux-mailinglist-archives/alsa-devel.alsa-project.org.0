Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E414D170
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 20:53:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C0DB167D;
	Wed, 29 Jan 2020 20:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C0DB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580327583;
	bh=yavTReSNXwqKKoeVUsosAJQto6T58+fyr1FWGpy5l9U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szYZ/eMmaVcn4kmbksvnCSr2x4fSyxumUm5MkhnUFXikP6tyY0aARIwEE8pcz0yfG
	 AJ6GHFP+XkZjBPOysXh8iKVxb4Xml6jSstTtLzKm5yro4emPREW3f8EEtoSWAwcjRx
	 1yPThGNtGxJ8HzxHd2iPtoPdP0IgpXcR9JaVye5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A386FF8021E;
	Wed, 29 Jan 2020 20:51:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD16CF8021E; Wed, 29 Jan 2020 20:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9C89F80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 20:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C89F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i+SbOgfP"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TJp1Lr078023;
 Wed, 29 Jan 2020 13:51:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580327461;
 bh=rbB/lD7xEgzLxXwTLa3JpCV55iUJ31TPZ7JK+o77KyA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=i+SbOgfPYo7oQJfA+Q3vNaHmk6uHqFgEJ28i3Fxt7pifIhEH2MdjGg/uPNV9NVRsc
 zc+SHz4kE0B1WMghT0gX6uVeGbGIST4r+ydRgsHFPkxh1t/ew60x+KwLXY0RuCMcgK
 BoyjKqrW1p9iPtwSYX4spV6syCAb1RVBuU8FVrVY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TJp1fk010922
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Jan 2020 13:51:01 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 13:51:01 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 13:51:01 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TJowTf087910;
 Wed, 29 Jan 2020 13:50:59 -0600
To: Marek Szyprowski <m.szyprowski@samsung.com>, <dmaengine@vger.kernel.org>, 
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
References: <CGME20200129163716eucas1p19550fcbfff81ca8586df28782399cff0@eucas1p1.samsung.com>
 <20200129163548.11096-1-m.szyprowski@samsung.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <3d7a612a-851f-85f1-4207-531f5a87212a@ti.com>
Date: Wed, 29 Jan 2020 21:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200129163548.11096-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [alsa-devel] [PATCH] dmaengine: Fix return value for
 dma_requrest_chan() in case of failure
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

CgpPbiAyOS8wMS8yMDIwIDE4LjM1LCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+IENvbW1pdCA3
MTcyM2E5NmI4YjEgKCJkbWFlbmdpbmU6IENyZWF0ZSBzeW1saW5rcyBiZXR3ZWVuIERNQSBjaGFu
bmVscyBhbmQKPiBzbGF2ZXMiKSBjaGFuZ2VkIHRoZSBkbWFfcmVxdWVzdF9jaGFuKCkgZnVuY3Rp
b24gZmxvdyBpbiBzdWNoIGEgd2F5IHRoYXQKPiBpdCBhbHdheXMgcmV0dXJucyBFUFJPQkVfREVG
RVIgaW4gY2FzZSBvZiBjaGFubmVscyB0aGF0IGNhbm5vdCBiZSBmb3VuZC4KPiBUaGlzIGJyZWFr
IHRoZSBvcGVyYXRpb24gb2YgdGhlIGRldmljZXMgd2hpY2ggaGF2ZSBvcHRpb25hbCBETUEgY2hh
bm5lbHMKPiBhcyBpdCBwdXRzIHRoZWlyIGRyaXZlcnMgaW4gZW5kbGVzcyBkZWZlcnJlZCBwcm9i
ZSBsb29wLiBGaXggdGhpcyBieQo+IHByb3BhZ2F0aW5nIHRoZSBwcm9wZXIgZXJyb3IgdmFsdWUu
Cj4gCj4gRml4ZXM6IDcxNzIzYTk2YjhiMSAoImRtYWVuZ2luZTogQ3JlYXRlIHN5bWxpbmtzIGJl
dHdlZW4gRE1BIGNoYW5uZWxzIGFuZCBzbGF2ZXMiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6
eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9kbWEv
ZG1hZW5naW5lLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9kbWFlbmdpbmUuYyBiL2Ry
aXZlcnMvZG1hL2RtYWVuZ2luZS5jCj4gaW5kZXggZjNlZjRlZGQ0ZGUxLi4yN2I2NGE2NjUzNDcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEvZG1hZW5naW5lLmMKPiArKysgYi9kcml2ZXJzL2Rt
YS9kbWFlbmdpbmUuYwo+IEBAIC03NTksNyArNzU5LDcgQEAgc3RydWN0IGRtYV9jaGFuICpkbWFf
cmVxdWVzdF9jaGFuKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbmFtZSkKPiAgCWlm
ICghSVNfRVJSX09SX05VTEwoY2hhbikpCj4gIAkJZ290byBmb3VuZDsKPiAgCj4gLQlyZXR1cm4g
RVJSX1BUUigtRVBST0JFX0RFRkVSKTsKPiArCXJldHVybiBjaGFuOwoKSXQgc2hvdWxkIGJlOgpy
ZXR1cm4gY2hhbiA/IGNoYW4gOiBFUlJfUFRSKC1FUFJPQkVfREVGRVIpOwoKZG1hX3JlcXVlc3Rf
Y2hhbigpIHNob3VsZCBuZXZlciByZXR1cm4gTlVMTCwgaXQgZWl0aGVyIHJldHVybnMgdGhlCmRt
YV9jaGFuLCBvciBFUlJfUFRSKCkuCgo+ICAKPiAgZm91bmQ6Cj4gIAljaGFuLT5zbGF2ZSA9IGRl
djsKPiAKCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5r
YXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4g
S290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
