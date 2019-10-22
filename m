Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D994DDFC21
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 05:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BB5165E;
	Tue, 22 Oct 2019 05:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BB5165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571714037;
	bh=Gp+yLSU/My3uE6aXrJF8jTcdxcncalxEqdPb/G+xPNY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDqj+iwsIHpa+qDTAgFexbo3OZGQaCl2Il2S9svZgR2s2nFn64G8Yoh4g8nK0epch
	 LedVxG0bp/FeCwi0/1YfDFjDiJWtWw/J2CmJw16E7Be1G+IT9v6cKWO5C+i30pIq5m
	 9G/6uKcUJ9qZT5LdggSV5VnuNC+wZkbk+rVpB31s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 875DCF8031A;
	Tue, 22 Oct 2019 05:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE346F8031A; Tue, 22 Oct 2019 05:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC84F80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 05:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC84F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="K0b7xhMq"
Received: by mail-wr1-x442.google.com with SMTP id t16so11034875wrr.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 20:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DBGwxBswkEid+QYsKOoKTSk4CtB3fQhNvSrwGatyLx0=;
 b=K0b7xhMqt64fnvR3ILBAbY/mqyZkV1DwiFHyB0m3J43kFz6jKK0Y/NO8TBQP7Wr9UL
 PQfgxfM1u2SphsjK3c7chtiW1WBkMfGyE5fxtpN+5Dn/eo1zJOgHBi3vY+sQ8H+EPoIY
 w5L0Q5djLFsUahOlexunN7Elrbsz6tfRIBFi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DBGwxBswkEid+QYsKOoKTSk4CtB3fQhNvSrwGatyLx0=;
 b=Kh1H1AGEW2g+LThhTkxlw1x80dOVTnd6Tfs6YdJp9ZDmeco+98ESOF+2WZBqH10Tdp
 8M1NrpDYZuxMd5J0JPWbJZoy0Q5YTtNZ/OtKLucXxoLRkqhHNkHuBFrs/r/W6qfzSJPF
 L5oyaB4hAtj2tLfG0lx6d5hTm50AsJv53k4sJYcLVZaFAHINL9CA4QB4EGeHQA3i5N24
 jo0WUthB+QtRgfM4oiITTny9675o08MgV6IFhCReEyWjQu0NEpLfA5q0AH7vO5FAVFVz
 oVioJvzrURZ7nqA0Jl4F6AMXdoMz5QWUY8fHTleCCo7USgPu+znp69RW5w9EkbTYG0du
 bdTA==
X-Gm-Message-State: APjAAAVz8b+1xT3Wnp0talAlvRE7LJi11NpeUokTxgj+7Y6EF8gk/Kzz
 zQ64u2LTK8yGTNHzl7dbWOBt0TXgIMItiRAgEUJdtA==
X-Google-Smtp-Source: APXvYqwVhpzg/T617PK/MoOirSNmIus8eMerWOKSOtp96OKp/ukpJHsMFJf79I2DXfQWc+C0iqBjeWIDk0GfVEUOUX4=
X-Received: by 2002:adf:e80b:: with SMTP id o11mr1160769wrm.231.1571713922674; 
 Mon, 21 Oct 2019 20:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
 <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
 <572375501.5493214.1571396197926@mail.yahoo.com>
 <CAGvk5PrZ65wEp7y7UbtEN2CCf6c-wvoknMKyTmuqXY9EPg7jiw@mail.gmail.com>
 <43747502.7351282.1571666231987@mail.yahoo.com>
In-Reply-To: <43747502.7351282.1571666231987@mail.yahoo.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Tue, 22 Oct 2019 11:11:51 +0800
Message-ID: <CAGvk5PoYYikRL90Vn2GxGWngwaaYzZwe6UX_hcjfAnLeBwvy=w@mail.gmail.com>
To: htl10@users.sourceforge.net
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] alsa conformance test fails to run for playback
	(and works for capture)
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

