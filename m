Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4D219FF4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 14:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A5411616;
	Thu,  9 Jul 2020 14:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A5411616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594297549;
	bh=pXJm1JgAmBBNUElK3GvnvYiqOBFfIMyrcaMkwYYiJPs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJPk24jzwV8fdnRH8nj4tp5zDdPQydvVjJSsMDZVxJ5qSEMVlY/2U3RYpCz32KsrZ
	 afufnQfoA/HVQ8oQJ5mDyOX3LRAnI+mQIT2RppkVzqaJ5hkIbSxbCMIoxJ74c6HY1J
	 f4XG7vwrL5pVxQo1azQF5USO5LlcVLyfOXqf+/6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D157F80255;
	Thu,  9 Jul 2020 14:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 653ABF80216; Thu,  9 Jul 2020 14:24:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97E4AF80117
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 14:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E4AF80117
IronPort-SDR: sDS8W9gkCbl4EgjANjU/2lyOEjSyfGQHUZSSuiDtVapUjjzl5wPBfz0qX+PqMhj4dRv+GnLJzz
 XSX1/uomWibA==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="128052778"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="128052778"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 05:23:46 -0700
IronPort-SDR: zUJRMxFqvXKawZmBVL3m/XHWTrYINnuLqEswthbA/fKG98lMBnra0mnHAwQTfRgZaHtK0Iyxnf
 7rV77zFdLPAg==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="389126681"
Received: from drleon-mobl1.amr.corp.intel.com (HELO [10.254.78.19])
 ([10.254.78.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 05:23:45 -0700
Subject: Re: [PATCH] ASoC: rt286: fix unexpected interrupt happens
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20200709101345.11449-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dd389bcf-c296-daf5-31d8-72d61415602f@linux.intel.com>
Date: Thu, 9 Jul 2020 06:56:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200709101345.11449-1-shumingf@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, flove@realtek.com
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



On 7/9/20 5:13 AM, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The HV/VREF should not turn off if the headphone jack plug-in.
> This patch could solve the unexpected interrupt issue in some devices.
> 
> Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For more context, this patch removes a recurring click with a ~1s period 
audible with headphones on Dell XPS13-9343.

> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>   sound/soc/codecs/rt286.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
> index 9593a9a27bf8..e8d14eefc41b 100644
> --- a/sound/soc/codecs/rt286.c
> +++ b/sound/soc/codecs/rt286.c
> @@ -272,13 +272,13 @@ static int rt286_jack_detect(struct rt286_priv *rt286, bool *hp, bool *mic)
>   		regmap_read(rt286->regmap, RT286_GET_MIC1_SENSE, &buf);
>   		*mic = buf & 0x80000000;
>   	}
> -	if (!*mic) {
> +
> +	if (!*hp) {
>   		snd_soc_dapm_disable_pin(dapm, "HV");
>   		snd_soc_dapm_disable_pin(dapm, "VREF");
> -	}
> -	if (!*hp)
>   		snd_soc_dapm_disable_pin(dapm, "LDO1");
> -	snd_soc_dapm_sync(dapm);
> +		snd_soc_dapm_sync(dapm);
> +	}
>   
>   	return 0;
>   }
> 
