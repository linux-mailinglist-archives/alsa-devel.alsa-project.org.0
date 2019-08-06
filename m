Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7228352A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D94A1664;
	Tue,  6 Aug 2019 17:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D94A1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565105128;
	bh=LmM88cMcEBbV0Lo5pWWLHy+L3HbXGR3J5uTkXIQreg8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iCPSDmvkCQ8iV9unS+qLG9ufQqVX8j/cbn2+y6efZiorIcWnGswgtxknCsgCYl42C
	 6Iv2u9Sd6QhF7IUiCAQA/G87x6ae4BHFXjN2ufgatlWspTF1i9vYleyNpc0LFRn4Vk
	 Ue8XL3oxW1Blpf1qqRWR5wBaUjKJcUW+ki6R4tE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A649F80483;
	Tue,  6 Aug 2019 17:23:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2C9FF80483; Tue,  6 Aug 2019 17:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C6DFF800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C6DFF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wkr5gpVU"
Received: by mail-wr1-x444.google.com with SMTP id x1so38413452wrr.9
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 08:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=odr/LwwtS4mPalaN6ESbuLoaV9Tj61vBV+Buti6dQKs=;
 b=Wkr5gpVUBwPFtwe7aMYlXu0QCRyLrLWrpwVBqLAGNXi7JlcjK14f5Eyxlh2YYXO3uX
 hl2G9AogPdxljXjx9HiCAlDxkkKISy/OiNlkAQvn7fxLYl17PYB36zwF+0aQlt8yt2eJ
 93Tan+2FxKZ/+VerPk81ksBL0ms3wrw1cqVmHmiOppGELU7gzpkQQ3mSivu9Sn3Ti7W3
 17cz1PjB2gSF4vzREVSJPL+mpgu5gplQvh3OPQZzwWSaPYxNmwcQPSj8zCcQpjBQUsi7
 6l7LmL7mONcX007+Mh04YXNQp8KWxXxmXWbYopYoiob3lYS/E2JhuiLOJtRhKNmB8Zv3
 UsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=odr/LwwtS4mPalaN6ESbuLoaV9Tj61vBV+Buti6dQKs=;
 b=fdGrHlKWNcWR1nnb+4SgPNEiWnV5f+9/alUtOsrq5vOp2plNQ3YqUh2TO343Lb3+KL
 stPvIx315NicK6NtYACCuhRgz4DlIxVlkFYimbe5KOItwSCXjXxAfWb1FhlcnRW0CXrd
 iPD2UHgUlD6U3cgI/YuVzruAQOBoWu7aopfWvKrtuxwUn9RrfJRqXTTvZUPy1ziOM9sf
 qobuy8MCHTABBGTi7ind6S/sygOi6hqvK8IAduO+Kncn3raumnaKS+ezCFOvik75gdlv
 25R4KZqZ9iqh3yJ2lZB3TEWig0AfCF4YmTitgaTY/gxcuIBFaoB/UYve/7/yjb8gJ26F
 wQTQ==
X-Gm-Message-State: APjAAAWLFTuWI3lubVGg6qsVH/40XMeJ9s8UyuE2WJLzaaeDEarsdGsz
 G0Nu5XX2KCfnjtyu5czw0jNM/tZxCkwDkZWXmQE=
X-Google-Smtp-Source: APXvYqxeI6GgG7w7v2FCZh3kocax8+++ZYu+tr47LIy/bG8jVs0n5UPlQx0djkr8B/y34PLQDVAHtQztP9qr1yLN/qY=
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr5446454wrx.196.1565105018109; 
 Tue, 06 Aug 2019 08:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-4-daniel.baluta@nxp.com>
 <20190729202154.GC20594@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190729202154.GC20594@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 6 Aug 2019 18:23:27 +0300
