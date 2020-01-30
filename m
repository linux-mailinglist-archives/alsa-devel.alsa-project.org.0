Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22D14DF14
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 17:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1DEC1673;
	Thu, 30 Jan 2020 17:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1DEC1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580401643;
	bh=P4hbId4UWIwA2SK8nK3DuwgQFh1GZ0MGD+Vp+6u6LdM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGes098SMp7NIQ/ABCW99jR9S1tdltPR7PtVcyHl43piNgAT5o8POTzH2RXZmeuJk
	 pBScMiequuQRWSG3xJJ8hvABDg9jloyFks8yboXl1Z+y/XvP31X71pN9skp3Pf/LGC
	 R4CUA8nHdLJG+BEH68eRBVlyRcTuLO+Fh4bvJvy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D42DDF80082;
	Thu, 30 Jan 2020 17:25:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40E1AF80150; Thu, 30 Jan 2020 17:25:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21B62F80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 17:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21B62F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="inIqrwx/"
Received: by mail-wr1-x442.google.com with SMTP id c9so4821321wrw.8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEv1TQ+edaBGRrOOmtAAmasVAys8eaAXmwOW+zWwiy0=;
 b=inIqrwx/INY/W2rxTtN9mm+ADXMSUo+PiEd5QuWGHJLov90zqaUR3epP311IVM+HwP
 OwkJDKkSEhRW3CAqoIZo93HWiqAd7rcoEVda6FUqQnwWPGhTVbI8sgVpYBkTVjZ3txQs
 cKY2UK98WHWWeiOVC94dqJ1avrviw/UiEulYF7S4Ok8xW0JXXwgh4smuliReEd0D+tPm
 7cWVUfXjmDzNlIjhPXKtFXIVyDa1BFhztj4TtKaucNJcwyg84jRe0SAdivPSgYQBHLMr
 y7mZ7YjW3gEUxQBFUeTnQkRYugHzGEz1LeE3CpylU5WiQX8a5mtHQXUS9pHn0FGbY6M2
 NaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEv1TQ+edaBGRrOOmtAAmasVAys8eaAXmwOW+zWwiy0=;
 b=CsHlblsF4SMWtb5d8hjdN1nlWWB0sqS9aoKkaK5Rm5pAsJbZAcgpkt0m37MRup1bD4
 qZtyMr2CE0dYO9/nn96Cld0SV1YhgLTplphdheXCc73JZ8ciqIh5fmMXS0AYovK7uPPE
 LwW1cwSS84nCkr48RI1Xws1Dh4p17ZvsOLK8CvuQkuNlFG8FLpjIvaaneBCYFfTDF8+d
 iCmJ/mJ1MzQ+384QRrZC1n9dqDNeiW30PA4nRGO/h0G9fWWAjCIixktF08wDQxAKwbFd
 sJ3r0oZ68Bbf3NTbd7a8ew/qe9SKgYG7kZRw8CfgXNPJ8P2qivElHS4zW1dlbqjo08dx
 D6pg==
X-Gm-Message-State: APjAAAUFYvM6PfLDX2tuzqXKHg/P193ScsciEtPnGm2qkjpzl6+yKCgM
 QBHsuEdKpcOtVDi3r1u1n9w=
X-Google-Smtp-Source: APXvYqwFHZbZ3k2UC/uO+VYHuxO31Pgbs+0+4VDuytNaH0qr0kRLGfndMsE7Ij44bWvLABFZAxxUzQ==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr6455173wrw.165.1580401536329; 
 Thu, 30 Jan 2020 08:25:36 -0800 (PST)
Received: from schmakbook.localnet (router-kraduha-nat-p.pilsfree.net.
 [212.79.110.127])
 by smtp.gmail.com with ESMTPSA id i204sm7235421wma.44.2020.01.30.08.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 08:25:35 -0800 (PST)
From: Roman =?utf-8?B?xaBtYWthbA==?= <schmakerisko@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 30 Jan 2020 17:25:48 +0100
Message-ID: <5566728.lOV4Wx5bFT@schmakbook>
In-Reply-To: <s5hsgjxcafb.wl-tiwai@suse.de>
References: <2520086.mvXUDI8C0e@schmakbook> <11474778.O9o76ZdvQC@schmakbook>
 <s5hsgjxcafb.wl-tiwai@suse.de>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [CX2075] No sound after suspend/resume from
	front	speaker
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