SGkgSGluLVRhaywKCkkgZmluYWxseSBmb3VuZCBvdXQgdGhlIHJlYXNvbiEgSXQgaXMgYmVjYXVz
ZSB0aGVyZSBpcyBhIGxlbmd0aCBsaW1pdApvZiBQQ00gbmFtZSBpbiBBTFNBIGNvbmZvcm1hbmNl
IHRlc3QuCkkgaGF2ZSBpbmNyZWFzZWQgaXQgb24KaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29v
Z2xlc291cmNlLmNvbS9jL2Nocm9taXVtb3MvcGxhdGZvcm0vYXVkaW90ZXN0LysvMTg3MTc5Mi4K
V2FpdGluZyBmb3IgdGhlIHJldmlldyBhbmQgbWVyZ2UuClRoYW5rcyBhIGxvdCBmb3IgeW91ciBj
YXRjaCEKCkJlc3QsCll1LUhzdWFuCgpIaW4tVGFrIExldW5nIDxodGwxMEB1c2Vycy5zb3VyY2Vm
b3JnZS5uZXQ+IOaWvCAyMDE55bm0MTDmnIgyMeaXpSDpgLHkuIAg5LiL5Y2IOTo1N+Wvq+mBk++8
mgo+Cj4gT24gU3VuZGF5LCAyMCBPY3RvYmVyIDIwMTksIDExOjUxOjQyIEJTVCwgWXUtSHN1YW4g
SHN1IDx5dWhzdWFuQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPgo+ID4gSGkgSGluLVRhaywKPiA+
IE1heWJlIGl0IGlzIG5vdCB0aGUgY29ycmVjdCBwY20gbmFtZS4gIEkgZ3Vlc3MgdGhlIGNvcnJl
Y3Qgb25lIGlzCj4gPiAiaHc6c2VlZWQ4bWljdm9pY2VjLDAiLiBDb3VsZCB5b3UgdHJ5IGl0Pwo+
ID4gQnkgdGhlIHdheSwgeW91IGNhbiBhbHNvIHVzZSBhcGxheSAtRCB7ZGV2aWNlX25hbWV9IHRv
IG1ha2Ugc3VyZQo+ID4gd2hldGhlciB0aGUgbmFtZSBpcyBjb3JyZWN0IG9yIG5vdC4KPgo+ID4g
QmVzdCwKPiA+IFl1LUhzdWFuCj4KPiBEZWFyIFl1LUhzdWFuLAo+Cj4gTm8gImh3OnNlZWVkOG1p
Y3ZvaWNlYywwIiBkaWQgbm90IHdvcmsgYXMgaW5wdXQgdG8gdGhlIGNvbmZvcm1hbmNlIHRlc3Qu
IEFzIGlucHV0IHRvICdhcGxheSAtRCcsIGJvdGggdGhlICwwIGFuZCB3aXRob3V0IGl0IHNvcnQg
b2Ygd29ya3MuCj4gKGl0IHdhaXRzIGZvciBpbnB1dCBmcm9tIHN0ZGluKS4KPgo+IFdoZW4gSSBh
Y3R1YWxseSBnYXZlIGl0IGFuIGNoYW5uZWwgZmlsZSB0byBwbGF5LCBib3RoIGZvcm1zICgnYXBs
YXkgLUQgaHc6Q0FSRD1zZWVlZDhtaWN2b2ljZWMgLi4uJyBhbmQgJ2FwbGF5IC1EIGh3OkNBUkQ9
c2VlZWQ4bWljdm9pY2VjLDAgLi4uJykgc3RvcHBlZCB3aXRoOgo+Cj4gUGxheWluZyBXQVZFICdV
bnRpdGxlZCByZWNvcmRpbmcgMjAxOS0xMC0xMSAxOS4xNS4xMS53YXYnIDogU2lnbmVkIDE2IGJp
dCBMaXR0bGUgRW5kaWFuLCBSYXRlIDE2MDAwIEh6LCBDaGFubmVscyA2Cj4gYXBsYXk6IHNldF9w
YXJhbXM6MTMzOTogU2FtcGxlIGZvcm1hdCBub24gYXZhaWxhYmxlCj4gQXZhaWxhYmxlIGZvcm1h
dHM6Cj4gLSBTMzJfTEUKPgo+IFRoZSBpbnRlcmVzdGluZyBwYXJ0IG9mICdhcGxheSAtTCcgaXMg
KHRoZXJlIGlzIGFub3RoZXIgZGV2aWNlKToKPgo+IHN5c2RlZmF1bHQ6Q0FSRD1zZWVlZDhtaWN2
b2ljZWMKPiBzZWVlZC04bWljLXZvaWNlY2FyZCwKPiBEZWZhdWx0IEF1ZGlvIERldmljZQo+IGRt
aXg6Q0FSRD1zZWVlZDhtaWN2b2ljZWMsREVWPTAKPiBzZWVlZC04bWljLXZvaWNlY2FyZCwKPiBE
aXJlY3Qgc2FtcGxlIG1peGluZyBkZXZpY2UKPiBkc25vb3A6Q0FSRD1zZWVlZDhtaWN2b2ljZWMs
REVWPTAKPiBzZWVlZC04bWljLXZvaWNlY2FyZCwKPiBEaXJlY3Qgc2FtcGxlIHNub29waW5nIGRl
dmljZQo+IGh3OkNBUkQ9c2VlZWQ4bWljdm9pY2VjLERFVj0wCj4gc2VlZWQtOG1pYy12b2ljZWNh
cmQsCj4gRGlyZWN0IGhhcmR3YXJlIGRldmljZSB3aXRob3V0IGFueSBjb252ZXJzaW9ucwo+IHBs
dWdodzpDQVJEPXNlZWVkOG1pY3ZvaWNlYyxERVY9MAo+IHNlZWVkLThtaWMtdm9pY2VjYXJkLAo+
IEhhcmR3YXJlIGRldmljZSB3aXRoIGFsbCBzb2Z0d2FyZSBjb252ZXJzaW9ucwo+IHVzYnN0cmVh
bTpDQVJEPXNlZWVkOG1pY3ZvaWNlYwo+IHNlZWVkLThtaWMtdm9pY2VjYXJkCj4gVVNCIFN0cmVh
bSBPdXRwdXQKPgo+IEFzIEkgbWVudGlvbmVkIGF0IHRoZSBiZWdpbm5pbmcsICdhcmVjb3JkIC1M
JyBhbmQgcnVubmluZyB0aGUgY29uZm9ybWFuY2UgdGVzdCBpbiBDQVBUVVJFIG1vZGUgdXNpbmcg
J2h3OkNBUkQ9c2VlZWQ4bWljdm9pY2VjJyB3b3Jrcy4gSXQgaXMgUExBWUJBQ0sgd2hpY2ggZG9l
cyBub3QuCj4KPiBSZWdhcmRzLAo+IEhpbi1UYWsKPgo+Cj4KPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
