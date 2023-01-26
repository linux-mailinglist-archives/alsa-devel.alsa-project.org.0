Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E8967D176
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:26:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0AA81CE;
	Thu, 26 Jan 2023 17:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0AA81CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674750395;
	bh=7tKbBPC9aDVVfGKolDI9/dBbPmFzcQG7teudBkR6D2c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PZPLelgDfGqRRFSrI8G0N//t5E+7Z+yLjJUIAoKtTmtbATScsdOgJ1cwqqbRr/1v0
	 h4m7X2ee5kKyLHh9gbaIjFwMAnZX8JQ0sbcpANSoI8uWCavSyDK3Qxx2WgyA1CFwqY
	 4yixs2JYyK//mWJOEolBER3ze5TI+HUuIHIbaKIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1EDDF80549;
	Thu, 26 Jan 2023 17:24:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 190CEF8025D; Thu, 26 Jan 2023 17:24:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 724B2F802DF
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724B2F802DF
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Un/EQ5jD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674750282; x=1706286282;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7tKbBPC9aDVVfGKolDI9/dBbPmFzcQG7teudBkR6D2c=;
 b=Un/EQ5jDGRdWqmB/rphbv1ULONhtlpxXVF7+bC7+iLtvlaIWWc44V5JP
 Y1iD7glnWsKc3qsx1IYtkZoZYKOO7kPMZ1dGtkwXlmAgUv3EFljM9toxL
 rfU0v49TltScmWQWChHtMMzCMh+OXvlxdp0ddCICmcWGB1yeCANqnnpkY
 NBjcbzv9ng39OJnvYGHqWwpjNlK0IFe7Ct2AQFZtqkEuGD2FIFr1kygmK
 paAoqNeHiG19GX98KkuE7ccZxblUru72fSnCA208G3vr7TxQyYZTxRplW
 Si+eX2s9+btY5kT6SybpQVcOcNXrqJubIBzoD5PcTZdVV4shaxTl9OAfY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="354154636"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="354154636"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="612855059"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="612855059"
Received: from nmani1-mobl2.amr.corp.intel.com (HELO [10.209.167.178])
 ([10.209.167.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:34 -0800
Message-ID: <7f471960-0909-4680-e192-261d1fdfe6d7@linux.intel.com>
Date: Thu, 26 Jan 2023 09:44:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 11/22] ASoC: qcom: Add USB backend ASoC driver for
 Q6
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-12-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230126031424.14582-12-quic_wcheng@quicinc.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/25/23 21:14, Wesley Cheng wrote:
> Create a USB BE component that will register a new USB port to the ASoC USB
> framework.  This will handle determination on if the requested audio
> profile is supported by the USB device currently selected.

Can you clarify how? because ...


> +static struct snd_soc_dai_driver q6usb_be_dais[] = {
> +	{
> +		.playback = {
> +			.stream_name = "USB BE RX",
> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
> +				SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
> +				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> +				SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
> +				SNDRV_PCM_RATE_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +				SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
> +				SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +				SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rate_max =     192000,
> +			.rate_min =	8000,
> +		},
> +		.id = USB_RX,
> +		.name = "USB_RX_BE",
> +		.ops = &q6usb_ops,
> +	},
> +};

... here I see a single DAI, so presumably ONE endpoint can be supported?

I didn't see in the rest of the code how a card with multiple endpoint
would be rejected, nor how the capabilities are checked?

