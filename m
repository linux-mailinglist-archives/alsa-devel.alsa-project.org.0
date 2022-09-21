Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C885C00B4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA41163C;
	Wed, 21 Sep 2022 17:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA41163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663772787;
	bh=Ivbh6ZGqsRC20s9vn6y6NPd6czEHxqm4rOtV1lbpFnc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llx30SVIcwilZ9BBLjjtY/1VWeCazH1rlon1MRMpu/utQ+IuZS3MMMy5MBSlo3RrB
	 u0BRsHEpdZ72fYQ+FBOIjHInw3VqnMp5sgFt6uie1VRsS0xu6hQJUWzIGgylD0p9Jw
	 iJYRPJeBRrYy4dLjnowDgknRNp/AFE4Dpmf3LFk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D05EF800C9;
	Wed, 21 Sep 2022 17:05:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F79F800F3; Wed, 21 Sep 2022 17:05:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6764AF800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6764AF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AhwcRtOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663772721; x=1695308721;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ivbh6ZGqsRC20s9vn6y6NPd6czEHxqm4rOtV1lbpFnc=;
 b=AhwcRtOXGyqjEOmbd/iKzLFl+JlGdxolhGyj4Re+tyHuRofP2qJQC7o4
 EVz9/2SLc48I9r7egZr7ypWEwQrvBL4UiSHAQeGm7i2lrGUGgHFkFZrCc
 maZ8MFvJy6Dn+fG1VxuJS7aGm1ZFevnjc/I71WC6L14DI2IvbEaAAbwPn
 hZTflRfye+t/dl71fWgJZIP69vqaclZwvp/c8anwHKmLbtUVg65qdARzv
 avfyOQV/A4ZQmQ7s8eObHhWVijLJnHvVUrg4HuyyI7o/R3MvVnvayrNTs
 9uYz58jPhTv21eDHIPiXRAiMICWWbO5eb6JMkXMEwvfQwN08BA0jCl1iH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="326340273"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="326340273"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:05:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="948187784"
Received: from johannes-mobl1.ger.corp.intel.com (HELO [10.249.46.195])
 ([10.249.46.195])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:05:11 -0700
Message-ID: <20916c9d-3598-7c40-ee77-1148c3d2e4b1@linux.intel.com>
Date: Wed, 21 Sep 2022 17:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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



On 9/21/22 16:53, Krzysztof Kozlowski wrote:
> Slimbus streams are first prepared and then enabled, so the cleanup path
> should reverse it.  The unprepare sets stream->num_ports to 0 and frees
> the stream->ports.  Calling disable after unprepare was not really
> effective (channels was not deactivated) and could lead to further
> issues due to making transfers on unprepared stream.
> 
> Fixes: 20aedafdf492 ("ASoC: wcd9335: add support to wcd9335 codec")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd9335.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 06c6adbe5920..d2548fdf9ae5 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -1972,8 +1972,8 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		slim_stream_unprepare(dai_data->sruntime);
>  		slim_stream_disable(dai_data->sruntime);
> +		slim_stream_unprepare(dai_data->sruntime);

This looks logical but different from what the kernel doc says:

/**
 * slim_stream_disable() - Disable a SLIMbus Stream
 *
 * @stream: instance of slim stream runtime to disable
 *
 * This API will disable all the ports and channels associated with
 * SLIMbus stream
 *
 * Return: zero on success and error code on failure. From ASoC DPCM
framework,
 * this state is linked to trigger() pause operation.
 */

/**
 * slim_stream_unprepare() - Un-prepare a SLIMbus Stream
 *
 * @stream: instance of slim stream runtime to unprepare
 *
 * This API will un allocate all the ports and channels associated with
 * SLIMbus stream
 *
 * Return: zero on success and error code on failure. From ASoC DPCM
framework,
 * this state is linked to trigger() stop operation.
 */

I would bet the documentation is incorrect?

>  		break;
>  	default:
>  		break;
