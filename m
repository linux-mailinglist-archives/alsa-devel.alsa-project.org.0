Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1D88A21
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 10:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0EB81612;
	Sat, 10 Aug 2019 10:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0EB81612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565426845;
	bh=rlxw/irKd3yO6ZH7dSeSVZC6pDhGZrgEjS4qMXvoWDU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtpShpBspoJRssxV0ey0SINwkwIElk77t2/XpslVFjOiH5qFReYutA5psob43zr45
	 65p098q2pEN85yG3Xq5soOim3cXz7fmxR3lH29m6+E0hJVSBrdcRkMGbw0TD67/m2x
	 ybcJCTkklvglsp6F8Y3Um6DWFvuHj8+acbd6ejtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9055F804FF;
	Sat, 10 Aug 2019 10:45:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D31D3F80506; Sat, 10 Aug 2019 10:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 316AFF8015B
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 10:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 316AFF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tFjHxYGs"
Received: by mail-yb1-xb43.google.com with SMTP id n7so1738245ybd.8
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4N2DP4l2LpXR0ja9/QlgTCxk89cb9ApRuW6Y7KL7/QM=;
 b=tFjHxYGsshA6uhC4ZyO8gQA5CGqOklLRWWxRbDw74L/pi+b9ttnCV0SxJXzM1GWIvS
 F9rYQq1hBhIsaxKOI08ZyaGxkadwK312OhWil5n/UwwkKSmadnu/olRJh1TePylAFF1P
 4ktVi+A2LsntpLrg+0r5GSjYQS6MoaBf5QcbFDhiWv7xJnDJnGAAFTUKJLcAwhajChY9
 OyZKinHBA6UhYKPjOgT2ZHjTfw/jp+Njsc09CGDN2oGgyuMarC1b8lJbRsvnx9Il0N93
 Q2aGmNoPzI8TmYFqu0vVtm5p9ZXDTei6QktQwpM52ZY7q5UI24kSvWdBmw3r3ttiWOfn
 PRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4N2DP4l2LpXR0ja9/QlgTCxk89cb9ApRuW6Y7KL7/QM=;
 b=q+VBtPPasxqJXUaj/Znyuf1ACGTSjGHL0pxitHygN6cbdl1gEKy/Dg5wYX++fEHqA1
 xHR3vFqR0QbSYvU+QXMB1qPIaBl+BgwLWlcRiFDKCKW3MnACr75zuvOxhXINVkoqlfAF
 ndNn5l+knDK3bqRuGzJCkE5lPqwzqlIcTdrrn8JolhI5sEPmg2NYNrWT0L+s5D8JPnvz
 bKv2yW4sA5ijgPnKwrEz6FMg3CW/JFmR4gTS+uT9iWUnWDBNp8lSLFrg3IstQytppZvn
 XNBr6FPA4HXYylFYIT8p+wiB1jV8rWg5aBbrWorqhFmmwmAMChKu1nLUwDTySsQcRbBZ
 qkig==
X-Gm-Message-State: APjAAAX8Gyy28sNOPIFN8EzuJsP/3v7a360PULi67i2BAs6cmbZzhn+x
 jhZWFrzxTye7qBlSoNb643/LonmlUtpkieWofL0=
X-Google-Smtp-Source: APXvYqwYP1MVAOUz7wJvEpUhVTE97jzCm1T5VZgDMaOxdDC99C9zKxDOMpuB6Lus4uMwey10ooqmjZMMWn1jbSlbvgQ=
X-Received: by 2002:a25:9109:: with SMTP id v9mr17429940ybl.396.1565426734980; 
 Sat, 10 Aug 2019 01:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190527200627.8635-1-peron.clem@gmail.com>
 <CAJiuCcfUhBxEr=o7VVpPROQZadQh7z1QC0SkWSYt-53Sj3H2qw@mail.gmail.com>
 <CAJiuCcc3_1jZWV7G3+fFQYRZ8b6qcAbnH+K6pkRvww6_D=OMAw@mail.gmail.com>
 <20190715193842.GC4503@sirena.org.uk>
In-Reply-To: <20190715193842.GC4503@sirena.org.uk>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 10 Aug 2019 10:45:23 +0200
Message-ID: <CAJiuCceYDnyxRLLLLy6Dn6DLTZ+NmSaUnoX1Vmzvgiy0XvF_Fw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
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

