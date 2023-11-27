Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A07FA929
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 19:42:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC16DEC;
	Mon, 27 Nov 2023 19:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC16DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701110561;
	bh=ocdAfY8jzn+hMTXj3yEo5xBI/FMZYl5m4SnwH6zy1iQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dio0c0fDNlpL6r3Oznc2BE0/qU96B/wswbtZrGExNYfrXHzX8HkkRGMuIWSGB40LT
	 W9f89RSFm8itv3gL9LXQbsjrcho95KSqUBR2nvFqpULptj0tx3ke3oMAg7tYxVeFPm
	 +7SKeTy+g+Czza0xxdgXS/AfAGkMJgauZ2/3qUR0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 257B6F805AA; Mon, 27 Nov 2023 19:42:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB2EF805BD;
	Mon, 27 Nov 2023 19:42:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DF2FF805A8; Mon, 27 Nov 2023 19:41:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FDCEF800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 19:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FDCEF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gMlbUV/K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701110508; x=1732646508;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ocdAfY8jzn+hMTXj3yEo5xBI/FMZYl5m4SnwH6zy1iQ=;
  b=gMlbUV/Ke9C5kATge66ETxTjt02r3ILPCCO1nwwhfZ+2NJHC3aELKaeV
   qPryzyt72/74BE/TvXBOQiLLFQfAIrERdepqbi0E6jJ70k4KQSv2p0DBe
   9GADtGtNPrSyOFfnUAl2Ip1kdAl9kPam+D1mjhFNhvILyGMlMDPdVx6wY
   TOljiR6CRWGFBmh8oPn5l76uGcxplZVuqMt1uE1gscqCSieGJPCuD8Isp
   wN7AbrWhtp2wdy6LSOD/bVy5JbXHCztBwwTZLHx1TK5dKMp+M3ekHZ3qx
   xcpkKTpZ0+jgJPYuP/mRVe33Rwv8r0kfd334YyoZ94KNpr/QBaSXeeNW9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="392517689"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="392517689"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="891820937"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891820937"
Received: from alanpai-mobl.amr.corp.intel.com (HELO [10.209.65.171])
 ([10.209.65.171])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:41:41 -0800
Message-ID: <a177e7c1-3a28-464e-888f-315df72d528c@linux.intel.com>
Date: Mon, 27 Nov 2023 11:44:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: fix NULL pointer dereference for
 multi_link
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20231124180136.390621-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231124180136.390621-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VWBRU3D54ON3HADSDSW2DHVNNQUIUMEB
X-Message-ID-Hash: VWBRU3D54ON3HADSDSW2DHVNNQUIUMEB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWBRU3D54ON3HADSDSW2DHVNNQUIUMEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/24/23 12:01, Krzysztof Kozlowski wrote:
> If bus is marked as multi_link, but number of masters in the stream is
> not higher than bus->hw_sync_min_links (bus->multi_link && m_rt_count >=
> bus->hw_sync_min_links), bank switching should not happen.  The first
> part of do_bank_switch() code properly takes these conditions into
> account, but second part (sdw_ml_sync_bank_switch()) relies purely on
> bus->multi_link property.  This is not balanced and leads to NULL
> pointer dereference:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>   ...
>   Call trace:
>    wait_for_completion_timeout+0x124/0x1f0
>    do_bank_switch+0x370/0x6f8
>    sdw_prepare_stream+0x2d0/0x438
>    qcom_snd_sdw_prepare+0xa0/0x118
>    sm8450_snd_prepare+0x128/0x148
>    snd_soc_link_prepare+0x5c/0xe8
>    __soc_pcm_prepare+0x28/0x1ec
>    dpcm_be_dai_prepare+0x1e0/0x2c0
>    dpcm_fe_dai_prepare+0x108/0x28c
>    snd_pcm_do_prepare+0x44/0x68
>    snd_pcm_action_single+0x54/0xc0
>    snd_pcm_action_nonatomic+0xe4/0xec
>    snd_pcm_prepare+0xc4/0x114
>    snd_pcm_common_ioctl+0x1154/0x1cc0
>    snd_pcm_ioctl+0x54/0x74
> 
> Fixes: ce6e74d008ff ("soundwire: Add support for multi link bank switch")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

LGTM, thanks for the patch.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  drivers/soundwire/stream.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 9dc6399f206a..f9c0adc0738d 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -742,14 +742,15 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
>   * sdw_ml_sync_bank_switch: Multilink register bank switch
>   *
>   * @bus: SDW bus instance
> + * @multi_link: whether this is a multi-link stream with hardware-based sync
>   *
>   * Caller function should free the buffers on error
>   */
> -static int sdw_ml_sync_bank_switch(struct sdw_bus *bus)
> +static int sdw_ml_sync_bank_switch(struct sdw_bus *bus, bool multi_link)
>  {
>  	unsigned long time_left;
>  
> -	if (!bus->multi_link)
> +	if (!multi_link)
>  		return 0;
>  
>  	/* Wait for completion of transfer */
> @@ -847,7 +848,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>  			bus->bank_switch_timeout = DEFAULT_BANK_SWITCH_TIMEOUT;
>  
>  		/* Check if bank switch was successful */
> -		ret = sdw_ml_sync_bank_switch(bus);
> +		ret = sdw_ml_sync_bank_switch(bus, multi_link);
>  		if (ret < 0) {
>  			dev_err(bus->dev,
>  				"multi link bank switch failed: %d\n", ret);
