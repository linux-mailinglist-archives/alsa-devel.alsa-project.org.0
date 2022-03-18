Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36F4DDC40
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 15:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D981317F6;
	Fri, 18 Mar 2022 15:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D981317F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647615294;
	bh=bfWU2YF+kWT90DlMBu51PEmAdtdOwU0hgjdLKZfgG2s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+CAl7sIeE7LUCqvrZa8A3SMXaRzz8UfNyVapuCcTHrJW3vJo6CPYw0bXQskI2BFQ
	 zibOm9AiYTVxGZENP52g+fG4L6AlYpzfNQ+Skga8AXYyDnwAQoq6Eq7bPCU3dfYkb8
	 seYd2RBwpmapYXhwMGYeLGqFXF3cSQwPUL66tIEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46182F80271;
	Fri, 18 Mar 2022 15:53:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F1A7F8026D; Fri, 18 Mar 2022 15:53:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C85A3F80124;
 Fri, 18 Mar 2022 15:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C85A3F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FB906eQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647615222; x=1679151222;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bfWU2YF+kWT90DlMBu51PEmAdtdOwU0hgjdLKZfgG2s=;
 b=FB906eQxZOkFellKSFe8qj/1zePcZcePlmkd5LNWP+F/d5jFdLnsQ8rZ
 DlZnGcCjlmwnfPiYWfbba3Ffyrw8Xh3DyQI3TXg9HUDc9XyNlmiYAQE7T
 XOyh9/RFPzOoo82GIVWj2ETd6o/tYO2FNJbbM2l5Di1isWwcwlgyPJpBP
 M5b5iRx+46c1vx0tQ99OzEEoUgikaOnMHirwr5e7OKHERkOKlTo9O2jPd
 ReOVRSMf8H0OadzRxYaYxr52T247gpa9wTc2RZ1LjP8aHUj1Eii32KeG/
 1A31sknxvMej4ZuZXkx3gebcJgvEFM2iJ4yYa6z1ytmxvaj2C6Mt/Xz4C w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237760630"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237760630"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:53:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="691342073"
Received: from mdabdull-mobl1.amr.corp.intel.com (HELO [10.251.31.89])
 ([10.251.31.89])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:53:29 -0700
Message-ID: <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
Date: Fri, 18 Mar 2022 09:42:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ASoC: SOF: Prevent NULL dereference in
 sof_pcm_dai_link_fixup()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20220318071233.GB29472@kili>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220318071233.GB29472@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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



On 3/18/22 02:12, Dan Carpenter wrote:
> The "dia" pointer can be NULL, so handle that condition first before
> storing "dia->private".
> 
> Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC agnostic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch.

This part will be removed in follow-up patches, likely the reason why 
this problem was missed.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/pcm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 1661b0bc6f12..71f5bce0c4c7 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -702,7 +702,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
>   	struct snd_sof_dai *dai =
>   		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
>   	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> -	struct sof_dai_private_data *private = dai->private;
> +	struct sof_dai_private_data *private;
>   	struct snd_soc_dpcm *dpcm;
>   
>   	/* no topology exists for this BE, try a common configuration */
> @@ -727,6 +727,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
>   	/* read format from topology */
>   	snd_mask_none(fmt);
>   
> +	private = dai->private;
>   	switch (private->comp_dai->config.frame_fmt) {
>   	case SOF_IPC_FRAME_S16_LE:
>   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
