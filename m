Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B9B74F40
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27B301B0C;
	Thu, 25 Jul 2019 15:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27B301B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564061109;
	bh=zr9qHrP9ILpoSHjmZMRbRiC/kLoTTg7NFCAfskbL50I=;
	h=From:To:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SuYGY2s/8/CplnAv85KtTMThtg59yoRJhxXQFFK0swjs55PyWrkBEzYfVS4NgzqjR
	 QHNFXlemM5sGwjkk5MP5fa3O6wlNXaFSBzAyM5l3EXmV7O9+DgRyd6iia+CZgrIJh+
	 38AvDz3Cf+VjN5wNKtsrkSAb9b8eNguYghCS2KtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 770C4F80448;
	Thu, 25 Jul 2019 15:21:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6BF4F80447; Thu, 25 Jul 2019 15:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F14F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F14F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="T56ZL0tU"
Received: by mail-wr1-x443.google.com with SMTP id z1so50752418wru.13
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZUGd2jspUiG+FAZ+7RGXuDLiEmYs11194A8ngHTeyP8=;
 b=T56ZL0tUgVYFHxu5umztZcIPeZ+Y8EP8VLpHuXaydTQ2sRYjlSuJGRW7wGkv6BaLef
 2rmXbB+mslBhrq6hpaJjKktJCFFSUwgbuDnRy2lrDzGwgtfptspfvaPBQlwIq9p1FT29
 nEDaROkdDc+VuBxTand+b9z8uQVgKmntkAOI9EsNO9SJdWKJfFsxEvzyi7MTrxF58qg2
 18CPs3hYcN08R3Q14dvUsVLIjfvne6Kh6IXf3qeU4yNgaxrJ5gWLu8IycArfQ+MP1U/v
 z1wYqGOsp9S8aZ1vMY0UrW3uMRaq+kn1Lwz8zRr16qOkrdhgYj4LmulNozig/NxmAYNr
 5gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZUGd2jspUiG+FAZ+7RGXuDLiEmYs11194A8ngHTeyP8=;
 b=aAkSCy+CscpDbI8nM9EUVVxl0yxcxBI+umCnwnp79K9MPhM9/BNeOHf1bdvp1Kzxw8
 plPNBiIHzlN4dgBcUwRFow+y+jYt37P9O3kN6R/kHpU+Nzjo+zrac4/ciTAEv8Mwj+Da
 5JzhywWlk6xNWkfbafU4nj+8V3ViaZlyi+J2AqfPK8UIRdYkG/xNFkVCTmyKxLUITv90
 TQ4XOj32NRpjEKWysCEWecam6JHwVLiglnWam/aYdp5vEQqdjwNGflG6ZVUvAfCSUHwb
 dGt9kIJxIPDGLEq42aLSm0EO/3Ch+Lglhm7slekinJYer5ZqHzvzlK03RtiI5tLrsaF1
 3Xxw==
X-Gm-Message-State: APjAAAXryD5JcQtm6R0S7DxDub+b5Ydv1tq9sBC+PtFrtIT0ZOOSeIUF
 ruAeU7N3fMNt+bxZHRAPObZrRg==
X-Google-Smtp-Source: APXvYqwwDUYgCEVbqCOrCIRQ3IOn2d2MD6ZRphM4OAuYE08YMKhoSF7VOHW0dgqJ4VhM8pmfOrVkog==
X-Received: by 2002:a5d:4108:: with SMTP id l8mr93347933wrp.113.1564060902228; 
 Thu, 25 Jul 2019 06:21:42 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s2sm39836778wmj.33.2019.07.25.06.21.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:21:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20190725130016.GC4213@sirena.org.uk>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
 <20190724162405.6574-2-jbrunet@baylibre.com>
 <20190725130016.GC4213@sirena.org.uk>
Date: Thu, 25 Jul 2019 15:21:40 +0200
Message-ID: <1jlfwmxna3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: codec2codec: run callbacks in
	order
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

T24gVGh1IDI1IEp1bCAyMDE5IGF0IDE0OjAwLCBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5v
cmc+IHdyb3RlOgoKPiBPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwNjoyNDowMFBNICswMjAwLCBK
ZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBXaGVuIGhhbmRsaW5nIGRhaV9saW5rIGV2ZW50cyBvbiBj
b2RlYyB0byBjb2RlYyBsaW5rcywgcnVuIGFsbCAuc3RhcnR1cCgpCj4+IGNhbGxiYWNrcyBvbiBz
aW5rcyBhbmQgc291cmNlcyBiZWZvcmUgcnVubmluZyBhbnkgLmh3X3BhcmFtcygpLiBTYW1lIGdv
ZXMKPj4gZm9yIGh3X2ZyZWUoKSBhbmQgc2h1dGRvd24oKS4gVGhpcyBpcyBjbG9zZXIgdG8gdGhl
IGJlaGF2aW9yIG9mIHJlZ3VsYXIKPj4gZGFpIGxpbmtzCj4KPiBUaGlzIGxvb2tzIGdvb2QgYnV0
IG5lZWRzIHJlYmFzaW5nIGFnYWluc3QgLW5leHQgZHVlIHRvIE1vcmltb3RvLXNhbidzCj4gcmVj
ZW50IERBSSBjaGFuZ2VzOgo+Cj4gICBDQyAgICAgIHNvdW5kL3NvYy9zb2MtZGFwbS5vCj4gc291
bmQvc29jL3NvYy1kYXBtLmM6IEluIGZ1bmN0aW9uIOKAmHNuZF9zb2NfZGFpX2xpbmtfZXZlbnTi
gJk6Cj4gc291bmQvc29jL3NvYy1kYXBtLmM6Mzg1NzoxMDogZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHNvY19kYWlfaHdfcGFyYW1z4oCZOyBkaWQgeW91IG1lYW4g
4oCYc25kX3NvY19kYWlfaHdfcGFyYW1z4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0KPiAgICAgcmV0ID0gc29jX2RhaV9od19wYXJhbXMoJnN1YnN0cmVhbSwgcGFy
YW1zLCBzb3VyY2UpOwo+ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgICAgICBz
bmRfc29jX2RhaV9od19wYXJhbXMKCkkgZGlkIHJlYmFzZSBhZ2FpbnN0IG5leHQgYW5kIHNhdyBN
b3JpbW90by1zYW4ncyBwYXRjaHNldC4gSSBtdXN0IGhhdmUKbWVzc2VkIHVwIHdoZW4gZm9ybWF0
dGluZyB0aGUgcGF0Y2hlcywgc29ycnkgYWJvdXQgdGhhdC4gSSdsbCByZXNlbmQuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
