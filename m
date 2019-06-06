Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A593753D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 15:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804C186E;
	Thu,  6 Jun 2019 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804C186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559827899;
	bh=Jgapc52updioRWeoGbUmxRgl88WmVdK48AGqHaPjrEY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jsiOGvRGq3ZXqpo3zMBOvw+YLhjXfKxpdU6MCpRFFIDreIMbP80LT9VkEEYld6xWY
	 pkL3tDuYcPOHqVxyHmIp8ZDrPelIxqQ7tmDLK5kh59STwuuHVLwhu0wTVSJ9HhEtYZ
	 qUfL9oyW69Ua4ubmgKifkQx/RLoJNqqODkBXh09k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89645F896EF;
	Thu,  6 Jun 2019 15:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C17CFF896F7; Thu,  6 Jun 2019 15:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE914F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 15:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE914F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="a3oJZXWA"
Received: by mail-wr1-x442.google.com with SMTP id n4so2402039wrw.13
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dxw1uwc1ttUhPxukM95b/+WkmRUy6HuZlnKOUBJr3/c=;
 b=a3oJZXWAJ7Jk564i4pv4LsLXooK3jw9nvgPJMj/+KqslglQMY87w0YCK76MD2plRi4
 uGFxZNvJhz66Rgno3JjXEvRnQufHYQNvOmk39ezmDCuIAT73DYMz/bLMUOaGkCnCyQsg
 hbtu1Mvw/TaNeNmOc0rqrtas0uWukruGbVky4M0QI280KD7iqwta0CUbHdM9wgIsgNqm
 71fdWP/Vt/SZkcM6fmpXrl5QgOhonvginubqXbBzL5CGPn5qbWZNPW2Jcu3BiDImMCdc
 5Tg1d/ww065w0c1z3zJccWTAMJLBV7+Oh4TNfXeZ7lo0TNuyPDEEUCFlbV51EdtGVbbx
 mDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dxw1uwc1ttUhPxukM95b/+WkmRUy6HuZlnKOUBJr3/c=;
 b=YakcjdO6uHqNr1g1kc/oxXZXujrDyJlQ2GKcwjZdN0kKyMarJ6286Tylw7pAg6m0TH
 8EvsWTSnWsBIwk7+Vvz0DCcSH8kU9qPEIvDv67Ca6x44gNEmprsqr/RxIw3KVe/liWKF
 q+VWkP8HnzqFvNhybhnrqKfU8B5eNRlHV8s1II6Re+54ByNnj129dRtfsXwizzFmODE9
 hzwBVZ/I95QO5+NwUkG0rR7YI/i9GNbkz6FDuc9o4K4sD/VK1s+teood0j96GIAF2AcE
 xSoLfgwxMSUrBMNVswP6JDMsFOGqKt3tOAu9vwcrxYlClbzFkANjw1MW9dBgzMQGJIeK
 LEDg==
X-Gm-Message-State: APjAAAX+w/hH+jrlpg2YHsSNlypKI+oUg5vCAJMHkUHrdZLh3lq9BLaJ
 8U9463CYJC8Mvmv42ZDeiMZkcg==
X-Google-Smtp-Source: APXvYqwskQjUPoFvAPLywsd8VoQs8gyuWhT1PCBf1K+2lH1FY77vhA1Gj83fJjIUMi+zYlR0aLTYUw==
X-Received: by 2002:a5d:6a8c:: with SMTP id s12mr28645752wru.326.1559827787007; 
 Thu, 06 Jun 2019 06:29:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id z14sm1799294wrh.86.2019.06.06.06.29.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 06:29:46 -0700 (PDT)
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20190606124242.12941-1-srinivas.kandagatla@linaro.org>
 <20190606152402.2d310b7d@xxx>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <446dd43c-c47e-c7a3-bcef-33241f41e4b0@linaro.org>
Date: Thu, 6 Jun 2019 14:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606152402.2d310b7d@xxx>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] ASoC: msm8916-wcd-digital: Add sidetone
 support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAwNi8wNi8yMDE5IDE0OjI0LCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3cm90ZToKPj4gKwlT
T0NfU0lOR0xFX1NYX1RMVigiSUlSMSBJTlAxIFZvbHVtZSIsCj4+IExQQVNTX0NEQ19JSVIxX0dB
SU5fQjFfQ1RMLAo+PiArCQkJMCwgIC04NCwgNDAsIGRpZ2l0YWxfZ2FpbiksCj4+ICsJU09DX1NJ
TkdMRV9TWF9UTFYoIklJUjEgSU5QMiBWb2x1bWUiLAo+PiBMUEFTU19DRENfSUlSMV9HQUlOX0Iy
X0NUTCwKPj4gKwkJCTAsICAtODQsIDQwLCBkaWdpdGFsX2dhaW4pLAo+PiArCVNPQ19TSU5HTEVf
U1hfVExWKCJJSVIxIElOUDMgVm9sdW1lIiwKPj4gTFBBU1NfQ0RDX0lJUjFfR0FJTl9CM19DVEws
Cj4+ICsJCQkwLCAgLTg0LCA0MCwgZGlnaXRhbF9nYWluKSwKPj4gKwlTT0NfU0lOR0xFX1NYX1RM
VigiSUlSMSBJTlA0IFZvbHVtZSIsCj4+IExQQVNTX0NEQ19JSVIxX0dBSU5fQjRfQ1RMLAo+PiAr
CQkJMCwgIC04NCwJNDAsIGRpZ2l0YWxfZ2FpbiksCj4gVGhlcmUgc2VlbXMgdG8gYmUgc29tZSBh
bGlnbm1lbnQgaXNzdWUgaW4gYWJvdmUgbGluZS4KPiBBbmQgd2hpbGUgSSdtIGNvbW1lbnRpbmcg
dGhpcyBwbGFjZSwgdGhlcmUgaXMgb25seSA0IFZvbHVtZSBjb250cm9scywKPiB3aGlsZSB0aGVy
ZSBpcyA1IHN3aXRjaGVzIGZvciBJSVIxIGFuZCBJSVIyLCBpcyB0aGlzIHJpZ2h0Pwo+IAoKRWFj
aCBJSVIgRmlsdGVyIGlzIDUgU3RhZ2UsIGFuZCBJSVIgYmxvY2sgaXMgZmVlZCB3aXRoIDQgaW5w
dXRzLCB0aGVzZSAKdm9sdW1lcyBhYm92ZSByZWZlcnMgdG8gZWFjaCBpbnB1dCBwYXRoLgoKClRo
YW5rcywKc3JpbmkKPj4gKwlTT0NfU0lOR0xFX1NYX1RMVigiSUlSMiBJTlAxIFZvbHVtZSIsCj4+
IExQQVNTX0NEQ19JSVIyX0dBSU5fQjFfQ1RMLApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCg==
