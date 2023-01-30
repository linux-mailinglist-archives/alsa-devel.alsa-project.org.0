Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC96816CC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 17:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD30EDF1;
	Mon, 30 Jan 2023 17:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD30EDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675097267;
	bh=BGLsVIuFZDt/bF+jLZwFS5dn4p5TZfhk5DnFYH4e/nA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CT8ElmtFe7cuJJ8+aRifEajaJ7qdMwDDZjlBV7k32+of7q99bgbxSc0h/mftK+zMb
	 tcgCuTANM59zzZatzrcDl/aOIT1ohEI33K7TWkle3+kIyzyc5ZIDpUhWqTh/Nmw7DO
	 NLgSADy0qdYZH7i2r/EThL9p0SavLoQzY7LQiLII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7CABF80155;
	Mon, 30 Jan 2023 17:46:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 463B2F80553; Mon, 30 Jan 2023 17:46:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52857F8047D
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 17:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52857F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ElK7Z5bM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675097160; x=1706633160;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BGLsVIuFZDt/bF+jLZwFS5dn4p5TZfhk5DnFYH4e/nA=;
 b=ElK7Z5bMt1KRDDnGpouKrt4CbJIbiuVIilXJd5gF1zW0dZKY4phF5jwR
 QYZoKM4xc9VrTATD8gHm1pJ2+1wNh9kxJLZhz8TVN87FUIFWWKSf6jaKd
 40TbCFlpOtnvjCWnvBZfLwuoEm2SQrejY6pO0n8pLdtjra3BcTVBAYDD6
 lwmmtn750J5LcuECsT7K/FIe5kzJCROH/C4ZSbCpFnbci4je7e/vreRYG
 yJ5fzdPGhjLUtO9r5L/ALxRl98OYwqhxrd1PGF6wJv1WNnF3BfbTHpp5t
 89e9F8GdFxcqRQi0Uv77iy4tB5n9DYJxXcW5RhTURHAESokULs0S4F4z8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307260865"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="307260865"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732763631"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="732763631"
Received: from inuber-mobl5.amr.corp.intel.com (HELO [10.212.58.60])
 ([10.212.58.60])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:52 -0800
Message-ID: <f0c8d03d-8190-383b-0536-a4006b1296c7@linux.intel.com>
Date: Mon, 30 Jan 2023 10:40:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/8] ASoC: cs42l42: Don't set idle_bias_on
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-8-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230127165111.3010960-8-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 10:51, Stefan Binding wrote:
> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> idle_bias_on was set because cs42l42 has a "VMID" type pseudo-midrail
> supply (named FILT+), and these typically take a long time to charge.
> But the driver never enabled pm_runtime so it would never have powered-
> down the cs42l42 anyway.
> 
> In fact, FILT+ can charge to operating voltage within 12.5 milliseconds
> of enabling HP or ADC. This time is already covered by the startup
> delay of the HP/ADC.
> 
> The datasheet warning about FILT+ taking up to 1 second to charge only
> applies in the special cases that either the PLL is started or
> DETECT_MODE set to non-zero while both HP and ADC are off. The driver
> never does either of these.
> 
> Removing idle_bias_on allows the Soundwire host controller to suspend
> if there isn't a snd_soc_jack handler registered.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/codecs/cs42l42.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index aa8d724432ab8..e3edaa1a2761e 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -597,7 +597,6 @@ const struct snd_soc_component_driver cs42l42_soc_component = {
>  	.num_dapm_routes	= ARRAY_SIZE(cs42l42_audio_map),
>  	.controls		= cs42l42_snd_controls,
>  	.num_controls		= ARRAY_SIZE(cs42l42_snd_controls),
> -	.idle_bias_on		= 1,
>  	.endianness		= 1,
>  };
>  EXPORT_SYMBOL_NS_GPL(cs42l42_soc_component, SND_SOC_CS42L42_CORE);
