Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF5F18BEA2
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 18:46:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F0D81796;
	Thu, 19 Mar 2020 18:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F0D81796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584640014;
	bh=Pu43VZSSPeGe1Lmm5UmdyLeBeRTwIHgY2IJRqTu+j7g=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oKOD9hoaFJW19wJJMYnFKi4DWI9JpjIDzoqRfdzmdwohMpEmqPEhZRjsM/fXqIJ1I
	 fl+MbgQs4gFdBscd4QR4eYlPgUtGylcywDla3jQb7sEyc/4xuc8Uop0h4Y5V/TGNlq
	 Eg0Iel2RAJrMtc41uru3QnF19WvzOtTkN3fVTLIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B09F800DD;
	Thu, 19 Mar 2020 18:45:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26767F8022B; Thu, 19 Mar 2020 18:45:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 155B2F800DD
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 18:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 155B2F800DD
IronPort-SDR: I7bMxkKTCImQL9XGWdOPhvYkTWiRURBJMJDbiI6INid/pbCwSUq357GI8euN3SRqg5wnzyzkTF
 5gct68opycpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 10:45:04 -0700
IronPort-SDR: nyg3Ka5QrvO3iYtSgsFbqxfqHGG7+n8+Zf6c65Hz/36CO+GdLR3Ez0v3k5pfe+8G9I643vtJNa
 10W4HYXOFQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="245232828"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.128.140])
 ([10.249.128.140])
 by orsmga003.jf.intel.com with ESMTP; 19 Mar 2020 10:45:01 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
References: <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <a7bf2aee-78e7-f905-bcc3-cd21bf16a976@intel.com>
Message-ID: <2346211f-4639-75c3-513a-b765a0ba88d2@intel.com>
Date: Thu, 19 Mar 2020 18:45:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a7bf2aee-78e7-f905-bcc3-cd21bf16a976@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, tiwai@suse.com, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
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

On 2020-03-19 18:33, Cezary Rojewski wrote:
> 
> Thank you for being so cooperative during this 2day debug session.
> 
> The patch I mentioned earlier unintentionally (?) changed 'platform' 
> component param for ssp0_port from 'dummy' to 'platform' for non-SOF 
> solution:
> 
> diff --git a/sound/soc/intel/boards/broadwell.c 
> b/sound/soc/intel/boards/broadwell.c
> index b9c12e24c70b..db7e1e87156d 100644
> --- a/sound/soc/intel/boards/broadwell.c
> +++ b/sound/soc/intel/boards/broadwell.c
> @@ -164,14 +164,6 @@ SND_SOC_DAILINK_DEF(platform,
>   SND_SOC_DAILINK_DEF(codec,
>          DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
> 
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -SND_SOC_DAILINK_DEF(ssp0_port,
> -           DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
> -#else
> -SND_SOC_DAILINK_DEF(ssp0_port,
> -           DAILINK_COMP_ARRAY(COMP_DUMMY()));
> -#endif
> -
>   /* broadwell digital audio interface glue - connects codec <--> CPU */
>   static struct snd_soc_dai_link broadwell_rt286_dais[] = {
>          /* Front End DAI links */
> @@ -226,7 +218,7 @@ static struct snd_soc_dai_link 
> broadwell_rt286_dais[] = {
>                  .ops = &broadwell_rt286_ops,
>                  .dpcm_playback = 1,
>                  .dpcm_capture = 1,
> -               SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
> +               SND_SOC_DAILINK_REG(dummy, codec, dummy),
>          },
> 

Of course I messed up the mail - above is a revert of said change.
