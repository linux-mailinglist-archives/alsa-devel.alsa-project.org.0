Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE6108576
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 00:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F43186F;
	Mon, 25 Nov 2019 00:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F43186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574636966;
	bh=Qnkx1Z+dbZeZCMYOomyCAkOw7Ey+Nz/iHLPXy57ViOY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCLuVXcx9M//jfUnfLvvAyF0EMw0cG9Gsa6ZKAkylun0ebQQtokh75lA0G7Z4hx4Y
	 uwDPPcIqDBYRcYrqbok0I2UXg582jvejBNG6G8jLQtE5Nl3CYVSjGul8CM9viwgcko
	 XtyNVUNGTeemh/x6yTv/qev2vPy6NotgypjNIr2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1232F80159;
	Mon, 25 Nov 2019 00:07:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9516FF801ED; Mon, 25 Nov 2019 00:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8C5F80108
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 00:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8C5F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LkTjbhko"
Received: by mail-lj1-x22d.google.com with SMTP id y23so13525540ljh.10
 for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2019 15:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U7dkV1fZwkif694vRpgDaZdMhFvsfH7UPDQjtdiU/ow=;
 b=LkTjbhkopyL8s9VIlZgs1ugslyxfKXWThCgHriIemUE5xOaPtTTAtJW6uMmIOujX0z
 j2PcVk2Hna7Q+y2QrDKqQ3Ep3AB/GvVtOKW0S6jCAvTEns9HuBu2oT1DU6SmJmwNQkA1
 W3VbN4KdIshmUtARMxsKuIybT7jfsXhU3Bugsc94Kvo4rweUkz4qxbFEpH85HH/59+Xn
 9DGcpNMwveO3JEtWVSInVL4cMK9O1TxOCIiHifGXEEFK9WOF8QXqCmyVHo/bagrEKGmJ
 tQKQiXHj7+yWy27wugIgy9YrsN0Yqur/hi3Cp29tQ8BFnKuoJyC1sxiE/DANlfijaLEK
 WI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U7dkV1fZwkif694vRpgDaZdMhFvsfH7UPDQjtdiU/ow=;
 b=Y8Yct4T8PXpEN+N7j51vnkFY9O22/nViAsJMEmiDBejctJIWGa1FjKAU7oAA1XE63d
 WwA9pMXzJ2GBxO+Eucz7xVXCTcmkB/WvK3x9nmsQljVXvD5dsbuTfXr3GFv4Upy0RSPf
 lnhQ1det+ANFQ3d1f3w60Dqp5TBl5+DBJaJxOIyipCADVAbvzeVybEnztw1Q1RLXnyyV
 ZcbBIN9fLMyKxMX7gN2+/nEMmSLiYLxhd9XyUVqkO7CBrmBGFfUffzOrt21ZNKC+hn4O
 skS1IYY6QrQJMzHTPOQxVp/Iyo4TYipmJW5gyrHX2+ct4l150qyFn3kqeCQYAD671wSz
 SL2w==
X-Gm-Message-State: APjAAAVzbpk0e44yNsqvOWiouo/Mpqwjk1FIlQ4zj2uuglfkBxSulen9
 1b6sC4nHFezgHCX/xZaIbGMCdtKxU2ArSXNmtsU=
X-Google-Smtp-Source: APXvYqxtLF96m0cRZUg1XUtHsiKS/6zOG+VKLUVkiM5sGRAaCQoU1N3LWsEIUAH4MkB30hNe4i9fv70sXZRq3Jt7gGU=
X-Received: by 2002:a2e:818e:: with SMTP id e14mr5600404ljg.245.1574636855850; 
 Sun, 24 Nov 2019 15:07:35 -0800 (PST)
MIME-Version: 1.0
References: <CABPh3UOig4HS5=sKB0bk+wtWJoshTbMGA6L18w14i1QNF6TsxA@mail.gmail.com>
 <30bf6f19-e97b-c4fe-e428-7cade1df7751@jensverwiebe.de>
In-Reply-To: <30bf6f19-e97b-c4fe-e428-7cade1df7751@jensverwiebe.de>
From: nick83ola <nick83ola@gmail.com>
Date: Sun, 24 Nov 2019 23:07:24 +0000
Message-ID: <CABPh3UPYhJZu85XMRPfJqs_-yuTpxvfCogiaNTaHnJhTFaUwYQ@mail.gmail.com>
To: Jens Verwiebe <info@jensverwiebe.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Line 6 Helix quirks
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

