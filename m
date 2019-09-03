Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DFA60A2
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 07:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9D85167C;
	Tue,  3 Sep 2019 07:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9D85167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567488754;
	bh=NufYMTFpKDsW3/xPnsTx9+o8JHmdKea+eviEMGcjYxA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6HLbYUd6HLgEjcS5Yda+qzOptMp8CH2vXqylDY9sGoPF4RCUgFO77pT9HKUj+gyv
	 U/7cAkyCYxOg2eLGip5PkWk9URQcwM4+bSeXaaJE5zpMJN83txdm9dpnnW41s0S2dG
	 w3G4pWSjnEs/ne1wP/nxkECe3LxpZsPs5ykGKX7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59B99F80228;
	Tue,  3 Sep 2019 07:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D7BCF8045F; Tue,  3 Sep 2019 07:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B44F80228
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 07:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B44F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="kKTFo/ci"
Received: by mail-ua1-x942.google.com with SMTP id 107so2902642uau.5
 for <alsa-devel@alsa-project.org>; Mon, 02 Sep 2019 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5e8NU11wQpmTZzAjPbjvXoRys0WzexQTxIerJ/JngOQ=;
 b=kKTFo/ciFR3y8rsCb/3oMmwxdLxzWMn/U2BLuhSX1IqNRJwKjGyH8rIQwTjkFpcIPs
 mbAJc58qo4xJZphXnUkhwLwnY/oaLXcZ1C3YRE80gPSe0vCj4IwcLRsrfaTWpKtTNIlA
 3oLxW7JjiWwAsGppKCKbumbyi2uLsDe5Bno0Lv4M285ZUGV6PwKVTflcGoPd5I54M6ul
 uv5yrH15T0Fww42W5k9+zyESOGlzrJPR+laywzITD9TAa2cDqCihLylh8pY2cM5ZM25l
 xp2/19ZNAG2xa5O398xEckEbT6QxHJYbnSbbEJFW7PE2E/Z443aay1OQzyle9/GPG7Ck
 UW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5e8NU11wQpmTZzAjPbjvXoRys0WzexQTxIerJ/JngOQ=;
 b=GVXilQ5tZDve2jsczWws2MbTF9icUghMMPWLQXD5YTfNU1aIpAp8VPw8yJG7YM1ecT
 YhPHWIrGTG9T0AEtak80UhA+jqEpeLAHItrnO+VCbCeyDzsD5a/MVefXSP6Pvre9gp3g
 wlnY2xgOPtoRobzIkeKqYJc3zbuGsWN0yza3x7CHvZAfLujb/QwKJOAWRxcP8GJsymrD
 aq/2L38E3imnqc85ICyQL1b4AlcBDec0jDPN0q4U+Mavf/bJZlg92ItYOUC1c+H+nPZ2
 VPrzB9J5pmwEJD9CP2BkpSzoR3cRtI7iaRc0tbfPQOwkg323GAWSUXuBH3T0l05yVLCr
 h/GA==
X-Gm-Message-State: APjAAAXzB4Vh1udOEAELIPmwy6iWhczY7pnFhl84qQfry8TIWGMGAbqx
 S9sKoN2I0mRnuSzWAlE++0V0mdL55qUENkfiBWcCbg==
X-Google-Smtp-Source: APXvYqxTAZ/MUoUZk3D1f36VHOazK37aILZfgkD3ZURYmQHRaepUGoeGfgD90m4zsVbCX/fUrHBVP/rGwbWTR9yjq2g=
X-Received: by 2002:ab0:6358:: with SMTP id f24mr2531680uap.72.1567488641754; 
 Mon, 02 Sep 2019 22:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190902100054.6941-1-jian-hong@endlessm.com>
 <s5hwoerx6wf.wl-tiwai@suse.de>
In-Reply-To: <s5hwoerx6wf.wl-tiwai@suse.de>
From: Jian-Hong Pan <jian-hong@endlessm.com>
Date: Tue, 3 Sep 2019 13:30:04 +0800
Message-ID: <CAPpJ_edbfN_6yfxjBSV5dnp40ufCeWeMiF_QdsPmWmHubagCQw@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Linux Upstreaming Team <linux@endlessm.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Enable internal
 speaker & headset mic of ASUS UX431FL
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

VGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPiDmlrwgMjAxOeW5tDnmnIgy5pelIOmAseS4gCDk
uIvljYg3OjQx5a+r6YGT77yaCj4KPiBPbiBNb24sIDAyIFNlcCAyMDE5IDEyOjAwOjU2ICswMjAw
LAo+IEppYW4tSG9uZyBQYW4gd3JvdGU6Cj4gPgo+ID4gT3JpZ2luYWwgcGluIG5vZGUgdmFsdWVz
IG9mIEFTVVMgVVg0MzFGTCB3aXRoIEFMQzI5NDoKPiA+Cj4gPiAweDEyIDB4YjdhNjAxNDAKPiA+
IDB4MTMgMHg0MDAwMDAwMAo+ID4gMHgxNCAweDkwMTcwMTEwCj4gPiAweDE1IDB4NDExMTExZjAK
PiA+IDB4MTYgMHg0MTExMTFmMAo+ID4gMHgxNyAweDkwMTcwMTExCj4gPiAweDE4IDB4NDExMTEx
ZjAKPiA+IDB4MTkgMHg0MTExMTFmMAo+ID4gMHgxYSAweDQxMTExMWYwCj4gPiAweDFiIDB4NDEx
MTExZjAKPiA+IDB4MWQgMHg0MDY2ODUyZAo+ID4gMHgxZSAweDQxMTExMWYwCj4gPiAweDFmIDB4
NDExMTExZjAKPiA+IDB4MjEgMHgwNDIxMTAyMAo+ID4KPiA+IDEuIEhhcyBkdXBsaWNhdGVkIGlu
dGVybmFsIHNwZWFrZXJzICgweDE0ICYgMHgxNykgd2hpY2ggbWFrZXMgdGhlIG91dHB1dAo+ID4g
ICAgcm91dGUgYmVjb21lIGNvbmZ1c2VkLiBTbywgdGhlIG91dHB1dCB2b2x1bWUgY2Fubm90IGJl
IGNoYW5nZWQgYnkKPiA+ICAgIHNldHRpbmcuCj4gPiAyLiBNaXNzZXMgdGhlIGhlYWRzZXQgbWlj
IHBpbiBub2RlLgo+ID4KPiA+IFRoaXMgcGF0Y2ggZGlzYWJsZXMgdGhlIGNvbmZ1c2luZyBzcGVh
a2VyIChOSUQgMHgxNCkgYW5kIGVuYWJsZXMgdGhlCj4gPiBoZWFkc2V0IG1pYyAoTklEIDB4MTkp
Lgo+Cj4gSXMgMHgxNCByZWFsbHkgYSBkZWFkIHBpbj8gIE9yIGlzIGEgc3Vycm91bmQvYmFzcyBz
cGVha2VyIG9yIHN1Y2g/CgpJIGNoZWNrZWQgV2luZG93cyAodXBkYXRlZCB0byBsYXRlc3QgYW5k
IGluY2x1ZGluZyBSZWFsdGVrIE1FRElBKSBvbgpBU1VTIFVYNDMxRkwgbGFwdG9wIGFnYWluLiAg
QWx0aG91Z2ggaXQgaGFzIHR3byBpbnRlcm5hbCBzcGVha2VyIHBpbnMsCnRoZXJlIGlzIG9ubHkg
b25lIHNldCBvZiBpbnRlcm5hbCBzcGVha2VyIGluY2x1ZGluZyBsZWZ0L3JpZ2h0CmNoYW5uZWxz
LiAgQW5kIHRoZSBhdWRpbyB0ZXN0IChTcGVha2VyIFNldHVwKSBvbmx5IHNob3dzIGxlZnQvcmln
aHQKY2hhbm5lbHMuICBTbywgTklEIDB4MTQgY2FuIGJlIGRpc2FibGVkLgoKSmFpbi1Ib25nIFBh
bgoKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFuLUhvbmcgUGFuIDxqaWFuLWhvbmdAZW5kbGVz
c20uY29tPgo+ID4gLS0tCj4gPiAgc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgfCAxMiAr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCj4gPiBpbmRleCBlMzMzYjNlMzBlMzEuLjBhMWZhOTlhNjcyMyAx
MDA2NDQKPiA+IC0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCj4gPiArKysgYi9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwo+ID4gQEAgLTU3OTcsNiArNTc5Nyw3IEBAIGVu
dW0gewo+ID4gICAgICAgQUxDMjg2X0ZJWFVQX0FDRVJfQUlPX0hFQURTRVRfTUlDLAo+ID4gICAg
ICAgQUxDMjU2X0ZJWFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFLAo+ID4gICAgICAgQUxDMjk5X0ZJ
WFVQX1BSRURBVE9SX1NQSywKPiA+ICsgICAgIEFMQzI5NF9GSVhVUF9BU1VTX0lOVFNQS19IRUFE
U0VUX01JQywKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBh
bGMyNjlfZml4dXBzW10gPSB7Cj4gPiBAQCAtNjgzNyw2ICs2ODM4LDE2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICB7IH0KPiA+ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgfSwKPiA+ICsgICAgIFtB
TEMyOTRfRklYVVBfQVNVU19JTlRTUEtfSEVBRFNFVF9NSUNdID0gewo+ID4gKyAgICAgICAgICAg
ICAudHlwZSA9IEhEQV9GSVhVUF9QSU5TLAo+ID4gKyAgICAgICAgICAgICAudi5waW5zID0gKGNv
bnN0IHN0cnVjdCBoZGFfcGludGJsW10pIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB7IDB4
MTQsIDB4NDExMTExZjAgfSwgLyogZGlzYWJsZSBjb25mdXNpbmcgaW50ZXJuYWwgc3BlYWtlciAq
Lwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHsgMHgxOSwgMHgwNGExMTE1MCB9LCAvKiB1c2Ug
YXMgaGVhZHNldCBtaWMsIHdpdGhvdXQgaXRzIG93biBqYWNrIGRldGVjdCAqLwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHsgfQo+ID4gKyAgICAgICAgICAgICB9LAo+ID4gKyAgICAgICAgICAg
ICAuY2hhaW5lZCA9IHRydWUsCj4gPiArICAgICAgICAgICAgIC5jaGFpbl9pZCA9IEFMQzI2OV9G
SVhVUF9IRUFEU0VUX01PREVfTk9fSFBfTUlDCj4gPiArICAgICB9LAo+ID4gIH07Cj4gPgo+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7
Cj4gPiBAQCAtNjk5NSw2ICs3MDA2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1
aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKPiA+ICAgICAgIFNORF9QQ0lfUVVJUksoMHgxMDQz
LCAweDE0MjcsICJBc3VzIFplbmJvb2sgVVgzMUUiLCBBTEMyNjlWQl9GSVhVUF9BU1VTX1pFTkJP
T0spLAo+ID4gICAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MTUxNywgIkFzdXMgWmVuYm9v
ayBVWDMxQSIsIEFMQzI2OVZCX0ZJWFVQX0FTVVNfWkVOQk9PS19VWDMxQSksCj4gPiAgICAgICBT
TkRfUENJX1FVSVJLKDB4MTA0MywgMHgxNmUzLCAiQVNVUyBVWDUwIiwgQUxDMjY5X0ZJWFVQX1NU
RVJFT19ETUlDKSwKPiA+ICsgICAgIFNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDE3ZDEsICJBU1VT
IFVYNDMxRkwiLCBBTEMyOTRfRklYVVBfQVNVU19JTlRTUEtfSEVBRFNFVF9NSUMpLAo+ID4gICAg
ICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWExMywgIkFzdXMgRzczSnciLCBBTEMyNjlfRklY
VVBfQVNVU19HNzNKVyksCj4gPiAgICAgICBTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxYTMwLCAi
QVNVUyBYNzA1VUQiLCBBTEMyNTZfRklYVVBfQVNVU19NSUMpLAo+ID4gICAgICAgU05EX1BDSV9R
VUlSSygweDEwNDMsIDB4MWIxMywgIkFzdXMgVTQxU1YiLCBBTEMyNjlfRklYVVBfSU5WX0RNSUMp
LAo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
