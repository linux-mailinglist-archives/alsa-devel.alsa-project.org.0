Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35492680EF1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 14:29:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36DA4AE8;
	Mon, 30 Jan 2023 14:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36DA4AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675085387;
	bh=y3uOpscp6FQEPLwJB+DgR4ftPrTIh5c6tQ5X5DY1sUs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gHa/xUm3annS2fu/i6Pe3JUZpCCJHVak8ABao6kj84FQESmmyp9nDqj06G9CdBXpV
	 VYacCe2iwWVUddEzGd3UV6kxQjLGgj+uKfR8jhlKeunqZwv/0e79R+kngLvc/IBE4k
	 cETE/wZzHPzsiHc6SvP61oJU98wC3KyrngOzGjAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0873F8007C;
	Mon, 30 Jan 2023 14:28:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C67FF8032B; Mon, 30 Jan 2023 14:28:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE199F8007C
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 14:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE199F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RvUxkzC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675085319; x=1706621319;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y3uOpscp6FQEPLwJB+DgR4ftPrTIh5c6tQ5X5DY1sUs=;
 b=RvUxkzC89jkYNUnrgPNn4Dd+kf0Ak7dPKX80929t9ZJtoegzq3IIkXNZ
 QNRjoxFbLJd6R2AgiFJMTZ2uUYZa9YdTZKXYdqajuXElAOq0UdRSv7bJd
 I8KO9AC8+FC1zpzWdX47ImooTCuTvrk1dHEuzSMFbbGLj7Sh79Z5YcxHX
 iMfDrn55NgHg3DKTMSPxuEUgbr7VbgVlPDRosWl7JSvL3dwJvTnJwqfoa
 +nBBPVB1TC6hNXW58pZnS5nsL/CE21MF8EdRC6HthPUcNQyYXYEVDrkPg
 glQJqMskmfOUIruB3souObmcqJkaEoUM/lW4fMbnkyD8EEbhAbk+eNOn3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="354869483"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="354869483"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 05:28:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="788027124"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="788027124"
Received: from bradym3x-mobl.ger.corp.intel.com (HELO [10.252.0.233])
 ([10.252.0.233])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 05:28:12 -0800
Message-ID: <81c25623-8689-759a-026e-b49190bc19cf@linux.intel.com>
Date: Mon, 30 Jan 2023 15:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: amd: acp: Refactor bit width calculation
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20230130100104.4076640-1-venkataprasad.potturu@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230130100104.4076640-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 30/01/2023 12:01, Venkata Prasad Potturu wrote:
> Refactor bit width calculation using params_physical_width()
> instead hard-code values.

I would have added a Reported-by tag for Pierre...
A Fixes tag might also help this patch to follow
ca9d237994db ("ASoC: amd: acp: Refactor i2s clocks programming sequence")

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
> ---
>  sound/soc/amd/acp/acp-mach-common.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index b83ae946b3e4..b4dcce4fbae9 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -186,7 +186,7 @@ static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
>  
>  	srate = params_rate(params);
>  	ch = params_channels(params);
> -	format = 8 * params_format(params);
> +	format = params_physical_width(params);
>  
>  	if (drvdata->tdm_mode)
>  		fmt = SND_SOC_DAIFMT_DSP_A;
> @@ -330,7 +330,7 @@ static int acp_card_rt5682s_hw_params(struct snd_pcm_substream *substream,
>  
>  	srate = params_rate(params);
>  	ch = params_channels(params);
> -	format = 8 * params_format(params);
> +	format = params_physical_width(params);
>  
>  	if (drvdata->tdm_mode)
>  		fmt = SND_SOC_DAIFMT_DSP_A;
> @@ -475,7 +475,7 @@ static int acp_card_rt1019_hw_params(struct snd_pcm_substream *substream,
>  
>  	srate = params_rate(params);
>  	ch = params_channels(params);
> -	format = 8 * params_format(params);
> +	format = params_physical_width(params);
>  
>  	if (drvdata->amp_codec_id != RT1019)
>  		return -EINVAL;
> @@ -616,7 +616,7 @@ static int acp_card_maxim_hw_params(struct snd_pcm_substream *substream,
>  
>  	srate = params_rate(params);
>  	ch = params_channels(params);
> -	format = 8 * params_format(params);
> +	format = params_physical_width(params);
>  
>  	if (drvdata->tdm_mode)
>  		fmt = SND_SOC_DAIFMT_DSP_A;

-- 
Péter