Message-ID: <CAEnQRZBN5Y+75cpgS2h3LwDj5BkF5cesqu6=V3GuPU4=5pgn6A@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mihai Serban <mihai.serban@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 3/7] ASoC: fsl_sai: Add support to
	enable multiple data lines
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

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMTE6MjIgUE0gTmljb2xpbiBDaGVuIDxuaWNvbGVvdHN1
a2FAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgSnVsIDI4LCAyMDE5IGF0IDEwOjI0OjI1
UE0gKzAzMDAsIERhbmllbCBCYWx1dGEgd3JvdGU6Cj4gPiBTQUkgc3VwcG9ydHMgdXAgdG8gOCBS
eC9UeCBkYXRhIGxpbmVzIHdoaWNoIGNhbiBiZSBlbmFibGVkCj4gPiB1c2luZyBUQ0UvUkNFIGJp
dHMgb2YgVENSMy9SQ1IzIHJlZ2lzdGVycy4KPiA+Cj4gPiBEYXRhIGxpbmVzIHRvIGJlIGVuYWJs
ZWQgYXJlIHJlYWQgZnJvbSBEVCBmc2wsZGwtbWFzayBwcm9wZXJ0eS4KPiA+IEJ5IGRlZmF1bHQg
KGlmIG5vIERUIGVudHJ5IGlzIHByb3ZpZGVkKSBvbmx5IGRhdGEgbGluZSAwIGlzIGVuYWJsZWQu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAu
Y29tPgo+ID4gLS0tCj4gPiAgc291bmQvc29jL2ZzbC9mc2xfc2FpLmMgfCAxMSArKysrKysrKysr
LQo+ID4gIHNvdW5kL3NvYy9mc2wvZnNsX3NhaS5oIHwgIDQgKysrLQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMgYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYwo+ID4g
aW5kZXggNjM3YjFkMTJhNTc1Li41ZTdjYjdmZDI5ZjUgMTAwNjQ0Cj4gPiAtLS0gYS9zb3VuZC9z
b2MvZnNsL2ZzbF9zYWkuYwo+ID4gKysrIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMKPiA+IEBA
IC02MDEsNyArNjAxLDcgQEAgc3RhdGljIGludCBmc2xfc2FpX3N0YXJ0dXAoc3RydWN0IHNuZF9w
Y21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4gPgo+ID4gICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRz
KHNhaS0+cmVnbWFwLCBGU0xfU0FJX3hDUjModHgpLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgIEZTTF9TQUlfQ1IzX1RSQ0VfTUFTSywKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBG
U0xfU0FJX0NSM19UUkNFKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBGU0xfU0FJX0NS
M19UUkNFKHNhaS0+c29jX2RhdGEtPmRsX21hc2tbdHhdKTsKPiA+Cj4gPiAgICAgICByZXQgPSBz
bmRfcGNtX2h3X2NvbnN0cmFpbnRfbGlzdChzdWJzdHJlYW0tPnJ1bnRpbWUsIDAsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0hXX1BBUkFNX1JBVEUsICZmc2xfc2FpX3JhdGVf
Y29uc3RyYWludHMpOwo+ID4gQEAgLTg4OCw2ICs4ODgsMTUgQEAgc3RhdGljIGludCBmc2xfc2Fp
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgICAgICAgIH0K
PiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogYWN0aXZlIGRhdGEgbGlu
ZXMgbWFzayBmb3IgVFgvUlgsIGRlZmF1bHRzIHRvIDEgKG9ubHkgdGhlIGZpcnN0Cj4gPiArICAg
ICAgKiBkYXRhIGxpbmUgaXMgZW5hYmxlZAo+ID4gKyAgICAgICovCj4gPiArICAgICBzYWktPmRs
X21hc2tbUlhdID0gMTsKPiA+ICsgICAgIHNhaS0+ZGxfbWFza1tUWF0gPSAxOwo+ID4gKyAgICAg
b2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJmc2wsZGwtbWFzayIsIFJYLCAmc2FpLT5k
bF9tYXNrW1JYXSk7Cj4gPiArICAgICBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChucCwgImZz
bCxkbC1tYXNrIiwgVFgsICZzYWktPmRsX21hc2tbVFhdKTsKPgo+IEp1c3QgY3VyaW91cyB3aGF0
IGlmIHdlIGVuYWJsZSA4IGRhdGEgbGluZXMgdGhyb3VnaCBEVCBiaW5kaW5ncwo+IHdoaWxlIGFu
IGF1ZGlvIGZpbGUgb25seSBoYXMgMSBvciAyIGNoYW5uZWxzLiBXaWxsIFRSQ0UgYml0cyBiZQo+
IG9rYXkgdG8gc3RheSB3aXRoIDggZGF0YSBjaGFubmVscyBjb25maWd1cmF0aW9ucz8gQnR3LCBo
b3cgZG9lcwo+IERNQSB3b3JrIGZvciB0aGUgZGF0YSByZWdpc3RlcnM/IEVTQUkgaGFzIG9uZSBl
bnRyeSBhdCBhIGZpeGVkCj4gYWRkcmVzcyBmb3IgYWxsIGRhdGEgY2hhbm5lbHMgd2hpbGUgU0FJ
IHNlZW1zIHRvIGhhdmUgZGlmZmVyZW50Cj4gZGF0YSByZWdpc3RlcnMuCgpIaSBOaWNvbGluLAoK
SSBoYXZlIHNlbnQgdjMgYW5kIHJlbW92ZWQgdGhpcyBwYXRjaCBmcm9tIHRoZSBzZXJpZXMgYmVj
YXVzZSB3ZQpuZWVkIHRvIGZpbmQgYSBiZXR0ZXIgc29sdXRpb24uCgpJIHRoaW5rIHdlIHNob3Vs
ZCBlbmFibGUgVENFIGJhc2VkIG9uIHRoZSBudW1iZXIgb2YgYXZhaWxhYmxlIGRhdGFsaW5lcwph
bmQgdGhlIG51bWJlciBvZiBhY3RpdmUgY2hhbm5lbHMuICBXaWxsIGNvbWUgd2l0aCBhIFJGQyBw
YXRjaCBsYXRlci4KClBhc3RpbmcgaGVyZSB0aGUgcmVwbHkgb2YgU0FJIEF1ZGlvIElQIG93bmVy
IHJlZ2FyZGluZyB0byB5b3VyIHF1ZXN0aW9uIGFib3ZlLApqdXN0IGZvciBhbnlvbmUgdG8gaGF2
ZSBtb3JlIGluZm8gb2Ygb3VyIHByaXZhdGUgZGlzY3Vzc2lvbjoKCklmIGFsbCA4IGRhdGFsaW5l
cyBhcmUgZW5hYmxlZCB1c2luZyBUQ0UgdGhlbiB0aGUgdHJhbnNtaXQgRklGTyBmb3IKYWxsIDgg
ZGF0YWxpbmVzIG5lZWQgdG8gYmUgc2VydmljZWQsIG90aGVyd2lzZSBhIEZJRk8gdW5kZXJydW4g
d2lsbCBiZQpnZW5lcmF0ZWQuCkVhY2ggZGF0YWxpbmUgaGFzIGEgc2VwYXJhdGUgdHJhbnNtaXQg
RklGTyB3aXRoIGEgc2VwYXJhdGUgcmVnaXN0ZXIgdG8Kc2VydmljZSB0aGUgRklGTywgc28gZWFj
aCBkYXRhbGluZSBjYW4gYmUgc2VydmljZWQgc2VwYXJhdGVseS4gTm90ZQp0aGF0IGNvbmZpZ3Vy
aW5nIEZDT01CPTIgd291bGQgbWFrZSBpdCBsb29rIGxpa2UgRVNBSSB3aXRoIGEgY29tbW9uCmFk
ZHJlc3MgZm9yIGFsbCBGSUZPcy4KV2hlbiBwZXJmb3JtaW5nIERNQSB0cmFuc2ZlcnMgdG8gbXVs
dGlwbGUgZGF0YWxpbmVzLCB0aGVyZSBhcmUgYQpjb3VwbGUgb2Ygb3B0aW9uczoKICAgICogVXNl
IDEgRE1BIGNoYW5uZWwgdG8gY29weSBmaXJzdCBzbG90IGZvciBlYWNoIGRhdGFsaW5lIHRvIGVh
Y2gKRklGTyBhbmQgdGhlbiB1cGRhdGUgdGhlIGRlc3RpbmF0aW9uIGFkZHJlc3MgYmFjayB0byB0
aGUgZmlyc3QKcmVnaXN0ZXIuCiAgICAqIENvbmZpZ3VyZSBzZXBhcmF0ZSBETUEgY2hhbm5lbCBm
b3IgZWFjaCBkYXRhbGluZSBhbmQgdHJpZ2dlciB0aGUKZmlyc3Qgb25lIGJ5IHRoZSBETUEgcmVx
dWVzdCBhbmQgdGhlIHN1YnNlcXVlbnQgY2hhbm5lbHMgYnkgRE1BCmxpbmtpbmcgb3Igc2NhdHRl
ci9nYXRoZXIuCiAgICAqIENvbmZpZ3VyZSBGQ09NQj0yIGFuZCB0cmVhdCBpdCB0aGUgc2FtZSBh
cyB0aGUgRVNBSS4gVGhpcyBpcwphbG1vc3QgdGhlIHNhbWUgYXMgMSwgYnV0IGRvbuKAmXQgbmVl
ZCB0byB1cGRhdGUgdGhlIGRlc3RpbmF0aW9uCmFkZHJlc3MuCgpUaGFua3MsCkRhbmllbC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
