Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8BAB3CE
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 10:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB18515E2;
	Fri,  6 Sep 2019 10:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB18515E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567757796;
	bh=Azg9K/kjGtI/VzsVNlxj+KvNNhjjJCkDkuG/Y0B+3fU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mbbm9xn+Tu1qYKery0hvIYqU946Gfle6LIDq+WGSSZvw1lMDtgmCBXjtiY9xn6r6L
	 u2drzTvuAhzmqXGHq0/iwQaWHJKjufZ5JWbSR25Jfqdeeik3qCIAFzkqtTW+nsKZDR
	 mXBogCCujogYMryjEqfOP54gy6NotRgWDCujJ00Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2740F80214;
	Fri,  6 Sep 2019 10:07:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC8ABF80394; Fri,  6 Sep 2019 10:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36024F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 10:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36024F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YQTNUGp3"
Received: by mail-wr1-x433.google.com with SMTP id q17so796699wrx.10
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZADO0frl2e1psD03tmu3ATaAVmo/5SCefdrKUcR4Rok=;
 b=YQTNUGp3sU45o5oom9Nbiq7APATAFh5CdGyqx2lHQcs7+xdkW9WQ7VSpWFC7L9MY6o
 GyYc2gV7PSH8fyAgPhsoTHo/qKfwvBV/ZCrSOrlYcQbHoDnQ+Rn2XU1uT6ndpnxb7kOg
 YxF5PJFJB5Xuo07p+8eCLvJtwix37JrLzNVJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZADO0frl2e1psD03tmu3ATaAVmo/5SCefdrKUcR4Rok=;
 b=KWv4QV9IkUsXRHlUucdyAakuSWc+LAYC18mhAi6B26Amw8PqiqlldhpAu8SJe/AhfN
 54ooSBZ44lxGtZyL0z6aCKCRyOeQaNIFBuAvBsheoEJHg58jLMbFpNRTKF0p4lklvRTX
 vkwnkf3kqlxTO+diShUspOSQf42ECJdCEKVlJmEdc3LQKyCm60MIfYmnRK97cF4XKUfr
 2Eygi1e9S+ItslK3jO3u30sNAmWRjmoLwtD3YX+Oo+gG13St6+UWctBhMWNQ92kT15/L
 ShlH1YTrb0D+ZffGxJPH15VDDtSzyxE23OLQlORl8O7a/7dCedM+OLu7PkhWr99L19Gk
 QUHQ==
X-Gm-Message-State: APjAAAUZ8vMypRBmfYUcSX+kXyh3hnitDy6IcinnuG4WgQfGCjL5dZbT
 zpNT+VHYnv72jfzZUko4Ce1n8tM/O/d48/jd0lGPlQ==
X-Google-Smtp-Source: APXvYqwubICMC4atLMRUT4xr8MjBBM7G4a2xKPxtixdBFlOHDcqyon5qG+FSRXbfY4qWHU59n/zQtJGR7uxN2VYYO6c=
X-Received: by 2002:adf:cd02:: with SMTP id w2mr5779548wrm.327.1567757226883; 
 Fri, 06 Sep 2019 01:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAGvk5Pohb9cxL=Mu11RPVD66NdiZkG+vO9TEtqBWe1tnBn6qyQ@mail.gmail.com>
 <s5h5zm6pybu.wl-tiwai@suse.de>
In-Reply-To: <s5h5zm6pybu.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 6 Sep 2019 16:06:55 +0800
Message-ID: <CAGvk5Pp76Y2s5Uz87KXxGCRbvEf8q6k8XhXoWGG=7qRUHx7iNg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Alsa conformance test - a new test for ALSA drivers
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

