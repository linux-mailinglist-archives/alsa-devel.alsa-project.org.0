Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE33F3C6E
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Aug 2021 22:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7E7515E0;
	Sat, 21 Aug 2021 22:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7E7515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629578842;
	bh=1t7bzOgppcoI+NJicZLViIMDFKIgpgz9mH68jGH9RKE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uo0bV2RU8mnZJfMQlofL1rCQv0wkLvodfoZiJ9rgJkdEf8qrfl+NuWD7N5NMJXxEF
	 rAyG57IfMiV/DOH1ZW5HXxxoh1iZNPzusN4/H4x54Am/+p58yCEg6PJGt+SoeqgnsM
	 5oULdSFz2IJU5ZQ7sTanL5suksncb9OJs8ynMgI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EDC2F80272;
	Sat, 21 Aug 2021 22:46:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C329AF8026D; Sat, 21 Aug 2021 22:46:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_35,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08363F8016B
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 22:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08363F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qqY8UxSx"
Received: by mail-ej1-x630.google.com with SMTP id x11so27766352ejv.0
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jW6WgkkcgqeMv2g70HWibDwKNVYFyjoAOtV6/XbdB3I=;
 b=qqY8UxSxlX5wea3lPQ0OcfWiDDRe3k47+uUluXghkrYr5Iwu/+xTeJVZepCNhD9FDx
 hSnV7rQVGcsYDrNkKL4NK/Iiic0cOQnAVm3a+F85vu25NDyTQS5P+Q2v95e7/V4FpRhw
 AxArOzTMRYHNlwdO5xtWiLJ4EbNU2CYyyvwr1G8ylP2AHFggPe4hO0UDkHZVdJwtjhY/
 vdZH/BjCC8dlxI0p7w6p3CimbD9aEk/QACb27bGRGY64coKJtYtqXGSoGWtYS6UGEno2
 26A1SCtxhH/QTspbix9EuFOWfpliO8a8/0ijMxxyKxPtBwog7NwJUZLfbp7xi2PeQ84d
 1ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jW6WgkkcgqeMv2g70HWibDwKNVYFyjoAOtV6/XbdB3I=;
 b=NABonvaaCm8/cJg9cBiL1vDZM3cv4H9zBSycn/rHrgb916VoPw6/66PIlmAVaZ/Y+T
 Lr9a3FSF897qg9ZEVaEVpH/BiFhiVubhPZ9iPpvjf8Z8XI3K42LGr/NFZKqhX7cEXWVH
 QwXZDEK6i3Vp0DnyvW3aqu4FNrvehDtJOjMwTcs0NL+HJhv/H6Ms9/PEHkPJqVZT3xDi
 k5/I3QVveEEHPoJo+ZTyCkNRZf2ZmM4BtQ/2BnJaArEeF3gDUT9NzWW08662pk25aAKe
 Jyo6sLGwUS/SM+NVPmWpBeE5jJf+Uc/nhPRnl9jevdODcOK3TkNYH3pQATkDyNBQxwJ8
 jjYQ==
X-Gm-Message-State: AOAM533wws+vznWfw1P97VlZfajV7/iDQ5P2+ue4/P5TpKggEJ/DRgeJ
 E65e9H8gcnH7aTWHO1+Tn+I=
X-Google-Smtp-Source: ABdhPJylGo+JqRqLQ/39m2bF0KZUWoYNkH79V+Bh47oCk6+evGfniowz7vDAvz9iwcOv5AjqB18Djg==
X-Received: by 2002:a17:906:5f93:: with SMTP id
 a19mr29018008eju.126.1629578758085; 
 Sat, 21 Aug 2021 13:45:58 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id o6sm229307eje.6.2021.08.21.13.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:45:57 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/4] ASoC: rockchip: add support for i2s-tdm controller
Date: Sat, 21 Aug 2021 22:45:52 +0200
Message-ID: <3469189.PC3msRC2N5@archbook>
In-Reply-To: <66d6bd43-ee43-eff4-7a68-333fbb996787@linux.intel.com>
References: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
 <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
 <66d6bd43-ee43-eff4-7a68-333fbb996787@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Freitag, 20. August 2021 21:02:16 CEST Pierre-Louis Bossart wrote:
> > +	regmap_read(i2s_tdm->regmap, I2S_CLR, &val);
> > +	/* Wait on the clear operation to finish */
> > +	while (val) {
> 
> delay needed here?
> 

The rockchip_i2s.c code doesn't have a delay here either, but I can
add one of 1 usec for good measure, it seems weird to retry the
read as fast as it can.

> > +static int rockchip_i2s_tdm_clk_set_rate(struct rk_i2s_tdm_dev *i2s_tdm,
> > +					 struct clk *clk, unsigned long rate,
> > +					 int ppm)
> > +{
> > +	unsigned long rate_target;
> > +	int delta, ret;
> > +
> > +	if (ppm == i2s_tdm->clk_ppm)
> > +		return 0;
> > +
> > +	delta = (ppm < 0) ? -1 : 1;
> > +	delta *= (int)div64_u64((u64)rate * (u64)abs(ppm) + 500000,
> > +				1000000);
> 
> formula looks odd? looks like you are implementing a round to nearest
> operation, but that shouldn't require this multiplication?
> 

I believe the multiplication is there to compensate for clock drift.
ppm is a value between -1000 and 1000 that specifies the clock drift
in presumably parts per million, going by the variable name.

> > +	pm_runtime_enable(&pdev->dev);
> > +	if (!pm_runtime_enabled(&pdev->dev)) {
> > +		ret = i2s_tdm_runtime_resume(&pdev->dev);
> 
> that looks like dead code? you've just enabled pm_runtime, why would
> this fail?
> 

I've had a look at the upstream rockchip_i2s.c code which does the
same thing, and I believe the idea here is that we need to manually
prepare and enable the master clocks (mclk_rx/mclk_tx) if pm_runtime
is not available. Otherwise, pm_runtime will presumably call our
resume callback at some point.

If runtime power management is disabled in the kernel config then 
pm_runtime_enabled is always going to return false.

> > +err_suspend:
> > +	if (!pm_runtime_status_suspended(&pdev->dev))
> > +		i2s_tdm_runtime_suspend(&pdev->dev);
> 
> why is this necessary?

I believe this is the same kind of situation as before, and the
other driver does this too: if pm_runtime is not available, we
need to stop our clocks manually on probe failure.
 
> > +err_pm_disable:
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
> > +{
> > +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(&pdev->dev);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +	if (!pm_runtime_status_suspended(&pdev->dev))
> > +		i2s_tdm_runtime_suspend(&pdev->dev);
> 
> this looks backwards, if you disable pm_runtime first what is the
> expectation for the rest.

I'm not well versed in the PM code but if my theory of this being
related to unavailable PM is correct, then my best guess is that
pm_runtime_disable does suspend the device, so if it's not
suspended then we don't have pm_runtime and therefore need to call
it manually.

> > +
> > +	if (!IS_ERR(i2s_tdm->mclk_tx))
> > +		clk_prepare_enable(i2s_tdm->mclk_tx);
> > +	if (!IS_ERR(i2s_tdm->mclk_rx))
> > +		clk_prepare_enable(i2s_tdm->mclk_rx);
> > +	if (!IS_ERR(i2s_tdm->hclk))
> > +		clk_disable_unprepare(i2s_tdm->hclk);
> > +
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> 
> use __maybe_unused

You mean instead of the ifdef stuff to just add this attribute to
the following functions like this?

static int rockchip_i2s_tdm_suspend(struct device *dev) __maybe_unused

> 
> > +static int rockchip_i2s_tdm_suspend(struct device *dev)
> > +{
> > +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
> > +
> > +	regcache_mark_dirty(i2s_tdm->regmap);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rockchip_i2s_tdm_resume(struct device *dev)
> > +{
> > +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = pm_runtime_get_sync(dev);
> > +	if (ret < 0)
> > +		return ret;
> > +	ret = regcache_sync(i2s_tdm->regmap);
> > +	pm_runtime_put(dev);
> > +
> > +	return ret;
> > +}
> > +#endif

Thank you for your review!

Regards,
Nicolas Frattaroli



