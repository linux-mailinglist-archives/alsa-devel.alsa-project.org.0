Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1534C028B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 20:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2547188B;
	Tue, 22 Feb 2022 20:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2547188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645559845;
	bh=Fb9LNxAZehNZGlRVuozFIeYkxpG6Ih/D1zN47x3V20E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LA7DO8nQU9Oxn08kB4j1gb4WRrF3AUYxaYhCReIRdSUaJox4P9f6b2GEJ1WG+aCec
	 XubfiAshSsVFIJTqQKFnqX2JfHypBRf4H2aP5+aqbk1IfrwPGsoTYHhDar6p6xfV93
	 FlSZ2wCcSwvbN+lHCoaVtCoPPaBNkME1YvZmRoLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01504F80511;
	Tue, 22 Feb 2022 20:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46FADF80238; Tue, 22 Feb 2022 20:55:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69DC0F8012C
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 20:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69DC0F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZczpFgiq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645559742; x=1677095742;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Fb9LNxAZehNZGlRVuozFIeYkxpG6Ih/D1zN47x3V20E=;
 b=ZczpFgiqFZ1fBJxoDAz/QFx7sPA7hM0Ynyz4v8el1EdG09RnmIg1wUjJ
 DOPjRyZcw+VVpAwUls3cQP+ckeOEaA/IiqIg/ZlRTiPTeQQp6hgPX69uN
 JYiGoAL2NWC9+/ZHV58MAUD/M09YWkWv1hfV01HP/4XmJSA6sGP37Z6yO
 nzJL1mI05WehPKAGtDSqYwWk5TnnaesNtOTICdO9718LCln9DYwzPoByi
 Gb45GOMvgt8gBXFXg8X+7Ck3KSdsZs170cn/VTF7N9gJBRUPHP/5fq+Gc
 ybQCnNppIAKmSaLL1wFXVlck3UufGIFth4G8HTFx7UWj9b4TRTqHji7pK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232421608"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232421608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 11:55:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="639032076"
Received: from mjpatel-mobl.amr.corp.intel.com (HELO [10.212.37.223])
 ([10.212.37.223])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 11:55:19 -0800
Message-ID: <a2a6f631-b1b6-e015-f6bd-0c3851fdaa83@linux.intel.com>
Date: Tue, 22 Feb 2022 13:53:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 05/10] ASoC: codecs: wsa881x: add runtime pm support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
 <20220221131037.8809-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220221131037.8809-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 quic_srivasam@quicinc.com, linux-kernel@vger.kernel.org
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



On 2/21/22 07:10, Srinivas Kandagatla wrote:
> WSA881x codecs can not cope up with clk stop and requires a full reset after suspend.

isn't clock stop mode0 a peripheral requirement in SoundWire 1.x? I
don't see any permission to skip this mode, the only thing I see in the
spec is the permission to implement an always-ready capability (SCSP_SM)

The current assumption is that ALL peripherals support that mode, but
that Managers may or may not support clock stop.

It wouldn't be a big deal to add a quirk, but IMHO this needs to be
captured at the bus/manager level since the decision to enter this mode
is made at that level.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa881x.c | 54 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index 0222370ff95d..d851ba14fbdd 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_registers.h>
>  #include <linux/soundwire/sdw_type.h>
> @@ -198,6 +199,7 @@
>  #define WSA881X_OCP_CTL_TIMER_SEC 2
>  #define WSA881X_OCP_CTL_TEMP_CELSIUS 25
>  #define WSA881X_OCP_CTL_POLL_TIMER_SEC 60
> +#define WSA881X_PROBE_TIMEOUT 1000
>  
>  #define WSA881X_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
>  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
> @@ -747,6 +749,12 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
>  	unsigned int mask = (1 << fls(max)) - 1;
>  	int val, ret, min_gain, max_gain;
>  
> +	ret = pm_runtime_get_sync(comp->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_noidle(comp->dev);
> +		return ret;
> +	}
> +
>  	max_gain = (max - ucontrol->value.integer.value[0]) & mask;
>  	/*
>  	 * Gain has to set incrementally in 4 steps
> @@ -773,6 +781,9 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
>  		usleep_range(1000, 1010);
>  	}
>  
> +	pm_runtime_mark_last_busy(comp->dev);
> +	pm_runtime_put_autosuspend(comp->dev);
> +
>  	return 1;
>  }
>  
> @@ -1101,6 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>  			 const struct sdw_device_id *id)
>  {
>  	struct wsa881x_priv *wsa881x;
> +	struct device *dev = &pdev->dev;
>  
>  	wsa881x = devm_kzalloc(&pdev->dev, sizeof(*wsa881x), GFP_KERNEL);
>  	if (!wsa881x)
> @@ -1124,6 +1136,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>  	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
>  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>  	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +	pdev->prop.simple_clk_stop_capable = true;
>  	gpiod_direction_output(wsa881x->sd_n, 1);
>  
>  	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
> @@ -1132,12 +1145,52 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>  		return PTR_ERR(wsa881x->regmap);
>  	}
>  
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
>  	return devm_snd_soc_register_component(&pdev->dev,
>  					       &wsa881x_component_drv,
>  					       wsa881x_dais,
>  					       ARRAY_SIZE(wsa881x_dais));
>  }
>  
> +static int __maybe_unused wsa881x_runtime_suspend(struct device *dev)
> +{
> +	struct regmap *regmap = dev_get_regmap(dev, NULL);
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
> +
> +	gpiod_direction_output(wsa881x->sd_n, 0);
> +
> +	regcache_cache_only(regmap, true);
> +	regcache_mark_dirty(regmap);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct regmap *regmap = dev_get_regmap(dev, NULL);
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
> +
> +	gpiod_direction_output(wsa881x->sd_n, 1);
> +
> +	wait_for_completion_timeout(&slave->initialization_complete,
> +				    msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
> +
> +	regcache_cache_only(regmap, false);
> +	regcache_sync(regmap);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops wsa881x_pm_ops = {
> +	SET_RUNTIME_PM_OPS(wsa881x_runtime_suspend, wsa881x_runtime_resume, NULL)
> +};
> +
>  static const struct sdw_device_id wsa881x_slave_id[] = {
>  	SDW_SLAVE_ENTRY(0x0217, 0x2010, 0),
>  	SDW_SLAVE_ENTRY(0x0217, 0x2110, 0),
> @@ -1151,6 +1204,7 @@ static struct sdw_driver wsa881x_codec_driver = {
>  	.id_table = wsa881x_slave_id,
>  	.driver = {
>  		.name	= "wsa881x-codec",
> +		.pm = &wsa881x_pm_ops,
>  	}
>  };
>  module_sdw_driver(wsa881x_codec_driver);
