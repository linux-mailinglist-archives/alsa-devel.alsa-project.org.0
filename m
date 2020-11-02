Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E92A2D96
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 16:05:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 603941737;
	Mon,  2 Nov 2020 16:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 603941737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604329508;
	bh=XLsFfCx1l1LuiUExxvDWYcrLC/Xm4VNG3M4aRjlK+tg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPiVAONiBiZGQnMhIBm/ZWADhFSpUWbWjKqjwFv8xVs83ZDR4B6NCNjlIJ58AoExq
	 XwsMYRJQVz6JSfsOvz6E0t1zhf2S2P/LvTgE/qibtfl7YuRaK7QXyeqUcwToi49yye
	 i3MvMSzp+i182Pg5fayDX+TwrC14iFi/eBvDvKH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C65CF8012B;
	Mon,  2 Nov 2020 16:02:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A15CF80256; Mon,  2 Nov 2020 16:02:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BE33F80232
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BE33F80232
IronPort-SDR: RlRp6Kc422QqEwxFVR/6A5+xO/XCA9U+hxrinLUCwyiOS6dzKYYcN4ShW1ecoDz4zsNa7JVC0E
 SPxbF2zozigw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="155883727"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="155883727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 07:02:41 -0800
IronPort-SDR: QuG3lUHRZGvFUqxt7qZ6hSlrL8JdR/LIwsd1ayZg4vx48vPPPmAD1ct3IckSS4rajYVuJHqMbS
 LqgJ7a++y1kQ==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="528043551"
Received: from pvrott-mobl1.amr.corp.intel.com (HELO [10.212.253.243])
 ([10.212.253.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 07:02:39 -0800
Subject: Re: [PATCH] ASoC: rt1015: support TDM slot configuration
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20201102091656.25379-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3d8b58fa-81c2-ea9e-8627-b5c58ca91c7a@linux.intel.com>
Date: Mon, 2 Nov 2020 09:01:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102091656.25379-1-shumingf@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, Keith.Tzeng@quantatw.com,
 derek.fang@realtek.com, brent.lu@intel.com, flove@realtek.com
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




> +static int rt1015_set_tdm_slot(struct snd_soc_dai *dai,
> +	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	unsigned int val = 0, rx_slotnum, tx_slotnum;
> +	int ret = 0, first_bit;
> +
> +	switch (slots) {
> +	case 4:
> +		val |= RT1015_I2S_TX_4CH;
> +		break;
> +	case 6:
> +		val |= RT1015_I2S_TX_6CH;
> +		break;
> +	case 8:
> +		val |= RT1015_I2S_TX_8CH;
> +		break;
> +	case 2:
> +		break;

nit-pick: I would put the case 2 first to keep the order. I thought for 
a second this was an error case due to the discontinuity.

> +	default:
> +		ret = -EINVAL;
> +		goto _set_tdm_err_;
> +	}
> +
> +	switch (slot_width) {
> +	case 20:
> +		val |= RT1015_I2S_CH_TX_LEN_20B;
> +		break;
> +	case 24:
> +		val |= RT1015_I2S_CH_TX_LEN_24B;
> +		break;
> +	case 32:
> +		val |= RT1015_I2S_CH_TX_LEN_32B;
> +		break;
> +	case 16:
> +		break;

nit-pick: same here, I would put 16 first.

> +	default:
> +		ret = -EINVAL;
> +		goto _set_tdm_err_;
> +	}
> +
> +	/* Rx slot configuration */
> +	rx_slotnum = hweight_long(rx_mask);
> +	if (rx_slotnum > 1 || !rx_slotnum) {

I am confused here, is this saying you can only have a single channel on RX?

If yes should this be simplified as if (rx_slotnum != 1) ?

> +		ret = -EINVAL;
> +		dev_err(component->dev, "too many rx slots or zero slot\n");
> +		goto _set_tdm_err_;
> +	}
> +
> +	first_bit = __ffs(rx_mask);
> +	switch (first_bit) {
> +	case 0:
> +	case 2:
> +	case 4:
> +	case 6:
> +		snd_soc_component_update_bits(component,
> +			RT1015_PAD_DRV2, RT1015_MONO_LR_SEL_MASK,
> +			RT1015_MONO_L_CHANNEL);
> +		snd_soc_component_update_bits(component,
> +			RT1015_TDM1_4,
> +			RT1015_TDM_I2S_TX_L_DAC1_1_MASK |
> +			RT1015_TDM_I2S_TX_R_DAC1_1_MASK,
> +			(first_bit << RT1015_TDM_I2S_TX_L_DAC1_1_SFT) |
> +			((first_bit+1) << RT1015_TDM_I2S_TX_R_DAC1_1_SFT));

looks like there's an assumption that the rx mask has contiguous bits 
set? Maybe add a comment to explain how the RX path works?

> +		break;
> +	case 1:
> +	case 3:
> +	case 5:
> +	case 7:
> +		snd_soc_component_update_bits(component,
> +			RT1015_PAD_DRV2, RT1015_MONO_LR_SEL_MASK,
> +			RT1015_MONO_R_CHANNEL);
> +		snd_soc_component_update_bits(component,
> +			RT1015_TDM1_4,
> +			RT1015_TDM_I2S_TX_L_DAC1_1_MASK |
> +			RT1015_TDM_I2S_TX_R_DAC1_1_MASK,
> +			((first_bit-1) << RT1015_TDM_I2S_TX_L_DAC1_1_SFT) |
> +			(first_bit << RT1015_TDM_I2S_TX_R_DAC1_1_SFT));
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto _set_tdm_err_;
> +	}
> +
> +	/* Tx slot configuration */
> +	tx_slotnum = hweight_long(tx_mask);
> +	if (tx_slotnum) {
> +		ret = -EINVAL;
> +		dev_err(component->dev, "doesn't need to support tx slots\n");
> +		goto _set_tdm_err_;
> +	}
> +
> +	snd_soc_component_update_bits(component, RT1015_TDM1_1,
> +		RT1015_I2S_CH_TX_MASK | RT1015_I2S_CH_RX_MASK |
> +		RT1015_I2S_CH_TX_LEN_MASK | RT1015_I2S_CH_RX_LEN_MASK, val);
> +
> +_set_tdm_err_:
> +	return ret;
> +}
> +
