Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E469B4E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 21:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55521669;
	Mon, 15 Jul 2019 21:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55521669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563218583;
	bh=yASNikXWxgPFyl/vDLzxfb4WgVdadcVPXz/Nw4Ag+Og=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t3lswLbho5jL553OJpOT5SgtAz4LJ8cIohDvBVbSMlkVh1zCbmwCW2DH55rIzoqEF
	 56MIpM3C2xNHVGfQ+kNkNVz8AXNYylStZpopt0wKwFoilMHJPbCF/v2A5cd0pORwg1
	 gZ4khgC+2HJGka1TLQK4qSx6PXfncJGkKiHbBJq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12873F80368;
	Mon, 15 Jul 2019 21:21:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 154F1F80367; Mon, 15 Jul 2019 21:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC8B4F800C6
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 21:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC8B4F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WNARhfF9"
Received: by mail-yw1-xc42.google.com with SMTP id m16so7731891ywh.12
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T6L/T//A/hr8zs4n7h5mkmSwRWcgvC/d4JNrZUI4Hm8=;
 b=WNARhfF9FItohnvszMOVl4tf67FTBW8z6mVMLcqSbMbljIgUy+cX0Jp0YfAAn6kvUV
 6B6qTRPgZBjVJy0+wx5Cj2BakLpiAiVZthmkB8RwCAJT4lZqVISu/fGLTrTZrrYiHF+U
 yzM4+eKufO1eXC5AsamPg9bdbjtTI2uJcJPJsDIzAzR1eYQH2/3+DY2OOPuUGErHf+cH
 6s29jnfo/oPHtq5a/H0Sy1cvGpnTzS1ni4CRff8wbQQa+ysZ+sXz3lWCtiOED27rdf1t
 tkQL8IOHrjNfyHRrYx0QL8ftLKDHp1uf1JDapE1bQHyZKsu3iShgGsknBrH0rgd3UHOE
 ETDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T6L/T//A/hr8zs4n7h5mkmSwRWcgvC/d4JNrZUI4Hm8=;
 b=QTwJRNjRiLcYzfQG66wcI04+uNyq1k1ndPOXc9vWbjBi0gTBOwnRBBPnBcgLYdFBxC
 6Gn6bp43Fz3kY6U2uQ8o17Cto7UQ64ZsxZh1FoYjdjm5S1Lqw2cQ02boCt9SEOtss2wv
 C3jr+mDyuhx+arZwRhpd94L1fXEn08dMG5G/9rVrJkJ3Q3OGYa1bbOE87B6XkRNt+3fN
 AkiQBmUPqtGSQy7upGy7hGFh+6qLjyAHppYafXdzH28AhIoIr5jjXq62Z+LQe7nfWVG7
 0c1+c7B896n1mWkilbiFZu5xgAKnmCXNPkUKf/hJUDk3W1NdCTXvQSiZ08YS49zlQRGU
 4/ew==
X-Gm-Message-State: APjAAAUjPv6s+r0s6eqgp1CpCxc5Kv++RdxegwzUr1vJhJAf9N7FJpyl
 /6IB56Q0GL0XSmzUWDROYPlwvn6WCUhXVe9CRiE=
X-Google-Smtp-Source: APXvYqxcM/GTLLwXLJ0XLGxzMQuEi34XclLyeCNzAgq1oLJCQsl7q05aszfWDHWZs0j8skZrYjD5o0W5JZ3MI1abTjQ=
X-Received: by 2002:a0d:d884:: with SMTP id
 a126mr16542399ywe.349.1563218472776; 
 Mon, 15 Jul 2019 12:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190527200627.8635-1-peron.clem@gmail.com>
 <CAJiuCcfUhBxEr=o7VVpPROQZadQh7z1QC0SkWSYt-53Sj3H2qw@mail.gmail.com>
In-Reply-To: <CAJiuCcfUhBxEr=o7VVpPROQZadQh7z1QC0SkWSYt-53Sj3H2qw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 15 Jul 2019 21:21:01 +0200
Message-ID: <CAJiuCcc3_1jZWV7G3+fFQYRZ8b6qcAbnH+K6pkRvww6_D=OMAw@mail.gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v4 0/7] Allwinner H6 SPDIF support
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

