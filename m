Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16518674ED7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 09:02:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B5C2E84;
	Fri, 20 Jan 2023 09:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B5C2E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674201732;
	bh=KdobaH4syO7V+kdAWH+wnONXay4qKevv10bWKbL7ssQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=axEAc8Yz2RHe9B5kqUuDgnnTH8AYAaBd8zlrzUP3wI0GHY7KbFTj7S1SbLGlZqztG
	 wAOX8epQYjExvXl+IJy3HM+k8eOyUvEDacDLyHlsm1mlDo7NdCnH9ii6PgCMlVMBhF
	 oSE7UBMsYgra9S6INZbsLR+lvgCpG+Ionu0ltjho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF8A5F80246;
	Fri, 20 Jan 2023 09:01:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0F96F8026D; Fri, 20 Jan 2023 09:01:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41247F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 09:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41247F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mRJ9gQP1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674201670; x=1705737670;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KdobaH4syO7V+kdAWH+wnONXay4qKevv10bWKbL7ssQ=;
 b=mRJ9gQP1Yb1s0IIGDQViefequWrCdEsy4rh/rbAZObk6RNSpw4Be1dwZ
 l5A/yrJvKZbPeW/pjbhQrvTVS/1Hl36nSMSpCs4yc4b1dyvtDpFE+2MFW
 2qsK4W9j8CpXINLVRf+ujd/+xlH24b+QQ7oxwjcSwx8VilUPQEfmiTzfP
 0VzX08BtWeVbuiUbmfyf6HVEzNUrkbtpzpP+jQZdmw45bS/iv99iPTAqA
 8/U6yTuZt+IJXsceCjZzfhVWpQjJyZzHb9/19so3zW3lexsCztNL8MLbQ
 dD7ea/5IHoPmAWjuUPqUBqgs3uSkv3Z1MnF5kboe5SiZcJ+/0gwDyTKW2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305894442"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="305894442"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 00:01:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660505480"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="660505480"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 00:00:58 -0800
Message-ID: <6f047ec5-4055-761d-c1ea-c2d0b606e53a@linux.intel.com>
Date: Fri, 20 Jan 2023 09:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 22/25] ASoC: soc-dai.c: use helper function
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
 <87edrpk7qb.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87edrpk7qb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/20/2023 8:03 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ASoC has many helper function.
> This patch use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-dai.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 29a75fdf90e0..e01b87ea04d4 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -267,6 +267,11 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
>   			     int slots, int slot_width)
>   {
>   	int ret = -ENOTSUPP;
> +	int stream;
> +	unsigned int tdm_mask[] = {
> +		tx_mask,
> +		rx_mask,
> +	};
>   
>   	if (dai->driver->ops &&
>   	    dai->driver->ops->xlate_tdm_slot_mask)
> @@ -275,8 +280,8 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
>   	else
>   		snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
>   
> -	dai->tx_mask = tx_mask;
> -	dai->rx_mask = rx_mask;
> +	for_each_pcm_streams(stream)
> +		snd_soc_dai_tdm_mask_set(dai, stream, tdm_mask[stream]);

Does this work? There are functions earlier which modify the values of 
tx_mask/rx_mask and you copy their old values on tdm_mask[] init?

>   
>   	if (dai->driver->ops &&
>   	    dai->driver->ops->set_tdm_slot)

