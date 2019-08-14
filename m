Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D98CEFA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 11:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5100166E;
	Wed, 14 Aug 2019 11:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5100166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565773495;
	bh=++6Bne4V/O70jsyKPi4VnwkUHwdrb0yITA5m+zomXoc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLnsc20CDWgtTJcFRCUn2Q7nvjxhMCkmJVf7hPDikyLs0S5rJ8yBhHae9kbLRyu/S
	 P5Oa+aEUiVgZaRS7hnLxUQbi3S2zXO5KlmeYL6H/5PvjIuw5mHjeCeCPJCV4/Kfrfj
	 EWTT1+YlTc61aclBtkevCCs7w3nR6oXd79hv8bl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10786F801DF;
	Wed, 14 Aug 2019 11:03:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A81A3F80214; Wed, 14 Aug 2019 11:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A5EF801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 11:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A5EF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W96oK3cp"
Received: by mail-lj1-x242.google.com with SMTP id f9so5563051ljc.13
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 02:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HGGsA7jJbuHeLKCTTStxYTVLGBd6wnCss83qHowgbjU=;
 b=W96oK3cplk+LETGgfrUx025DuWIVN07yy7YAIfAoynHMDXa6+xVaV/sYZjvar/1zKv
 XFAzJLyCpaXbHaI0Jj7zDzkRdxJ9/+ygX+T0rBz87g8xxWGYlIkKq2NYMFeVDw01G0yI
 GtiPNL8KjexuBM4mZ/qYmpZhQdRnXw7yFImlxTSJC9eRa/u2mQSnfcyFBtPfu/PFh+wO
 9aBxFRZnTIvpV4ukI+9FPT1Xpjn66WdT7Ht3WpXpkcscVYLynKrBWSVpNMMU6H4T9EP9
 2Hy1ufq+tqognp6wU0Z6Y9XMYtJB+zBv4k8uPklw2vIhTD6XRwUS2gkgak2pKssb7fQ0
 BZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HGGsA7jJbuHeLKCTTStxYTVLGBd6wnCss83qHowgbjU=;
 b=T5hcmrgRop6FG0gjA8YrtvDdWdkX2bTWBmRMKQ59DYva1mJ8ZhUw3z9x5vEPRi8zAI
 EjEZFjkNVIVneQ93P0JrZyuiWF57XWfpz75KD3UsbHRnzlEgs0Qwa0UhS5arIzQJz7va
 oRbcQM4XpEFK+uS9/nHXY+JSibA9QgsLG7figpBhlc/X9OM6WlM6YNZ9v4IG/UoPaed7
 pCZ45zt1Qb41cwdSfZyOS8mA0dan0tQfcvGtzWwN3zz8r0BiEmBwEadmHEIRniszVa3u
 L1kQHhrGoEqR0Q1OnV5U9rR/UPH95M0ql20qLXV+QCWccj+kdRDSYL7JwKUqm6VssVWA
 DXLQ==
X-Gm-Message-State: APjAAAVImTIoPp741YB2FTwJcCc7t0Ax4taroNihjyqr4tNGop5qBlso
 0qv+0M+rxllO6dYpZotSB2CvQDvK29rksucJlTo=
X-Google-Smtp-Source: APXvYqyW1xPosjpGG4nDcVQ4sN08u61lmr1tOzbLSoAlD3n5ZJrmw1nQj2fpjXRQgr8vSPVXMkST0bIshq4hM+ESxOg=
X-Received: by 2002:a2e:3c12:: with SMTP id j18mr8727511lja.50.1565773385844; 
 Wed, 14 Aug 2019 02:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-16-codekipper@gmail.com>
 <3741744.8c7tOhJ1tT@jernej-laptop>
In-Reply-To: <3741744.8c7tOhJ1tT@jernej-laptop>
From: Code Kipper <codekipper@gmail.com>
Date: Wed, 14 Aug 2019 11:02:54 +0200
Message-ID: <CAEKpxBnNzH3KANfaY7p0qv=XTAyHAk3YSWqFbt_hpWat+xSBxw@mail.gmail.com>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 15/15] ASoC: sun4i-i2s:
	Adjust regmap settings
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

