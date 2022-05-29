Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3A536FFB
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 08:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C94611908;
	Sun, 29 May 2022 08:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C94611908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653805354;
	bh=xVj2WM9BCrk3z0nBLP1VrCaTf2C1g0JD3Eg7C2WAVws=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f9eiOmEgnuknXpAu02+DgQhO25pa6kVnbFpSxtgrWcDHLIS6e3QqQvElOCEvrhxht
	 zMpFvXy03/Z+ZNK18PLz40yZkdyXAwRKi9KPQv4XWxBRTdixSHBfj4xThdFuEdITtG
	 ys2DG929Yz+FR30QcmEMltIX3WF2VMIAyxCbdxJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CA2EF8026A;
	Sun, 29 May 2022 08:21:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25929F8024C; Sun, 29 May 2022 08:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCC7DF8010B
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 08:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC7DF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WH6rANfO"
Received: by mail-ot1-x333.google.com with SMTP id
 t14-20020a9d66ce000000b0060af9ed4b87so5722480otm.9
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 23:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DP3KL8zh3H6hEONXRWYvdxMVnBOn9TmfB1GUJt+GXzw=;
 b=WH6rANfOONF/H/3mOJ9b+yuZzvyPASxxgUjKMAc/XHkrz9hMmmhUVN+R6VIUMzwaM1
 h494ZwXYDbZlhtd/b7GKz+sxGrAIAuQnVUrxa6XnZTtoHlcOX8dZZO8+vGBTwwq2SByA
 wsgFOQlordoq6cae7YCtpCJdH59x2da1gZmHU7YwCskdTJqmSuNGlZOzgLVa56Wbpfag
 wanX6C4AUZb15waePPdqCkNrfY/SG0k5apL9TuWp+bZH++SL20uU1wnpZ1e0jemJzb1n
 nmJYt7zOYpsJIr0nueB/4Vj0rcws5xnsZJB22iftMp2p/5i5vULY5mpYoy0TkigxSlbp
 RgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DP3KL8zh3H6hEONXRWYvdxMVnBOn9TmfB1GUJt+GXzw=;
 b=4/1x7YIPluGFh6QRwgQaehIxqFtgd4aAkNlM2jRSys97Nk0es6Sqw77YTFShZDV0Wc
 cC8tN13WpmvlqZomiZtW8LzjnY+4gIBRfMNp5Tka0asciQm11wLJwhosF4vMxaVUU90a
 Kyk57r2fhi917rBajdQsFXtzPCNnJ/BOPYkFVAUnzIwXUaeLkrzorXc8FiIDPIMvrdg2
 Ouao/u2rsIFQ9qyZJhsYxF/Mg23EWM1mN4OpY5ekAPgWwUnsY4Zt0iEdH6+BZMEvTjQk
 o7k920iXSVDOGWhks86/OeVIEOwpzsXRXyEGSN0o6IQScE6+nARHsoDKWK/IFtJQg58R
 GciA==
X-Gm-Message-State: AOAM531ZjFyhKuZ07XzeiD28dSoGzqYYkOUAuU03asnBpbbdUYtJc8kT
 1Bt1kww0QDbPEmTo9vMXAJo=
X-Google-Smtp-Source: ABdhPJydxHNPe/DI9GN80COFyXA9R3gRhkvwP3OOuBUIoMPz6Q6XQw+NoLB5TNuv/vfg3wpIFzILlA==
X-Received: by 2002:a05:6830:18c8:b0:60b:1d79:22e5 with SMTP id
 v8-20020a05683018c800b0060b1d7922e5mr11245508ote.56.1653805286451; 
 Sat, 28 May 2022 23:21:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bm22-20020a056820189600b0035eb4e5a6besm3634279oob.20.2022.05.28.23.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 23:21:25 -0700 (PDT)
Message-ID: <9ed24f31-3676-7b9f-41b2-b1a7de4c8610@roeck-us.net>
Date: Sat, 28 May 2022 23:21:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: Intel: avs: Fix build error on arc, m68k and sparc
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net> <Yo+8hvwhvdx7tNGI@sirena.org.uk>
 <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
 <20220529060503.av7cahnu3knhnord@pengutronix.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220529060503.av7cahnu3knhnord@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 alsa-devel@alsa-project.org, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 5/28/22 23:05, Uwe Kleine-König wrote:
> On some platforms (i.e. arc, m68k and sparc) __fls returns an int (while
> on most platforms it returns an unsigned long). This triggers a format
> warning on these few platforms as the driver uses %ld to print a warning.
> 
> Replace it by fls (and %d) which returns an int everywhere and which is
> already used in the if condition triggering the warning.
> 
> Fixes: beed983621fb ("ASoC: Intel: avs: Machine board registration")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

FWIW:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Hello again
> 
> On Sun, May 29, 2022 at 07:48:18AM +0200, Uwe Kleine-König wrote:
>> Tell me if you don't want to squash this into beed983621fb and prefer a
>> formal patch.
> 
> I just realized this isn't a problem in next only any more, but the
> commit is already in Linus Torvald's tree. So I guess this isn't fixed
> by a fixup of said commit and here comes a proper patch.
> 
>   sound/soc/intel/avs/board_selection.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> index 80cb0164678a..f189f71b8e1e 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -325,8 +325,8 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
>   
>   	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
>   	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
> -		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
> -			num_ssps, mach->drv_name, __fls(mach->mach_params.i2s_link_mask));
> +		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%d\n",
> +			num_ssps, mach->drv_name, fls(mach->mach_params.i2s_link_mask));
>   		return -ENODEV;
>   	}
>   
> 
> base-commit: beed983621fbdfd291e6e3a0cdc4d10517e60af8

