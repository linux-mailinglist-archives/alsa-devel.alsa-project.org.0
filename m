Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E946754F785
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 14:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90C531EE0;
	Fri, 17 Jun 2022 14:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90C531EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655468918;
	bh=DBtnOJznP1/NB7ClUFKzB8xJL/wpKbkdkmbBHwPGU+4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFmPAuK7slsGW+rcLHXYgoLk5Ylrv+M2qSPU9b3xoMYxQWWZh/fGZO7yEus1/Trzz
	 YquTvTGkP5qEe+ePqW0KfetQn00pEmcn9EyshT4d5Bja4YxjGSMKho2sYpRQbi65A5
	 BN2hXeDCx4gqf24FS90J/DguFUyBohvjq47L2cEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74077F80529;
	Fri, 17 Jun 2022 14:27:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B647F80528; Fri, 17 Jun 2022 14:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26134F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 14:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26134F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T640Ob++"
Received: by mail-lj1-x233.google.com with SMTP id b7so4564829ljr.6
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JnQ7ER3/BznrTK6nfzGkCBcRLScePRNEds8wSayDWBU=;
 b=T640Ob++YeWd+T4ihz7vTm05LTeY1mBKCkrscFUItH+rfgs8IQ0zuI+rF5wsrv/uSE
 4smrU/D1K55NAapM7LpLvaSXHuQP8eg2yb3SWc2rmTcxAS5KSD2hsN3fqqIII8A+6MiP
 DbMWkdHmpqnFG0903QpZnEqTu9a5INuuekBkb8vVdCQirDUsG+lZHGpma8s/o7UzVIK8
 t72yJNWYaYTxkgjlJmAJnETqJtChitTyUpd6IcxFgltNZKauQiOWqEAt71NVwEEkD52L
 ivKggtaNSmYESsaOGpLfWglIE624MgV/4TyiIfLSanXQMC47IcQ/kflPwVGXVu68120j
 q5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JnQ7ER3/BznrTK6nfzGkCBcRLScePRNEds8wSayDWBU=;
 b=b3pZpBhStBxk18s+SdfdHsuxRFhPxBz3kWC16UhZk7M12EmnrBXW2jD/9z5hRjtfRM
 1bkgXB30bkZFYdugDvFI/n6+PvVtVwJ9qqnYbnllEj+oyE9Ydj0/WfYgoBkdOAHPcHS7
 u+1y552Sz3cKEFYVSkw/681ZwK39Oz5Koi3f/ayd7kPit/Pio1cYGfnZSJsOnGbwhXge
 4AVvY1DMPZWM04fqF6UIFiZpzI8ife+kLs+8nVAliROYYctcGmoG+dfDsKt4zb/AXoZV
 I7GlwQnIjOLLs/NYMSWWij7JBPUdIIKchotJZ8+PTElJgfEO7pV/YdRLf+mCcEiCegxE
 a1sA==
X-Gm-Message-State: AJIora88uQNVnCqxZaxxVr8lY+BXkqtdc5mZquQSBadGXCpshfkxF2IN
 7Q8yJIZtEm4d66IXARtYJBg=
X-Google-Smtp-Source: AGRyM1thk1l/pNJzxUInKJ0RZ+VOJmvPhKqfi3rTTC9JzaLkrNZkk9MrxX7xO+x0ncaIaqoA7DXVtg==
X-Received: by 2002:a2e:a783:0:b0:255:9be1:a471 with SMTP id
 c3-20020a2ea783000000b002559be1a471mr4816519ljf.215.1655468848267; 
 Fri, 17 Jun 2022 05:27:28 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056512046800b0047e0061a611sm621093lfd.235.2022.06.17.05.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 05:27:27 -0700 (PDT)
Message-ID: <bc447b49-a02c-5c4f-4e04-8071ecdfe1bd@gmail.com>
Date: Fri, 17 Jun 2022 15:28:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 11/11] ASoC: ti: davinci-mcasp: use
 pm_runtime_resume_and_get()
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
 <20220616220427.136036-12-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220616220427.136036-12-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Hi Pierre,

On 17/06/2022 01:04, Pierre-Louis Bossart wrote:
> The use of pm_runtime_get_sync() is buggy with no use of put_noidle on
> error.
> 
> Use pm_runtime_resume_and_get() instead.

Thanks for the fix,

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index e2aab4729f3ab..0201000b619f6 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2111,8 +2111,7 @@ static int davinci_mcasp_gpio_request(struct gpio_chip *chip, unsigned offset)
>  	}
>  
>  	/* Do not change the PIN yet */
> -
> -	return pm_runtime_get_sync(mcasp->dev);
> +	return pm_runtime_resume_and_get(mcasp->dev);
>  }
>  
>  static void davinci_mcasp_gpio_free(struct gpio_chip *chip, unsigned offset)

-- 
Péter
