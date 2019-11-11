Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45034F7525
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 14:38:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEAC81669;
	Mon, 11 Nov 2019 14:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEAC81669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573479488;
	bh=9Lyv5useRtD0hLBV0rGfs0B61e0suJcvbVvFTKCHQF0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YyEv0+hLRn7Fsm/sd0jEtXzR9p0Vtui6pPcfukiUfVI1ZLd4oBQtTVMnoImbEkwqT
	 lX4skxO4EQN6XRdh7332oAjhO1KtePgG2XREs96PvsihuJKCGlx1NRC1T61eN6PWzX
	 QjwE+U3uRJXS7WDsX9Faw5oP9zwBCwezq4e8aLN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28181F804FF;
	Mon, 11 Nov 2019 14:36:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A79F804FF; Mon, 11 Nov 2019 14:36:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7818DF80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 14:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7818DF80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c6ruehmM"
Received: by mail-wr1-x442.google.com with SMTP id l7so3086672wrp.6
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=0s9ZynTVj8MKyIhAnnLXh+oQ19lAh04mL6+1frjsEwU=;
 b=c6ruehmMh/cva0d4uTQ9KOMr4Uf69bUn/3AhPtA/HZmCVJ8H1L0JWTAUrYzMGP/SkY
 HVvxkQccjvl1SbbGmizCg0YUx/hXIsWM3cCFALBEGEfAsmShHRkA0YuzZbaMXtpZ1SQQ
 tOA/jBvVAdm/W797X0W1Wj6K7RETkhkTKos+BO/+SCBA4zRVJL1l+bB/nhgeQRbu3Csf
 zjS8Hg6M2MW9YWOmE2i5vvxe3ANl8o7WrrrbTKZZvgKBhavqI82JAVZKW7Bx1U0/W40U
 RXZIWXwPCCZEee6oXd1ZR4U6bhQI5pEgWHgZI07HFiMPyUmsyzZvGgMw+tbr6EP4CVvs
 9pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0s9ZynTVj8MKyIhAnnLXh+oQ19lAh04mL6+1frjsEwU=;
 b=lbiiMQeoCF4wo+ntiJ8Yz5gS1ViuY9se7xJWugbsDPEPafQMzL+EQWxZITSWqe+vaZ
 JSmnmjT6GMOVDcnc3gOLOicW5UiYyra8bgntl7oC3U0n2CSTiGPZr1Da9A5c/N5/4C0c
 Ey+S7Z9OTpAx4Te/69EkgTbgnLfD20Y6WbsHEQ3cZewdsdSHWBZ3hS5FBRYkFKHYaVz6
 sHzQ739HbvSNdfHBIvSDjDJ7DvuKtkY3CxsXLyr7NS5/ZaJtKSWOAHdhEQ48vLsivgoF
 191+Ac/L8swv4Qb8ccVHCx9IMxg1HV6gR/Cv3d0xD9H2IwoTpq20FvpmZ4MvMyOGzzBL
 pZhQ==
X-Gm-Message-State: APjAAAVpRLMCzSyyweBnOPkJsNf+QqbHA7PcClJzb4F1Q891yH5zejC4
 wrQGw8goBkVoHxIPemchvh2KWg==
X-Google-Smtp-Source: APXvYqzHgmTe66oXstdgxQO4KmGrIbywCgH/1P35rEMm83LcQyasx1HVyYnWKQ86oUmVQzSdPuzgPg==
X-Received: by 2002:adf:9185:: with SMTP id 5mr22081841wri.389.1573479378512; 
 Mon, 11 Nov 2019 05:36:18 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id q5sm13960498wmc.27.2019.11.11.05.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 05:36:18 -0800 (PST)
Date: Mon, 11 Nov 2019 13:36:10 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191111133610.GO3218@dell>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-3-srinivas.kandagatla@linaro.org>
 <20191111111836.GH3218@dell>
 <ce2244ac-2219-3cc0-8ad6-7491295fbbef@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce2244ac-2219-3cc0-8ad6-7491295fbbef@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v3 02/11] mfd: wcd934x: add support to
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

PiA+ID4gK3N0YXRpYyB2b2lkIHdjZDkzNHhfc2xpbV9yZW1vdmUoc3RydWN0IHNsaW1fZGV2aWNl
ICpzZGV2KQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCB3Y2Q5MzR4X2RkYXRhICpkZGF0YSA9IGRl
dl9nZXRfZHJ2ZGF0YSgmc2Rldi0+ZGV2KTsKPiA+ID4gKwo+ID4gPiArCXJlZ3VsYXRvcl9idWxr
X2Rpc2FibGUoV0NEOTM0WF9NQVhfU1VQUExZLCBkZGF0YS0+c3VwcGxpZXMpOwo+ID4gPiArCW1m
ZF9yZW1vdmVfZGV2aWNlcygmc2Rldi0+ZGV2KTsKPiA+ID4gKwlrZnJlZShkZGF0YSk7Cj4gPiA+
ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc2xpbV9kZXZpY2VfaWQgd2Nk
OTM0eF9zbGltX2lkW10gPSB7Cj4gPiA+ICsJeyBTTElNX01BTkZfSURfUUNPTSwgU0xJTV9QUk9E
X0NPREVfV0NEOTM0MCwgMHgxLCAweDAgfSwKPiA+IAo+ID4gV2hhdCBkbyB0aGUgbGFzdCBwYXJh
bWV0ZXJzIG1lYW4/IE1pZ2h0IGJlIGJldHRlciB0byBkZWZpbmUgdGhlbS4KPiAKPiBUaGlzIGlz
IEluc3RhbmNlIElEIGFuZCBEZXZpY2UgSUQgb2YgU0xJTUJ1cyBlbnVtZXJhdGlvbiBhZGRyZXNz
LgoKR3JlYXQuCgpQbGVhc2UgZGVmaW5lIHRoZW0gaW4gdGhlIHNhbWUgd2FzIHlvdSBkaWQgZm9y
IHRoZSBwcm9kdWN0IGNvZGUuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2
aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
