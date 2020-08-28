Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017132554AD
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 08:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9101823;
	Fri, 28 Aug 2020 08:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9101823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598597410;
	bh=TkhgczOGtkifWB/TVIlRts5Vlh4369xzTFV+is7IYo0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCbRvzohE/bJLiioIfIqk+v6mLzKIKQOIOgRBCf//ms8w1Bgq26ESnvHU1RzxCcX9
	 dSdtC8U1JtIrMKXn/7ZBpbh7wmEQCL4ED73mu6WzxGvUQIRVNKGapYKLRmO/s4qFOM
	 xb+MuKAfou8mUbLu/zU4HeckII4Rjz8w3+u3cU6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9F3BF80105;
	Fri, 28 Aug 2020 08:48:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 788BEF8016F; Fri, 28 Aug 2020 08:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B5D6F80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 08:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B5D6F80105
Received: by mail-ej1-f65.google.com with SMTP id d26so123996ejr.1
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 23:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yGha4SiD+sJIY9+V0onyYAsFpD65q4MyMopm/dvyYaY=;
 b=dacc/fGEMznz7IUIFXK0o2G6gBoRinQI6SLbzs2FZaaBIk6/SN8oEboLBpFjqTxXMy
 j4E9feQBHyJ/gZcpZWlegGcjjfdtJGs+skGt9EpuyPQ8tXXkj+bvdaSHG8KAyWy14aHJ
 eOVA3dAqSIYDOhX+1mjzxPBg7yrQOL1nwm0hJGjQkRKLZl9nib5TdpjhVmRxOAI8wN+Z
 zDZKF5Dj3m6ojSCbdST33pF/VHMlyoAJImgEl5U/SoOu+h2Oll0C0ckXfxkAkTEp4hAn
 B7Ss/w2sApJkCEROrQQJFxFdgPacCWM6PqLtyJTZrY4lI0lE4p5t7unT6OvkBbKwOqbU
 9Ysg==
X-Gm-Message-State: AOAM530K5OBp4mcqwAhtu56gQcSnlaFu6vAOAfIKI8VCLEtewmPr60AU
 aR624/Uxh3wxlLzdUxfTs5A=
X-Google-Smtp-Source: ABdhPJxhsWIy8WW+Tr4xQbQCXRqLiOto2ndTlcft3CciYCq2dpG8mxvQSmAG9Sd2ZbVjMFwrTmeR6Q==
X-Received: by 2002:a17:906:4c97:: with SMTP id
 q23mr327734eju.11.1598597295563; 
 Thu, 27 Aug 2020 23:48:15 -0700 (PDT)
Received: from pi3 ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id dr21sm22807ejc.112.2020.08.27.23.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 23:48:15 -0700 (PDT)
Date: Fri, 28 Aug 2020 08:48:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ASoC: wm8994: Ensure the device is resumed in
 wm89xx_mic_detect functions
Message-ID: <20200828064812.GE17406@pi3>
References: <20200827173357.31891-1-s.nawrocki@samsung.com>
 <CGME20200827173426eucas1p13f9f7d358dfcc440db160de3dc658ddf@eucas1p1.samsung.com>
 <20200827173357.31891-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200827173357.31891-2-s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, m.szyprowski@samsung.com
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

On Thu, Aug 27, 2020 at 07:33:57PM +0200, Sylwester Nawrocki wrote:
> When the wm8958_mic_detect, wm8994_mic_detect functions get called from
> the machine driver, e.g. from the card's late_probe() callback, the CODEC
> device may be PM runtime suspended and any regmap writes have no effect.
> Add PM runtime calls to these functions to ensure the device registers
> are updated as expected.
> This suppresses an error during boot
> "wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"
> caused by the regmap access error due to the cache_only flag being set.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index b3ba053..fc9ea19 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -3514,6 +3514,8 @@ int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
>  		return -EINVAL;
>  	}
>  
> +	pm_runtime_get_sync(component->dev);

The driver enables PM runtime unconditionally so you should probably
handle the error code here. I know that driver does not do it in other
cases but it should not be a reason to multiple this pattern... unless
it really does not matter as there are no runtime PM ops?

Best regards,
Krzysztof
