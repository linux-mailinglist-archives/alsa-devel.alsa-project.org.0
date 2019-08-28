Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF65A1E74
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1BC316AE;
	Thu, 29 Aug 2019 17:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1BC316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091382;
	bh=vs0YZ1q9kXBy/SEGfFh0EsG2kF+A5TZw+2rBXebGcNE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IMe27OahjMeeBoWgbicWIrTmXTdUneBsfUcWvST+TBH0g2WrC2m6PCn0wDOOqhkWl
	 8E7NlLS1en+joKGKLBUHmVe6pRc06X0qo8sc185hX9/bEIWnsIiHMH+I30MTfcB7Ee
	 0HHw0dik4MXyOkLjuLl7mzM/wcQF4gksaYb/2yV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33A70F89810;
	Thu, 29 Aug 2019 01:05:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62CA0F8980E; Thu, 29 Aug 2019 01:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57152F8980C
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 01:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57152F8980C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 16:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="188372414"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2019 16:05:22 -0700
Received: from dnuyen-mobl.amr.corp.intel.com (unknown [10.255.34.53])
 by linux.intel.com (Postfix) with ESMTP id 01095580107;
 Wed, 28 Aug 2019 16:05:21 -0700 (PDT)
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190828095102.15737-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <64773d79-b9ed-f42f-e2b9-4c1c18768348@linux.intel.com>
Date: Wed, 28 Aug 2019 12:00:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828095102.15737-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel: Baytrail: Fix implicit
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

On 8/28/19 4:51 AM, Cezary Rojewski wrote:
> Append fallthrough statement to fix warning reported during compilation.
> 
> Fixes: b80d19c166c4 ("ASoC: Intel: Restore Baytrail ADSP streams only when ADSP was in reset")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> Changes from v1:
> - made use of fallthrough statement as suggested by Pierre
> - updated commit message
> 
>   sound/soc/intel/baytrail/sst-baytrail-pcm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/baytrail/sst-baytrail-pcm.c b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
> index 9cbc982d46a9..54f2ee3010ee 100644
> --- a/sound/soc/intel/baytrail/sst-baytrail-pcm.c
> +++ b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
> @@ -193,6 +193,7 @@ static int sst_byt_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   		break;
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   		pdata->restore_stream = false;
> +		/* fallthrough */
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>   		sst_byt_stream_pause(byt, pcm_data->stream);
>   		break;
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
