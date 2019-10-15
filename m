Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8AD71A1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 10:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DCB31672;
	Tue, 15 Oct 2019 10:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DCB31672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571129880;
	bh=XAFvdL90QNfhXTcwHhNvAyj8pDRViFpA2H8Is/7N5yk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJg3SOQalfNlq+avm25Eh6cYPfD5YTJBE+7hsU8VkiBDUQN6xEutHRgC8AlSHBbZS
	 x4981+G2taBAur/lx9Dy6/gLtlYKMHmVY7StKTY1NN9qYuicgXpcVb93slg5xIhwpD
	 AVW3ObcFllnT0+EUNH8FtOicog1HTG+fVrmcgvrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A2F2F80529;
	Tue, 15 Oct 2019 10:56:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E43C0F804AA; Tue, 15 Oct 2019 10:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A317EF8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 10:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A317EF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kaE/sNkt"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9F8u7f6073129;
 Tue, 15 Oct 2019 03:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1571129767;
 bh=qdTn7xIgK+l26BxkCaBF7gbc7z1FbFzqB04vUo68HZs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kaE/sNkt2My59UnyaDBzkdYsVFzEvm17VrDXSfX1JE5WhNDtzJyVBN2v4cvAClqR7
 ZIUxTYu0OM046TkPVLR1zGsrOLgUsfgAcziNYTTxarzrDIqLCadMj/WZWGt6bAX+hT
 uXtLqlU6DQ5NxVV7fVQRnzfZjwHUCIAfWUrR5cSo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9F8u79W101290
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Oct 2019 03:56:07 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 15
 Oct 2019 03:55:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 15 Oct 2019 03:56:05 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9F8u4GS023698;
 Tue, 15 Oct 2019 03:56:04 -0500
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20191008115720.7135-1-peter.ujfalusi@ti.com>
 <87lftm68d6.wl-kuninori.morimoto.gx@renesas.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <eb62a134-5189-eb7c-6083-69302ba590e2@ti.com>
Date: Tue, 15 Oct 2019 11:57:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87lftm68d6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: pcm3168a: Use fixup instead of
 constraint for channels and formats
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

SGkgTW9yaW1vdG8tc2FuLAoKT24gMTUvMTAvMjAxOSA1LjM4LCBLdW5pbm9yaSBNb3JpbW90byB3
cm90ZToKPiAKPiBIaSBQZXRlcgo+IAo+PiBUaGUgc25kX3BjbV9od19jb25zdHJhaW50X21pbm1h
eCgpIHdvcmtzIGZpbmUgd2hlbiBhIHNpbmdsZSBjb2RlYyBpcwo+PiBjb25uZWN0ZWQgdG8gYSBz
aW5nbGUgQ1BVIERBSSwgYnV0IGluIG11bHRpY29kZWMgb3IgRFBDTSBzZXR1cCB0aGUKPj4gY29u
c3RyYWludHMgcGxhY2VkIGJ5IHRoZSBkcml2ZXIgd2lsbCBhcHBseSB0byB0aGUgd2hvbGUgUENN
IHN0cmVhbSAoRkUKPj4gaW5jbHVkZWQpIGFuZCB0aHVzIHByZXZlbnRzIG1vcmUgdGhhbiA4IHBs
YXliYWNrIGNoYW5uZWxzIGZvciBleGFtcGxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBV
amZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29tPgo+PiAtLS0KPiAKPiBUaGlzIHBhdGNoIGJy
ZWFrcyBteSBzb3VuZC4KPiBJJ20gc2VsZWN0aW5nIEkyUyBiZXR3ZWVuIENQVTwtPkNvZGVjLCBh
bmQgCj4gYmVmb3JlIHRoaXMgcGF0Y2gsIGl0IGhhZCBiZWVuIHNlbGVjdGVkIDI0Yml0ICsgSTJT
Lgo+IEJ1dCBhZnRlciB0aGlzIHBhdGNoLCBpdCBzZWxlY3RzIDE2Yml0ICsgSTJTLAo+IGFuZCBz
YXkgIjE2LWJpdCBzbG90cyBhcmUgc3VwcG9ydGVkIG9ubHkgZm9yIHNsYXZlIG1vZGUgdXNpbmcg
cmlnaHQganVzdGlmaWVkIgoKT29wcy4gSSBoYXZlIHNlbnQgYSBwYXRjaCB0byBmaXggdGhpcy4g
U29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlIQoKRldJVywgSSdtIHJ1bm5pbmcgb25lIHBjbTMx
NjhhIGluIENCU19DRlMgfCBSSUdIVF9KIHdpdGggcGFyYWxsZWwKc2VyaWFsaXplcnMgKHRvIG9u
ZSBNY0FTUCkgYW5kIG90aGVyIHR3byBhbHNvIGluIENCU19DRlMgfCBSSUdIVF9KCmNvbm5lY3Rl
ZCB0byBhIHNpbmdsZSBNY0FTUCBpbiBwYXJhbGxlbCAoc28gSSBjYW4gcGxheSAxNiBjaGFubmVs
IGF1ZGlvCnVzaW5nIHRoZSB0d28pLgoKPiBJJ20gbm90IDEwMCUgdW5kZXJzdGFuZCBwY20zMTY4
YS4KPiBJJ20gaGFwcHkgaWYgeW91IGNhbiBzb2x2ZSB0aGlzIGlzc3VlLgo+IElmIHlvdSBjYW4n
dCwgY2FuIHlvdSBwbGVhc2UgdGVhY2ggbWUgd2hlcmUgc2hvdWxkIEkgY2hlY2sgPwoKSnVzdCBz
ZW50IGEgcGF0Y2ggdG8gZml4IHRoZSBpc3N1ZSB5b3UgYXJlIHNlZWluZyB3aXRoIEkyUyBtb2Rl
ICh0ZXN0ZWQKaXQgbXlzZWxmKS4KClNvcnJ5IGFnYWluLgoKPiBUaGFuayB5b3UgZm9yIHlvdXIg
aGVscCAhIQo+IEJlc3QgcmVnYXJkcwo+IC0tLQo+IEt1bmlub3JpIE1vcmltb3RvCj4gCgotIFDD
qXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
