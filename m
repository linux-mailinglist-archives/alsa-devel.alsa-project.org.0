Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E0750A099
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 15:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B22F91884;
	Thu, 21 Apr 2022 15:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B22F91884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650547293;
	bh=1oYR2n6VJE1CE3Qh/8FUpvWbkv9elsrcy8FmffuLHl4=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aorAD71QBlFKuLm7wXzqvRyuv03e8c34gNYMzeCjf33nB2C/iMS0RVwh7e02B7no9
	 ulMRfZEea1N+yZ/yp+4FU/uxlK4BuCCmNFInkptE17XOTRsQQiCvLybt7u5XdXpSIR
	 hvXOWGMjqqp9N/6hod1ZNpxaPMoRsPTck7mLLPbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4082BF80279;
	Thu, 21 Apr 2022 15:20:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D57F0F8032D; Thu, 21 Apr 2022 15:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A035F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 15:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A035F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="AUrm1OTM"
Received: by mail-wr1-x42e.google.com with SMTP id g18so6654313wrb.10
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=L7wte0C06azsXefSq415hFdMstkFvM22zlQgYtWO+cg=;
 b=AUrm1OTMT57lP9zR2YWItlE0dKnSg1BLMtlMv1ZIO6HK4oVMoDaYuT5t6BsPlwh9+V
 IhQhXJEIW0V82HowORKopGxyxnx6JvyCHVcsvQ0s6zjok7JTNP3WHs8FDrJ6EUr82Eny
 EKGzPccZ9en9NO3GBZjvRdkfSdY5sT0dY0zjCZn/LAYReLKYL/yPUwc65C32kxZasxCu
 reMf3hLpNA2s5NvEg1GuxVUVZ1I/XwIyIwswk8704HGAWzhIU1OWlNP2ie0VC+dBClQf
 Frj64DKiDPV4LJ/EPfqvij6c31Bx2TgarJGtSo3JgjU8l1htTLxYx9hf6Huv6eGLSmvN
 Fg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=L7wte0C06azsXefSq415hFdMstkFvM22zlQgYtWO+cg=;
 b=nztKuzI3xh3BfJEFl4RVNvkQxoyDlYGIv+ACPJlRBAAEG4qGumXJZWT6IiyUfr98I8
 V0OSdF4oiTticpfK2klmiH8FiT/8WL4mSwQDmAba/umSdxBXiZizYatQHqled8ljTlR6
 JF0PCPuI9oU55Vu/CkT+02sclHfzq9kMRk+fS67JyNEyaVXXTH36DsOnJY4i0d5LP09c
 UjkIn8MODeEsHVkHuTOE8usSUHogSbAx9yMOYOERyBTDbOLE0OVQ7IS+MNd1SKANlIKc
 Fvwp5a0IYF6HTqL7GeYe/VbNW5B46yZI9bWC+443M3B0YNVgfTXDyzffIVtsAj5Tk9Q7
 MwJQ==
X-Gm-Message-State: AOAM533m43RupFKpasxFlBtlIYmTT4wu9PD6vLn+igN43jk4lNTPaKX4
 mZOsxveQycngKx0O9KHElSdaZQ==
X-Google-Smtp-Source: ABdhPJyBQ2yedSfoh50dtsVWiG2Gzt8Qe2nzOPVRbqAMstR05XSh0xou3worT9lubhfTrl9HuWr5VQ==
X-Received: by 2002:a5d:4306:0:b0:207:9e49:a1d3 with SMTP id
 h6-20020a5d4306000000b002079e49a1d3mr20582394wrq.188.1650547221697; 
 Thu, 21 Apr 2022 06:20:21 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b0039295759a55sm2098677wmq.12.2022.04.21.06.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:20:20 -0700 (PDT)
References: <20220421123803.292063-1-broonie@kernel.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Date: Thu, 21 Apr 2022 15:02:54 +0200
In-reply-to: <20220421123803.292063-1-broonie@kernel.org>
Message-ID: <1j1qxqzi7g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Thu 21 Apr 2022 at 13:38, Mark Brown <broonie@kernel.org> wrote:

> These patches fix event generation issues in the custom controls in the
> Meson drivers detected by mixer-test and by inspection once I saw the
> pattern in these drivers.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Thx !

> I'm also seeing other failures due to these
> controls having invalid values, eg:
>
> # # AIU ACODEC SRC.0 value 3 more than item count 3
>
> but without documentation I'm not sure how to interpret/fix these -
> either the value should be fixed up on startup or there should be an
> extra value there (disconnected possibly?).

Value 3 is an I2S input from a block we don't support.
If we did support it, it would be an hostless DPCM BE to BE link
I'm not sure how I would represent this in ASoC TBH :/

At the time, I thought it would be easier (for the users) to leave this
value out and not give the false impression that the path was somehow
supported.

I did not realize it was the reset value nor that it would be a problem.

I can add a element to the enum if you think it is better have it
regardless of the actual path support. What do you think ?

>
> Mark Brown (3):
>   ASoC: meson: Fix event generation for AUI ACODEC mux
>   ASoC: meson: Fix event generation for AUI CODEC mux
>   ASoC: meson: Fix event generation for G12A tohdmi mux
>
>  sound/soc/meson/aiu-acodec-ctrl.c | 2 +-
>  sound/soc/meson/aiu-codec-ctrl.c  | 2 +-
>  sound/soc/meson/g12a-tohdmitx.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
>
> base-commit: 3123109284176b1532874591f7c81f3837bbdc17

