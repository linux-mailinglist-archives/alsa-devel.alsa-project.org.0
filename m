Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 091DD3AB3FC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 14:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71AFB16F1;
	Thu, 17 Jun 2021 14:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71AFB16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623934115;
	bh=IrhBB5EBtvuYlDqFaXCJi2gwIX1lXtPW6xQ+f4DJdQc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iA/S4ObWIgyEa24EnkgoG6bJI7JyfaTlOFFbrVS2KfprorCNwXqYZ7xZ1LFeT7ilh
	 a4Lw260KceBxuUT36y8XoKsjM4QdlhMAw7DRhbP4WrxNkw4BppGJr6N8oDhnk1eydV
	 AIblucUYyh0YE5wSoWpgixlfZMOVKoneIsYbVLzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFAD8F8025E;
	Thu, 17 Jun 2021 14:47:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAF0FF8025A; Thu, 17 Jun 2021 14:47:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D35EF8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D35EF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V+/6qPue"
Received: by mail-lf1-x130.google.com with SMTP id a1so10105962lfr.12
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r/Phzu7bjrEKdlhTrW87VC5bOCa9s6yypu708VamqUg=;
 b=V+/6qPueqNv2eJf47RZRXdqdDWmhAT08TDW/JYPs3WbJUN3ProYHLkncBwwYYvVgQk
 ncY12AUH2y595XbeaUoSWEGzYEDRrNOpRFSG7TwtgsQf2Pi3fpkX9WVo6nf0v3BsL7g3
 YGsAUS60HJeqGjljrduvog3/kAZMxfPxh8n+lszzDVJKwgddGlZzYDmPrgewCAAQTmMl
 KuXr9W/egmqV61kGkuGcAHJv1e7PXbRcZ83Wmag1khtx//vfgWwCCXnWehtf1vD8ukTP
 09XVvNo5/XVKZrG8+J1GFV5hpV1unHSiGPxpFXnsh1YiEyjyqosAJa0DDFu1aKDQQpDc
 db1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r/Phzu7bjrEKdlhTrW87VC5bOCa9s6yypu708VamqUg=;
 b=oUuAG0seuc9WkJ0qGklsIDK4lewYeYuAMrKpjQeJ5nVbXDk1SI8e5c02V4QhKLlHga
 UnAKHCIxXQKCSnuxLRSjIOZ1ZP+zmj9OKOxerILgfrnxJ1tpCFaS0Tje2jCS2mbW0uq9
 bpWzchY/enxVEaU3IOO+Kw6yR/pze/pUriFdcEDaZRbKxitASajXnRsKhzDKGBivr6mi
 xLOpeT7WfzzTyZmpPcoKjVSs0L1ADwXz9lc+cLY+K58QYr2TW/6ZsWTfYN/lSC3N9oWI
 VQjryIjbwRwsMC4LTpjk8BhwoY8tcPC5CcvVeaT7w+2Hmxbc2HC95tuTPvTCSnS3/jXb
 SnRw==
X-Gm-Message-State: AOAM532JL7Gkz71vmDK2Kebo9VCK2fWR/hVBHsjS37GyqDwc5QGPLZDq
 H6vtFQ/8QqNz0xYPVdGI/10=
X-Google-Smtp-Source: ABdhPJyZvxJ8DZDSNo4DKoKVvrsEkV3RZqEGYzVwIuFF49Cen5ncP6NQG4mkD8dK4Jxjpe0knZXRig==
X-Received: by 2002:a19:a407:: with SMTP id q7mr3870181lfc.68.1623934018213;
 Thu, 17 Jun 2021 05:46:58 -0700 (PDT)
Received: from [192.168.2.145] (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
 by smtp.googlemail.com with ESMTPSA id m22sm719848ljj.45.2021.06.17.05.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 05:46:57 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: tegra: Fix missing clk_disable_unprepare() on
 error path
To: Zou Wei <zou_wei@huawei.com>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com
References: <1623929439-4289-1-git-send-email-zou_wei@huawei.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fedff22c-2a25-0def-4980-8ba8ae75757b@gmail.com>
Date: Thu, 17 Jun 2021 15:46:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623929439-4289-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

17.06.2021 14:30, Zou Wei пишет:
> Fix the missing clk_disable_unprepare() before return
> from tegra_machine_hw_params() in the error handling case.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  sound/soc/tegra/tegra_asoc_machine.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index a53aec3..397f326 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -306,6 +306,7 @@ static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
>  
>  	err = snd_soc_dai_set_sysclk(codec_dai, clk_id, mclk, SND_SOC_CLOCK_IN);
>  	if (err < 0) {
> +		clk_disable_unprepare(machine->clk_cdev1);

It should be the opposite, the clock must be enabled here and it could
be re-enabled in the other error cases. In practice the chance of those
errors is close to zero, so we don't care about them since we will have
much bigger problems in that case.

>  		dev_err(card->dev, "codec_dai clock not set: %d\n", err);
>  		return err;
>  	}
> @@ -523,8 +524,10 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
>  	}
>  
>  	err = devm_snd_soc_register_card(dev, card);
> -	if (err)
> +	if (err) {
> +		clk_disable_unprepare(machine->clk_cdev1);

We also don't disable clock after removing driver module. This is
intentional because that clock is enabled to workaround obscure bug on
one of devboards that I can't reproduce. Ideally we should should fix
the bug and remove the clk-enable hack. So I'm not sure whether this is
a worthwhile "fix".
