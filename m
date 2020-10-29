Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAC629F1C5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 17:42:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD160165E;
	Thu, 29 Oct 2020 17:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD160165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603989734;
	bh=qI//FqhqS0n2HU0L4C2swHuoaiBXgm74osWxibvdW14=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJvm0y+2bJuAvHWJV/PYV9UMKlsc8alkOcM5zHUCnOCn8FMUmRaAFsLA4aa6xB0Jt
	 go7G+0RKJQpajIFIq7SPX1Mf3zJUrVhE9027RtdB7MVEUkKRvIh5ZomDHhtM7Rbv2o
	 ZSXqZXxGQ6dURVffRXUmidOFnzmA0Im2pwMEFhWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22661F80240;
	Thu, 29 Oct 2020 17:40:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53327F800D8; Thu, 29 Oct 2020 17:40:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64845F800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 17:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64845F800D8
IronPort-SDR: +PLu59ilpqh2iXZNEINHprvOVBzU8udu5hSITQLROMwzwvXKLuRIM3x5hBz295TdcpkOU1+Wir
 zGZB37pWrjRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168563729"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="168563729"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:40:14 -0700
IronPort-SDR: 1oSQd9MBrQuw86QZc4pzJxn3TBhU1EYLQzWMqQiqxHtIT7QUNkZjOZShp4Zuov2Xz2H8PypckI
 Ezf16Q6Jb0GQ==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="323762883"
Received: from mghaffa-mobl1.amr.corp.intel.com (HELO [10.212.235.9])
 ([10.212.235.9])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:40:14 -0700
Subject: Re: [PATCH v2 2/6] ASoC: codecs: lpass-wsa-macro: Add support to WSA
 Macro
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <13987e14-0bd9-9659-b574-d3b7446bb789@linux.intel.com>
Date: Thu, 29 Oct 2020 10:47:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029110829.16425-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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


> +static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
> +						u8 int_prim_fs_rate_reg_val,
> +						u32 sample_rate)
> +{
> +	u8 int_1_mix1_inp;
> +	u32 j, port = 0;

nit-pick: initialization of port not needed

> +	u16 int_mux_cfg0, int_mux_cfg1;
> +	u16 int_fs_reg;
> +	u8 int_mux_cfg0_val, int_mux_cfg1_val;
> +	u8 inp0_sel, inp1_sel, inp2_sel;
> +	struct snd_soc_component *component = dai->component;
> +	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
> +
> +	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
> +		int_1_mix1_inp = port;
> +		if ((int_1_mix1_inp < WSA_MACRO_RX0) || (int_1_mix1_inp > WSA_MACRO_RX_MIX1)) {
> +			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
> +				__func__, dai->id);
> +			return -EINVAL;
> +		}
> +
> +		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0;
> +
> +		/*
> +		 * Loop through all interpolator MUX inputs and find out
> +		 * to which interpolator input, the cdc_dma rx port
> +		 * is connected
> +		 */
> +		for (j = 0; j < NUM_INTERPOLATORS; j++) {
> +			int_mux_cfg1 = int_mux_cfg0 + WSA_MACRO_MUX_CFG1_OFFSET;
> +
> +			int_mux_cfg0_val = snd_soc_component_read(component,
> +								  int_mux_cfg0);
> +			int_mux_cfg1_val = snd_soc_component_read(component,
> +								  int_mux_cfg1);
> +			inp0_sel = int_mux_cfg0_val & WSA_MACRO_MUX_INP_MASK1;
> +			inp1_sel = (int_mux_cfg0_val >>
> +					WSA_MACRO_MUX_INP_SHFT) &
> +					WSA_MACRO_MUX_INP_MASK1;
> +			inp2_sel = (int_mux_cfg1_val >>
> +					WSA_MACRO_MUX_INP_SHFT) &
> +					WSA_MACRO_MUX_INP_MASK1;
> +			if ((inp0_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
> +			    (inp1_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
> +			    (inp2_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0)) {
> +				int_fs_reg = CDC_WSA_RX0_RX_PATH_CTL +
> +					     WSA_MACRO_RX_PATH_OFFSET * j;
> +				/* sample_rate is in Hz */
> +				snd_soc_component_update_bits(component,
> +						int_fs_reg,
> +						WSA_MACRO_FS_RATE_MASK,
> +						int_prim_fs_rate_reg_val);
> +			}
> +			int_mux_cfg0 += WSA_MACRO_MUX_CFG_OFFSET;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wsa_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
> +					       u8 int_mix_fs_rate_reg_val,
> +					       u32 sample_rate)
> +{
> +	u8 int_2_inp;
> +	u32 j, port = 0;

same here, port is set in the for_each_bit loop

[...]

> +static void wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
> +{
> +	struct regmap *regmap = wsa->regmap;
> +
> +	if (mclk_enable) {
> +		if (wsa->wsa_mclk_users == 0) {
> +			regcache_mark_dirty(regmap);
> +			regcache_sync_region(regmap, 0x0, WSA_MAX_OFFSET);

I am not a regcache/regmap expert but the sequence seems odd. I could be 
wrong, but one would typically sync *after* doing changes, no?

> +			/* 9.6MHz MCLK, set value 0x00 if other frequency */
> +			regmap_update_bits(regmap, CDC_WSA_TOP_FREQ_MCLK, 0x01, 0x01);
> +			regmap_update_bits(regmap,
> +					   CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL,
> +					   CDC_WSA_MCLK_EN_MASK,
> +					   CDC_WSA_MCLK_ENABLE);
> +			regmap_update_bits(regmap,
> +					   CDC_WSA_CLK_RST_CTRL_FS_CNT_CONTROL,
> +					   CDC_WSA_FS_CNT_EN_MASK,
> +					   CDC_WSA_FS_CNT_ENABLE);
> +		}
> +		wsa->wsa_mclk_users++;
> +	} else {
> +		if (wsa->wsa_mclk_users <= 0) {
> +			dev_err(wsa->dev, "clock already disabled\n");
> +			wsa->wsa_mclk_users = 0;
> +			return;
> +		}
> +		wsa->wsa_mclk_users--;
> +		if (wsa->wsa_mclk_users == 0) {
> +			regmap_update_bits(regmap,
> +					   CDC_WSA_CLK_RST_CTRL_FS_CNT_CONTROL,
> +					   CDC_WSA_FS_CNT_EN_MASK,
> +					   CDC_WSA_FS_CNT_DISABLE);
> +			regmap_update_bits(regmap,
> +					   CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL,
> +					   CDC_WSA_MCLK_EN_MASK,
> +					   CDC_WSA_MCLK_DISABLE);
> +		}
> +	}
> +}
> +

[...]

> +static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
> +{
> +	struct regmap *regmap = wsa->regmap;
> +
> +	if (enable) {
> +		wsa_macro_mclk_enable(wsa, true);
> +		if (wsa->reset_swr)
> +			regmap_update_bits(regmap,
> +				CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
> +				0x02, 0x02);
> +		regmap_update_bits(regmap,
> +			CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
> +			0x01, 0x01);

Touching the same register once conditionally and then unconditionally 
looks suspicious. Make add a comment to explain this is intentional and 
not an indentation mistake.

> +
> +		if (wsa->reset_swr)
> +			regmap_update_bits(regmap,
> +				CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
> +				0x02, 0x00);
> +		wsa->reset_swr = false;
> +	} else {
> +		regmap_update_bits(regmap,
> +			CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
> +			0x01, 0x00);
> +		wsa_macro_mclk_enable(wsa, false);
> +	}
> +
> +	return 0;
> +}
