Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8B157D69
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61EF15F9;
	Mon, 10 Feb 2020 15:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61EF15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581345056;
	bh=A+k0XP6Z7xI5LzsYwnY3vXyDCUSiva+QHhUMU1Bw5vs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDTfchTzJ4Pvv4jAQ6FErCQs0MKW5qFz5VvQh/wXGANTrgxp6L98qPaFUSJg20SQA
	 pMyqeQ92v/eYSfKHehUqgIZNo9FbCA7/oXea8NSzeWZlx9lwTjfQVv3O2QGuLNaFM1
	 dJ5ZkC/cYGajlfAupFiBuXRvVjKRDkdA+qxwW0G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCC02F8027B;
	Mon, 10 Feb 2020 15:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EDB5F80279; Mon, 10 Feb 2020 15:28:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CE64F8014F
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE64F8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tS+Nt8nu"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AESiJa001066;
 Mon, 10 Feb 2020 08:28:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581344924;
 bh=+SXU0yCFEep2Yqb8rENzdcMj11Yb5cRlMdNCjpmA0es=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tS+Nt8nunkUdVl31bfPwfP8vNDiDlnQ7sdnq6pQSgi9B6T/mjCojOHCYK44JPZUSy
 nOjGBg/NIsrH8km1yEQK39ovilB2UScjHjirOu3jlkSe27wN8f0MbR9cz4Z7dcIvsW
 byETDNkHXStoueFKplsWwUlKk3KgFEixlNS64gHk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01AESin6127867
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Feb 2020 08:28:44 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 08:28:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 08:28:44 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AESfmZ067868;
 Mon, 10 Feb 2020 08:28:42 -0600
To: Takashi Iwai <tiwai@suse.de>
References: <20200210140423.10232-1-peter.ujfalusi@ti.com>
 <s5hmu9qfrq7.wl-tiwai@suse.de>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <15c7df10-cf9f-109c-3cbf-e73af7f4f66a@ti.com>
Date: Mon, 10 Feb 2020 16:28:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5hmu9qfrq7.wl-tiwai@suse.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, vkoul@kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dmaengine_pcm: Consider DMA cache
 caused delay in pointer callback
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

