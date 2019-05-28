Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB52CE54
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 20:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F481850;
	Tue, 28 May 2019 20:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F481850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559067412;
	bh=X02khnsHYBpQEF9JIskbTBfoR9TCVzVaBca0b45tmPw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBuCasS6bTbsrLVeps8m7lgM2dBim4+CpUqgY4ZNUV2KitjHfOhxLStS6H5inLZVo
	 V3O9Ey2WpsccVbhfhvzH7KzotXlqzU1EA96H5h9h8Ufsr4hXIvdkJEGFnjkqON34IH
	 DrWtxdw9Ek5ajgdo71yVJxJj4Ve+6DdluuisvKJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DB0F89706;
	Tue, 28 May 2019 20:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 536CAF89706; Tue, 28 May 2019 20:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22EE8F896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 20:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22EE8F896B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GIjUDZYM"
Received: by mail-pg1-x543.google.com with SMTP id d30so11457965pgm.7
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gYIu+wD84eQ1WmLbv3FSR4WLrpH7YtQFJ7uLdHXyleo=;
 b=GIjUDZYMtdRfLlJZBnLmwQ/LQfAM/HSHggOnLashhYFVbEs3RA65Tv4FHCyhNFqEi3
 fA5rG4XPC6FnCXDWk3jLVWp9nWzzFs3ClIrKt5iy9y4HGdq3VZXbzIhviwbezoqes/qG
 YFIOHEUm8VepsYFlPP6ssdl5CyYQVbzY2F/q2+bDusoaqZIPCRTVD8JjU4qSBC5M0zHU
 B1IEC46xN2TxyCGzLSxMdTWnkzZBwL+wpKL7Xl8cDVMjrthETu5UV6xQIVFeUBM06fEX
 6oKcXLWaj7GhJnimERgJczUT1vc4UqJ4fsjNEU//JA5Y8FT11RBd6fDeBdenrAiWvEel
 vdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYIu+wD84eQ1WmLbv3FSR4WLrpH7YtQFJ7uLdHXyleo=;
 b=j697YWcY/x+s5fyAXdZVR3eJQpIEdRf2IqEae//Vp0kojYD5f+zuuHM7pcUsUVWt7E
 +IRt03iJJ9aDZM5vkLZfSUWxG5G4KUaYsFqd0lQLd4jxHe6QnXFcB0b4Qqev7PBGu2bn
 4skCLSnM2VHFJGTWXjzSpAOpoZZAAikpnHl+tY23r1b24w7NXJm3rcIksM10SAK+aJPu
 n3DfyUbbO0dv3qxn3AZItr60+hUJlpNwCtj4WD6uOBETIo2JdGAAjdv8WXJYx7v/xp13
 NiBN4eK4R2uRhJmiuxTnqz0Lr0nDcqiQJt81ymGALL9YE1zuoTh8bjgcNBbhiI/yHbpD
 QpvA==
X-Gm-Message-State: APjAAAWtB63F2PBeZv6PMyAyGPKvGX7Hn6xq5uganJcE9xTAvMzcTLDz
 KOx/BPb4oEOOIfdN6/CivOAoa0jCfSceFuE4J0Y=
X-Google-Smtp-Source: APXvYqwoM0p4T8p5SpnuHB+CpTihvR3BHRZo5IuooXv49uYC0/xWQkp90d/RK18jAe/7cFHO2KUM0KEJeVChgoc5W2U=
X-Received: by 2002:a62:86ce:: with SMTP id
 x197mr144319884pfd.218.1559067300413; 
 Tue, 28 May 2019 11:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOz7CXoOS3rA5uWVQgs+6LGephq0sNoPfom=sq0pjHsJEWGsKg@mail.gmail.com>
 <9749e4f4-fd52-e0a7-1a74-683e9acef3ee@linux.intel.com>
In-Reply-To: <9749e4f4-fd52-e0a7-1a74-683e9acef3ee@linux.intel.com>
From: =?UTF-8?B?VGFtw6FzIEtvdsOhY3M=?= <kepszlok@gmail.com>
Date: Tue, 28 May 2019 20:14:49 +0200
Message-ID: <CAOz7CXow0ADo=A0RT43CZwQqFBwZ-b+_G5zHxEwLvqr0=i8CTA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Baytrail: add quirk for Aegex
 10 (RU2) tablet
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

