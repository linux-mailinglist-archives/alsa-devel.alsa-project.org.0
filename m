Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE10CC76C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 04:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 259C91679;
	Sat,  5 Oct 2019 04:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 259C91679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570243651;
	bh=08JVfn4gP+eE67O1lB7KBVtn8NDphfx7oX0++1eAZyc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDGTxy5Kn+B8JYJAJbIjGqZZvIppKEhY0qu/d3zK/aFX8zZ86zzGqK6W6eiwfFxqM
	 J80FpHep6yUbFLqwHk4ePKAAqzPMKj8xN8PgQYqpIVFWNjEw3vdE48+/3AiYH5+t5n
	 evMBuUc7Nn40mnjQ6YYJgVX1TxpVCnNHz8PvxfK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF51BF80506;
	Sat,  5 Oct 2019 04:45:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3913BF80506; Sat,  5 Oct 2019 04:45:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A18F800D2
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 04:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A18F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="R51US8ek"
Received: by mail-wr1-x431.google.com with SMTP id z9so9164760wrl.11
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 19:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TVLpEM3Nt8G4vEeTNuNmG81mUMClUGk85ivpi3zh0ZA=;
 b=R51US8ekTEoGJcf5LSSC/mPuIANUfDdSVNYRgT27c5+jCKaw8lQR0PHy//FX/oiTOD
 0bpWMis4Jjq5Eya4CZausOOy8LGE/UsvfhQg37uah0Bwz8TV2LH/0eEtKSNZva46Z8de
 cDPkjWja33XMoOfsQPYwW9lfZhi1qBVkeIaBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TVLpEM3Nt8G4vEeTNuNmG81mUMClUGk85ivpi3zh0ZA=;
 b=JNI59AlqrbaR4nBb5VS5QJliTEyK+NbeLEChLhekIrnlNlxWcDurrob5bywbuqU4FY
 52MDTyT7QfY8KISHDft2ufmdNT3uGzPgsoq9gRrZxTd2TIEd43L3rmmUoAcLxsVpx+tY
 y8ErWCdnxCFnkro9vYVsbMSF4Oci/UmIxiGJgdPHgLJvC03ayELGG/sGt4XuE4shnwC3
 W0bxVVuzHnwNubdAfGbXDnPiOCVjGP1MXVCn0D6p9Wbd/DQgsMupDG5PmS11TlpvqzUL
 0Zv4BmwRumrTwlVukJWBSCHpjrA3RP1GjO+aFD1/WpVW6+MRCccJNS+GkMZ8pctXMaua
 D9Tg==
X-Gm-Message-State: APjAAAWMv89wJfyRRycdo7XNNzd5ll6uGnYxBBQTBKlNv/DyGP7cGiYf
 7GedqtimpFpffibiAG2CRFaR0UWUEU0vTFaLYwDFzQ==
X-Google-Smtp-Source: APXvYqwWPwLtz6xEMwmGdIiy8RIllJfZ7mVYQrZ+pjMLUafG1rNUI/zlhiFSND2ivoETYgnasfBke/Wx34disW4tCP4=
X-Received: by 2002:adf:f34b:: with SMTP id e11mr7197256wrp.369.1570243534455; 
 Fri, 04 Oct 2019 19:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <1000767908.8406503.1568280868516@mail.yahoo.com>
 <CAGvk5PpTPppjz70oND=TkVm05VzQDp7RvRDH+8JXrDMrAS8LPg@mail.gmail.com>
 <961122733.10516996.1568629558023@mail.yahoo.com>
 <CA+SWvNyeawE8WayvWJL=NWydxcxouY82oOE=FFHvh_Ru=q1btQ@mail.gmail.com>
In-Reply-To: <CA+SWvNyeawE8WayvWJL=NWydxcxouY82oOE=FFHvh_Ru=q1btQ@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sat, 5 Oct 2019 10:45:23 +0800
Message-ID: <CAGvk5PrnKNEXYBNmOnsBLiUGz_oN1MuWe7+2--1DmaOcmt33XA@mail.gmail.com>
To: Pavel Hofman <pavhofman@gmail.com>
Cc: htl10@users.sourceforge.net, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] alsa compliance test: H340 (USB audio) playback /
 capture rate asymmetry bug?
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

UGF2ZWwgSG9mbWFuIDxwYXZob2ZtYW5AZ21haWwuY29tPiDmlrwgMjAxOeW5tDnmnIgxNuaXpSDp
gLHkuIAg5LiL5Y2INzo1NeWvq+mBk++8mgoKPgo+IFRoaXMgdG9waWMgc2VlbXMgcXVpdGUgc2lt
aWxhciB0byBteSB0aHJlYWQgYWJvdXQgbWVhc3VyaW5nIGF2ZXJhZ2UgdGhyb3VnaHB1dCBmb3Ig
YXN5bmNocm9ub3VzIGZlZWRiYWNrIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2Fsc2Et
ZGV2ZWwvbXNnOTY3ODEuaHRtbCAuIEkgcGVyZmVjdGx5IHVuZGVyc3RhbmQgdGhlIG1vdGl2YXRp
b24gOi0pCj4KPiBQZXJoYXBzIHRoYXQgaW5leHBlbnNpdmUgaGVhZHNldCBpcyBub3QgcmVhbGx5
IGFzeW5jIHBsYXliYWNrLCBidXQgc3RhbmRhcmQgYWRhcHRpdmUsIHJlcG9ydGluZyBpbmNvcnJl
Y3QgVVNCIGhlYWRlcj8gVGhlbiBjYXB0dXJlIChhc3luYyA9IGludGVybmFsIGNsb2NrKSB3b3Vs
ZCBkaWZmZXIgZnJvbSBwbGF5YmFjayAoYWRhcHRpdmUgPSBVU0IgY29udHJvbGxlciBjbG9jayku
Cj4KPiBSZWdhcmRzLAo+Cj4gUGF2ZWwuCgpIaSBIaW4tVGFrLAoKU29ycnkgZm9yIHRoZSBsYXRl
IHJlcGx5LgpUaGUgbG9nIGxvb2tzIG5vcm1hbC4gSSBjYW4gbm90IGZpbmQgYW55IG9idmlvdXMg
cHJvYmxlbSB3aXRoaW4gdGhpcwpsb2cuIEFzIFBhdmVsIHNhaWQsIHRoZXkgdXNlIHRoZSBkaWZm
ZXJlbnQgY2xvY2suIFNvIEkgdGhpbmsgaXQgbWF5IGJlCnRoZSBwcm9ibGVtIG9mIHRoYXQgaGVh
ZHBob25lLgpEbyBvdGhlciBVU0IgaGVhZHBob25lcyBhbHNvIGhhdmUgdGhpcyBwcm9ibGVtPwoK
QmVzdCwKWXUtSHN1YW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