T24gV2VkLCAxNCBBdWcgMjAxOSBhdCAxMDozOCwgSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2ty
YWJlY0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkhCj4KPiBEbmUgc3JlZGEsIDE0LiBhdmd1c3Qg
MjAxOSBvYiAwODowODo1NCBDRVNUIGplIGNvZGVraXBwZXJAZ21haWwuY29tCj4gbmFwaXNhbChh
KToKPiA+IEZyb206IE1hcmN1cyBDb29wZXIgPGNvZGVraXBwZXJAZ21haWwuY29tPgo+ID4KPiA+
IEJ5cGFzcyB0aGUgcmVnbWFwIGNhY2hlIHdoZW4gZmx1c2hpbmcgdGhlIGkycyBGSUZPcyBhbmQg
bW9kaWZ5IHRoZSB0YWJsZXMKPiA+IHRvIHJlZmxlY3QgdGhpcy4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXJjdXMgQ29vcGVyIDxjb2Rla2lwcGVyQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHNv
dW5kL3NvYy9zdW54aS9zdW40aS1pMnMuYyB8IDMxICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdW54aS9zdW40aS1pMnMuYyBiL3Nv
dW5kL3NvYy9zdW54aS9zdW40aS1pMnMuYwo+ID4gaW5kZXggZDNjODc4OWY3MGJiLi5lY2ZjMWVk
NzkzNzkgMTAwNjQ0Cj4gPiAtLS0gYS9zb3VuZC9zb2Mvc3VueGkvc3VuNGktaTJzLmMKPiA+ICsr
KyBiL3NvdW5kL3NvYy9zdW54aS9zdW40aS1pMnMuYwo+ID4gQEAgLTg3Niw5ICs4NzYsMTEgQEAg
c3RhdGljIGludCBzdW40aV9pMnNfc2V0X2ZtdChzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwKPiA+
IHVuc2lnbmVkIGludCBmbXQpIHN0YXRpYyB2b2lkIHN1bjRpX2kyc19zdGFydF9jYXB0dXJlKHN0
cnVjdCBzdW40aV9pMnMKPiA+ICppMnMpCj4gPiAgewo+ID4gICAgICAgLyogRmx1c2ggUlggRklG
TyAqLwo+ID4gKyAgICAgcmVnY2FjaGVfY2FjaGVfYnlwYXNzKGkycy0+cmVnbWFwLCB0cnVlKTsK
PiA+ICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhpMnMtPnJlZ21hcCwgU1VONElfSTJTX0ZJRk9f
Q1RSTF9SRUcsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgU1VONElfSTJTX0ZJRk9fQ1RS
TF9GTFVTSF9SWCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBTVU40SV9JMlNfRklGT19D
VFJMX0ZMVVNIX1JYKTsKPiA+ICsgICAgIHJlZ2NhY2hlX2NhY2hlX2J5cGFzcyhpMnMtPnJlZ21h
cCwgZmFsc2UpOwo+Cj4gRGlkIHlvdSB0cnkgd2l0aCByZWdtYXBfd3JpdGVfYml0cygpIGluc3Rl
YWQ/IFRoaXMgZnVuY3Rpb24gd2lsbAo+IHVuY29uZGl0aW9uYWxseSB3cml0ZSBiaXRzIHNvIGl0
J3MgbmljZXIgc29sdXRpb24sIGJlY2F1c2UgeW91IGRvbid0IGhhdmUgdG8KPiB1c2UgcmVnY2Fj
aGVfY2FjaGVfYnlwYXNzKCkuCgpJIGRpZG4ndC4uLi53aXRoIGFsbCB0aGUgcmV3b3JrIEkndmUg
YXZvaWRlZCBtZXNzaW5nIHdpdGggdGhpcyBjaGFuZ2UuCk5vdyB0aGF0IHRoZSBkdXN0CmhhcyBz
ZXR0bGVkLCBJIGNhbiBnbyBiYWNrIHRvIGxvb2sgYXQgdGhpcy4KVGhhbmtzLApDSwo+Cj4gPgo+
ID4gICAgICAgLyogQ2xlYXIgUlggY291bnRlciAqLwo+ID4gICAgICAgcmVnbWFwX3dyaXRlKGky
cy0+cmVnbWFwLCBTVU40SV9JMlNfUlhfQ05UX1JFRywgMCk7Cj4gPiBAQCAtODk3LDkgKzg5OSwx
MSBAQCBzdGF0aWMgdm9pZCBzdW40aV9pMnNfc3RhcnRfY2FwdHVyZShzdHJ1Y3Qgc3VuNGlfaTJz
Cj4gPiAqaTJzKSBzdGF0aWMgdm9pZCBzdW40aV9pMnNfc3RhcnRfcGxheWJhY2soc3RydWN0IHN1
bjRpX2kycyAqaTJzKQo+ID4gIHsKPiA+ICAgICAgIC8qIEZsdXNoIFRYIEZJRk8gKi8KPiA+ICsg
ICAgIHJlZ2NhY2hlX2NhY2hlX2J5cGFzcyhpMnMtPnJlZ21hcCwgdHJ1ZSk7Cj4gPiAgICAgICBy
ZWdtYXBfdXBkYXRlX2JpdHMoaTJzLT5yZWdtYXAsIFNVTjRJX0kyU19GSUZPX0NUUkxfUkVHLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgIFNVTjRJX0kyU19GSUZPX0NUUkxfRkxVU0hfVFgs
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgU1VONElfSTJTX0ZJRk9fQ1RSTF9GTFVTSF9U
WCk7Cj4gPiArICAgICByZWdjYWNoZV9jYWNoZV9ieXBhc3MoaTJzLT5yZWdtYXAsIGZhbHNlKTsK
Pgo+IERpdHRvLgo+Cj4gPgo+ID4gICAgICAgLyogQ2xlYXIgVFggY291bnRlciAqLwo+ID4gICAg
ICAgcmVnbWFwX3dyaXRlKGkycy0+cmVnbWFwLCBTVU40SV9JMlNfVFhfQ05UX1JFRywgMCk7Cj4g
PiBAQCAtMTA1MywxMyArMTA1Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19jb21w
b25lbnRfZHJpdmVyCj4gPiBzdW40aV9pMnNfY29tcG9uZW50ID0gewo+ID4KPiA+ICBzdGF0aWMg
Ym9vbCBzdW40aV9pMnNfcmRfcmVnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHJl
ZykKPiA+ICB7Cj4gPiAtICAgICBzd2l0Y2ggKHJlZykgewo+ID4gLSAgICAgY2FzZSBTVU40SV9J
MlNfRklGT19UWF9SRUc6Cj4gPiAtICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+IC0KPiA+
IC0gICAgIGRlZmF1bHQ6Cj4gPiAtICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gLSAgICAg
fQo+ID4gKyAgICAgcmV0dXJuIHRydWU7Cj4KPiBXaHkgZGlkIHlvdSBjaGFuZ2UgdGhpcz8gTWFu
dWFsIG1lbnRpb25zIHRoYXQgU1VONElfSTJTX0ZJRk9fVFhfUkVHIGlzIHdyaXRlLQo+IG9ubHkg
cmVnaXN0ZXIuIEV2ZW4gaWYgaXQgY2FuIGJlIHJlYWQsIHRoZW4gaXQncyBiZXR0ZXIgdG8gcmVt
b3ZlIHdob2xlCj4gZnVuY3Rpb24sIHdoaWNoIHdpbGwgYXV0b21hdGljYWxseSBtZWFuIHRoYXQg
YWxsIHJlZ2lzdGVycyBjYW4gYmUgcmVhZC4KPgo+Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgYm9v
bCBzdW40aV9pMnNfd3JfcmVnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHJlZykK
PiA+IEBAIC0xMDc4LDYgKzEwNzYsOCBAQCBzdGF0aWMgYm9vbCBzdW40aV9pMnNfdm9sYXRpbGVf
cmVnKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+IHVuc2lnbmVkIGludCByZWcpIHsKPiA+ICAgICAg
IHN3aXRjaCAocmVnKSB7Cj4gPiAgICAgICBjYXNlIFNVTjRJX0kyU19GSUZPX1JYX1JFRzoKPiA+
ICsgICAgIGNhc2UgU1VONElfSTJTX0ZJRk9fVFhfUkVHOgo+ID4gKyAgICAgY2FzZSBTVU40SV9J
MlNfRklGT19TVEFfUkVHOgo+ID4gICAgICAgY2FzZSBTVU40SV9JMlNfSU5UX1NUQV9SRUc6Cj4g
PiAgICAgICBjYXNlIFNVTjRJX0kyU19SWF9DTlRfUkVHOgo+ID4gICAgICAgY2FzZSBTVU40SV9J
MlNfVFhfQ05UX1JFRzoKPgo+IFNVTjRJX0kyU19GSUZPX0NUUkxfUkVHIHNob3VsZCBiZSBwdXQg
aGVyZSwgYmVjYXVzZSBpdCBoYXMgdHdvIGJpdHMgd2hpY2gKPiByZXR1cm5zIHRvIDAgaW1tZWRp
YXRlbHkgYWZ0ZXIgdGhleSBhcmUgc2V0IHRvIDEuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVq
Cj4KPiA+IEBAIC0xMDg4LDIzICsxMDg4LDEyIEBAIHN0YXRpYyBib29sIHN1bjRpX2kyc192b2xh
dGlsZV9yZWcoc3RydWN0IGRldmljZQo+ID4gKmRldiwgdW5zaWduZWQgaW50IHJlZykgfQo+ID4g
IH0KPiA+Cj4gPiAtc3RhdGljIGJvb2wgc3VuOGlfaTJzX3JkX3JlZyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHVuc2lnbmVkIGludCByZWcpCj4gPiAtewo+ID4gLSAgICAgc3dpdGNoIChyZWcpIHsKPiA+
IC0gICAgIGNhc2UgU1VOOElfSTJTX0ZJRk9fVFhfUkVHOgo+ID4gLSAgICAgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gPiAtCj4gPiAtICAgICBkZWZhdWx0Ogo+ID4gLSAgICAgICAgICAgICByZXR1
cm4gdHJ1ZTsKPiA+IC0gICAgIH0KPiA+IC19Cj4gPiAtCj4gPiAgc3RhdGljIGJvb2wgc3VuOGlf
aTJzX3ZvbGF0aWxlX3JlZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCByZWcpCj4g
PiAgewo+ID4gICAgICAgaWYgKHJlZyA9PSBTVU44SV9JMlNfSU5UX1NUQV9SRUcpCj4gPiAgICAg
ICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gICAgICAgaWYgKHJlZyA9PSBTVU44SV9JMlNfRklG
T19UWF9SRUcpCj4gPiAtICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIHRydWU7Cj4gPgo+ID4gICAgICAgcmV0dXJuIHN1bjRpX2kyc192b2xhdGlsZV9y
ZWcoZGV2LCByZWcpOwo+ID4gIH0KPiA+IEBAIC0xMTc1LDcgKzExNjQsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHJlZ21hcF9jb25maWcKPiA+IHN1bjhpX2kyc19yZWdtYXBfY29uZmlnID0geyAu
cmVnX2RlZmF1bHRzICAgICA9IHN1bjhpX2kyc19yZWdfZGVmYXVsdHMsCj4gPiAgICAgICAubnVt
X3JlZ19kZWZhdWx0cyAgICAgICA9IEFSUkFZX1NJWkUoc3VuOGlfaTJzX3JlZ19kZWZhdWx0cyks
Cj4gPiAgICAgICAud3JpdGVhYmxlX3JlZyAgPSBzdW40aV9pMnNfd3JfcmVnLAo+ID4gLSAgICAg
LnJlYWRhYmxlX3JlZyAgID0gc3VuOGlfaTJzX3JkX3JlZywKPiA+ICsgICAgIC5yZWFkYWJsZV9y
ZWcgICA9IHN1bjRpX2kyc19yZF9yZWcsCj4gPiAgICAgICAudm9sYXRpbGVfcmVnICAgPSBzdW44
aV9pMnNfdm9sYXRpbGVfcmVnLAo+ID4gIH07Cj4gPgo+ID4gQEAgLTExODgsNyArMTE3Nyw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZwo+ID4gc3VuNTBpX2kyc19yZWdtYXBf
Y29uZmlnID0geyAucmVnX2RlZmF1bHRzICAgID0gc3VuNTBpX2kyc19yZWdfZGVmYXVsdHMsCj4g
PiAgICAgICAubnVtX3JlZ19kZWZhdWx0cyAgICAgICA9IEFSUkFZX1NJWkUoc3VuNTBpX2kyc19y
ZWdfZGVmYXVsdHMpLAo+ID4gICAgICAgLndyaXRlYWJsZV9yZWcgID0gc3VuNGlfaTJzX3dyX3Jl
ZywKPiA+IC0gICAgIC5yZWFkYWJsZV9yZWcgICA9IHN1bjhpX2kyc19yZF9yZWcsCj4gPiArICAg
ICAucmVhZGFibGVfcmVnICAgPSBzdW40aV9pMnNfcmRfcmVnLAo+ID4gICAgICAgLnZvbGF0aWxl
X3JlZyAgID0gc3VuOGlfaTJzX3ZvbGF0aWxlX3JlZywKPiA+ICB9Owo+Cj4KPgo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