SGkgVGFrYXNoaSwKClRoYW5rcyBmb3IgdGhlIHJlcGx5LiBJJ20gdmVyeSBnbGFkIHRoYXQgeW91
IGxpa2UgaXQuIERvIHlvdSBoYXZlIGFueQpzdHJvbmcgcmVhc29uIGZvciBtb3ZpbmcgaXQgaW50
byBBTFNBIHVwc3RyZWFtPyBJZiBub3QsIEkgd291bGQgbGlrZSB0bwprZWVwIGl0IGluIGNocm9t
aXVtIGNvZGUgYmFzZS4gSXQncyBhbHNvIGVhc3kgZm9yIGRldmVsb3BlcnMgdG8gc2VuZApwYXRj
aGVzIHZpYSBnZXJyaXQgKGNocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tKS4gSSBjYW4g
YmUgcmVzcG9uc2libGUKZm9yIHJldmlld2luZyB0aGVzZSBjaGFuZ2VzLiBJZiBpbnN0YWxsaW5n
IGZyb20gdGhlIHNvdXJjZSBjb2RlIGlzIG5vdApxdWljayBlbm91Z2gsIHdlIGNhbiBjcmVhdGUg
dGhlIG5ldyBwYWNrYWdlIGZvciBpdC4gQmVzaWRlcywgaXQgaXMgZWFzaWVyCmZvciBtZSB0byBt
YWludGFpbiB0aGlzIHRvb2wuCgpCZXN0LApZdS1Ic3VhbgoKVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmRlPiDmlrwgMjAxOeW5tDnmnIg15pelIOmAseWbmyDkuIvljYgxMToxN+Wvq+mBk++8mgoK
PiBPbiBXZWQsIDA0IFNlcCAyMDE5IDA2OjI5OjMwICswMjAwLAo+IFl1LUhzdWFuIEhzdSB3cm90
ZToKPiA+Cj4gPiBIaSBhbGwsCj4gPgo+ID4gSSBoYXZlIGNyZWF0ZWQgYW4gbmV3IHRvb2wgIkFs
c2EgY29uZm9ybWFuY2UgdGVzdCIoCj4gPgo+IGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNl
LmNvbS9jaHJvbWl1bW9zL3BsYXRmb3JtL2F1ZGlvdGVzdC8rL21hc3Rlci9hbHNhX2NvbmZvcm1h
bmNlX3Rlc3QubWQKPiApLAo+ID4gd2hpY2ggaXMgdXNlZCBmb3IgdmVyaWZ5aW5nIEFMU0EgZHJp
dmVycy4gSGVyZSBhcmUgc29tZSBtYWluIGZ1bmN0aW9ucyBpdAo+ID4gY2FuIG1lYXN1cmU6Cj4g
PiAxLiBDb3JyZWN0bmVzcyBvZiBod19wYXJhbXMKPiA+IDIuIFN0YWJpbGl0eSBvZiByYXRlCj4g
PiAzLiBTdGFiaWxpdHkgb2Ygc3RlcAo+ID4gNC4gUnVudGltZSBvZiBlYWNoIEFMU0EgQVBJCj4g
PiA1LiBVbmRlcnJ1biBhbmQgT3ZlcnJ1bgo+ID4KPiA+IEkgcmVjb21tZW5kIHRvIHVzZSB0aGUg
c2NyaXB0ICJhbHNhX2NvbmZvcm1hbmNlX3Rlc3QucHkiIGluc2lkZS4gSnVzdAo+IGdpdmUKPiA+
IGl0IGEgZGV2aWNlIGFuZCB0aGVuIGl0IHdpbGwgdGVzdCB0aGUgYmVsb3cgZnVuY3Rpb25zIGF1
dG9tYXRpY2FsbHkuCj4gPiAxLiBUbyBtYWtlIHN1cmUgd2hldGhlciBhbGwgdGhlIHBhcmFtZXRl
cnMgcHJvdmlkZWQgYnkgYW4gQUxTQSBkcml2ZXIgY2FuCj4gPiBiZSB1c2VkLgo+ID4gMi4gVG8g
bWFrZSBzdXJlIHdoZXRoZXIgdGhlIG1lYXN1cmVkIHJhdGUgaXMgdGhlIHNhbWUgYXMgdGhlIGV4
cGVjdGVkCj4gcmF0ZS4KPiA+Cj4gPiBXZSBoYXZlIHVzZWQgdGhpcyB0b29sIHRvIGZpbmQgb3V0
IG1hbnkgaXNzdWVzIGluIENocm9tZU9TLiBJIGhvcGUgaXQgY2FuCj4gPiBoZWxwIGRldmVsb3Bt
ZW50IGluIExpbnV4IHRvby4gSWYgeW91IGhhdmUgYW55IHByb2JsZW1zIG9yIHdhbnQgbW9yZQo+
ID4gZmVhdHVyZXMsIHBsZWFzZSBjcmVhdGUgYSBidWcgaW4gY3JidWcuY29tIGFuZCBhc3NpZ24g
dG8gbWUgKAo+ID4geXVoc3VhbkBjaHJvbWl1bS5vcmcpLiBUaGFua3MhCj4KPiBHcmVhdCwgaXQn
cyBzb21ldGhpbmcgSSB3YW50ZWQgdG8gc2VlIGZvciBsb25nIHRpbWUuCj4gTGV0IHVzIGtub3cg
aWYgeW91J2QgbGlrZSB0byBwdXQgdGhpcyB0byBBTFNBIHVwc3RyZWFtLgo+Cj4KPiB0aGFua3Ms
Cj4KPiBUYWthc2hpCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
