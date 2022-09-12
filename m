Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49D5B5DFD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 18:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BEC416B0;
	Mon, 12 Sep 2022 18:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BEC416B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662999381;
	bh=SLlwFA24tNoJjVqEf2KLHL5duhY12vqRsUFfwq8STnU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4bdrZ0RRRtLCC3zmgdtbCrZN5cNPSrru9M31nOsDVP1UhaFpm8nD/36jQFiEwocM
	 +4EZjrzYr8mHQ0+XD+3f0Laad4FO3W8wuZxwCndysdSIVNl0Opo4SCgjlFrOWKaFi8
	 fhkIYwiz1iRDGD7X+oyNrltXuadbN0uN/J9MlcsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4840BF804E7;
	Mon, 12 Sep 2022 18:15:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E36BF804AC; Mon, 12 Sep 2022 18:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A745AF8030F
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 18:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A745AF8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Oxw61ItY"
Received: by mail-wr1-x433.google.com with SMTP id k9so16235531wri.0
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=M0xmdgrmwbDBhsKXm8W2iTCB3o2g5k9UR6WS8CgTgAc=;
 b=Oxw61ItYOZEFE3R9dscWj0YuzCJ7CCVcOrfiBfKNEDsx/Aq5ErBXBfqZbtvfWuPX++
 i2mEGSZ0rWDJAjlRdBKMC8BZ62bIvCziS/Es4XF0lhgcdQwWC6L/OPhmn69JU3ttZAsI
 9cVmlIdvu/F965sUahklPfNqgAjA6e5Q63oZ15mvA7U7ExYUlF1bIxpJPc7pC0JWw5ty
 GLQs9oBo4z8LYnpw4VhiY0AbUYwQdhgV9t7bYpBkELDCW6CWThwbEaN4UseBm6BhakFw
 44wQuMX0ozZjSAvtzBdqncTB2L/7M404U0QQ89tU9gN6Qk8vgLF0AohgO8It/rvmRI2p
 LKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=M0xmdgrmwbDBhsKXm8W2iTCB3o2g5k9UR6WS8CgTgAc=;
 b=eF46obXOdJw+dPLjJIJdlogd29m3Rubm7F8gjRzr/n5MJE7B8mOAi7aiNEvCCxTB1K
 L8HeKGrLM/mM+AEdBCPt210Ff02MBeBPeINBUW5tLh/cQgR96Z+HP9DLVoMUQwWq2Tww
 lvqJVFsezwan5LsmtYaKigeprIppQPYfxFrKe3y+aD8HytHbem7ITh0VM/zdQRCX94SI
 HVhWZL5ehy6iBkHemDr2YS1kjtpUgHFyPFOankDkNFwOsyCIzvBQ4vTodDZ6iE9N2QJs
 WCFsY/2Nnrj6S3vVOHlO21iRBJK/jYdnBac2AHxQEEMgXaXvDfEh9p4/Q5FvW8qqzXRH
 23Og==
X-Gm-Message-State: ACgBeo0ceXCRzXtOuWoY9WH/HV59S54WGKd1g47JXfgYMgvNpCMoY2R9
 F6EpgZSNJlLdZ49GS5/agmE=
X-Google-Smtp-Source: AA6agR7iIstenSIVzqPRm91CXrgAFC5OzE2haezdyWa1MRmbRFznZs+R7yo6gnPmDP2SRl48i3jbAw==
X-Received: by 2002:adf:d1c2:0:b0:22a:66ad:2669 with SMTP id
 b2-20020adfd1c2000000b0022a66ad2669mr4996100wrd.468.1662999312594; 
 Mon, 12 Sep 2022 09:15:12 -0700 (PDT)
Received: from jernej-laptop.localnet ([89.101.193.71])
 by smtp.gmail.com with ESMTPSA id
 bo23-20020a056000069700b0022a3517d3besm8549700wrb.5.2022.09.12.09.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 09:15:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU
 DAI component
Date: Mon, 12 Sep 2022 18:15:11 +0200
Message-ID: <4766008.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20220911145713.55199-2-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
 <20220911145713.55199-2-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Mikhail Rudenko <mike.rudenko@gmail.com>
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

Dne nedelja, 11. september 2022 ob 16:57:12 CEST je Mikhail Rudenko 
napisal(a):
> At present, succesfull probing of H3 Codec results in an error
> 
>     debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' already
> present!
> 
> This is caused by a directory name conflict between codec
> components. Fix it by setting debugfs_prefix for the CPU DAI
> component.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-codec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 01b461c64d68..4d118f271e8c 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1253,6 +1253,7 @@ static const struct snd_soc_component_driver
> sun8i_a23_codec_codec = {
> 
>  static const struct snd_soc_component_driver sun4i_codec_component = {
>  	.name = "sun4i-codec",
> +	.debugfs_prefix = "dai",
>  };
> 
>  #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS




