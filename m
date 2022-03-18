Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F634DDC43
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 15:55:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E630A1838;
	Fri, 18 Mar 2022 15:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E630A1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647615328;
	bh=yld6LrFeJIp66uBCsGtAheYeUr4v7ay70MC6FnCNO8M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKjtwOb/13GKm/rQMNjuBv7XuYpLvqUwduEKpMX9YclmeHUKPb85UCq74xusii3vV
	 yeqSnEpVEKYCBRSQs2rrv7AXGSUiFD5MWvphtSBBYf9SWW8wEk+5QUZXHCMsLKbDxm
	 3xWkk3Au4ZP9cOMPELo8vuboWFYpfEF8APuPy/gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43C22F80515;
	Fri, 18 Mar 2022 15:53:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C0AF80121; Fri, 18 Mar 2022 15:53:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 220ECF80121;
 Fri, 18 Mar 2022 15:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 220ECF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f8h/fA3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647615225; x=1679151225;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yld6LrFeJIp66uBCsGtAheYeUr4v7ay70MC6FnCNO8M=;
 b=f8h/fA3J82ge2jRR0hgbkfnH2ZwqsWvSJ2JYevv8eV75P+BWVRutSJ8t
 HntMYkSX/OB/XECvq73+JujpxVbd8YiBIK0C+kz1qvRTqN3QW6Qf5klMP
 g3U56fXu7vp+R3Erac15ggVDWWN+n4xMXnsOkzQn5QvI5tD7zhbpevCZw
 0bdvbsTNGByRgimzpF3GWQGuBtZYxiE4rFJ7xBl7TSZBafKAAtYWSY6fH
 KW8HJtPQYqG2BO+9mvmaX+QcaZAskwgw/gpb0CeGDVvVwXMyU3/Ld0uYA
 s8Liv0NPbgoquunA5AdukFbkH3mSFYhBsVpy6WLcZyH444hem+vbGvq+I A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237760638"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237760638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:53:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="691342095"
Received: from mdabdull-mobl1.amr.corp.intel.com (HELO [10.251.31.89])
 ([10.251.31.89])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:53:31 -0700
Message-ID: <58fc6207-c4f4-9504-f00f-7f5f18fce6ba@linux.intel.com>
Date: Fri, 18 Mar 2022 09:51:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] ASoC: SOF: check for NULL before dereferencing
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20220318071308.GC29472@kili>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220318071308.GC29472@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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



On 3/18/22 02:13, Dan Carpenter wrote:
> This code dereferences "dai" before checking whether it can be NULL.
> 
> Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC agnostic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Same thing, this code will be removed in follow-up patches and we missed 
the intermediate error. Thanks for the patch.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/sof-audio.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
> index 15c36a51f89f..88ddd1e2476d 100644
> --- a/sound/soc/sof/sof-audio.c
> +++ b/sound/soc/sof/sof-audio.c
> @@ -626,10 +626,13 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
>   		/* update DAI config. The IPC will be sent in sof_widget_setup() */
>   		if (WIDGET_IS_DAI(swidget->id)) {
>   			struct snd_sof_dai *dai = swidget->private;
> -			struct sof_dai_private_data *private = dai->private;
> +			struct sof_dai_private_data *private;
>   			struct sof_ipc_dai_config *config;
>   
> -			if (!dai || !private || !private->dai_config)
> +			if (!dai)
> +				continue;
> +			private = dai->private;
> +			if (!private || !private->dai_config)
>   				continue;
>   
>   			config = private->dai_config;
> @@ -918,10 +921,13 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
>   		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
>   	struct snd_sof_dai *dai =
>   		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
> -	struct sof_dai_private_data *private = dai->private;
> +	struct sof_dai_private_data *private;
>   
>   	/* use the tplg configured mclk if existed */
> -	if (!dai || !private || !private->dai_config)
> +	if (!dai)
> +		return 0;
> +	private = dai->private;
> +	if (!private || !private->dai_config)
>   		return 0;
>   
>   	switch (private->dai_config->type) {