SGkgVGFrYXNoaSwKCk9uIDEwLzAyLzIwMjAgMTYuMjEsIFRha2FzaGkgSXdhaSB3cm90ZToKPiBP
biBNb24sIDEwIEZlYiAyMDIwIDE1OjA0OjIzICswMTAwLAo+IFBldGVyIFVqZmFsdXNpIHdyb3Rl
Ogo+Pgo+PiBTb21lIERNQSBlbmdpbmVzIGNhbiBoYXZlIGJpZyBGSUZPcyB3aGljaCBhZGRzIHRv
IHRoZSBsYXRlbmN5Lgo+PiBUaGUgRE1BZW5naW5lIGZyYW1ld29yayBjYW4gcmVwb3J0IHRoZSBG
SUZPIHV0aWxpemF0aW9uIGluIGJ5dGVzLiBVc2UgdGhpcwo+PiBpbmZvcm1hdGlvbiBmb3IgdGhl
IGRlbGF5IHJlcG9ydGluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBl
dGVyLnVqZmFsdXNpQHRpLmNvbT4KPj4gLS0tCj4+IEhpLAo+Pgo+PiA1LjYtcmMxIG5vdyBoYXZl
IHN1cHBvcnQgZm9yIHJlcG9ydGluZyB0aGUgRE1BIGNhY2hlZCBkYXRhLgo+PiBXaXRoIHRoaXMg
cGF0Y2ggd2UgY2FuIGluY2x1ZGUgaXQgdG8gdGhlIGRlbGF5IGNhbGN1bGF0aW9uLgo+PiBUaGUg
Zmlyc3QgRE1BIGRyaXZlciB3aGljaCByZXBvcnRzIHRoaXMgaXMgdGhlIFRJIEszIFVETUEgZHJp
dmVyLgo+Pgo+PiBSZWdhcmRzLAo+PiBQZXRlcgo+Pgo+PiAgc291bmQvY29yZS9wY21fZG1hZW5n
aW5lLmMgfCA2ICsrKysrKwo+PiAgc291bmQvc29jL3NvYy1wY20uYyAgICAgICAgfCAyICstCj4+
ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvc291bmQvY29yZS9wY21fZG1hZW5naW5lLmMgYi9zb3VuZC9jb3JlL3BjbV9k
bWFlbmdpbmUuYwo+PiBpbmRleCA1NzQ5YThhNDk3ODQuLjRmMTM5NWZkMDE2MCAxMDA2NDQKPj4g
LS0tIGEvc291bmQvY29yZS9wY21fZG1hZW5naW5lLmMKPj4gKysrIGIvc291bmQvY29yZS9wY21f
ZG1hZW5naW5lLmMKPj4gQEAgLTI0Nyw5ICsyNDcsMTUgQEAgc25kX3BjbV91ZnJhbWVzX3Qgc25k
X2RtYWVuZ2luZV9wY21fcG9pbnRlcihzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVh
bSkKPj4gIAo+PiAgCXN0YXR1cyA9IGRtYWVuZ2luZV90eF9zdGF0dXMocHJ0ZC0+ZG1hX2NoYW4s
IHBydGQtPmNvb2tpZSwgJnN0YXRlKTsKPj4gIAlpZiAoc3RhdHVzID09IERNQV9JTl9QUk9HUkVT
UyB8fCBzdGF0dXMgPT0gRE1BX1BBVVNFRCkgewo+PiArCQlzdHJ1Y3Qgc25kX3BjbV9ydW50aW1l
ICpydW50aW1lID0gc3Vic3RyZWFtLT5ydW50aW1lOwo+PiArCQlpbnQgc2FtcGxlX2JpdHMgPSBz
bmRfcGNtX2Zvcm1hdF9waHlzaWNhbF93aWR0aChydW50aW1lLT5mb3JtYXQpOwo+PiArCj4+ICAJ
CWJ1Zl9zaXplID0gc25kX3BjbV9saWJfYnVmZmVyX2J5dGVzKHN1YnN0cmVhbSk7Cj4+ICAJCWlm
IChzdGF0ZS5yZXNpZHVlID4gMCAmJiBzdGF0ZS5yZXNpZHVlIDw9IGJ1Zl9zaXplKQo+PiAgCQkJ
cG9zID0gYnVmX3NpemUgLSBzdGF0ZS5yZXNpZHVlOwo+PiArCj4+ICsJCXNhbXBsZV9iaXRzICo9
IHJ1bnRpbWUtPmNoYW5uZWxzOwo+PiArCQlydW50aW1lLT5kZWxheSA9IHN0YXRlLmluX2ZsaWdo
dF9ieXRlcyAvIChzYW1wbGVfYml0cyAvIDgpOwo+IAo+IENhbiB0aGlzIGJlIHNpbXBseSBieXRl
c190b19mcmFtZXMoKT8KPiAKPiAJCXJ1bnRpbWUtPmRlbGF5ID0gYnl0ZXNfdG9fZnJhbWVzKHJ1
bnRpbWUsIHN0YXRlLmluX2ZsaWdodF9ieXRlcyk7CgpDZXJ0YWlubHkgaXQgY2FuLCBJIGxvb2tl
ZCBhdCB2YXJpb3VzIGhlbHBlciBidXQgc29tZWhvdyBtaXNzZWQgdGhlCmJ5dGVzX3RvX2ZyYW1l
cygpLgoKSSdsbCBzZW5kIHYyIGluIGFib3V0IGFuIGhvdXIuCgoKCj4gCj4+ICAJfQo+PiAgCj4+
ICAJcmV0dXJuIGJ5dGVzX3RvX2ZyYW1lcyhzdWJzdHJlYW0tPnJ1bnRpbWUsIHBvcyk7Cj4+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29jLXBjbS5jIGIvc291bmQvc29jL3NvYy1wY20uYwo+PiBp
bmRleCBmZjFiN2M3MDc4ZTUuLjU4ZWY1MDhkNzBhMyAxMDA2NDQKPj4gLS0tIGEvc291bmQvc29j
L3NvYy1wY20uYwo+PiArKysgYi9zb3VuZC9zb2Mvc29jLXBjbS5jCj4+IEBAIC0xMTUxLDcgKzEx
NTEsNyBAQCBzdGF0aWMgc25kX3BjbV91ZnJhbWVzX3Qgc29jX3BjbV9wb2ludGVyKHN0cnVjdCBz
bmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtKQo+PiAgCX0KPj4gIAlkZWxheSArPSBjb2RlY19k
ZWxheTsKPj4gIAo+PiAtCXJ1bnRpbWUtPmRlbGF5ID0gZGVsYXk7Cj4+ICsJcnVudGltZS0+ZGVs
YXkgKz0gZGVsYXk7Cj4gCj4gSXMgaXQgY29ycmVjdD8KPiBkZWxheSBhbHJlYWR5IHRha2VzIHJ1
bnRpbWUtPmRlbGF5IGFzIGl0cyBiYXNpcywgc28gaXQnbGwgcmVzdWx0IGluIGEKPiBkb3VibGUu
CgpUaGUgZGVsYXkgaGVyZSBpcyBjb21pbmcgZnJvbSB0aGUgREFJIGFuZCB0aGUgY29kZWMuClRo
ZSBydW50aW1lLT5kZWxheSBob2xkIHRoZSBQQ00gKERNQSkgY2F1c2VkIGRlbGF5LgoKPiAKPiB0
aGFua3MsCj4gCj4gVGFrYXNoaQo+IAoKLSBQw6l0ZXIKClRleGFzIEluc3RydW1lbnRzIEZpbmxh
bmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVz
cyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