SGkgSmVucywKaW4gbXkgaHggc3RvbXAgd2l0aCAyLjgyIGZpcm13YXJlIHRoZSBVU0IgaWQgaXMg
dGhlIHNhbWUgYW5kIEknbSBub3QKZXhwZXJpZW5jaW5nIGFueSBnbGl0Y2guCkFsc28gc29tZSBw
ZW9wbGUgb24gbGluZTYgY29uZmlybSB0aGF0IHRoZSBwYXRjaCBpcyB3b3JraW5nIGZvciBoeCBz
dG9tcC4KSWYgb24gaGVsaXggdGhlIHNpdHVhdGlvbiBpcyBkaWZmZXJlbnQgeW91IHNob3VsZCBz
dWJtaXQgYSBwYXRjaC4KCkJlc3QgUmVnYXJkcwpOaWNvbGEgTHVuZ2hpCgpPbiBTdW4sIDI0IE5v
diAyMDE5IGF0IDEzOjQxLCBKZW5zIFZlcndpZWJlIDxpbmZvQGplbnN2ZXJ3aWViZS5kZT4gd3Jv
dGU6Cgo+IEJhY2sgdG8gdGhlIEhlbGl4IG9uY2UgbW9yZSAuLi4uLgo+Cj4gSSBhbHJlYWR5IGlu
Zm9ybWVkIE5pY29sYSBhYm91dCBsYXRlc3QgTGluZTYgZmlybXdhcmUgMi44IGZmIGNoYW5nZXMu
Cj4KPiBBbGwgSGVsaXggZGV2aWNlcyBzZWVtIHRvIGdldCBhIG5ldyBwcm9kdWN0IGlkIGR1ZSB0
byB0aGUgbmV3IGNvcmUgY2hhbmdlcy4KPgo+IEFkZGl0aW9uYWxseSB3ZSBoYXZlIG5vdyBhbiBl
bmRwb2ludCA1IGZvciBISUQgc3VwcG9ydCAoIGFwcGxpZWQgZHVtcCApLgo+IE5vdCBzdXJlIHdo
YXQgd2UgY2FuIG1ha2Ugb3V0IG9mIHRoaXMKPgo+IGNhdXNlIGEgbGFjayBvZiBpbnZlc3RpZ2F0
aW9uIHRpbWUuIFRoZSBhdWRpbyBlbmRwb2ludCBkZXNjcmlwdG9ycyBhcmUKPiB1bmNoYW5nZWQu
Cj4KPgo+IFRoZSBwcm9ibGVtIHdpdGggbm90IHdvcmtpbmcgaW1wbGljaXRlIGZlZWRiYWNrIHN0
YXlzLCBzbyBpIHN0aWxsIHVzZSBteQo+IGFyYml0cmFyeSA0ODAwNSBIeiBoYWNrLgo+Cj4gV2l0
aG91dCBzbGlnaHQgcG9wIHdvdWxkIG9jdXJlIGluIGF1ZGlvLCBidXQgc3RpbGwgd2l0aCB0aGlz
IGhhY2sgZXZlcnkKPiAyMCBtaW51dGVzIGkgZ2V0IGEgc2xpZ2h0IGRpc3RvcnRpb24gd2hpY2gK
Pgo+IGlzIG5vIHN1cnByaXNlLgo+Cj4gQ2FuIHNvbWVvbmUgc2hlZCBsaWdodCBoZXJlIGlmIGFu
IGltcGxpY2l0ZSBmZWVkYmFjayBkZXZpY2Ugc2hvdWxkIHNob3cKPiB0aGUgZXhhY3QgbW9tZW50
w6RyeSBmZXF1ZW5jeSA/Cj4KPiBTaG91bGQgaSBzZWUgYWxzbyB0aGUgMTYuMTYgZmVlZGJhY2sg
Zm9ybWF0ID8KPgo+IEkgbG9va2VkIHRocm91Z2ggYWxsIGNvZGUgYW5kICdhbSBzdGlsbCBzdHVu
bmVkIHdoZXJlIHRoZSBzeW5jCj4KPiBmYWlscy4KPgo+IEJ0dzogaSBoYXZlIGFsc28gYXR0YWNo
ZWQgaW9yZWcgaW5mb3JtYXRpb24gZnJvbSBtYWNPUyBpZiB0aGlzIGhlbHBzCj4gc29tZW9uZSB0
byBkaWcgZGVlcGVyLiBJIGR1bXBlZCBkcml2ZXJsZXNzCj4KPiAidXNiIGNvbXBsaWFudCIgbW9k
ZSBoZXJlIHdpdGggaW50ZWdlciBvdXRjb21lIGZvciBhIHF1aWNrIG92ZXJsb29rLgo+Cj4KPiBU
aGlzIHNvIGZhciAuLi4gSmVucwo+Cj4gLS0KPgo+IEplbnMgVmVyd2llYmUKPiBBbGxlcnNrZWhy
ZSA0NCAtIDIyMzA5IEhhbWJ1cmcKPgo+IFRlbC46ICs0OSA0MCA2OCA3OCA1MAo+IG1haWx0bzog
aW5mb0BqZW5zdmVyd2llYmUuZGUKPiB3ZWI6IGh0dHBzOi8vd3d3LmplbnN2ZXJ3aWViZS5kZQo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNh
LWRldmVsIG1haWxpbmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
