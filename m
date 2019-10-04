Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C7CC4F5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 23:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69B88168B;
	Fri,  4 Oct 2019 23:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69B88168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570225357;
	bh=x0aGR24nYhq7eFYNn+q8EQzJ/iErhVPPrYjsaeYWDy0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k1KW99DjC91TM02c/79wRPhU2bDBMTRQobg5qF3smjft7lJ9A3QgnzpCw0XVz2GCD
	 CMJKBr7KJCE+i3NeroIl5C96/8V8zUO2YDsXjLkuat5EcnyBOCVUC8kc12xeF8PuO1
	 frJGPwOtTrRcPa9k+mFHCGyGZQPs5NRrVdjb86ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D95C3F80137;
	Fri,  4 Oct 2019 23:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 896E8F80391; Fri,  4 Oct 2019 23:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F11F80137
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 23:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F11F80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 14:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,257,1566889200"; d="scan'208";a="186382566"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 04 Oct 2019 14:40:44 -0700
Received: from omukherj-mobl4.amr.corp.intel.com (unknown [10.251.29.2])
 by linux.intel.com (Postfix) with ESMTP id E6833580378;
 Fri,  4 Oct 2019 14:40:43 -0700 (PDT)
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20191004154127.28459-1-ranjani.sridharan@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <304027eb-ea44-ae4f-b4b2-f2020f528312@linux.intel.com>
Date: Fri, 4 Oct 2019 16:40:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004154127.28459-1-ranjani.sridharan@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com
Subject: Re: [alsa-devel] [RFC PATCH 0/2] Alter the trigger order for FE/BE
 DAI's based on command
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

On 10/4/19 8:41 AM, Ranjani Sridharan wrote:
> Currently, the trigger orders SND_SOC_DPCM_TRIGGER_PRE/POST
> determine the order in which FE DAI and BE DAI are triggered.
> In the case of SND_SOC_DPCM_TRIGGER_PRE, the FE DAI is
> triggered before the BE DAI and in the case of
> SND_SOC_DPCM_TRIGGER_POST, the BE DAI is triggered before
> the FE DAI. And this order remains the same irrespective of the
> trigger command.
>      
> In the case of the SOF driver, during playback, the FW
> expects the BE DAI to be triggered before the FE DAI during
> the START trigger. The BE DAI trigger handles the starting of
> Link DMA and so it must be started before the FE DAI is started
> to prevent xruns during pause/release. This can be addressed
> by setting the trigger order for the FE dai link to
> SND_SOC_DPCM_TRIGGER_POST. But during the STOP trigger,
> the FW expects the FE DAI to be triggered before the BE DAI.
> Retaining the same order during the START and STOP commands,
> results in FW error as the DAI component in the FW is still
> active.
>      
> The issue can be fixed by mirroring the trigger order of
> FE and BE DAI's during the START and STOP trigger. So, with the
> trigger order set to SND_SOC_DPCM_TRIGGER_PRE, the FE DAI will be
> trigger first during SNDRV_PCM_TRIGGER_START/STOP/RESUME
> and the BE DAI will be triggered first during the
> STOP/SUSPEND/PAUSE commands. Conversely, with the trigger order
> set to SND_SOC_DPCM_TRIGGER_POST, the BE DAI will be triggered
> first during the SNDRV_PCM_TRIGGER_START/STOP/RESUME commands
> and the FE DAI will be triggered first during the
> SNDRV_PCM_TRIGGER_STOP/SUSPEND/PAUSE commands.
> 
> My first thought was to use a BESPOKE trigger for the SOF driver
> but looking more into the implementation of the bespoke trigger
> in soc_pcm_bespoke_trigger() didnt indicate it had much to do
> with the ordering of the FE/BE DAI's but rather just use the
> bespoke trigger callbacks in the DAI driver.
> 
> More details on the SOF issue can be found in:
> Github Issue: https://github.com/thesofproject/linux/issues/1160

I am a bit confused because that GitHub link does not provide any test 
results, and the PR1277 CI results show only half of the platforms 
tested. not sure why. I also don't get if this is an issue specific to 
the HDaudio Link DMA or if this is a across-the-board issue.

The other comment is that I see quite a few legacy Intel machine drivers 
with the POST trigger hard-coded for front-ends, and we'd need to retest 
some of these platforms to see if this change broke them.

> 
> Ranjani Sridharan (2):
>    ASoC: pcm: update FE/BE trigger order based on the command
>    ASoC: SOF: topology: set trigger order for FE DAI link
> 
>   sound/soc/soc-pcm.c      | 99 +++++++++++++++++++++++++++++-----------
>   sound/soc/sof/topology.c |  4 ++
>   2 files changed, 76 insertions(+), 27 deletions(-)
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
