Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 712FF3F4CFB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 17:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8328B851;
	Mon, 23 Aug 2021 17:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8328B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629731029;
	bh=RUPvk6dX28UupdENVZxLtV0kxRTRgHdiPKKmgChg+No=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RZ428hmxnDtsGP6Iv/xch0c5UsOWOAFV1EC30Qa930WWicqp7htvwqEVVKc+XTzuD
	 uSTWwk6m4i/h57VW+6TWdHLCuyJTs7FW+qFn0UB7lVqcUuaJGhzwt7bNZ5gcyovAMQ
	 b8DzY1ZnWKKGPeEgKad3MV7MHR/y1LV9Pjl27ws8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE51EF80229;
	Mon, 23 Aug 2021 17:02:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79FBFF80217; Mon, 23 Aug 2021 17:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_35,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2147EF800B6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 17:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2147EF800B6
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="302702254"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="302702254"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 08:02:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="492732236"
Received: from ikuon-mobl.amr.corp.intel.com (HELO [10.212.74.116])
 ([10.212.74.116])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 08:02:21 -0700
Subject: Re: [PATCH v2 1/4] ASoC: rockchip: add support for i2s-tdm controller
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
 <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
 <66d6bd43-ee43-eff4-7a68-333fbb996787@linux.intel.com>
 <3469189.PC3msRC2N5@archbook>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a2aa0525-326e-9364-1907-c1d53bca39cf@linux.intel.com>
Date: Mon, 23 Aug 2021 10:02:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3469189.PC3msRC2N5@archbook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 8/21/21 3:45 PM, Nicolas Frattaroli wrote:
> On Freitag, 20. August 2021 21:02:16 CEST Pierre-Louis Bossart wrote:
>>> +	regmap_read(i2s_tdm->regmap, I2S_CLR, &val);
>>> +	/* Wait on the clear operation to finish */
>>> +	while (val) {
>>
>> delay needed here?
>>
> 
> The rockchip_i2s.c code doesn't have a delay here either, but I can
> add one of 1 usec for good measure, it seems weird to retry the
> read as fast as it can.

yep.

>>> +static int rockchip_i2s_tdm_clk_set_rate(struct rk_i2s_tdm_dev *i2s_tdm,
>>> +					 struct clk *clk, unsigned long rate,
>>> +					 int ppm)
>>> +{
>>> +	unsigned long rate_target;
>>> +	int delta, ret;
>>> +
>>> +	if (ppm == i2s_tdm->clk_ppm)
>>> +		return 0;
>>> +
>>> +	delta = (ppm < 0) ? -1 : 1;
>>> +	delta *= (int)div64_u64((u64)rate * (u64)abs(ppm) + 500000,
>>> +				1000000);
>>
>> formula looks odd? looks like you are implementing a round to nearest
>> operation, but that shouldn't require this multiplication?
>>
> 
> I believe the multiplication is there to compensate for clock drift.
> ppm is a value between -1000 and 1000 that specifies the clock drift
> in presumably parts per million, going by the variable name.

I meant using a signed division with lsb round-to-nearest, something like:

delta = (int)div64_u64((u64)rate * (u64)(ppm) + 500000,
			1000000);

> 
>>> +	pm_runtime_enable(&pdev->dev);
>>> +	if (!pm_runtime_enabled(&pdev->dev)) {
>>> +		ret = i2s_tdm_runtime_resume(&pdev->dev);
>>
>> that looks like dead code? you've just enabled pm_runtime, why would
>> this fail?
>>
> 
> I've had a look at the upstream rockchip_i2s.c code which does the
> same thing, and I believe the idea here is that we need to manually
> prepare and enable the master clocks (mclk_rx/mclk_tx) if pm_runtime
> is not available. Otherwise, pm_runtime will presumably call our
> resume callback at some point.
> 
> If runtime power management is disabled in the kernel config then 
> pm_runtime_enabled is always going to return false.

that seems very odd. why not enable the clocks by default and let them
stop in suspend.

>>> +err_suspend:
>>> +	if (!pm_runtime_status_suspended(&pdev->dev))
>>> +		i2s_tdm_runtime_suspend(&pdev->dev);
>>
>> why is this necessary?
> 
> I believe this is the same kind of situation as before, and the
> other driver does this too: if pm_runtime is not available, we
> need to stop our clocks manually on probe failure.

then use pm_runtime_disable() and manually stop the clocks...

>>> +err_pm_disable:
>>> +	pm_runtime_disable(&pdev->dev);>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
>>> +{
>>> +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(&pdev->dev);
>>> +
>>> +	pm_runtime_disable(&pdev->dev);
>>> +	if (!pm_runtime_status_suspended(&pdev->dev))
>>> +		i2s_tdm_runtime_suspend(&pdev->dev);
>>
>> this looks backwards, if you disable pm_runtime first what is the
>> expectation for the rest.
> 
> I'm not well versed in the PM code but if my theory of this being
> related to unavailable PM is correct, then my best guess is that
> pm_runtime_disable does suspend the device, so if it's not
> suspended then we don't have pm_runtime and therefore need to call
> it manually.

I think this is really doing things backwards. You want to
unconditionally enable all resources on probe, and let them go to idle
when no one needs them - or if pm_runtime is disabled.

>>> +
>>> +	if (!IS_ERR(i2s_tdm->mclk_tx))
>>> +		clk_prepare_enable(i2s_tdm->mclk_tx);
>>> +	if (!IS_ERR(i2s_tdm->mclk_rx))
>>> +		clk_prepare_enable(i2s_tdm->mclk_rx);
>>> +	if (!IS_ERR(i2s_tdm->hclk))
>>> +		clk_disable_unprepare(i2s_tdm->hclk);
>>> +
>>> +	return 0;>>> +}
>>> +
>>> +#ifdef CONFIG_PM_SLEEP
>>
>> use __maybe_unused
> 
> You mean instead of the ifdef stuff to just add this attribute to
> the following functions like this?
> 
> static int rockchip_i2s_tdm_suspend(struct device *dev) __maybe_unused

yes

> 
>>
>>> +static int rockchip_i2s_tdm_suspend(struct device *dev)
>>> +{
>>> +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
>>> +
>>> +	regcache_mark_dirty(i2s_tdm->regmap);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int rockchip_i2s_tdm_resume(struct device *dev)
>>> +{
>>> +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	ret = pm_runtime_get_sync(dev);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +	ret = regcache_sync(i2s_tdm->regmap);
>>> +	pm_runtime_put(dev);
>>> +
>>> +	return ret;
>>> +}
>>> +#endif
> 
> Thank you for your review!
> 
> Regards,
> Nicolas Frattaroli
> 
> 
> 
