Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B478658F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 17:20:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E721661;
	Thu,  8 Aug 2019 17:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E721661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565277609;
	bh=BetC3R4r2KFyO7SnwTCqvComzqri4t7lI6h8wXW2jpg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NyDISTMvRdj6gBKonKgK/3oDX/Cdq8rLnfHglakhiMJ45BK4Q3Yx2TiwK/fyA3QzE
	 +B6KmU1io3IZbC1RPlXRFaT4q4mplK3nM/ShXdcg3rnlj9UvJbWKEKKyMWJiU9hWct
	 A1cxN7np5EN34rEEdw8uZPFjC8xPK1vTsZQh35vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70FBEF8059F;
	Thu,  8 Aug 2019 17:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4CECF8053A; Thu,  8 Aug 2019 17:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B263FF804FF
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 17:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B263FF804FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 08:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; d="scan'208";a="182622610"
Received: from spenceke-mobl1.amr.corp.intel.com (HELO [10.251.157.200])
 ([10.251.157.200])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2019 08:18:53 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-5-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3ad15652-9d6c-11e4-7cc3-0f076c6841bb@linux.intel.com>
Date: Thu, 8 Aug 2019 10:18:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808144504.24823-5-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 4/4] ASoC: codecs: add wsa881x amplifier
 support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +/* 4 ports */
> +static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
> +	{
> +		/* DAC */
> +		.num = 1,
> +		.type = SDW_DPN_SIMPLE,

IIRC we added the REDUCED type in SoundWire 1.1 to cover the PDM case 
with channel packing (or was it grouping) used by Qualcomm. I am not 
sure the SIMPLE type works?

> +		.min_ch = 1,
> +		.max_ch = 8,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		/* COMP */
> +		.num = 2,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 8,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		/* BOOST */
> +		.num = 3,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 8,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		/* VISENSE */
> +		.num = 4,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 8,
> +		.simple_ch_prep_sm = true,
> +	}
> +};

> +static int wsa881x_update_status(struct sdw_slave *slave,
> +				 enum sdw_slave_status status)
> +{
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(&slave->dev);
> +
> +	if (status == SDW_SLAVE_ATTACHED) {

there is an ambiguity here, the Slave can be attached but as device0 
(not enumerated). We should check dev_num > 0

> +		if (!wsa881x->regmap) {
> +			wsa881x->regmap = devm_regmap_init_sdw(slave,
> +						       &wsa881x_regmap_config);
> +			if (IS_ERR(wsa881x->regmap)) {
> +				dev_err(&slave->dev, "regmap_init failed\n");
> +				return PTR_ERR(wsa881x->regmap);
> +			}
> +		}
> +
> +		return snd_soc_register_component(&slave->dev,
> +						  &wsa881x_component_drv,
> +						  NULL, 0);
> +	} else if (status == SDW_SLAVE_UNATTACHED) {
> +		snd_soc_unregister_component(&slave->dev);

the update_status() is supposed to be called based on bus events, it'd 
be very odd to register/unregister the component itself dynamically. In 
our existing Realtek-based solutions the register_component() is called 
in the probe function (and unregister_component() in remove). We do the 
inits when the Slave becomes attached but the component is already 
registered.

> +	}
> +
> +	return 0;
> +}
> +
> +static int wsa881x_port_prep(struct sdw_slave *slave,
> +			     struct sdw_prepare_ch *prepare_ch,
> +			     enum sdw_port_prep_ops state)
> +{
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(&slave->dev);
> +
> +	if (state == SDW_OPS_PORT_POST_PREP)
> +		wsa881x->port_prepared[prepare_ch->num - 1] = true;
> +	else
> +		wsa881x->port_prepared[prepare_ch->num - 1] = false;
> +
> +	return 0;
> +}
> +
> +static int wsa881x_bus_config(struct sdw_slave *slave,
> +			      struct sdw_bus_params *params)
> +{
> +	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
> +		  0x01);
> +
> +	return 0;
> +}
> +
> +static struct sdw_slave_ops wsa881x_slave_ops = {
> +	.update_status = wsa881x_update_status,
> +	.bus_config = wsa881x_bus_config,
> +	.port_prep = wsa881x_port_prep,
> +};
> +
> +static int wsa881x_probe(struct sdw_slave *pdev,
> +			 const struct sdw_device_id *id)
> +{
> +	struct wsa881x_priv *wsa881x;
> +
> +	wsa881x = devm_kzalloc(&pdev->dev, sizeof(*wsa881x), GFP_KERNEL);
> +	if (!wsa881x)
> +		return -ENOMEM;
> +
> +	wsa881x->sd_n = devm_gpiod_get_optional(&pdev->dev, "pd",
> +						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> +	if (IS_ERR(wsa881x->sd_n)) {
> +		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
> +		return PTR_ERR(wsa881x->sd_n);
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, wsa881x);
> +	wsa881x->slave = pdev;
> +	wsa881x->dev = &pdev->dev;
> +	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
> +	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
> +	gpiod_set_value(wsa881x->sd_n, 1);
> +
> +	return 0;
> +}
> +
> +static int wsa881x_remove(struct sdw_slave *sdw)
> +{
> +	return 0;
> +}
> +
> +static const struct sdw_device_id wsa881x_slave_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x2010, 0),
> +	{},
> +};
> +MODULE_DEVICE_TABLE(sdw, wsa881x_slave_id);
> +
> +static struct sdw_driver wsa881x_codec_driver = {
> +	.probe	= wsa881x_probe,
> +	.remove = wsa881x_remove,

is this needed since you do nothing in that function?

> +	.ops = &wsa881x_slave_ops,
> +	.id_table = wsa881x_slave_id,
> +	.driver = {
> +		.name	= "wsa881x-codec",
> +	}
> +};
> +module_sdw_driver(wsa881x_codec_driver);
> +
> +MODULE_DESCRIPTION("WSA881x codec driver");
> +MODULE_LICENSE("GPL v2");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
