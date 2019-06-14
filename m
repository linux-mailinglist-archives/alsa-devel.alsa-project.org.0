Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40445789
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 10:32:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88CF6185C;
	Fri, 14 Jun 2019 10:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88CF6185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560501122;
	bh=Z/Dtgm5ZQGHvV4HSJh3izCmOl4ZQNkjpVVT029/Tt9w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+NIvVBFxahUM28aPqvTzVQ6IibywOGBkvTJ3MeQLqMtfBDNpvW1W6fMzbUKPlvWf
	 UUfWf8a+jihWKKcjY2B7iT3ZUb7cJFdGI11/DWRQwL4tGNYjimOEc2sCSggUsDAYpm
	 ue9bSmf0sIuXHSd08Nyv6XyLPfLY/na6joZIcwwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD5DEF896E3;
	Fri, 14 Jun 2019 10:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44E87F896E0; Fri, 14 Jun 2019 10:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D34AF8076F
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 10:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D34AF8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kuqPHbm9"
Received: by mail-yb1-xb42.google.com with SMTP id v17so764171ybm.2
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nzVcHF0m70Fw+qIor/h4e6MpGLGe8ekBloVHLUtwVtM=;
 b=kuqPHbm9jWzSzqRNBz098asTFfYK0VOUq+5FpWwWh3z6y8vIzdmbN4jHIJT1AKnoi/
 DWqmluxBy1qkR88hqRC53qsxCflNkUKxWdV/XJ+otdmaBVNKEhJKgPO/l/0OD20U8e0Y
 bL18x5wplBC6K9lv1VPa0S79QMnytw+QJaqrDviiMez0vOzpXEyuaK6QX44UzUKqUlbv
 6U5c49IHHv5j6vz6z/nBYcvi5hClp7cbL8V9YAc7xQYfPRjq+zYk9v7LGVDhqSb0ONq9
 CWtHyWSJP1CIWjUPA3IKWfYLb/YGMREJSNsm/MDsMt6zWBzVzQPSWlUEEXqGM2cnGFW3
 OSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nzVcHF0m70Fw+qIor/h4e6MpGLGe8ekBloVHLUtwVtM=;
 b=eJt6MX15d0zs8bTVmk6WzCtV7WuL8RsdN/HfGl0j4hYQ28tpuGyEvPQ4sZD5rY8DTd
 4TesSQnE0e796F7sfRDJTIzFiDpzoMbHkp75Xo3NGqtzNsx1RsOL194+wUxYdRgzU4c0
 A0D71++4xG4lJUhT0GEjxRiMfJszFtWoyU/5oY13xRZfV+r51/X3ln4OBt83BiPhSaDw
 alS0n6v4b/P+AdTPf6FjkrSTwjEvRtDAMZEzI1J9nJC+6YT6Dz31oe1zmV/r1t+UaRPZ
 9mlchpZQ7Rzj05McBFAWEgXfW547ooJJi6LFBSsz8VLyU63eWdCgKkgOTKMXo3HxpITn
 YMRw==
X-Gm-Message-State: APjAAAVKlV8bb10MgKT9KpfQO+CDsfSpycYVRolNDTeZnsaETC0ddy6i
 UWX5x5SOi85JDMHACeUw9N+6YcFzxa10SnEwssA=
X-Google-Smtp-Source: APXvYqy2kxodppWZiVypCM4BCxN56xAjgKw4jxOCVlJIgXRgaBJbPrms6UcdTL2C9gu+ZsfB0hqWyMivsi8hKhOyo9s=
X-Received: by 2002:a25:ca8d:: with SMTP id
 a135mr42871828ybg.438.1560501008839; 
 Fri, 14 Jun 2019 01:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190527200627.8635-1-peron.clem@gmail.com>
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 14 Jun 2019 10:29:57 +0200
Message-ID: <CAJiuCcfUhBxEr=o7VVpPROQZadQh7z1QC0SkWSYt-53Sj3H2qw@mail.gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
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

