Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE52A4AFA
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:16:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9FB16AB;
	Tue,  3 Nov 2020 17:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9FB16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420200;
	bh=HOyvG6sVZy5dEo4f1fjgmSbr+W139I6XdVCQWs1rvG8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=auyRkPKPjf05sVZaUcTv4f/Yb4jC58Cv+2rHWLiEJyEUFCBUy98E2OBjKpoGPA4fu
	 jIQvOVL2KkieGxBox5pZwWaX/wj+nOonkPEsmgReYa8gdxQ1PeEHo+wHogr3eMq9vm
	 YkywcEnAgDnT+xPwBF0mQ7LkGE9iwixSwrQvd7P4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72EEBF80279;
	Tue,  3 Nov 2020 17:15:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57983F80272; Tue,  3 Nov 2020 17:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1783EF8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 17:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1783EF8015A
IronPort-SDR: Kd7L+YQy4a5Q3sl+ynlxMOWE5YIAzqO+Q/Bg4MaG029PeivuDASptN53Pv4hMBMNUFu6SoCJvo
 QhVSfjopHWjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="169185042"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="169185042"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:14:57 -0800
IronPort-SDR: jZab5oytGyFLlQrCaugEYKYWs/Q++oi1xtSDTpne7+dCcvGLfESup5K/p3518AfKjku2Tocl66
 XnG3nmSJfmNg==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="528532316"
Received: from ctanriov-mobl1.amr.corp.intel.com (HELO [10.212.114.78])
 ([10.212.114.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:14:56 -0800
Subject: Re: [PATCH v2] ASoC: rt1015: support TDM slot configuration
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20201103091402.8126-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <659af5ba-9854-b6d2-95f7-36fd1a5b2bfe@linux.intel.com>
Date: Tue, 3 Nov 2020 09:47:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103091402.8126-1-shumingf@realtek.com>
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


> +	/* This is an assumption that the system sends stereo audio to the amplifier typically.
> +	 * And the stereo audio is placed in slot 0/2/4/6 as the starting slot.
> +	 * According to the slot number, we also set the mono LR to select the right slot.
> +	 */
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

One more question from me: if you have 2 amplifiers on the same link and 
use slot 0 and 1, what would be the rx_mask for each amplifier? If the 
mask is BIT(0) for left and BIT(1) for right, it looks like both would 
render L+R?

Also should the settings and channel selection be modifiable using the 
codec configuration as we've done for RT1308, e.g. rt1015-1 would use LL 
and rt1015-2 would use RR?

Thanks
-Pierre
