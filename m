Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1824107691
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:39:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE38A1832;
	Fri, 22 Nov 2019 18:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE38A1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574444379;
	bh=XC6UrEgy/6POE9rSxbjzzSJVKipHC6C7orvTcHdGJNI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4oyxLT2XUrfTBsbSBF7JcP/FIZvWd9CJtyFHoZV7lqpxdZYGybldmOfPFw+sANid
	 WZiAONGthvkDoFyhv7zUpMHIFHetSTBOvcMgk2pXjdbOYcHguTpSnwYA8VngV8SKao
	 1qrC4r05mwDjMgo37HJf8Al6vA+o4KHdvQlKpxyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 463AEF8015D;
	Fri, 22 Nov 2019 18:38:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E90F8015A; Fri, 22 Nov 2019 18:38:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C78DCF8014A
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C78DCF8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="238682956"
Received: from sygreen1-mobl4.amr.corp.intel.com (HELO [10.252.195.68])
 ([10.252.195.68])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2019 09:38:35 -0800
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191122083800.9924-1-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7164dd8d-699a-6c5e-ab92-0068b248b4f0@linux.intel.com>
Date: Fri, 22 Nov 2019 08:50:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191122083800.9924-1-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF - topology - do not change the
 link triger order for old firmare
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



On 11/22/19 2:38 AM, Jaroslav Kysela wrote:
> BugLink: https://github.com/thesofproject/sof/issues/2102

This one is complicated.

The change of the trigger order is required in order to avoid DMA 
underflows.

But if you make this change, this exposes another issue in the firmware 
that leads to the a panic on some platforms (I couldn't reproduce it 
myself on a WHL HDAudio+dmic device), and unfortunately the fix for this 
DSP panic is not in the released 1.3 firmware.

With this proposal from Jaroslav, users of the older firmware will not 
see the panic but they are still facing potential underflows.

So long story short, I don't mind if we add this patch to solve the DSP 
panic, but there should be a clear explanation in the commit message 
that this is far from ideal and that an update to 1.4 is really desirable.

We may also need to look at different ways to identify the firmware, in 
this case the problem is not due to the ABI proper but a change in the 
timing sequences, we may need a different sort of ID here?

> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/sof/topology.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 143b8259a70a..d24268794a03 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -2935,6 +2935,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
>   	struct snd_soc_tplg_private *private = &cfg->priv;
>   	struct sof_ipc_dai_config config;
>   	struct snd_soc_tplg_hw_config *hw_config;
> +	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
>   	int num_hw_configs;
>   	int ret;
>   	int i = 0;
> @@ -2952,9 +2953,12 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
>   	if (!link->no_pcm) {
>   		link->nonatomic = true;
>   
> -		/* set trigger order */
> -		link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
> -		link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> +		/* this causes DSP panic on firmware v1.3 */
> +		if (SOF_ABI_VER(v->major, v->minor, v->micro) > SOF_ABI_VER(3, 7, 0)) {
> +			/* set trigger order */
> +			link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
> +			link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> +		}
>   
>   		/* nothing more to do for FE dai links */
>   		return 0;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
