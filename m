Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9649ECA73
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 22:43:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22C872393;
	Fri,  1 Nov 2019 22:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22C872393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572644624;
	bh=duMNDnTF7GPxnXu00a7tp/mhQLXzP47TSYdZ8x+JLKs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMkIzr7gKvc2B2Sn+p6cqb0BA7CZsbR42CcYbrDriqwf3L1EhC3SMkFvB1I6QgeBy
	 iaqFodp3zFXRhD///K7mrgYtJ1P8umTixARBLcrFPWbhS2KIaAFG2NAQ9TqvPXk9QF
	 v6AYHUlcYpccA1AS7M5I+MgS0AV5Om45Rqy/N0ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27EE4F80363;
	Fri,  1 Nov 2019 22:42:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEFD3F800C9; Fri,  1 Nov 2019 22:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4C1F800C9
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 22:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4C1F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j4ZhrA6u"
Received: by mail-wm1-x32e.google.com with SMTP id t26so6189168wmi.4
 for <alsa-devel@alsa-project.org>; Fri, 01 Nov 2019 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dhjtiPq6hhnW5hGY7vpr0Sdr0516NbCjOn7HdBu98Yc=;
 b=j4ZhrA6uwUnxBeQAhJ/jFbhCT8hYOLze8fDX/ieOsclMO3ypH4QwX3JAGVDipRjx8v
 ApColH9RMDgE79NBIvzkUr3g8SXBZBYRHRwvkEXcmQoPWwY6jsWz7rOEkI/Lv45e5s19
 jJ5bBXaZSie94kOlqy4PjIn38xwo/fDVbGvyHYyCTIQMI6Qo6kYc3a4N4q06+jsvfwYH
 cGr8jwOBrlFqSWAJUeE6kiyjZf33I3npxPw2UqKPqBMtlwCzJiGDJnAVpevNbmFZQaVW
 UzR5iXSGff5XwgV/fUP3IkL2XrxFsvVAVdpX+//tLvJR2HpoaskW9b7Dd8hnyvGiwajb
 oftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dhjtiPq6hhnW5hGY7vpr0Sdr0516NbCjOn7HdBu98Yc=;
 b=Mhz4WKHqI54ufl7ZStGZLjJCtqBxBj9Bu5AiHdJAi2br4lS4UnuaunGyrp2LpOVEwB
 oFJHdLXdoleR3cYipOYO9nsEU3fVaAySAsGOvNUaORbRwHhrc2HspSNj8wTl5U1ckCW8
 uh51fRvWP9MtPBWfY2SArL7dh4s3iV+POSn4Q6hXzVuFwhpyI2aw0VGdZzvPI8O2vfq6
 yLaEG/kzhS5edUpmUANN5J17R6ETYnxqtPC3vBnS+U2OrY93Y3V4z9XF+78lBQCUPSZq
 nwBFaXEAptv0FXssfDEZFIhNgLbfOgOWVXf3xva7JiaTRw6puD5S6ml615mfYDqEhaT1
 eZUQ==
X-Gm-Message-State: APjAAAV/zE79tC1d/E9kCfFl22rZNololVg+fgqV/QmqiIO6M9ZikWkw
 kNeiFp76fylPAOMAdlfsta0V7LFf2X++xSXaxro=
X-Google-Smtp-Source: APXvYqxG4W8KgAEpRGfKqcC6ZQctw2wWN2o5gIjGYsPXfN0hWZXMy/aa607MoOl+n+GsGE8NcdJ38yqBhfp/eCAunhc=
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr12449129wmg.13.1572644504414; 
 Fri, 01 Nov 2019 14:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZAen_Aa7SMdnPY4ezzbYtUypShto7ENGV_FhnsNhnxmBQ@mail.gmail.com>
 <87o8yi6c7x.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8yi6c7x.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 1 Nov 2019 23:41:33 +0200
