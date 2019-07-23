Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A668371F79
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 20:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A7F18EB;
	Tue, 23 Jul 2019 20:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A7F18EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563907268;
	bh=bMWM5Y1dUMo6ULPAE9ozNV056r4vJEuJwXyaDjyrn0o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBtDABs57BYmwrv5gGt/J1PONqpO/XWlIPxNuve/MSef15n4PmKARSmPP9s6GwUdI
	 hYrGe4VqkNw0h80BZ4GfpwuW3zfOmJrKXjf7dWuQiu+/8VpoLayP2tgWC3hsSuneUb
	 BVJHJhBhGknoaSNVxCpRWEE/h/ZKJbhD1tj5/cqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC3AF80448;
	Tue, 23 Jul 2019 20:39:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B2FAF80447; Tue, 23 Jul 2019 20:39:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB245F8011C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 20:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB245F8011C
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr
 [90.65.161.137])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B922C60008;
 Tue, 23 Jul 2019 18:39:15 +0000 (UTC)
Date: Tue, 23 Jul 2019 20:39:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: mirq-linux@rere.qmqm.pl
Message-ID: <20190723183915.GJ24911@piout.net>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
 <1f3a4256-58de-27a4-8095-54fc6baa6d89@microchip.com>
 <20190723164312.GA4772@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723164312.GA4772@qmqm.qmqm.pl>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Nicolas.Ferre@microchip.com, tiwai@suse.com, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, Codrin.Ciubotariu@microchip.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in
	Kconfig
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

T24gMjMvMDcvMjAxOSAxODo0MzoxMiswMjAwLCBtaXJxLWxpbnV4QHJlcmUucW1xbS5wbCB3cm90
ZToKPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCAwMTozNjozN1BNICswMDAwLCBDb2RyaW4uQ2l1
Ym90YXJpdUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4gT24gMjIuMDcuMjAxOSAyMToyNywgTWlj
aGHFgiBNaXJvc8WCYXcgd3JvdGU6Cj4gPiA+IEFsbG93IFNTQyB0byBiZSB1c2VkIG9uIHBsYXRm
b3JtcyBkZXNjcmliZWQgdXNpbmcgYXVkaW8tZ3JhcGgtY2FyZAo+ID4gPiBpbiBEZXZpY2UgVHJl
ZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxp
bnV4QHJlcmUucW1xbS5wbD4KPiA+ID4gLS0tCj4gPiA+ICAgc291bmQvc29jL2F0bWVsL0tjb25m
aWcgfCAyICstCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL0tjb25maWcg
Yi9zb3VuZC9zb2MvYXRtZWwvS2NvbmZpZwo+ID4gPiBpbmRleCAwNmMxZDVjZTY0MmMuLjllZjlk
MjViYjUxNyAxMDA2NDQKPiA+ID4gLS0tIGEvc291bmQvc29jL2F0bWVsL0tjb25maWcKPiA+ID4g
KysrIGIvc291bmQvc29jL2F0bWVsL0tjb25maWcKPiA+ID4gQEAgLTI1LDcgKzI1LDcgQEAgY29u
ZmlnIFNORF9BVE1FTF9TT0NfRE1BCj4gPiA+ICAgCWRlZmF1bHQgeSBpZiBTTkRfQVRNRUxfU09D
X1NTQ19ETUE9eSB8fCAoU05EX0FUTUVMX1NPQ19TU0NfRE1BPW0gJiYgU05EX0FUTUVMX1NPQ19T
U0M9eSkKPiA+ID4gICAKPiA+ID4gICBjb25maWcgU05EX0FUTUVMX1NPQ19TU0NfRE1BCj4gPiA+
IC0JdHJpc3RhdGUKPiA+ID4gKwl0cmlzdGF0ZSAiU29DIFBDTSBEQUkgc3VwcG9ydCBmb3IgQVQ5
MSBTU0MgY29udHJvbGxlciB1c2luZyBETUEiCj4gPiAKPiA+IENvdWxkIHlvdSBwbGVhc2UgbWFr
ZSBzb21ldGhpbmcgc2ltaWxhciBmb3IgU05EX0FUTUVMX1NPQ19TU0NfUERDPyBBbHNvLCAKPiA+
IEkgdGhpbmsgdGhhdCBpdCBzaG91bGQgc2VsZWN0IEFUTUVMX1NTQywgdG8gYmUgYWJsZSB0byB1
c2UgCj4gPiBzaW1wbGUvZ3JhcGgtY2FyZCB3aXRoIFNTQy4KPiAKPiBIbW0uIFRoZSBLY29uZmln
IGRlcGVuZGVuY2llcyBzZWVtcyBvdmVybHkgY29tcGxpY2F0ZWQsIGRvIHlvdSBtaW5kIGlmIEkK
PiBnZXQgcmlkIG9mIG1vc3Qgb2YgdGhlIGVudHJpZXMgaW4gdGhlIHByb2Nlc3M/Cj4gCgpVbmZv
cnR1bmF0ZWx5LCBpdCBpcyBqdXN0IGNvbXBsaWNhdGVkIGVub3VnaC4gVGhpcyBpcyBkb25lIHRv
IHN1cHBvcnQKYWxsIHRoZSBwb3NzaWJsZSBjb25maWd1cmF0aW9ucy4gUmVtb3ZpbmcgdGhlbSB3
aWxsIGxlYWQgdG8gbGlua2luZwplcnJvcnMuCgpBZnRlciBoYXZpbmcgdGhhdCBkaXNjdXNzaW9u
IGJhY2sgaW4gTWFyY2gsIEkgaGFkIGEgdmVyeSBxdWljayBsb29rIGFuZApkaWRuJ3Qgc2VuZCBh
IHBhdGNoIGJlY2F1c2UgSSBzdGlsbCBoYWQgbGlua2luZyBpc3N1ZXMuIEl0IGlzIG5vdAppbXBv
c3NpYmxlIGJ1dCBpdCByZXF1aXJlZCBtb3JlIHRpbWUgdGhhbiBJIGhhZC4KCi0tIApBbGV4YW5k
cmUgQmVsbG9uaSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
