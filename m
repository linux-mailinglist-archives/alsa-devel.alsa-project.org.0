Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E114999D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 08:58:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50CC1712;
	Tue, 18 Jun 2019 08:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50CC1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560841082;
	bh=MSpQYTyoNDrtrjPYkpAX43X6Ppre4YKrkFnF8P+wheI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjT+3x9/esZWYemY5+bJKCaToFKaKdvxmeYvnH3OwMteIyDuHB5rpl4MMskDCiVU7
	 dwYB/LRozbH8sG0grfNeZWrJui79yu/fDuCM2Hw8BJXI2D3j5P+6bATbMLVvYfaZsN
	 8GLPlBEPJlS8ZoIVbI5WU0iNO6l2137irggP0j78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C3CCF896DB;
	Tue, 18 Jun 2019 08:56:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A282F896F4; Tue, 18 Jun 2019 08:56:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EEE9F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 08:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EEE9F80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 23:56:10 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jun 2019 23:56:09 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id F35845801A8;
 Mon, 17 Jun 2019 23:56:07 -0700 (PDT)
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1560836926-27055-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c084b10a-ecb5-19ad-379f-b79e723fe3d5@linux.intel.com>
Date: Tue, 18 Jun 2019 08:56:10 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560836926-27055-1-git-send-email-mac.chiang@intel.com>
Content-Language: en-US
Cc: harshapriya.n@intel.com, broonie@kernel.org, yong.zhi@intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: add dmic format
 constraint
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/18/19 7:48 AM, mac.chiang@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> platform dmic recording fixup 16bits

Which platforms is this needed for? IIRC this machine driver is shared 
with SOF-based solutions - which typically sets DMIC configs with 
topology - and I'd like to make sure there's no impact.
Thanks!

> 
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
>   sound/soc/intel/boards/bxt_da7219_max98357a.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index 5cadb7f..ac06408 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -330,6 +330,9 @@ static int broxton_dmic_startup(struct snd_pcm_substream *substream)
>   	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
>   			&constraints_channels_quad);
>   
> +	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
> +
>   	return snd_pcm_hw_constraint_list(substream->runtime, 0,
>   			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
>   }
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
