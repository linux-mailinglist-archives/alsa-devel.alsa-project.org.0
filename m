Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A96816D6
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 17:48:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2DDADEE;
	Mon, 30 Jan 2023 17:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2DDADEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675097315;
	bh=4VDTGYM1+byb/e3AIkz0KQQE+tIgA/0Y7EvVgLJaKbU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rOuBKqRHQkUoOMOpKVP2Q/2+WuNvZ0pR+fxzsRMxjOUPFhwjwdRCCddgPJCm/wc8D
	 eGq9XzwZ0nu4QSa0kIgxYIniFBz2cBGFn5Vg9xqgU3nPMpAR3sNbdGAk2t6Y7hhbkA
	 omdMXq6xcQ2giYjtj+aSJD75wL3sKsdRa2BrVTm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B913EF80567;
	Mon, 30 Jan 2023 17:46:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFCB6F80567; Mon, 30 Jan 2023 17:46:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65C09F80423
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 17:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C09F80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F5NcyU75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675097158; x=1706633158;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4VDTGYM1+byb/e3AIkz0KQQE+tIgA/0Y7EvVgLJaKbU=;
 b=F5NcyU75dHKtcWFeZkkDYGsERqwKAqZjrXOJB8Qny9nknwvCMSv/d9EV
 zE9BTbcrAvPj9oLtzZvpw9+f1qvmZqWfR23Q0eipyFGQrzKiMkqz9fdO4
 SWF+VCB0rPW0v7HRFfsGyUyPo4NVw0dYuutdfrAIpHpvcTVDvYhfmw2Y1
 XcYVRjgatLf/OLClzR7l5YpUh/aCSii7nEJFMaow86waw/CemywFIJ/sC
 qnw0Lrlxyc2UN9GJOw5Mdv1mHKmUzxY4vqC70Jj39PZa+U8pjq9J7Q65R
 40WupDyZfn893YS+MqLR4dTaJ0/hznXeGLdCQ+P5emD58k5fLbvlEspzS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307260858"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="307260858"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732763627"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="732763627"
Received: from inuber-mobl5.amr.corp.intel.com (HELO [10.212.58.60])
 ([10.212.58.60])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:51 -0800
Message-ID: <7b61ac00-74af-5816-79bb-39eb208ab738@linux.intel.com>
Date: Mon, 30 Jan 2023 10:39:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/8] ASoC: cs42l42: Add SoundWire support
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-7-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230127165111.3010960-7-sbinding@opensource.cirrus.com>
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
> This adds support for using CS42L42 as a SoundWire device.
> 
> SoundWire-specifics are kept separate from the I2S implementation as
> much as possible, aiming to limit the risk of breaking the I2C+I2S
> support.
> 
> There are some important differences in the silicon behaviour between
> I2S and SoundWire mode that are reflected in the implementation:
> 
> - ASP (I2S) most not be used in SoundWire mode because the two interfaces
>   share pins.
> 
> - The SoundWire capture (record) port only supports 1 channel. It does
>   not have left-to-right duplication like the ASP.
> 
> - DP2 can only be prepared if the HP has powered-up. DP1 can only be
>   prepared if the ADC has powered-up. (This ordering restriction does
>   not exist for ASPs.) The SoundWire core port-prepare step is
>   triggered by the DAI-link prepare(). This happens before the
>   codec DAI prepare() or the DAPM sequence so these cannot be used
>   to enable HP/ADC. Instead the HP/ADC enable/disable are done during
>   the port_prep callback.
> 
> - The SRCs are an integral part of the audio chain but in silicon their
>   power control is linked to the ASP. There is no equivalent power link
>   to SoundWire DPs so the driver must take "manual" control of SRC power.
> 
> - The SoundWire control registers occupy the lower part of the SoundWire
>   address space so cs42l42 registers are offset by 0x8000 (non-paged) in
>   SoundWire mode.
> 
> - Register addresses are 8-bit paged in I2C mode but 16-bit unpaged in
>   SoundWire.
> 
> - Special procedures are needed on register read/writes to (a) ensure
>   that the previous internal bus transaction has completed, and
>   (b) handle delayed read results, when the read value could not be
>   returned within the SoundWire read command.
> 
> There are also some differences in driver implementation between I2S
> and SoundWire operation:
> 
> - CS42L42 I2S does not runtime_suspend, but runtime_suspend/resume support
>   has been added into the driver in SoundWire mode as the most convenient
>   way to power-up the bus manager and to handle the unattach_request
>   condition, though the CS42L42 chip does not itself suspend or resume.
> 
> - Intel SoundWire host controllers have a low-power clock-stop mode that
>   requires resetting all peripherals when resuming. This means that the
>   interrupt registers will be reset in between the interrupt being
>   generated and the interrupt being handled, and since the interrupt
>   status is debounced, these values may not be accurate immediately,
>   and may cause spurious unplug events before settling.
> 
> - As in I2S mode, the PLL is only used while audio is active because
>   of clocking quirks in the silicon. For SoundWire the cs42l42_pll_config()
>   is deferred until the DAI prepare(), to allow the cs42l42_bus_config()
>   callback to set the SCLK.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> +static int cs42l42_sdw_dai_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
> +					  int direction)
> +{
> +	if (!sdw_stream)
> +		return 0;
> +
> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> +		dai->playback_dma_data = sdw_stream;
> +	else
> +		dai->capture_dma_data = sdw_stream;

This may need to be updated to
snd_soc_dai_dma_data_set(dai, direction, stream);

which is being introduced by Morimoto-san

To avoid dependencies this could be updated later.

