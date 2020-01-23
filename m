Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164F147294
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 21:30:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BE5168B;
	Thu, 23 Jan 2020 21:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BE5168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579811442;
	bh=CFaSKonhi4QfOogn2nQHRnoOJndLuyy27ZLMNNHI4YQ=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/rJSfIpaV46JFt5Fr5ddPg7/sWH4QMl+sBWazMRqCev6xJasF3SEphgAGzxqwaPH
	 T/jw1WiNK2sOgTc3MeeBS+f0i83IYhb2dCs+vN6To4McHTsJQsU998WDQw8q978dEk
	 cHsLPYnZhZltGdbM9pARgRkiV7SytJmOlOxgAkVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 410DBF80112;
	Thu, 23 Jan 2020 21:28:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40189F801D9; Thu, 23 Jan 2020 21:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.lixid.net (lixid.tarent.de [193.107.123.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EB77F80112
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 21:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EB77F80112
Received: from localhost (localhost [127.0.0.1])
 by mail.lixid.net (MTA) with ESMTP id 07B36140C3E;
 Thu, 23 Jan 2020 21:28:51 +0100 (CET)
Received: from mail.lixid.net ([127.0.0.1])
 by localhost (mail.lixid.net [127.0.0.1]) (MFA, port 10024) with LMTP
 id 19DnMm3SUPvp; Thu, 23 Jan 2020 21:28:50 +0100 (CET)
Received: from tglase-nb.lan.tarent.de (vpn-172-28-0-27.dynamic.tarent.de
 [172.28.0.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lixid.net (MTA) with ESMTPS id D5838140612;
 Thu, 23 Jan 2020 21:28:50 +0100 (CET)
Received: by tglase-nb.lan.tarent.de (Postfix, from userid 1000)
 id 4287B5203AF; Thu, 23 Jan 2020 21:28:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by tglase-nb.lan.tarent.de (Postfix) with ESMTP id 404595203A7;
 Thu, 23 Jan 2020 21:28:50 +0100 (CET)
Date: Thu, 23 Jan 2020 21:28:50 +0100 (CET)
From: Thorsten Glaser <t.glaser@tarent.de>
X-X-Sender: tglase@tglase-nb.lan.tarent.de
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hmuco3unv.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2001232123580.6327@tglase-nb.lan.tarent.de>
References: <alpine.DEB.2.21.1911202147000.2011@tglase.lan.tarent.de>
 <s5hzhgpsl7b.wl-tiwai@suse.de>
 <alpine.DEB.2.21.1911211536340.23653@tglase-nb.lan.tarent.de>
 <s5hmuco3unv.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Content-Language: de-DE-1901
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, 870396@bugs.debian.org
Subject: Re: [alsa-devel] [PATCH] fix segfault on x32,
 64-bit time_t-related format strings
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

T24gRnJpLCAyMiBOb3YgMjAxOSwgVGFrYXNoaSBJd2FpIHdyb3RlOgoKPiA+IEnigJl2ZSBzZW50
IHRoZW0gYXMgdHdvIHNlcGFyYXRlIHBhdGNoIGZpbGVzIGF0dGFjaG1lbnRzLgo+IAo+IFRoZW4g
cGxlYXNlIG1ha2UgdGhlbSBjbGVhbmx5IGFwcGxpY2FibGUgdmlhIGdpdC1hbSwgd2l0aCBhIHBy
b3Blcgo+IHN1YmplY3QsIGEgcHJvcGVyIGNoYW5nZWxvZyBhbmQgeW91ciBzaWduLW9mZiwgZXRj
LgoKSeKAmWxsIHJlc2VuZCB0aGVtIGxpa2UgdGhhdCBub3cuIFNvcnJ5IGl0IHRvb2sgYSBiaXQs
IEkgd2FzIGJ1c3kuCgo+IEF0IGJlc3Qgc2VuZCBvbmUgcGF0Y2ggcGVyIG1haWwgKGFuZCB3aXRo
IGEgY292ZXIgbGV0dGVyIGZvciBtdWx0aXBsZQo+IHBhdGNoZXMpLgoKVGhpcyBpcyBhIGJpdCB0
cmlja3ksIGFzIEkgY2Fu4oCZdCBlYXNpbHkgaW5qZWN0IGdpdCBmb3JtYXQtcGF0Y2gKb3V0cHV0
IGludG8gdGhpcyBtYWlsIHNldHVwLiBJIHdpbGwgdHJ5IHNlbmRpbmcgdGhlbSBmcm9tIGhvbWUu
Cgo+ID4gPiBBbHNvLCB1c2luZyB0aW1lX3Qgd291bGQgYmUgYmV0dGVyIGlmIHBvc3NpYmxlLiAg
VW5mb3J0dW5hdGVseSBhIGNhc3QKPiA+ID4gaXMgbmVlZGVkIGZvciBwcmludGYgdXNhZ2UsIGJ1
dCBvdGhlciB0aGFuIHRoYXQsIHRpbWVfdCB3b3VsZCBsZWF2ZSB1cwo+ID4gPiB0aGUgcmlnaHQg
c2l6ZS4KPiA+IAo+ID4gSW4gdGltZWRpZmYoKSB5b3UgbWVhbj8gSHJtLCBpbmRlZWQuIEkgdHJp
ZWQgdG8gYmUgbWluaW1hbC1pbnZhc2l2ZQo+ID4gYXQgZmlyc3QuCj4gCj4gSSBtZWFudCB1c2lu
ZyB0aW1lX3QgYXMgbXVjaCBhcyBwb3NzaWJsZSBpbnN0ZWFkIG9mIGxvbmcgbG9uZy4KCknigJl2
ZSBkb25lIHRoaXMgbm93LgoKYnllLAovL21pcmFiaWxvcwotLSAKdGFyZW50IHNvbHV0aW9ucyBH
bWJIClJvY2h1c3N0cmHDn2UgMi00LCBELTUzMTIzIEJvbm4g4oCiIGh0dHA6Ly93d3cudGFyZW50
LmRlLwpUZWw6ICs0OSAyMjggNTQ4ODEtMzkzIOKAoiBGYXg6ICs0OSAyMjggNTQ4ODEtMjM1CkhS
QiA1MTY4IChBRyBCb25uKSDigKIgVVN0LUlEIChWQVQpOiBERTEyMjI2NDk0MQpHZXNjaMOkZnRz
ZsO8aHJlcjogRHIuIFN0ZWZhbiBCYXJ0aCwgS2FpIEViZW5yZXR0LCBCb3JpcyBFc3NlciwgQWxl
eGFuZGVyIFN0ZWVnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
