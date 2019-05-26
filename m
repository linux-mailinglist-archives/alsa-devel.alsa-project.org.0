Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A72ABB5
	for <lists+alsa-devel@lfdr.de>; Sun, 26 May 2019 20:49:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5216D1768;
	Sun, 26 May 2019 20:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5216D1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558896577;
	bh=iRmlL2DqM4W8XnHlbjmzBnaHv9pGXhMT/2XcaE4ihPM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLhVBRQU5iSFC3d/CAsm0txLAE6XbRs13K4w+PhcN/XhKk0pHWEaqWejfP/qacF9S
	 kRloJ3lzgGvjb8spAEgVL3MTWd9c5dPlL9EHrYXfA7GLglb8CsGkZvYiYLbJ7Fkei0
	 E/qrl+mZTIugn6FFNNVjAMuk2wdfhxyqqZBGqQYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 885A6F89706;
	Sun, 26 May 2019 20:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6E24F896EB; Sun, 26 May 2019 20:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,PRX_BODY_26,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FEF4F8072E
 for <alsa-devel@alsa-project.org>; Sun, 26 May 2019 20:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FEF4F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q1uQWPIX"
Received: by mail-yb1-xb41.google.com with SMTP id a21so5752686ybg.9
 for <alsa-devel@alsa-project.org>; Sun, 26 May 2019 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dH+6euD3B/9U0jUYqmwCTtJnJvDIWL4nGrMm/sJmAbk=;
 b=q1uQWPIXf6n7CSZVMkB81U0t5u4wk16K6Z4bYxaUjaY6GyKMNeUNBq1UregxK9PZJD
 5pG/s/7VAQS0uBM0QzSa6AFpPBr1HXM7KPbb1z3etQgMn31w3cf1hoi4PTCAOVIHAWFE
 x7uKPAMdYaWCGVuAn/dXAX2Sg8IJSFXCr2bf28Nx8M6yi731QAJm9TttmwRJ+7uIStDR
 cykxfVwBxPxXYXD6G/8PjJwDWBS93kHa4sXAB6SM7c2NIH64KBqzu9kT26/h6HULwJIF
 7wvkLvKxaywz/7T9bac3bCb8TRciPUKT3XO8PzdaSGfe3qIYAcTzJBuRvYR2doocDDuW
 oBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dH+6euD3B/9U0jUYqmwCTtJnJvDIWL4nGrMm/sJmAbk=;
 b=iESfFOrBicobpOqTf+a36INQ1aU7pKcSdS61LZ8m4QX7S1/DvPj9y3qtJltWRFP/Xv
 9wK/RoUUMFFWbthvvf3ryb+L8LjtEYBBNZ/ciN4Q65gW0PXTKau70nZegSie1Dw5czRH
 f2+gtEiiN3F07LD9ZsVg+qRZk39DxCrTIKn6aTmcn8QSakWiHqJIW4zRTkRioQzrB5qi
 ZlNVX7Qj3TN1LE0IvSjNB0QWLwpi7IlyuJnhVUaoirEDuPh38dzhtnIVqJimdkdXlFPJ
 A2D1o2H0CQ7jWDxtnxAtAvTaHppTudZLaWIQxGJ9Tq1Fq1HiTaahTFcVMD5hpFVQNFPO
 CdiQ==
X-Gm-Message-State: APjAAAWp/r3mO7PbmSdjAKNkKJnXeUjeDprobc1bEuBGXlmNhkCpy1zS
 VNerkVnmWzBHySF+DKoPrJzdp0d8U4Yf59y07mc=
X-Google-Smtp-Source: APXvYqxyveUEULLdiXn9xTempg9RokzTgBzz+s8S8SgwFeVu0aCdcbHIFT8+mi573Ck83EXCxT0cCvaTPPxJknmnL0U=
X-Received: by 2002:a25:340e:: with SMTP id b14mr13139570yba.82.1558896466232; 
 Sun, 26 May 2019 11:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190525162323.20216-1-peron.clem@gmail.com>
 <20190525162323.20216-2-peron.clem@gmail.com>
 <20190526182220.hgajlcyssujjkmiu@flea>
