Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF82B23CB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 18:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A472E1675;
	Fri, 13 Sep 2019 18:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A472E1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568390622;
	bh=lN0Ztd7dbNAsYlfTHe02s9a8HkIV4fM4NBxfDxnuc04=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOkxDfOXBm2u2wg2AGpTOha1V7PpfpqT0v+5096e/JxmUsMIrtyhkjBSArJklLdq8
	 D/Cm6iB5hVK4HK1n9Kktq2hPu3yNcHHxi1p1NESQvA8NebsvTvhALdZgTbt30PH7YJ
	 VOG6mFVcL3VBLWECa5uMHP5pqEBNKIcD+TYtyvkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9490DF8044B;
	Fri, 13 Sep 2019 18:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50457F8036A; Fri, 13 Sep 2019 18:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1756F801EC
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 18:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1756F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RtVOQl6S"
Received: by mail-wr1-x442.google.com with SMTP id h7so31618900wrw.8
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xK3P/MTBGgvM9inB0b/+0BFfc7AXQxejr+yyElk4fOo=;
 b=RtVOQl6S0qDe3qqqZfOn+HYcBwzwBHLscsskaaMW8gjHeRO1yNBIApe4AbJfwm/AhP
 Xy3Tly5958IZh4IzKxBy9rwkgCC7L/Zq5br8ZM7FUakg25OAfV+d7+Oief38xPlT+L5+
 7STiYilmvmSxjFst7uVDgmNORsKFwriLEL/Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xK3P/MTBGgvM9inB0b/+0BFfc7AXQxejr+yyElk4fOo=;
 b=rTMVg9SDIwCtoCZ1nhWYbjDoqa6Q6+Ea2yLupfb8KdBFdCOvrGqV/OUwlH+WXLAAwh
 rXIj12qkmR61mpW8UOT4EDRFEBSpi6yv9vb6GH4Ue7bciQPKNvPb6j0GIQTDAJWdw7rF
 ETtrW7FlElJypiAsNkDA5c7fcjz+We90qsbtc+QB0+cZ4JD4XkJ139Er4zQ/U1vC2Ndw
 zyYyozQb8nImKTBirSOjv4mOlJclGTHnfAURta3ZPNeRmPSkqmTm7gWZze/CIwRtR5rv
 dEHUmSnSNZ4X4Rq/4v0rit8osKjTMfUeiForxZQg/zqSNt9GjBfF8Aoz4uQAqTTNRZYj
 nJ8A==
X-Gm-Message-State: APjAAAWfDWBWEz6tlEk8kJq5+MhyL0xKBZR/SX4Ph1RBiXI0OyD42DrU
 wF0k9XoJJNuYUI1Oo7ur8MiHMwn7pkSwYMu1W9wu7w==
X-Google-Smtp-Source: APXvYqyEhc02o1CZzKDqnsA5N4VH62NZw/ZCFduDfVoTeL7AGFM1k8EQtzNWkOsjRFuc0dUlkz4Yo0uSyn3TKbVCo6k=
X-Received: by 2002:a5d:62c6:: with SMTP id o6mr6921750wrv.243.1568390511848; 
 Fri, 13 Sep 2019 09:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190912022740.161798-1-yuhsuan@chromium.org>
 <f2d9e339-ef96-8bb4-7360-422d317a470f@linux.intel.com>
In-Reply-To: <f2d9e339-ef96-8bb4-7360-422d317a470f@linux.intel.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sat, 14 Sep 2019 00:01:40 +0800
Message-ID: <CAGvk5PoWOQKYT4T18_xTzz=85k3_W_0hnSS3EJCEk4ukkaSzcw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927:
 Add dmic format constraint
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

UGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNv
bT4g5pa8CjIwMTnlubQ55pyIMTLml6Ug6YCx5ZubIOS4i+WNiDk6MDLlr6vpgZPvvJoKPgo+IE9u
IDkvMTEvMTkgOToyNyBQTSwgWXUtSHN1YW4gSHN1IHdyb3RlOgo+ID4gMjQgYml0cyByZWNvcmRp
bmcgZnJvbSBETUlDIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIEtCTCBwbGF0Zm9ybSBiZWNhdXNlCj4g
PiB0aGUgVERNIHNsb3QgYmV0d2VlbiBQQ0ggYW5kIGNvZGVjIGlzIDE2IGJpdHMgb25seS4gV2Ug
c2hvdWxkIGFkZCBhCj4gPiBjb25zdHJhaW50IHRvIHJlbW92ZSB0aGF0IHVuc3VwcG9ydGVkIGZv
cm1hdC4KPgo+IEh1bW0sIHdoZW4geW91IHVzZSBETUlDcyB0aGV5IGFyZSBkaXJlY3RseSBjb25u
ZWN0ZWQgdG8gdGhlIFBDSCB3aXRoIGEKPiBzdGFuZGFyZCAxLWJpdCBQRE0uIFRoZXJlIGlzIG5v
IG5vdGlvbiBvZiBURE0gb3Igc2xvdC4KPgo+IEl0IGNvdWxkIHZlcnkgd2VsbCBiZSB0aGF0IHRo
ZSBmaXJtd2FyZS90b3BvbG9neSBvbmx5IHN1cHBvcnQgMTYgYml0IChJCj4gdmFndWVseSByZWNh
bGwgYW5vdGhlciBjYXNlIHdoZXJlIDI0IGJpdHMgd2FzIGFkZGVkKSwgYnV0IHRoZQo+IGRlc2Ny
aXB0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSB3b3VsZCBuZWVkIHRvIGJlIG1vZGlmaWVkIHRv
IG1ha2UgdGhlCj4gcmVhc29uIGZvciB0aGlzIGNoYW5nZSBjbGVhcmVyLgoKKEkgc2VudCBpdCBh
Z2FpbiBiZWNhdXNlIHRoZSBwcmV2aW91cyBlbWFpbCBjb250YWlucyBIVE1MIHN1YnBhcnQuClNv
cnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4pCgpUaGFua3MgZm9yIHRoZSByZXZpZXchIElmIEkn
bSBub3QgbWlzdGFrZW4sIHRoZSBtaWNyb3Bob25lIGlzIGF0dGFjaGVkCnRvIGV4dGVybmFsIGNv
ZGVjKHJ0NTUxNCkgaW5zdGVhZCBvZiBQQ0ggb24gS2FieWxha2UgcGxhdGZvcm0uIFNvCnRoZXJl
IHNob3VsZCBiZSBhIFRETSBiZXR3ZWVuIERNSUNzIGFuZCBQQ0guIFdlIGNhbiBzZWUgaW4gdGhl
CmthYnlsYWtlX3NzcDBfaHdfcGFyYW1zIGZ1bmN0aW9uLCB0aGVyZSBhcmUgc29tZSBvcGVyYXRp
b25zIGFib3V0CnNldHRpbmcgdGRtIHNsb3Rfd2lkdGggdG8gMTYgYml0cy4gVGhlcmVmb3JlLCBJ
IHRoaW5rIGl0IG9ubHkgc3VwcG9ydHMKUzE2X0xFIGZvcm1hdCBmb3IgRE1JQ3MuIElzIGl0IGNv
cnJlY3Q/Cj4KPgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXUtSHN1YW4gSHN1IDx5dWhzdWFu
QGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gICBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9y
dDU2NjNfcnQ1NTE0X21heDk4OTI3LmMgfCAzICsrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMv
a2JsX3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYyBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2Js
X3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYwo+ID4gaW5kZXggNzRkZGE4Nzg0ZjFhMDEuLjY3YjI3
NmE2NWE4ZDJkIDEwMDY0NAo+ID4gLS0tIGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfcnQ1
NjYzX3J0NTUxNF9tYXg5ODkyNy5jCj4gPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2ti
bF9ydDU2NjNfcnQ1NTE0X21heDk4OTI3LmMKPiA+IEBAIC00MDAsNiArNDAwLDkgQEAgc3RhdGlj
IGludCBrYWJ5bGFrZV9kbWljX3N0YXJ0dXAoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJz
dHJlYW0pCj4gPiAgICAgICBzbmRfcGNtX2h3X2NvbnN0cmFpbnRfbGlzdChydW50aW1lLCAwLCBT
TkRSVl9QQ01fSFdfUEFSQU1fQ0hBTk5FTFMsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZG1p
Y19jb25zdHJhaW50cyk7Cj4gPgo+ID4gKyAgICAgcnVudGltZS0+aHcuZm9ybWF0cyA9IFNORFJW
X1BDTV9GTVRCSVRfUzE2X0xFOwo+ID4gKyAgICAgc25kX3BjbV9od19jb25zdHJhaW50X21zYml0
cyhydW50aW1lLCAwLCAxNiwgMTYpOwo+ID4gKwo+ID4gICAgICAgcmV0dXJuIHNuZF9wY21faHdf
Y29uc3RyYWludF9saXN0KHN1YnN0cmVhbS0+cnVudGltZSwgMCwKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBTTkRSVl9QQ01fSFdfUEFSQU1fUkFURSwgJmNvbnN0cmFpbnRzX3JhdGVzKTsKPiA+
ICAgfQo+ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