SGksCgpJJ20gbWlzc2luZyBBQ0sgZnJvbSBBU29DIE1haW50YWluZXJzIHBhdGNoIDItMy00LgoK
SXQncyByZWFsbHkgc21hbGwgcGFjaGVzLCBpZiB5b3UgY291bGQgaGF2ZSBhIGxvb2sgYXQgaXQu
Ck1hbnkgdGhhbmtzLApDbMOpbWVudAoKCgpPbiBGcmksIDE0IEp1biAyMDE5IGF0IDEwOjI5LCBD
bMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4g
T24gTW9uLCAyNyBNYXkgMjAxOSBhdCAyMjoxMCwgQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVt
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gKkg2IERNQSBzdXBwb3J0IElTIFJFUVVJUkVEKgo+
Cj4gRE1BIGhhcyBiZWVuIG1lcmdlZCwgc28gdGhpcyBzZXJpZXMgY2FuIGJlIG1lcmdlIHdoZW4g
QVNvQyBtYWludGFpbmVycwo+IGhhdmUgcmV2aWV3ZWQgaXQuCj4KPiBSZWdhcmRzLAo+IENsw6lt
ZW50Cj4KPiA+Cj4gPiBBbGx3aW5uZXIgSDYgU29DIGhhcyBhIFNQRElGIGNvbnRyb2xsZXIgY2Fs
bGVkIE9uZSBXaXJlIEF1ZGlvIChPV0EpIHdoaWNoCj4gPiBpcyBkaWZmZXJlbnQgZnJvbSB0aGUg
cHJldmlvdXMgSDMgZ2VuZXJhdGlvbiBhbmQgbm90IGNvbXBhdGlibGUuCj4gPgo+ID4gRGlmZmVy
ZW5jZSBhcmUgYW4gaW5jcmVhc2Ugb2YgZmlmbyBzaXplcywgc29tZSBtZW1vcnkgbWFwcGluZyBh
cmUgZGlmZmVyZW50Cj4gPiBhbmQgdGhlcmUgaXMgbm93IHRoZSBwb3NzaWJpbGl0eSB0byBvdXRw
dXQgdGhlIG1hc3RlciBjbG9jayBvbiBhIHBpbi4KPiA+Cj4gPiBBY3R1YWxseSBhbGwgdGhlc2Ug
ZmVhdHVyZXMgYXJlIHVudXNlZCBhbmQgb25seSBhIGJpdCBmb3IgZmx1c2hpbmcgdGhlIFRYCj4g
PiBmaWZvIGlzIHJlcXVpcmVkLgo+ID4KPiA+IEFsc28gdGhpcyBzZXJpZXMgcmVxdWlyZXMgdGhl
IERNQSB3b3JraW5nIG9uIEg2LCBhIGZpcnN0IHZlcnNpb24gaGFzIGJlZW4KPiA+IHN1Ym1pdHRl
ZCBieSBKZXJuZWogxaBrcmFiZWNbMV0gYnV0IGhhcyBub3QgYmVlbiBhY2NlcHRlZCB5ZXQuCj4g
Pgo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hcm0t
a2VybmVsL2xpc3QvP3Nlcmllcz04OTAxMQo+ID4KPiA+IENoYW5nZXMgc2luY2UgdjM6Cj4gPiAg
LSByZW5hbWUgcmVnX2ZjdGxfZnR4IHRvIHZhbF9mY3RsX2Z0eAo+ID4gIC0gcmViYXNlIHRoaXMg
c2VyaWVzIG9uIHNvdW5kLW5leHQKPiA+ICAtIGZpeCBkdC1iaW5kaW5ncyBkdWUgdG8gY2hhbmdl
IGluIHNvdW5kLW5leHQKPiA+ICAtIGNoYW5nZSBub2RlIG5hbWUgc291bmRfc3BkaWYgdG8gc291
bmQtc3BkaWYKPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ID4gIC0gU3BsaXQgcXVpcmtzIGFu
ZCBINiBzdXBwb3J0IHBhdGNoCj4gPiAgLSBBZGQgc3BlY2lmaWMgc2VjdGlvbiBmb3IgcXVpcmtz
IGNvbW1lbnQKPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gIC0gUmVtb3ZlIEgzIGNvbXBh
dGlibGUKPiA+ICAtIEFkZCBUWCBmaWZvIGJpdCBmbHVzaCBxdWlya3MKPiA+ICAtIEFkZCBINiBi
aW5kaW5ncyBpbiBTUERJRiBkcml2ZXIKPiA+Cj4gPiBDbMOpbWVudCBQw6lyb24gKDcpOgo+ID4g
ICBkdC1iaW5kaW5nczogc291bmQ6IHN1bjRpLXNwZGlmOiBBZGQgQWxsd2lubmVyIEg2IGNvbXBh
dGlibGUKPiA+ICAgQVNvQzogc3VuNGktc3BkaWY6IE1vdmUgcXVpcmtzIHRvIHRoZSB0b3AKPiA+
ICAgQVNvQzogc3VuNGktc3BkaWY6IEFkZCBUWCBmaWZvIGJpdCBmbHVzaCBxdWlya3MKPiA+ICAg
QVNvQzogc3VuNGktc3BkaWY6IEFkZCBzdXBwb3J0IGZvciBINiBTb0MKPiA+ICAgYXJtNjQ6IGR0
czogYWxsd2lubmVyOiBBZGQgU1BESUYgbm9kZSBmb3IgQWxsd2lubmVyIEg2Cj4gPiAgIGFybTY0
OiBkdHM6IGFsbHdpbm5lcjogaDY6IEVuYWJsZSBTUERJRiBmb3IgQmVlbGluayBHUzEKPiA+ICAg
YXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIFN1bjRpIFNQRElGIG1vZHVsZQo+ID4KPiA+ICAuLi4v
c291bmQvYWxsd2lubmVyLHN1bjRpLWExMC1zcGRpZi55YW1sICAgICAgfCAgMSArCj4gPiAgLi4u
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0cyAgIHwgIDQgKysKPiA+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaSAgfCAzOCArKysrKysr
KysrKysrKwo+ID4gIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiA+ICBzb3VuZC9zb2Mvc3VueGkvc3VuNGktc3BkaWYuYyAgICAgICAgICAgICAg
ICAgfCA0OSArKysrKysrKysrKysrKysrLS0tCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAyLjIwLjEKPiA+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