SGksCgpPbiBNb24sIDI3IE1heSAyMDE5IGF0IDIyOjEwLCBDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPiB3cm90ZToKPgo+ICpINiBETUEgc3VwcG9ydCBJUyBSRVFVSVJFRCoK
CkRNQSBoYXMgYmVlbiBtZXJnZWQsIHNvIHRoaXMgc2VyaWVzIGNhbiBiZSBtZXJnZSB3aGVuIEFT
b0MgbWFpbnRhaW5lcnMKaGF2ZSByZXZpZXdlZCBpdC4KClJlZ2FyZHMsCkNsw6ltZW50Cgo+Cj4g
QWxsd2lubmVyIEg2IFNvQyBoYXMgYSBTUERJRiBjb250cm9sbGVyIGNhbGxlZCBPbmUgV2lyZSBB
dWRpbyAoT1dBKSB3aGljaAo+IGlzIGRpZmZlcmVudCBmcm9tIHRoZSBwcmV2aW91cyBIMyBnZW5l
cmF0aW9uIGFuZCBub3QgY29tcGF0aWJsZS4KPgo+IERpZmZlcmVuY2UgYXJlIGFuIGluY3JlYXNl
IG9mIGZpZm8gc2l6ZXMsIHNvbWUgbWVtb3J5IG1hcHBpbmcgYXJlIGRpZmZlcmVudAo+IGFuZCB0
aGVyZSBpcyBub3cgdGhlIHBvc3NpYmlsaXR5IHRvIG91dHB1dCB0aGUgbWFzdGVyIGNsb2NrIG9u
IGEgcGluLgo+Cj4gQWN0dWFsbHkgYWxsIHRoZXNlIGZlYXR1cmVzIGFyZSB1bnVzZWQgYW5kIG9u
bHkgYSBiaXQgZm9yIGZsdXNoaW5nIHRoZSBUWAo+IGZpZm8gaXMgcmVxdWlyZWQuCj4KPiBBbHNv
IHRoaXMgc2VyaWVzIHJlcXVpcmVzIHRoZSBETUEgd29ya2luZyBvbiBINiwgYSBmaXJzdCB2ZXJz
aW9uIGhhcyBiZWVuCj4gc3VibWl0dGVkIGJ5IEplcm5laiDFoGtyYWJlY1sxXSBidXQgaGFzIG5v
dCBiZWVuIGFjY2VwdGVkIHlldC4KPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtYXJtLWtlcm5lbC9saXN0Lz9zZXJpZXM9ODkwMTEKPgo+IENoYW5nZXMg
c2luY2UgdjM6Cj4gIC0gcmVuYW1lIHJlZ19mY3RsX2Z0eCB0byB2YWxfZmN0bF9mdHgKPiAgLSBy
ZWJhc2UgdGhpcyBzZXJpZXMgb24gc291bmQtbmV4dAo+ICAtIGZpeCBkdC1iaW5kaW5ncyBkdWUg
dG8gY2hhbmdlIGluIHNvdW5kLW5leHQKPiAgLSBjaGFuZ2Ugbm9kZSBuYW1lIHNvdW5kX3NwZGlm
IHRvIHNvdW5kLXNwZGlmCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIFNwbGl0IHF1aXJrcyBh
bmQgSDYgc3VwcG9ydCBwYXRjaAo+ICAtIEFkZCBzcGVjaWZpYyBzZWN0aW9uIGZvciBxdWlya3Mg
Y29tbWVudAo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBSZW1vdmUgSDMgY29tcGF0aWJsZQo+
ICAtIEFkZCBUWCBmaWZvIGJpdCBmbHVzaCBxdWlya3MKPiAgLSBBZGQgSDYgYmluZGluZ3MgaW4g
U1BESUYgZHJpdmVyCj4KPiBDbMOpbWVudCBQw6lyb24gKDcpOgo+ICAgZHQtYmluZGluZ3M6IHNv
dW5kOiBzdW40aS1zcGRpZjogQWRkIEFsbHdpbm5lciBINiBjb21wYXRpYmxlCj4gICBBU29DOiBz
dW40aS1zcGRpZjogTW92ZSBxdWlya3MgdG8gdGhlIHRvcAo+ICAgQVNvQzogc3VuNGktc3BkaWY6
IEFkZCBUWCBmaWZvIGJpdCBmbHVzaCBxdWlya3MKPiAgIEFTb0M6IHN1bjRpLXNwZGlmOiBBZGQg
c3VwcG9ydCBmb3IgSDYgU29DCj4gICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBTUERJRiBu
b2RlIGZvciBBbGx3aW5uZXIgSDYKPiAgIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogaDY6IEVuYWJs
ZSBTUERJRiBmb3IgQmVlbGluayBHUzEKPiAgIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBTdW40
aSBTUERJRiBtb2R1bGUKPgo+ICAuLi4vc291bmQvYWxsd2lubmVyLHN1bjRpLWExMC1zcGRpZi55
YW1sICAgICAgfCAgMSArCj4gIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdz
MS5kdHMgICB8ICA0ICsrCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1o
Ni5kdHNpICB8IDM4ICsrKysrKysrKysrKysrCj4gIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25m
aWcgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgc291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlm
LmMgICAgICAgICAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKy0tLQo+ICA1IGZpbGVzIGNo
YW5nZWQsIDg3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjAuMQo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
