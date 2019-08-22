Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1546995F5
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 16:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E867168D;
	Thu, 22 Aug 2019 16:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E867168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566483019;
	bh=+EUQy7lMG6JUa7gtODer6sirNvSrKOk3EixEXLEdovc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bbnV799AeYEoBqs00o2WNJVf9YlZngOVJgtNYU4wXBW8Cx3wnYBtKoX4Mk2LaPGg4
	 3OwyqBRvfhqIIXx3ODai06y/zdl3+/zeL1OWVv0kWAn0biyNFJYFH7jYV0hJ+CCY4c
	 hPR1IllWB3RKYjXmB/Pt5QG3kUYeqFw2TXbgmyf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67819F803D5;
	Thu, 22 Aug 2019 16:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4C12F803D5; Thu, 22 Aug 2019 16:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3F1F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3F1F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 07:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="183899805"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 22 Aug 2019 07:08:59 -0700
Received: from tcwomach-mobl1.amr.corp.intel.com (unknown [10.255.34.51])
 by linux.intel.com (Postfix) with ESMTP id 483425806C4;
 Thu, 22 Aug 2019 07:08:58 -0700 (PDT)
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822120135.13515-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ed82f3b9-92da-dced-2fef-dee92ca67f10@linux.intel.com>
Date: Thu, 22 Aug 2019 09:08:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822120135.13515-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Baytrail: Fix implicit
	fallthrough warning
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

On 8/22/19 7:01 AM, Cezary Rojewski wrote:
> Separate _SUSPEND from _PAUSE_PUSH to ensure code is handled correctly
> while fixing warning reported during compilation.
> 
> Fixes: b80d19c166c4 ("ASoC: Intel: Restore Baytrail ADSP streams only when ADSP was in reset")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/baytrail/sst-baytrail-pcm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/intel/baytrail/sst-baytrail-pcm.c b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
> index 9cbc982d46a9..eddb24ab8072 100644
> --- a/sound/soc/intel/baytrail/sst-baytrail-pcm.c
> +++ b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
> @@ -193,6 +193,8 @@ static int sst_byt_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   		break;
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   		pdata->restore_stream = false;
> +		sst_byt_stream_pause(byt, pcm_data->stream);
> +		break;

why not just a /* fallthrough */ statement?

>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>   		sst_byt_stream_pause(byt, pcm_data->stream);
>   		break;
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