In-Reply-To: <20190526182220.hgajlcyssujjkmiu@flea>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 26 May 2019 20:47:35 +0200
Message-ID: <CAJiuCcf4d-5-U++wQ4wkrcSSk_SyeuHnxyz0DMvHaS4YuOsx3A@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v3 1/7] dt-bindings: sound: sun4i-spdif:
	Add Allwinner H6 compatible
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

SGkgTWF4aW1lLAoKT24gU3VuLCAyNiBNYXkgMjAxOSBhdCAyMDoyMiwgTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE1heSAyNSwgMjAx
OSBhdCAwNjoyMzoxN1BNICswMjAwLCBDbMOpbWVudCBQw6lyb24gd3JvdGU6Cj4gPiBBbGx3aW5u
ZXIgSDYgaGFzIGEgU1BESUYgY29udHJvbGxlciB3aXRoIGFuIGluY3JlYXNlIG9mIHRoZSBmaWZv
Cj4gPiBzaXplIGFuZCBhIHNsaWdoZXIgZGlmZmVyZW5jZSBpbiBtZW1vcnkgbWFwcGluZyBjb21w
YXJlIHRvIEgzL0E2NC4KPiA+Cj4gPiBUaGlzIG1ha2UgaXQgbm90IGNvbXBhdGlibGUgd2l0aCB0
aGUgcHJldmlvdXMgZ2VuZXJhdGlvbi4KPiA+Cj4gPiBJbnRyb2R1Y2UgYSBzcGVjaWZpYyBiaW5k
aW5ncyBmb3IgSDYgU29DLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8
cGVyb24uY2xlbUBnbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kL3N1bnhpLHN1bjRpLXNwZGlmLnR4dCB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3VueGksc3VuNGktc3BkaWYudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N1bnhpLHN1bjRpLXNw
ZGlmLnR4dAo+ID4gaW5kZXggMGM2NGEyMDljMmU5Li5jMGZiYjUwYTRkZjkgMTAwNjQ0Cj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3VueGksc3VuNGkt
c3BkaWYudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvc3VueGksc3VuNGktc3BkaWYudHh0Cj4gPiBAQCAtNywxMCArNywxMSBAQCBGb3Igbm93IG9u
bHkgcGxheWJhY2sgaXMgc3VwcG9ydGVkLgo+ID4KPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+
ID4KPiA+IC0gIC0gY29tcGF0aWJsZSAgICAgICAgICAgICAgIDogc2hvdWxkIGJlIG9uZSBvZiB0
aGUgZm9sbG93aW5nOgo+ID4gKyAgLSBjb21wYXRpYmxlICAgICAgICAgICAgICAgOiBTaG91bGQg
YmUgb25lIG9mIHRoZSBmb2xsb3dpbmc6Cj4gPiAgICAgIC0gImFsbHdpbm5lcixzdW40aS1hMTAt
c3BkaWYiOiBmb3IgdGhlIEFsbHdpbm5lciBBMTAgU29DCj4gPiAgICAgIC0gImFsbHdpbm5lcixz
dW42aS1hMzEtc3BkaWYiOiBmb3IgdGhlIEFsbHdpbm5lciBBMzEgU29DCj4gPiAgICAgIC0gImFs
bHdpbm5lcixzdW44aS1oMy1zcGRpZiI6IGZvciB0aGUgQWxsd2lubmVyIEgzIFNvQwo+ID4gKyAg
ICAtICJhbGx3aW5uZXIsc3VuNTBpLWg2LXNwZGlmIjogZm9yIHRoZSBhbGx3aW5uZXIgSDYgU29D
Cj4KPiBUaGlzIHdvbid0IGFwcGx5IGFueW1vcmUgb24gdG9wIG9mIG5leHQsIHdlJ3ZlIG1vdmVk
IHRvIGEgWUFNTAo+IHNjaGVtYXMuCgpJbmRlZWQgSSBoYXZlIGJhc2VkIHRoaXMgc2VyaWVzIG9u
IHN1bnhpIGluc3RlYWQgb2Ygc291bmQuClRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoYXQuCkNs
w6ltZW50Cgo+Cj4gTWF4aW1lCj4KPiAtLQo+IE1heGltZSBSaXBhcmQsIEJvb3RsaW4KPiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