SGksCgpTb3JyeSwgSSBqdXN0IGRpc2NvdmVyZWQgdGhhdCB0aGUgQVNvQyBwYXRjaGVzIGhhdmUg
YmVlbiBtZXJnZWQgaW50bwp0aGUgYnJvb25pZSBhbmQgbGludXMgdHJlZSBpbiA1LjMuCgpJJ20g
c3RpbGwgcXVpdGUgbmV3IGluIHRoZSBzZW5kaW5nIG9mIHBhdGNoZXMgdG8gdGhlIEtlcm5lbCBi
dXQKc291bGRuJ3QgYmUgYSBhY2sgb3IgYSBtYWlsIHNlbnQgdG8gd2FybiB0aGUgc2VuZGVyIHdo
ZW4gdGhlIHNlcmllcwphcmUgYWNjZXB0ZWQ/CgpTaG91bGQgNS82LzcgcGF0Y2hlcyBiZSBwaWNr
ZWQgYnkgU3VueGkgbWFpbnRhaW5lcj8KClRoYW5rcywKQ2zDqW1lbnQKCgoKCgpPbiBNb24sIDE1
IEp1bCAyMDE5IGF0IDIxOjM4LCBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDk6MjE6MDFQTSArMDIwMCwgQ2zDqW1lbnQg
UMOpcm9uIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gSSdtIG1pc3NpbmcgQUNLIGZyb20gQVNvQyBN
YWludGFpbmVycyBwYXRjaCAyLTMtNC4KPiA+Cj4gPiBJdCdzIHJlYWxseSBzbWFsbCBwYWNoZXMs
IGlmIHlvdSBjb3VsZCBoYXZlIGEgbG9vayBhdCBpdC4KPgo+IFBsZWFzZSBkb24ndCBzZW5kIGNv
bnRlbnQgZnJlZSBwaW5ncyBhbmQgcGxlYXNlIGFsbG93IGEgcmVhc29uYWJsZSB0aW1lCj4gZm9y
IHJldmlldy4gIFBlb3BsZSBnZXQgYnVzeSwgZ28gb24gaG9saWRheSwgYXR0ZW5kIGNvbmZlcmVu
Y2VzIGFuZCBzbwo+IG9uIHNvIHVubGVzcyB0aGVyZSBpcyBzb21lIHJlYXNvbiBmb3IgdXJnZW5j
eSAobGlrZSBjcml0aWNhbCBidWcgZml4ZXMpCj4gcGxlYXNlIGFsbG93IGF0IGxlYXN0IGEgY291
cGxlIG9mIHdlZWtzIGZvciByZXZpZXcuICBJZiB0aGVyZSBoYXZlIGJlZW4KPiByZXZpZXcgY29t
bWVudHMgdGhlbiBwZW9wbGUgbWF5IGJlIHdhaXRpbmcgZm9yIHRob3NlIHRvIGJlIGFkZHJlc3Nl
ZC4KPgo+IFNlbmRpbmcgY29udGVudCBmcmVlIHBpbmdzIGFkZHMgdG8gdGhlIG1haWwgdm9sdW1l
IChpZiB0aGV5IGFyZSBzZWVuIGF0Cj4gYWxsKSB3aGljaCBpcyBvZnRlbiB0aGUgcHJvYmxlbSBh
bmQgc2luY2UgdGhleSBjYW4ndCBiZSByZXZpZXdlZAo+IGRpcmVjdGx5IGlmIHNvbWV0aGluZyBo
YXMgZ29uZSB3cm9uZyB5b3UnbGwgaGF2ZSB0byByZXNlbmQgdGhlIHBhdGNoZXMKPiBhbnl3YXks
IHNvIHNlbmRpbmcgYWdhaW4gaXMgZ2VuZXJhbGx5IGEgYmV0dGVyIGFwcHJvYWNoIHRob3VnaCB0
aGVyZSBhcmUKPiBzb21lIG90aGVyIG1haW50YWluZXJzIHdobyBsaWtlIHRoZW0gLSBpZiBpbiBk
b3VidCBsb29rIGF0IGhvdyBwYXRjaGVzCj4gZm9yIHRoZSBzdWJzeXN0ZW0gYXJlIG5vcm1hbGx5
IGhhbmRsZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