Message-ID: <CAEnQRZA9APzcCz-N=+WpgEA6w-EO54W=Wqc59FCWi2AP8u_3ng@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>
Subject: Re: [alsa-devel] Question about FE & BE DPCM
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgNDoxNSBBTSBLdW5pbm9yaSBNb3JpbW90bwo8a3VuaW5v
cmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+IHdyb3RlOgo+Cj4KPiBIaSBEYW5pZWwKPgo+ID4g
wrsgICAgICAgLyogQkUgaXMgZHVtbXkgKi8KPiA+IMK7ICAgICAgIMK7ICAgICAgIGNvZGVjcy0+
b2Zfbm9kZcK7wrsgICAgICAgPSBOVUxMOwo+ID4gwrsgICAgICAgwrsgICAgICAgY29kZWNzLT5k
YWlfbmFtZcK7ICAgICAgID0gInNuZC1zb2MtZHVtbXktZGFpIjsKPiA+IMK7ICAgICAgIMK7ICAg
ICAgIGNvZGVjcy0+bmFtZcK7ICAgwrsgICAgICAgPSAic25kLXNvYy1kdW1teSI7Cj4gPgo+ID4g
wrsgICAgICAgwrsgICAgICAgLyogRkUgc2V0dGluZ3MgKi8KPiA+IMK7ICAgICAgIMK7ICAgICAg
IGRhaV9saW5rLT5keW5hbWljwrsgICAgICDCuyAgICAgICA9IDE7Cj4gPiDCuyAgICAgICDCuyAg
ICAgICBkYWlfbGluay0+ZHBjbV9tZXJnZWRfZm9ybWF0wrsgICA9IDE7Cj4KPiBBaGgsIGluZGVl
ZC4uLiBpdCBpcyB3cm9uZyBjb21tZW50Lgo+IEl0IHNob3VsZCBiZSAvKiBDb2RlYyBpcyBkdW1t
eSAqLyBoZXJlLgo+IEkgd2lsbCBwb3N0IGZpeHVwIHBhdGNoLCBzb29uLgo+Cj4gQ3VycmVudCBz
aW1wbGUtY2FyZCBpcyBhc3N1bWluZwo+Cj4gICAgICAgICBGRTogQ1BVLWR1bW15Cj4gICAgICAg
ICBCRTogZHVtbXktQ29kZWMKPgo+ID4gYXNvY19zaW1wbGVfY2Fub25pY2FsaXplX3BsYXRmb3Jt
IGZ1bmN0aW9uIHdoZXJlIGl0IGRvZXMgc2F5Ogo+ID4KPiA+IMK7ICAgICAgICAqIERQQ00gQkUg
Y2FuIGJlIG5vIHBsYXRmb3JtLgo+ID4gwrsgICAgICAgICogQWxsb2NlZCBtZW1vcnkgd2lsbCBi
ZSB3YXN0ZSwgYnV0IG5vdCBsZWFrLgo+ID4gwrsgICAgICAgICovCj4gPiDCuyAgICAgICBpZiAo
IWRhaV9saW5rLT5wbGF0Zm9ybXMtPm9mX25vZGUpCj4gPiDCuyAgICAgICDCuyAgICAgICBkYWlf
bGluay0+bnVtX3BsYXRmb3JtcyA9IDA7Cj4gPgo+ID4gQnV0IEkgZG8gd2FudCB0byBjcmVhdGUg
YSBCRSB3aXRoIGEgcGxhdGZvcm0uIFNvLCBzaG91bGQgSSB0cnkgdG8KPiA+IHJldmVydCB0aGUg
Zm9sbG93aW5nCj4KPiBJIHNlZS4KPiBJJ20gbm90IHVzaW5nIGJ1dCBzb21lb25lIGFkZGVkIGFz
b2Nfc2ltcGxlX3BhcnNlX3BsYXRmb3JtKCkuCj4gTWF5YmUgaXQgY2FuIGhlbHAgeW91ICg/KSwg
YnV0IGl0IGlzIG5vdCBjYWxsZWQvdXNlZCB1bmRlciBEUENNIGNhc2UuCj4gSWYgeW91IGNhbiBz
dXBwb3J0IGl0IHVuZGVyIERQQ00sIGFzb2Nfc2ltcGxlX2Nhbm9uaWNhbGl6ZV9wbGF0Zm9ybSgp
Cj4gaXMgbm8gbG9uZ2VyIHlvdXIgaXNzdWUgPwoKWWVzLCB0aGlzIHdvdWxkIGRlZmluaXRlbHkg
aGVscC4gTm93IEknbSB0cnlpbmcgdG8gZmlndXJlIG91dCBhbiBhY2NlcHRhYmxlCndheSB0byBj
cmVhdGUganVzdCBvbmUgbGluayB3aXRoOgoKRkU6IENQVS1kdW1teQpCRTogZHVtbXktQ29kZWMK
Ck9yIGV2ZW4gYmV0dGVyIGp1c3Qgb25lOgoKQkU6IGR1bW15LUNvZGVjLgoKQm90aCBhdWRpby1n
cmFwaC1jYXJkLmMgYW5kIHNpbXBsZS1jYXJkLmMgZGVhbCB3aXRoIERQQ00gb25seSB3aXRoCnRo
aXMgY29uZGl0aW9uczoKCsK7ICAgICAgIMK7ICAgICAgIMK7ICAgICAgIC8qCsK7ICAgICAgIMK7
ICAgICAgIMK7ICAgICAgICAqIEl0IGlzIERQQ00KwrsgICAgICAgwrsgICAgICAgwrsgICAgICAg
ICogaWYgQ29kZWMgcG9ydCBoYXMgbWFueSBlbmRwb2ludHMsCsK7ICAgICAgIMK7ICAgICAgIMK7
ICAgICAgICAqIG9yIGhhcyBjb252ZXJ0LXh4eCBwcm9wZXJ0eQrCuyAgICAgICDCuyAgICAgICDC
uyAgICAgICAgKi8KCm9yCgrCuyAgICAgICDCuyAgICAgICDCuyAgICAgICBpZiAoZHBjbV9zZWxl
Y3RhYmxlICYmCsK7ICAgICAgIMK7ICAgICAgIMK7ICAgICAgICAgICAobnVtID4gMiB8fArCuyAg
ICAgICDCuyAgICAgICDCuyAgICAgICAgICAgIGFkYXRhLmNvbnZlcnRfcmF0ZSB8fCBhZGF0YS5j
b252ZXJ0X2NoYW5uZWxzKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
