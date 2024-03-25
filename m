Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0756E894BBA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:46:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2040723D6;
	Tue,  2 Apr 2024 08:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2040723D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040416;
	bh=+MeltPZVNKwDT4s9LWJGLhPwYg6oTgYBzKVCn15VZsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ITdNIJob+rXOjVLdB1ZYlzoFVRe6HaoBfxAFxLFJziAuay+ZKscYaGYnkD04m33Ll
	 C1mLGbNRiTXh17xV99yBggafPSJR5zNhu3UBbTyEJU9c5puqIQNRNFuN011cAFh8It
	 c7AXO1MDDDCPFPs5XD3rYGZvm9MN2TnvbFoe4t40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D270F8059F; Tue,  2 Apr 2024 08:46:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BECDF805A0;
	Tue,  2 Apr 2024 08:46:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24777F80236; Mon, 25 Mar 2024 15:25:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A80BF8015B
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 15:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A80BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VQDSZFLq
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-513d3746950so5398043e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Mar 2024 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711376706; x=1711981506;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3PUtNY4boQ+ipy4wQYd09otPfOvXLpDaCkOQ9UXG84=;
        b=VQDSZFLqhwEZ3PR5GXPfscTuZ2SGQNbi5S1+rIt56DpCECR0/6AeMWsSRhMUpDpxEP
         Bp+ZA7MWFSxLPvk4c7W1kSlhcnmy2VpZ5tTayL3EMfYUg8smt1MqD5gtpCmEyvlp17MG
         aXJtBYehcdgTHDDpiaHcL8HOIFPC/FQ/HpW3A+8X7G/SSOhroycP5qBQFQg4f9h8apd5
         PikAXBapyIwETunl+ZLr8BlIbFBU5p/NfttyiYB95XA7dl46/DyH/2PDo7dxtgaUmnrX
         Y5ncH2g1dE+Q3Ia8W2ZjLnrOfwR4UjhzdbEVbAXXGFfl9dX/EdYCNb0cRh045FLVw/Zz
         Yf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376706; x=1711981506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3PUtNY4boQ+ipy4wQYd09otPfOvXLpDaCkOQ9UXG84=;
        b=BiVOXaY42knZncy1/WOXXm8k5rKNQGIBr5CacWJtf6nkkUy54odrZwTa85JicxhLBW
         S8Eo++hWwjQMu0zXYvhkZlDsvAmFIfD/LgnbnrRTvp7De/LIEeSZYy/hIVTWKpTyFFgY
         ThpTU5v17dstgGLUwi/6TqaMJNWASKTzmFIoqBy9XMnHruh+2PxuMFyxngiM5Cn2Ew7W
         QF63GrQb8QhDJuDC69c2IkwcWW9BA2a4VvJboTraO6MtIF8zyn/AhZdAFiT7W6U6/Ipf
         01f227S/IuqQMUmV5FAVe6RVIwE/mfDFHK/5SKEMnZGojMicQTbJy/9PhnsHuPMD0XP2
         9sug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU4SycA1qFIg9W7Purb1SbsxXGS++Sk9dFh1mW4i66WYC3v+i/LCInejsWaGjypvk6YrMA0nMzlY3WtgmyaGF6wUiBQkqc6loGW9s=
X-Gm-Message-State: AOJu0YwIqANBqZMqk0X8Ycd1S5yAwAbKQ1ohto0cjqUM8SIUBr2OiaFv
	IV4xIjwh8gYAW/4NudtIeDfR5PmbG2KCqRq+ikd6bSjoRKTxBYIHkI2Y0FGXAu8=
X-Google-Smtp-Source: 
 AGHT+IEFidCgty+v00DMTxMPtnXdVdXzQmlAggnT/0h5fv4Uf17UIa5tj3pq//IwqDLEoDELOZO2Xw==
X-Received: by 2002:a19:ca14:0:b0:513:23be:e924 with SMTP id
 a20-20020a19ca14000000b0051323bee924mr4375709lfg.59.1711376705571;
        Mon, 25 Mar 2024 07:25:05 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 l12-20020a1709062a8c00b00a45f39b2d16sm3104885eje.200.2024.03.25.07.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:25:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 17:25:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: sti: uniperif: fix the undefined bitwise shift
 behavior problem
Message-ID: <5d850276-a872-45fb-9df2-2b72479787be@moroto.mountain>
References: <20240325034032.1031885-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325034032.1031885-1-suhui@nfschina.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TV2UPH5CIK76D7KXGIV5LODWDJEV4ZXI
X-Message-ID-Hash: TV2UPH5CIK76D7KXGIV5LODWDJEV4ZXI
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:46:14 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TV2UPH5CIK76D7KXGIV5LODWDJEV4ZXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 25, 2024 at 11:40:33AM +0800, Su Hui wrote:
> Clang static checker(scan-build):
> sound/soc/sti/uniperif_player.c:1115:12: warning:
> The result of the left shift is undefined because the right operand is
> negative [core.UndefinedBinaryOperatorResult]
> 
> When UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip) equals to -1, the result of
> SET_UNIPERIF_CONFIG_BACK_STALL_REQ_DISABLE(ip) is undefined.
> 
> Here are some results of using different compilers.
> 		1UL >> -1	1UL << -1
> gcc 10.2.1	0x2		0
> gcc 11.4.0	0		0x8000000000000000
> clang 14.0.0	0x64b8a45d72a0	0x64b8a45d72a0
> clang 17.0.0	0x556c43b0f2a0	0x556c43b0f2a0
> 
> Add some macros to ensure that when right opreand is negative or other
> invalid values, the results of bitwise shift is zero.
> 
> Fixes: e1ecace6a685 ("ASoC: sti: Add uniperipheral header file")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  sound/soc/sti/uniperif.h | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
> index 2a5de328501c..1cbff01fbff0 100644
> --- a/sound/soc/sti/uniperif.h
> +++ b/sound/soc/sti/uniperif.h
> @@ -12,17 +12,28 @@
>  
>  #include <sound/dmaengine_pcm.h>
>  
> +#define SR_SHIFT(a, b)		({unsigned long __a = (a); \
> +				unsigned int __b = (b); \
> +				__b < BITS_PER_LONG ? \
> +				__a >> __b : 0; })

The code definitely looks buggy, but how do you know your solution is
correct without testing it?

I don't like this solution at all.  This is basically a really
complicated way of writing "if (b != -1)".  Instead of checking for -1,
the better solution is to just stop passing -1.  If you review that
file, every time it uses "-1" that's either dead code or a bug...

sound/soc/sti/uniperif.h
   132  #define UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT(ip) \
   133          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? -1 : 12)
                                                                      ^^^^
This is dead code

   134  #define UNIPERIF_ITS_UNDERFLOW_REC_DONE_MASK(ip) \
   135          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? \
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
because the version is checked here.

   136                  0 : (BIT(UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT(ip))))

Just delete UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT() and use 12 directly.

[ snip ]

   988  #define UNIPERIF_BIT_CONTROL_OFFSET(ip)  \
   989          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? -1 : 0x004c)
                                                                       ^^^
Negative offsets seem like a bug.

   990  #define GET_UNIPERIF_BIT_CONTROL(ip) \
   991          readl_relaxed(ip->base + UNIPERIF_BIT_CONTROL_OFFSET(ip))

regards,
dan carpenter

