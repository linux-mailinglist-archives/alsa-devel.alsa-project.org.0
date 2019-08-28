Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D802CA1CCD
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 655551682;
	Thu, 29 Aug 2019 16:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 655551682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089104;
	bh=Kbre1Gxmp4VZlDA5Eh2+Rj0YNV4g7C6ilB6st5sAb/s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLQAxCbYsk8jmcd/LE8kCGJmOsh6ivDUbNuhCqeUh6sMZpCX5lsY6TgK89m9Rn7M3
	 NIcsHPsvlb6rhFRxH/F5LyS7siLWHJKoA1rRaMh1ujGymT+RE94FZ3pLEQucdSvra4
	 0UXTIltfhvgR3nrkwGZFs+FoU33RQ6T/X8mlqqOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D22F897E2;
	Wed, 28 Aug 2019 20:34:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A6D0F897E1; Wed, 28 Aug 2019 20:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C304F897DE
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 20:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C304F897DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MLqrqhKZ"
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 518FC208C2
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 18:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567017273;
 bh=QlJKrHuG8AijV/iNEU5ZY82mlQS+xGN6r27ZxabHhuE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MLqrqhKZvW++VoqjZu0wKlAS41c+6bTvUhyT44KCDmpDXDeL6e9Z+bh46Izr+Cg6o
 aMW7k13Tnkpn/nhxaWJLmRCcQwwB6ZEkyDRvuvwY/WsDNW65AHvfskOlzpqXdyXJ5C
 pOmeQkVOnKSdT9EoZITcYWWMEAQ93s0tEGfcaFA0=
Received: by mail-qk1-f171.google.com with SMTP id y22so616734qkb.11
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 11:34:33 -0700 (PDT)
X-Gm-Message-State: APjAAAWwPmzy6U9De/0sjDoMyRaUVC9wzjXfm13h+ztXoZVUlb00AzFe
 wcmALpTlniMyyhwsOftPBH5Q3AfRAFRdVZ/mfA==
X-Google-Smtp-Source: APXvYqz5A5Bvj5V4jmWUchP11mypRsc4CrfFKrk/S0ky7O9zQRqolgrNnj40h/MhRHeg7iGHdxRMNzcIxjSQshaobs4=
X-Received: by 2002:a37:8905:: with SMTP id l5mr5638069qkd.152.1567017272343; 
 Wed, 28 Aug 2019 11:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <9b85d5a7c7e788e9ed87d020323ad9292e3aeab7.1566677788.git.mirq-linux@rere.qmqm.pl>
 <20190827223716.GA31605@bogus> <20190828130252.GD20202@qmqm.qmqm.pl>