RG5lIMSNdHZydGVrIDMwLiBsZWRuYSAyMDIwIDE0OjU5OjIwIENFVCwgVGFrYXNoaSBJd2FpIG5h
cHNhbChhKToKPiBPbiBUaHUsIDMwIEphbiAyMDIwIDE0OjI5OjA4ICswMTAwLAo+IAo+IFJvbWFu
IMWgbWFrYWwgd3JvdGU6Cj4gPiBEbmUgxI10dnJ0ZWsgMzAuIGxlZG5hIDIwMjAgMTQ6MDc6NTMg
Q0VULCBUYWthc2hpIEl3YWkgbmFwc2FsKGEpOgo+ID4gPiBPbiBUaHUsIDMwIEphbiAyMDIwIDEz
OjA3OjQ2ICswMTAwLAo+ID4gPiAKPiA+ID4gUm9tYW4gxaBtYWthbCB3cm90ZToKPiA+ID4gPiBE
bmUgxI10dnJ0ZWsgMzAuIGxlZG5hIDIwMjAgMTI6NTc6MzIgQ0VULCBUYWthc2hpIEl3YWkgbmFw
c2FsKGEpOgo+ID4gPiA+ID4gT24gVGh1LCAzMCBKYW4gMjAyMCAxMjo0MjowMSArMDEwMCwKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gUm9tYW4gxaBtYWthbCB3cm90ZToKPiA+ID4gPiA+ID4gRG5lIHN0
xZllZGEgMjkuIGxlZG5hIDIwMjAgMTI6MzM6MDYgQ0VUIGpzdGUgbmFwc2FsKGEpOgo+ID4gPiA+
ID4gPiA+IE9uIFNhdCwgMjUgSmFuIDIwMjAgMjM6MzA6MzIgKzAxMDAsCj4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gUm9tYW4gxaBtYWthbCB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IEhpLAo+
ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiB0aGlzIHN0aWxsIHNlZW0gdG8gYmUgYW4g
aXNzdWUuIEFmdGVyIHN0YXJ0dXAgZXZlcnl0aGluZyB3b3Jrcwo+ID4gPiA+ID4gPiA+ID4gd2Vs
bAo+ID4gPiA+ID4gPiA+ID4gdW50aWwKPiA+ID4gPiA+ID4gPiA+IHRoZSBsYXB0b3AgZ29lcyB0
byBzdXNwZW5kLgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBUcmllZCBwcmV0dHkg
bXVjaCBldmVyeXRoaW5nIGJhc2ljIHVzZXIgY2FuIGRvICh1bm11dGVzLAo+ID4gPiA+ID4gPiA+
ID4gcm1tb2RzCj4gPiA+ID4gPiA+ID4gPiBhbmQgc28KPiA+ID4gPiA+ID4gPiA+IG9uKSwKPiA+
ID4gPiA+ID4gPiA+IHN0aWxsIG5vIHdheSB0byB3YWtlIHRoZSBvdXRwdXQuIEFMU0Egc2VlbXMg
dG8gYmUgdGhpbmtpbmcsCj4gPiA+ID4gPiA+ID4gPiB0aGF0Cj4gPiA+ID4gPiA+ID4gPiBvdXRw
dXQgaXMKPiA+ID4gPiA+ID4gPiA+IGFjdGl2ZSwgeW91IGNhbiBzZXQgdm9sdW1lIGFuZCBzdHVm
ZiwgYnV0IG5vdGhpbmcgaGFwcGVucy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
QUxTQSBpbmZvOgo+ID4gPiA+ID4gPiA+ID4gaHR0cDovL2Fsc2EtcHJvamVjdC5vcmcvZGIvP2Y9
OWQxZWU4MWZlMDM3YWNiNTNjYTM4MWYyZGUyN2JlNDIKPiA+ID4gPiA+ID4gPiA+IDBmODMKPiA+
ID4gPiA+ID4gPiA+IGEzNzMKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gUmVsYXRl
ZCBsaW5rczoKPiA+ID4gPiA+ID4gPiA+IGh0dHBzOi8vd3d3LnJlZGRpdC5jb20vci9hcmNobGlu
dXgvY29tbWVudHMvNG53enVhLwo+ID4gPiA+ID4gPiA+ID4gbm9fc291bmRfYWZ0ZXJfc3VzcGVu
ZF9raWxsaW5nX29yX3Jlc3RhcnRpbmcvCj4gPiA+ID4gPiA+ID4gPiBodHRwczovL2J1Z3MubGF1
bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9saW51eC8rYnVnLzE2MTI5MTYKPiA+ID4gPiA+ID4g
PiA+IGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9ODUx
NDA0Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhlIGZpcnN0IHRoaW5nIHRvIGNoZWNr
IGlzIHRvIGNvbXBhcmUgYWxzYS1pbmZvLnNoIG91dHB1dHMKPiA+ID4gPiA+ID4gPiBiZWZvcmUK
PiA+ID4gPiA+ID4gPiBhbmQKPiA+ID4gPiA+ID4gPiBhZnRlciB0aGUgc3VzcGVuZC4KPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBBbHNvIHBhc3Mgc25kX2hkYV9jb2RlYy5kdW1wX2NvZWY9
MSBtb2R1bGUgb3B0aW9uIHRvIGVuYWJsZSB0aGUKPiA+ID4gPiA+ID4gPiBDT0VGCj4gPiA+ID4g
PiA+ID4gZHVtcC4gIFRoaXMgd2lsbCBnaXZlIG1vcmUgaW5mb3JtYXRpb24gaW4gYWxzYS1pbmZv
LnNoIG91dHB1dHMuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4g
VGFrYXNoaQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gT2theSwgaSBkaWQgc29tZSBjb21wYXJp
bmcgd2l0aCBtb2R1bGUgb3B0aW9uIGVuYWJsZWQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gU291bmQgd29ya2luZwo+ID4gPiA+ID4gPiBodHRwOi8vYWxzYS1wcm9qZWN0
Lm9yZy9kYi8/Zj1hZGZiMGIzYWQ1ZDliOGQ4ODI4OWFjN2UzNWI3NDIyNTRiZWIKPiA+ID4gPiA+
ID4gNzU4OAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU291bmQgbm90IHdvcmtpbmc6Cj4gPiA+
ID4gPiA+IGh0dHA6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPWM3OTZiMTRkZjBlZmIwMDc5YWVm
MWRmNWY3MDc2NDE5NGNmZgo+ID4gPiA+ID4gPiA4ZDRkCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiBXaGF0J3Mgd2llcmQgdG8gbWUgaXMsIHRoYXQgb24gdGhlIHJvdyA1MjEgdGhlcmUgaXMgY2hh
bmdlIGluCj4gPiA+ID4gPiA+IGFwbGF5Cj4gPiA+ID4gPiA+IFN1YmRldmljZXMgZnJvbSAxLzEg
dG8gMC8xLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQWxzbywgc3RhdGUuUENIIGNvbnRyb2wg
MTggc2hvd3MgY2hhbmdlIGluIHBsYXliYWNrIGNoYW5uZWwgbWFwLgo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gQW55IG90aGVyIHRoaW5nIGkgY2FuIGNoZWNrIG9yIHRyeSB0byBkb2ZvciBkZWJ1
Z2luZz8KPiA+ID4gPiA+IAo+ID4gPiA+ID4gWW91IHBhc3NlZCBhIHdyb25nIG9wdGlvbi4gIFRo
ZSBvcHRpb24gaXMgZm9yIHNuZF9oZGFfY29kZWMgbW9kdWxlLgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBTbyBlaXRoZXIgY3JlYXRlIGEgbW9kcHJvYmUuZC8qLmNvbmYgZmlsZSBjb250YWluaW5nOgo+
ID4gPiA+ID4gICBvcHRpb25zIHNuZF9oZGFfY29kZWMgZHVtcF9jb2VmPTEKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gb3IgcGFzcyBzbmRfaGRhX2NvZGVjLmR1bXBfY29lZj0xIGF0IGJvb3QgY21kbGlu
ZSBvcHRpb24uCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEJUVywgaXQnZCBiZSBiZXR0ZXIgdG8gZ2V0
IHRoZSBvdXRwdXRzIHdpdGggLS1uby11cGxvYWQgb3B0aW9uIG9mCj4gPiA+ID4gPiBhbHNhLWlu
Zm8uc2gsIGFuZCBhdHRhY2ggdGhlbS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gTGFzdCBidXQgbm90
IGxlYXN0LCBwbGVhc2UgZG9uJ3QgZHJvcCBDYyB0byBNTCB1bmxlc3MgeW91IG5lZWQgdG8gZG8K
PiA+ID4gPiA+IHNvLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHRoYW5rcywKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gVGFrYXNoaQo+ID4gPiA+IAo+ID4gPiA+IEFscmlnaHQsIG15IGJh
ZCwgaSdtIG5ldyB0byB0aGlzLgo+ID4gPiA+IAo+ID4gPiA+IEF0dGFjaGluZyBhbHNhaW5mb3Mg
d2l0aCBwcm9wZXIgbW9kdWxlIG9wdGlvbnMsIG5vIGJpZyBkaWZmZXJlbmNlCj4gPiA+ID4gdGhv
dWdoLgo+ID4gPiAKPiA+ID4gT0ssIHNvIGl0IGhhcyB0aGUgY29kZWMgaGFzIENPRUYgdGhpbmdz
IGFuZCB0aGVyZSBpcyBubyBzaWduaWZpY2FudAo+ID4gPiBkaWZmZXJlbmNlIGJldHdlZW4gdGhv
c2UgdHdvIG91dHB1dHMuICBJdCBpbXBsaWVzIHRoYXQgc29tZXRoaW5nCj4gPiA+IG91dHNpZGUg
SEQtYXVkaW8gYnVzIGlzIG5lZWRlZCBhbmQgaXQncyBwcm9iYWJseSBkb25lIGJ5IEJJT1MuCj4g
PiA+IAo+ID4gPiAKPiA+ID4gVGFrYXNoaQo+ID4gCj4gPiBPa2F5LCBzbyBhcmUgdGhlcmUgYW55
IGZ1cnRoZXIgc3RlcHMgcmVxdWlyZWQgZnJvbSBtZSwgb3IgaXQncyBqdXN0IG1hdHRlcgo+ID4g
b2YgdGltZSBmb3IgZGV2cyBmb3IgcGljayB0aGlzIGJ1ZyB1cD8KPiAKPiBXZWxsLCBpZiB5b3Ug
bWVhbnQgdXMgYXMgImRldnMiLCBjdXJyZW50bHkgdGhlcmUgaXMgbm8gbXVjaCB0aGluZyB3ZQo+
IGNhbiBkbyBmb3Igbm93LiAgQXMgc2FpZCwgdGhlIGlzc3VlIGlzIHByZXR0eSBtdWNoIHZlbmRv
ci1zcGVjaWZpYwo+IGltcGxlbWVudGF0aW9uIGRldGFpbHMuICBZb3UgY2FuIHRyeSBhc2tpbmcg
dGhlIGgvdyB2ZW5kb3IsIGJ1dCB0aGUKPiBjaGFuY2UgaXNuJ3QgaGlnaCwgdW5mb3J0dW5hdGVs
eS4KPiAKPiBJIHN1cHBvc2UgaGVyZSB0aGF0IHRoZSBydW50aW1lIFBNIHdvcmtzOyBpLmUuIGFm
dGVyIHNvbWUgdGltZSB3aXRob3V0Cj4gYWN0aXZpdHkgdGhlIGNoaXAgd2lsbCBiZSBzdXNwZW5k
ZWQuICBDaGVjawo+IC9zeXMvYnVzL2hkYXVkaW8vZGV2aWNlcy8qL3Bvd2VyL3J1bnRpbWVfc3Rh
dHVzLiAgSWYgaXQncyAic3VzcGVuZGVkIiwKPiBhbmQgaWYgeW91IGNhbiBwbGF5IGJhY2sgdG9u
ZSBhZnRlciB0aGlzIHN0YXRlLCBydW50aW1lIFBNIGJhc2ljYWxseQo+IHdvcmtzLCBhbmQgaXQg
aW1wbGllcyB0aGF0IHRoZSByZXN0IGlzIHRoZSBzeXN0ZW0td2lkZSBwb3dlciB1cAo+IHByb2Js
ZW0gdGhhdCBpcyBkZWVwbHkgaW52b2x2ZWQgd2l0aCBCSU9TLgo+IAo+IAo+IFRha2FzaGkKCkkg
Y2FuIGNvbmZpcm0gdGhhdCBydW50aW1lIFBNIHdvcmtzLCBidXQgdGhlcmUgaXMgbm8gd2F5IHRv
IG1ha2Ugc291bmQgd29yayAKYWZ0ZXIgc3VzcGVuZCBzbyBmYXIuIEF0IGxlYXN0IGZvciBCSU9T
IHZlci4gMS45CgpHb25uYSB0cnksIGlmIHBvc3NpYmxlLCB0byB1cGdyYWRlIEJJT1MganVzdCB0
byBjb25maXJtIGl0J3Mgc3RpbGwgYW4gaXNzdWUuCgpUaGFua3MKUm9tYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