SG1tLCBpdCBzZWVtcyBsaWtlIHBhc3RpbmcgdG8gZ21haWwgY2hhbmdlZCBhbGwgdGFidWxhdG9y
IHRvIHdoaXRlc3BhY2UgaW4KdGhlIGRpZmYncy4gSSBoYWQgdG8gZmlndXJlIG91dCBzb21ldGhp
bmcuIG8uTwooaSdtIGEgbmV3YmllIGluIG1haWxpbmcgbGlzdHMpCgpCdHcsIGkgd2lsbCBzZW5k
IGEgVjIgdmVyc2lvbiBzb29uLCB0aGFuayB5b3UgZ3V5cyBmb3IgdGhlIGZlZWRiYWNrLgoKUGll
cnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4g
ZXp0IMOtcnRhCihpZMWRcG9udDogMjAxOS4gbcOhai4gMjguLCBLLCAxODo0Nyk6Cgo+Cj4KPiBP
biA1LzI0LzE5IDEyOjAzIFBNLCBUYW3DoXMgS292w6FjcyB3cm90ZToKPiA+IFRoaXMgdGFibGV0
IGhhcyBhbiBpbmNvcnJlY3QgYWNwaSBpZGVudGlmaWVyLCB3aGljaCBpcyB3aHkgaXQgaXMgdHJ5
aW5nCj4gdG8KPiA+IGxvYWQgdGhlIFJUNTY0MCBkcml2ZXIgaW5zdGVhZCBvZiB0aGUgUlQ1NzYy
IGRyaXZlci4gVGhlIFJUNTY0MCBkcml2ZXIsCj4gb24KPiA+IHRoZSBvdGhlciBoYW5kLCBjaGVj
a3MgdGhlIGhhcmR3YXJlIElELCBzbyBubyBkcml2ZXJzIGFyZSBsb2FkZWQgZHVyaW5nCj4gPiBi
b290Lgo+ID4gVGhpcyBmaXggcmVzb2x2ZXMgdG8gbG9hZCB0aGUgUlQ1NjcyIGRyaXZlciBvbiB0
aGlzIHRhYmxldCBkdXJpbmcgYm9vdC4KPiBJdAo+ID4gYWxzbyBwcm92aWRlcyB0aGUgY29ycmVj
dCBJTyBjb25maWd1cmF0aW9uLCBsaWtlIHRoZSBqYWNrIGRldGVjdCBtb2RlIDMsCj4gPiBmb3Ig
MS44ViBwdWxsdXAuCj4gPiBJIHdvdWxkIGxpa2UgdG8gdGhhbmsgUGllcnJlLUxvdWlzIEJvc3Nh
cnQgZm9yIGhlbHBpbmcgd2l0aCB0aGlzIHBhdGNoLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEtv
dsOhY3MgVGFtw6FzIDxrZXBzemxva0BnbWFpbC5jb20+Cj4KPgo+IFRoYW5rcyBmb3IgdGhlIGNo
YW5nZXMgVGFtYXMuCj4gSSBjb3VsZCBub3QgYXBwbHkgdGhpcyBwYXRjaCwgc29tZSBzb3J0IG9m
IGVtYWlsIHV1ZW5jb2RlIGVycm9yPyBzZWUKPiBhbHNvIGNvbW1lbnRzIGJlbG93LiBJZiB5b3Ug
Y2FuIHVwZGF0ZSB0aGlzIHBhdGNoIGFuZCBwcm92aWRlIGEgdjIgaXQnZAo+IGJlIGdyZWF0Lgo+
IEFsc28gYWx3YXlzIENjOiBtYWludGFpbmVycyAoTWFyayBCcm93biBhbmQgVGFrYXNoaSBJd2Fp
LCBhZGRlZCB0byB0aGlzCj4gdGhyZWFkKSBpZiB5b3Ugd2FudCBhIHBhdGNoIHRvIGJlIGFwcGxp
ZWQuCj4gLVBpZXJyZQo+Cj4gPiAtLS0KPiA+IGRpZmYgLS1naXQgYS9vcmkvc291bmQvc29jL2lu
dGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYwo+ID4gYi9uZXcvc291bmQvc29j
L2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYwo+ID4gaW5kZXggZmU4MTJh
OS4uZTU0OTk1MCAxMDA2NDQKPiA+IC0tLSBhL29yaS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3Nv
Yy1hY3BpLWludGVsLWJ5dC1tYXRjaC5jCj4gPiArKysgYi9uZXcvc291bmQvc29jL2ludGVsL2Nv
bW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYwo+ID4gQEAgLTEsNCArMSw0IEBACj4gPiAt
LyoKPiA+ICvvu78vKgo+Cj4gbm8gbmVlZCBmb3IgY2hhbmdlIGhlcmUuCj4KPiA+ICAgICogc29j
LWFwY2ktaW50ZWwtYnl0LW1hdGNoLmMgLSB0YWJsZXMgYW5kIHN1cHBvcnQgZm9yIEJZVCBBQ1BJ
Cj4gPiBlbnVtZXJhdGlvbi4KPiA+ICAgICoKPiA+ICAgICogQ29weXJpZ2h0IChjKSAyMDE3LCBJ
bnRlbCBDb3Jwb3JhdGlvbi4KPiA+IEBAIC0yMiw2ICsyMiw3IEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIGJ5dF9tYWNoaW5lX2lkOwo+ID4KPiA+ICAgI2RlZmluZSBCWVRfVEhJTktQQURfMTAgIDEK
PiA+ICAgI2RlZmluZSBCWVRfUE9WX1AxMDA2VyAgIDIKPiA+ICsjZGVmaW5lIEJZVF9BRUdFWF8x
MCAgICAgMwo+ID4KPiA+ICAgc3RhdGljIGludCBieXRfdGhpbmtwYWQxMF9xdWlya19jYihjb25z
dCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCAqaWQpCj4gPiAgIHsKPiA+IEBAIC0zNSw2ICszNiwxMiBA
QCBzdGF0aWMgaW50IGJ5dF9wb3ZfcDEwMDZ3X3F1aXJrX2NiKGNvbnN0IHN0cnVjdAo+ID4gZG1p
X3N5c3RlbV9pZCAqaWQpCj4gPiAgICByZXR1cm4gMTsKPiA+ICAgfQo+ID4KPiA+ICtzdGF0aWMg
aW50IGJ5dF9hZWdleDEwX3F1aXJrX2NiKGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkICppZCkK
PiA+ICt7Cj4gPiArIGJ5dF9tYWNoaW5lX2lkID0gQllUX0FFR0VYXzEwOwo+ID4gKyByZXR1cm4g
MTsKPiA+ICt9Cj4KPiBpbmRlbnRhdGlvbiBpc3N1ZXM/Cj4KPiA+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkbWlfc3lzdGVtX2lkIGJ5dF90YWJsZVtdID0gewo+ID4gICAgewo+ID4gICAgLmNhbGxi
YWNrID0gYnl0X3RoaW5rcGFkMTBfcXVpcmtfY2IsCj4gPiBAQCAtNzUsNiArODIsMTQgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ5dF90YWJsZVtdID0gewo+ID4gICAgRE1J
X0VYQUNUX01BVENIKERNSV9CT0FSRF9OQU1FLCAiMEU1NyIpLAo+ID4gICAgfSwKPiA+ICAgIH0s
Cj4gPiArIHsKPiA+ICsgLyogQWVnZXggMTAgdGFibGV0IChSVTIpICovCj4gPiArIC5jYWxsYmFj
ayA9IGJ5dF9hZWdleDEwX3F1aXJrX2NiLAo+ID4gKyAubWF0Y2hlcyA9IHsKPiA+ICsgRE1JX01B
VENIKERNSV9TWVNfVkVORE9SLCAiQUVHRVgiKSwKPiA+ICsgRE1JX01BVENIKERNSV9QUk9EVUNU
X1ZFUlNJT04sICJSVTIiKSwKPiA+ICsgfSwKPiA+ICsgfSwKPgo+IGluZGVudGF0aW9uIGFuZCBr
ZXJuZWwgc3R5bGU/Cj4KPiA+ICAgIHsgfQo+ID4gICB9Owo+ID4KPiA+IEBAIC05Niw2ICsxMTEs
MTUgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCBieXRfcG92X3AxMDA2dyA9IHsK
PiA+ICAgIC5zb2ZfdHBsZ19maWxlbmFtZSA9ICJzb2YtYnl0LXJ0NTY1MS50cGxnIiwKPiA+ICAg
fTsKPiA+Cj4gPiArc3RhdGljIHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCBieXRfYWVnZXhfMTAg
PSB7Cj4gPiArIC5pZCA9ICIxMEVDNTY0MCIsCj4gPiArIC5kcnZfbmFtZSA9ICJjaHQtYnN3LXJ0
NTY3MiIsCj4gPiArIC5md19maWxlbmFtZSA9ICJpbnRlbC9md19zc3RfMGYyOC5iaW4iLAo+ID4g
KyAuYm9hcmQgPSAiY2h0LWJzdyIsCj4gPiArIC5zb2ZfZndfZmlsZW5hbWUgPSAiaW50ZWwvc29m
LWJ5dC5yaSIsCj4gPiArIC5zb2ZfdHBsZ19maWxlbmFtZSA9ICJpbnRlbC9zb2YtYnl0LXJ0NTY3
MC50cGxnIiwKPgo+IHRoZSBpbnRlbC8gcHJlZml4IGlzIG5vIGxvbmdlciB1c2VkIGZvciBTT0Yu
Cj4KPgo+IEFsc28gc2luY2UgeW91IGFyZSB1c2luZyBleGFjdGx5IHRoZSBzYW1lIHF1aXJrIGFz
IGZvciBCWVRfVEhJTktQQURfMTAKPiB5b3UgY291bGQgdXNlIGEgY29tbW9uIHN0cnVjdHVyZSBp
bnN0ZWFkIG9mIGEgZHVwbGljYXRlZCBvbmUuCj4KPiA+ICt9Owo+ID4gKwo+ID4gICBzdGF0aWMg
c3RydWN0IHNuZF9zb2NfYWNwaV9tYWNoICpieXRfcXVpcmsodm9pZCAqYXJnKQo+ID4gICB7Cj4g
PiAgICBzdHJ1Y3Qgc25kX3NvY19hY3BpX21hY2ggKm1hY2ggPSBhcmc7Cj4gPiBAQCAtMTA3LDYg
KzEzMSw4IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19hY3BpX21hY2ggKmJ5dF9xdWlyayh2b2lk
ICphcmcKPiA+ICAgIHJldHVybiAmYnl0X3RoaW5rcGFkXzEwOwo+ID4gICAgY2FzZSBCWVRfUE9W
X1AxMDA2VzoKPiA+ICAgIHJldHVybiAmYnl0X3Bvdl9wMTAwNnc7Cj4gPiArIGNhc2UgQllUX0FF
R0VYXzEwOgo+ID4gKyByZXR1cm4gJmJ5dF9hZWdleF8xMDsKPgo+IGluZGVudGF0aW9uPwo+Cj4g
PiAgICBkZWZhdWx0Ogo+ID4gICAgcmV0dXJuIG1hY2g7Cj4gPiAgICB9Cj4gPgo+ID4gZGlmZiAt
LWdpdCBhL29yaS9zb3VuZC9zb2MvY29kZWNzL3J0NTY3MC5jCj4gYi9uZXcvc291bmQvc29jL2Nv
ZGVjcy9ydDU2NzAuYwo+ID4gaW5kZXggOWEwMzcxMC4uMzdjY2UwNCAxMDA2NDQKPiA+IC0tLSBh
L29yaS9zb3VuZC9zb2MvY29kZWNzL3J0NTY3MC5jCj4gPiArKysgYi9uZXcvc291bmQvc29jL2Nv
ZGVjcy9ydDU2NzAuYwo+ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtLyoKPiA+ICvvu78vKgo+Cj4g
bm8gbmVlZCBmb3IgY2hhbmdlIGhlcmUKPgo+ID4gICAgKiBydDU2NzAuYyAgLS0gIFJUNTY3MCBB
TFNBIFNvQyBhdWRpbyBjb2RlYyBkcml2ZXIKPiA+ICAgICoKPiA+ICAgICogQ29weXJpZ2h0IDIw
MTQgUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnAuCj4gPiBAQCAtMjg4Miw2ICsyODgyLDE4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZAo+ID4gZG1pX3BsYXRmb3JtX2ludGVs
X3F1aXJrc1tdID0gewo+ID4gICAgUlQ1NjcwX0RFVl9HUElPIHwKPiA+ICAgIFJUNTY3MF9KRF9N
T0RFMyksCj4gPiAgICB9LAo+ID4gKyB7Cj4gPiArIC5jYWxsYmFjayA9IHJ0NTY3MF9xdWlya19j
YiwKPiA+ICsgLmlkZW50ID0gIkFlZ2V4IDEwIHRhYmxldCAoUlUyKSIsCj4gPiArIC5tYXRjaGVz
ID0gewo+ID4gKyBETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJBRUdFWCIpLAo+ID4gKyBETUlf
TUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIlJVMiIpLAo+ID4gKyB9LAo+ID4gKyAuZHJpdmVy
X2RhdGEgPSAodW5zaWduZWQgbG9uZyAqKShSVDU2NzBfRE1JQ19FTiB8Cj4gPiArIFJUNTY3MF9E
TUlDMl9JTlIgfAo+ID4gKyBSVDU2NzBfREVWX0dQSU8gfAo+ID4gKyBSVDU2NzBfSkRfTU9ERTMp
LAo+ID4gKyB9LAo+ID4gICAge30KPiA+ICAgfTsKPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+ID4g
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKPiA+Cj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
