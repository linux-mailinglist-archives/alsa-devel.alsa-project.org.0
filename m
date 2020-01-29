Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241414C97B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 12:20:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8541673;
	Wed, 29 Jan 2020 12:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8541673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580296833;
	bh=uaERRVi0nQDuN1slWN7YyQavuIpMrf86duBqB0gqOLc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNtCHNPfd7QI7ymOFqZcT6pNYrlpKJ5B1Jmx0EgtFtND3VUJ06VY5XG02x8g6HF5+
	 GahhvFrHnLsYz4GDhUaXqBUG4hXwNvLLflSbRVRLZXQe0Fk0IlHsc+9g4FOi7AWFxu
	 7AstcU3DP0TsB4hRnVgFxWB4sN+mjN9dcvnFjSgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE750F80229;
	Wed, 29 Jan 2020 12:18:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8E2EF8021E; Wed, 29 Jan 2020 12:18:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD1EF80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 12:18:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD1EF80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Sw3HgBhF"
Received: by mail-wr1-x442.google.com with SMTP id t2so19714004wrr.1
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=WdEwvXuf/f1ew5arKRFGjQIWnawCPhuYtVKO7QPsc9Y=;
 b=Sw3HgBhFTNZBQ36hs9fAypBBY7Fa4Sh5OhqWXeKEPKx1kmSDHDG26lN9LA8NuPw2qF
 p1DHCrsJ8EOijNoxlSKupI7Zxp/jNH8T5E9VvGgDRaqOitPqAwUS74HmiAa2e9jQLPbv
 89Du9baS80tY7ud1v+dhJl/UHWfb1rsw6BinQLgP7jPdxm3FsWERhB7LLxEIdmcc48pv
 IvpJw07fjov6WMjVtkzx0qF2RvIxiyEMBsvtYuAZEu6G6dxXDSHBPJDgjeuZ9nxRC4Vq
 xKwuGm14d1NEDJdCQHvkh2GjoQQsU1G/gsuEuT6g11JkYEZpLnLFNMDd8mOBL+N7a+4f
 yEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WdEwvXuf/f1ew5arKRFGjQIWnawCPhuYtVKO7QPsc9Y=;
 b=gqVv3y7uD7Sun4CA5rmVbauYyPMOj+G2vIhVS/91ovw8S56czaZaGHyoQsh/DRN6ZH
 HcGOeJ0hwude1aAou09TjpmcdZOxRAHSOoM5JRneTFIaLIJors7zNHNs5BXgy+l810p0
 NGRb8sRIqTu5LENpU9ZZA/7JS9L4vJC1HkdJ+ZX0ExSZOu1BCRo4eeWoNXnE0MnM5YPX
 BybFe5yTzH7RYhJp+dLnWLyd+mWkLB/sv1eSfR+1ZQmpPnzEYr/1StVNtIEuloPovLVE
 1LRx2lRTdW+GhRWtyRenTiqYK1203KDqnAXumA48s/20wYqvecwd1Mmi5y0Nd8MpGhzR
 yBfA==
X-Gm-Message-State: APjAAAVGdvTiDaAmSxuTf/gqzCF5TbwW9shl8uqWFSBJA+4ae6qK2PdT
 mXRhmCoAHqqJDyeRKgld8H0nsA==
X-Google-Smtp-Source: APXvYqyMoIcsyaEqYxxW6ffIc7cM/EHFn0b6ThBfRh9LHZ4nCf4C8TEqE1Hf1HzIgoqg9YnSyuDr8A==
X-Received: by 2002:adf:a109:: with SMTP id o9mr35424484wro.189.1580296726681; 
 Wed, 29 Jan 2020 03:18:46 -0800 (PST)
Received: from dell ([2.27.35.227])
 by smtp.gmail.com with ESMTPSA id b17sm2448180wrx.15.2020.01.29.03.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 03:18:45 -0800 (PST)
Date: Wed, 29 Jan 2020 11:18:58 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20200129111858.GC3548@dell>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v6 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
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

T24gVGh1LCAxOSBEZWMgMjAxOSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKCj4gUXVhbGNv
bW0gV0NEOTM0MC9XQ0Q5MzQxIENvZGVjIGlzIGEgc3RhbmRhbG9uZSBIaS1GaSBhdWRpbyBjb2Rl
YyBJQy4KPiAKPiBUaGlzIGNvZGVjIGhhcyBpbnRlZ3JhdGVkIFNvdW5kV2lyZSBjb250cm9sbGVy
LCBwaW4gY29udHJvbGxlciBhbmQKPiBpbnRlcnJ1cHQgY29udHJvbGxlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5v
cmc+Cj4gQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
PiAtLS0KPiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAxMiArCj4g
IGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJz
L21mZC93Y2Q5MzR4LmMgICAgICAgICAgICAgICAgIHwgMzA2ICsrKysrKysrKysrKysrKwo+ICBp
bmNsdWRlL2xpbnV4L21mZC93Y2Q5MzR4L3JlZ2lzdGVycy5oIHwgNTMxICsrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL3djZDkzNHgvd2NkOTM0eC5oICAgfCAg
MzEgKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA4ODEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9tZmQvd2NkOTM0eC5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L21mZC93Y2Q5MzR4L3JlZ2lzdGVycy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL2xpbnV4L21mZC93Y2Q5MzR4L3djZDkzNHguaAoKQXBwbGllZCwgdGhhbmtzLgoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
