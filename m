Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA88B5A0
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 12:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7601664;
	Tue, 13 Aug 2019 12:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7601664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565692340;
	bh=eHHVGUkBzyifQKmCgPOt28+wUBJYrtCNNIAE89DGgS0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3RpIshoHRJ9EY7LViLE0f6e2BNOkKFARCL79mxibG0Wa7turggWY15OKyzDhd8Km
	 JjPROKCzEPsFKm+f4OOpN8bfFi69Sz0BjUmsElBadUkok9RP/Y9i1RBP0hDGbOHE+r
	 YdDk1QkH7HDTzi64o6JCEeqQvlccUuib812mkJ1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85DB2F8015B;
	Tue, 13 Aug 2019 12:30:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A13DF8026A; Tue, 13 Aug 2019 12:30:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97C31F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 12:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97C31F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ECIOfaMx"
Received: by mail-wm1-x341.google.com with SMTP id e8so757516wme.1
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=FpaQRzjjHieM2ZwGQ/GdoyebOrmSoenQLDvTG9Qi6yI=;
 b=ECIOfaMx8Etdcuaur37ndWisVmkutpI1rFJEIHjhiDwicrUiGrpbpAh/VAWiR4/mk6
 Jys94C59P6dLWKu5BQICoe2FRE77l28OSivWG+JTNpgd8WKtGSQfWBBZVZAd/6GBPYIR
 N7QAM4bNCEBuL4EZ341aigqm61rNC6SklbSxux6Dl/RDvx5m6NoOoWU5WkAo1sULWlGP
 rmInauOV0CaASOC/reQNrVHz2DmC5lwG4koVfD/zwf/6tujmdf9hlG0GpGX3wZHW5mgA
 uLPW4z83TGAcn7qk9nhCXCd2q3i2VQmGjIrY9gblReoQWkp3QwSKnXXrrq/4ZMdLTfKj
 FjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FpaQRzjjHieM2ZwGQ/GdoyebOrmSoenQLDvTG9Qi6yI=;
 b=OTnFZR1Nfebo58zubu3GbqywxobWBYNxO2yeohJ4Sf2K6qdKONGa1CTVDiAlboih++
 CYMGmggZfaaeFoVAxge3ACT1Z67MC/Z7zJmLvxfXUZoSP/UqK9WCuo1a41wVOSWSpg8B
 9pIZj/0Vw3md3GDw8xKehb6roL6T7SyUhHqWkdUeNuDWIN+Kmt6hn9mpVRhOl+O42TeP
 U2p8iPWOfJxkgnO+MpKDoR/PFHdVprLpJVDh1kb9RyA0A1xP1DQQpVR8bosvw55MqTNq
 bx0wP4HvYMEUIcnMtnjNQhcIjgfJK3wEvBxSryQLjOTIcg2qg9maDq7Ea0lSO0jDEUMK
 TmGg==
X-Gm-Message-State: APjAAAVT9d8a/t4Cv8u0BYRYq+1i52h/b/ZLTvYZpvQAlcIYewUyWkrr
 1xtfNwBG98kNbvqyLKn94fU68Q==
X-Google-Smtp-Source: APXvYqyN4qrmzO2fFtNWQoBH44tqgLmmkrAsTcojaeG2fQxm4ZfxnFrHwjr1JBuy4GY1YNPhUuoqgg==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr2384506wme.3.1565692225238;
 Tue, 13 Aug 2019 03:30:25 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id a11sm10103044wrx.59.2019.08.13.03.30.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Aug 2019 03:30:24 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:30:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20190813103022.GB26727@dell>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net>
 <20190812081640.GA26727@dell>
 <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
 <1565690508.1856.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565690508.1856.0@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
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

T24gVHVlLCAxMyBBdWcgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKCj4gSGkgUGhpbGlwcGUs
Cj4gCj4gCj4gTGUgbWFyLiAxMyBhb8O7dCAyMDE5IMOgIDEwOjQ0LCBQaGlsaXBwZSA9P2lzby04
ODU5LTE/cT9NYXRoaWV1LURhdWQ9RTk/PQo+IDxmNGJ1Z0BhbXNhdC5vcmc+IGEgw6ljcml0IDoK
PiA+IEhpIExlZSwKPiA+IAo+ID4gT24gOC8xMi8xOSAxMDoxNiBBTSwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gPiAgT24gVGh1LCAyNSBKdWwgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiA+ID4g
Cj4gPiA+ID4gIEl0IGhhcyBiZWVuIHJlcGxhY2VkIHdpdGggdGhlIGluZ2VuaWMtaWlvIGRyaXZl
ciBmb3IgdGhlIEFEQy4KPiA+ID4gPiAKPiA+ID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJj
dWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPiA+ID4gIFRlc3RlZC1ieTogQXJ0dXIgUm9q
ZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4gPiA+ID4gIC0tLQo+ID4gPiA+ICAgZHJpdmVy
cy9tZmQvS2NvbmZpZyAgICAgIHwgICA5IC0tCj4gPiA+ID4gICBkcml2ZXJzL21mZC9NYWtlZmls
ZSAgICAgfCAgIDEgLQo+ID4gPiA+ICAgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jIHwgMzI0Cj4g
PiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gICAz
IGZpbGVzIGNoYW5nZWQsIDMzNCBkZWxldGlvbnMoLSkKPiA+ID4gPiAgIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21mZC9qejQ3NDAtYWRjLmMKPiA+ID4gCj4gPiA+ICBBcHBsaWVkLCB0aGFu
a3MuCj4gPiAKPiA+IEl0IHNlZW1zIHRoZSByZXBsYWNlbWVudCBpcyBkb25lIGluICJNSVBTOiBx
aV9sYjYwOiBNaWdyYXRlIHRvCj4gPiBkZXZpY2V0cmVlIiB3aGljaCBpcyBub3QgeWV0IG1lcmdl
ZC4KPiAKPiBJdCdzIG1lcmdlZCBpbiB0aGUgTUlQUyB0cmVlLCB0aG91Z2gsIHNvIGl0J2xsIGJs
ZW5kIHRvZ2V0aGVyIGp1c3QKPiBmaW5lIGluIGxpbnV4LW5leHQuCgpXb25kZXJmdWwuICBUaGFu
a3MgUGF1bC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
