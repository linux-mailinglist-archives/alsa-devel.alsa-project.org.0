Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D468A14961B
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 15:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C3B167F;
	Sat, 25 Jan 2020 15:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C3B167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579963016;
	bh=Ve1ROTl/jmAG5lWwmI+gvN7JxZTPlVntFdqHrGsJCM4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gv9O1ZO2Qym/HkIZWE9GTPKVwxoJUukrLQX+3jCZxiyGIcylYDZLWKGX5crnZr6na
	 xvJjAQ+8riPZRRbf1DRwTEA8/0XPWe9cgk3PBIYb4gYnEucjsswd+qNDXacgrEaOYr
	 KbcXzoqaeVpHNMStunk2LD9uF+KcQVhISglEzfPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 739DCF801F9;
	Sat, 25 Jan 2020 15:35:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE483F801F9; Sat, 25 Jan 2020 15:35:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 676AAF8012E
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 15:35:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 676AAF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="nsmgPtBc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=aykVI1njaha3r3cgiP7K9CMwvkmi/Cra+mY5duZqvHA=; b=nsmgPtBcLsck50yL1eEIbQR2u9
 BzSpBo98TW3q/XxUP4MgnVT7TJHFjE5VbTFWAJ4HNSGTJNd3kuL+9Z2+TJSzbKR2mx4VCuRxz4iJY
 s7CYCiNFZ/08yklWAAMPbB9SGFYsmMSO4n13NbhT/l97e87N7XLU5ajijzioPLJS0KO4=;
Received: from [2a00:1370:8125:a23e:55c9:2d3a:3db9:4bca] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1ivMXD-0005yr-Ow; Sat, 25 Jan 2020 17:35:39 +0300
Message-ID: <1c9ac8ab4d2e2897a351e7d03ae08f6d6e45c8bc.camel@tsoy.me>
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, Jens Verwiebe <info@jensverwiebe.de>
Date: Sat, 25 Jan 2020 17:35:38 +0300
In-Reply-To: <s5hd0b71v0o.wl-tiwai@suse.de>
References: <20200125132226.31277-1-nick83ola@gmail.com>
 <9b997da2-a292-9e4d-764e-ef3dedf0ce14@jensverwiebe.de>
 <s5hd0b71v0o.wl-tiwai@suse.de>
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Carlo Calica <carlo@calica.com>,
 Nicola Lunghi <nick83ola@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: add quirks for Line6
 Helix fw 2.82
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

0JIg0KHQsSwgMjUvMDEvMjAyMCDQsiAxNToxNiArMDEwMCwgVGFrYXNoaSBJd2FpINC/0LjRiNC1
0YI6Cj4gT24gU2F0LCAyNSBKYW4gMjAyMCAxNToxMjo0OCArMDEwMCwKPiBKZW5zIFZlcndpZWJl
IHdyb3RlOgo+ID4gSGkKPiA+IAo+ID4gV2h5IHRoaXMgaW5jb21wbGV0ZSBwYXRjaCA/Pz8KPiA+
IAo+ID4gSSBsb25nZXIgaW5mb3JtZWQgeW91IHRoYXQgd2l0aCBmdyA+PSAyLjggbG90IG9mIGhl
bGl4IGtpbmQgZGV2aWNlcwo+ID4gZ290IGEgbmV3IElEOgo+ID4gCj4gPiBTbyB0aGlzIHBhdGNo
IHNob3VsZCBpbmNsdWRlIGF0IGxlYXN0IHRoZSB3ZWxsIGtub3duL2NvbGxlY3RlZAo+ID4gZGF0
YToKPiA+IAo+ID4gY2FzZSBVU0JfSUQoMHgwRTQxLCAweDQyNGEpOiAvKiBMaW5lNiBIZWxpeCBM
VCAtIGZpcm13YXJlID49IDIuOCAqLwo+IAo+IE9oLCBzbyB0aGUgcGF0Y2ggZG9lc24ndCB3b3Jr
IGFzIGlzPwo+IFRoZW4gSSBkcm9wIGl0IGFnYWluLgo+IAoKTm8sIEplbnMgY29tcGxhaW5lZCB0
aGF0IHRoZSBxdWlyayBzaG91bGQgYWxzbyBiZSBhcHBsaWVkIHRvIG90aGVyCmRldmljZXMgZnJv
bSB0aGUgSGVsaXggbGluZSB0aGF0IHJlY2lldmVkIG5ldyBmaXJtd2FyZS4gTm90IHN1cmUgd2hh
dCdzCnRoZSBwcm9ibGVtIHdpdGggc3VibWl0dGluZyB0aGVtIGluIGEgZm9sbG93LXVwIHBhdGNo
LgoKPiBJZiBhbnlvbmUgY2FuIHJlc3VibWl0IHRoZSBjb21wcmVoZW5zaXZlIG9uZSBhbmQgZ2l2
ZSB0aGUgdGVzdGVkLWJ5Cj4gdGFnLCBJJ2xsIGhhcHBpbHkgYXBwbHkgaXQuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
