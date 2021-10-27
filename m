Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBEA43CB9F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 16:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A430E16CD;
	Wed, 27 Oct 2021 16:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A430E16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635343770;
	bh=0VOKqHKCz5e2amUVVtJ7TNvQM11rkmB5GlSHXz0Y1wE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dkA8tzwa1yO2Zm2rVfU+yLyp233wILR7FW3SoXTk4UWf2vJsNLw0occZpLMQmrgmQ
	 jL8OAJzQvc7qSS3y6Mgb+IHu/W8goCtglQ6NOzACZRlvAU1gH3AWANt6nJj8Xh8tpw
	 HXXNnEnMe8iO10iRtzyPQTBOmXmQMClVQfIPDYSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75BC1F804E6;
	Wed, 27 Oct 2021 16:07:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 232E2F8016C; Wed, 27 Oct 2021 16:07:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0B7DF8016C
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 16:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B7DF8016C
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210947223"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="210947223"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 07:07:39 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="494848995"
Received: from deryzhov-mobl1.ccr.corp.intel.com (HELO [10.212.69.94])
 ([10.212.69.94])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 07:07:39 -0700
Subject: Re: [PATCH 2/3] ASoC: nau8825: add disable jack detection support
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
References: <20211027025142.25898-1-CTLIN0@nuvoton.com>
 <20211027025142.25898-3-CTLIN0@nuvoton.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d581eb7a-cb61-0604-fb51-d9181d3eced3@linux.intel.com>
Date: Wed, 27 Oct 2021 09:05:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027025142.25898-3-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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



On 10/26/21 9:51 PM, David Lin wrote:
> A feature for disabling jack detection support.
> 
> Co-developed-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---
>  sound/soc/codecs/nau8825.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
> index c845f19b7c41..a356f26735bd 100644
> --- a/sound/soc/codecs/nau8825.c
> +++ b/sound/soc/codecs/nau8825.c
> @@ -1434,6 +1434,13 @@ int nau8825_enable_jack_detect(struct snd_soc_component *component,
>  
>  	nau8825->jack = jack;
>  
> +	if (!nau8825->jack) {
> +		regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
> +				   NAU8825_HSD_AUTO_MODE | NAU8825_SPKR_DWN1R |
> +				   NAU8825_SPKR_DWN1L, 0);
> +		return 0;
> +	}
> +

oh, so you've addressed my comment from the first patch but it might be
clearer to follow the flow from other codec drivers and test the jack
argument at a higher level, then you have an enable/disable parameter.

>  	/* Ground HP Outputs[1:0], needed for headset auto detection
>  	 * Enable Automatic Mic/Gnd switching reading on insert interrupt[6]
>  	 */
> 