In-Reply-To: <20190828130252.GD20202@qmqm.qmqm.pl>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 Aug 2019 13:34:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+tD1U2znUTdHxZDCJnfYa9fUeU4YMDAMMFXDka8vJ7jg@mail.gmail.com>
Message-ID: <CAL_Jsq+tD1U2znUTdHxZDCJnfYa9fUeU4YMDAMMFXDka8vJ7jg@mail.gmail.com>
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 4/6] dt-bindings: misc: atmel-ssc: LRCLK
	from TF/RF pin option
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

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgODowMyBBTSBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1s
aW51eEByZXJlLnFtcW0ucGw+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDU6
Mzc6MTZQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBTYXQsIEF1ZyAyNCwgMjAx
OSBhdCAxMDoyNjo1NVBNICswMjAwLCBNaWNoYcWCIE1pcm9zxYJhdyB3cm90ZToKPiA+ID4gQWRk
IHNpbmdsZS1waW4gTFJDTEsgc291cmNlIG9wdGlvbnMgZm9yIEF0bWVsIFNTQyBtb2R1bGUuCj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJl
cmUucW1xbS5wbD4KPiA+ID4KPiA+ID4gLS0tCj4gPiA+ICAgdjI6IHNwbGl0IGZyb20gaW1wbGVt
ZW50YXRpb24gcGF0Y2gKPiA+ID4KPiA+ID4gLS0tCj4gPiA+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWlzYy9hdG1lbC1zc2MudHh0IHwgNSArKysrKwo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvYXRtZWwtc3NjLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL2F0bWVsLXNzYy50eHQKPiA+ID4gaW5kZXgg
ZjlmYjQxMjY0MmZlLi5jOThlOTZkYmVjM2EgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL2F0bWVsLXNzYy50eHQKPiA+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvYXRtZWwtc3NjLnR4dAo+ID4gPiBA
QCAtMjQsNiArMjQsMTEgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKPiA+ID4gICAgICAgICB0aGlz
IHBhcmFtZXRlciB0byBjaG9vc2Ugd2hlcmUgdGhlIGNsb2NrIGZyb20uCj4gPiA+ICAgICAgIC0g
QnkgZGVmYXVsdCB0aGUgY2xvY2sgaXMgZnJvbSBUSyBwaW4sIGlmIHRoZSBjbG9jayBmcm9tIFJL
IHBpbiwgdGhpcwo+ID4gPiAgICAgICAgIHByb3BlcnR5IGlzIG5lZWRlZC4KPiA+ID4gKyAgLSBh
dG1lbCxscmNsay1mcm9tLXRmLXBpbjogYm9vbCBwcm9wZXJ0eS4KPiA+ID4gKyAgLSBhdG1lbCxs
cmNsay1mcm9tLXJmLXBpbjogYm9vbCBwcm9wZXJ0eS4KPiA+ID4gKyAgICAgLSBTU0MgaW4gc2xh
dmUgbW9kZSBnZXRzIExSQ0xLIGZyb20gUkYgZm9yIHJlY2VpdmUgYW5kIFRGIGZvciB0cmFuc21p
dAo+ID4gPiArICAgICAgIGRhdGEgZGlyZWN0aW9uLiBUaGlzIHByb3BlcnR5IG1ha2VzIGJvdGgg
dXNlIHNpbmdsZSBURiAob3IgUkYpIHBpbgo+ID4gPiArICAgICAgIGFzIExSQ0xLLiBBdCBtb3N0
IG9uZSBjYW4gYmUgcHJlc2VudC4KPiA+Cj4gPiBBIHNpbmdsZSBwcm9wZXJ0eSB0YWtpbmcgMSBv
ZiBwb3NzaWJsZSAyIHZhbHVlcyB3b3VsZCBwcmV2ZW50IHRoZSBlcnJvcgo+ID4gb2YgbW9yZSB0
aGFuIDEgcHJvcGVydHkgcHJlc2VudC4KPgo+IEl0IHN0aWxsIHdvdWxkIG5lZWQgYSB2YWxpZGF0
aW9uIGNoZWNrIGluIHRoZSBjb2RlLCB0aG91Z2g6IHlvdQo+IGNvdWxkIHB1dCB3cm9uZyB2YWx1
ZSB0aGVuLiAgSXQgc2VlbXMgbW9yZSBjb25zaXN0ZW50IHdpdGggdGhlCj4gZXhpc3RpbmcgcGFy
YW1ldGVycyB0byBoYXZlIHR3byBib29sIHByb3BlcnRpZXMuCgpJdCB3YXMgdmFsaWRhdGlvbiB1
c2luZyBzY2hlbWEgdGhhdCBJIHdhcyB0aGlua2luZyBhYm91dC4gRXhwcmVzc2luZyBhCnBvc3Np
YmxlIHNldCBvZiB2YWx1ZXMgZm9yIGEgcHJvcGVydHkgaXMgZWFzaWVyIHRoYW4gaW50ZXItcHJv
cGVydHkKY29uc3RyYWludHMuCgpCdXQgaWYgeW91IHJlYWxseSBwcmVmZXIgYXMtaXM6CgpSZXZp
ZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
