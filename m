Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1C56320C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 12:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41F01697;
	Fri,  1 Jul 2022 12:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41F01697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656673166;
	bh=DIRi+6ZaJOFr1zg33DBZQTKB2FcrepdEc5EYUaGlRTI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NgL4hhNlbnjzcvDxhjaXaJ39tDNGrjIxu9OZRP3zDvIdlUZnMgoX9BwzEtGsjRTaV
	 xRNI37rxWlfFh6FFtOtVuFvldzZNHFfCUHL/3/z1QOdSgsAImzv+5Qu0hBOuTWotL3
	 5kXVP+IaiKvb7aak/QSXJ77JyGM4MgJLCl7Rv5mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 306F4F800E8;
	Fri,  1 Jul 2022 12:58:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEF8DF80155; Fri,  1 Jul 2022 12:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF8A1F8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 12:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF8A1F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TmL7btSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656673101; x=1688209101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DIRi+6ZaJOFr1zg33DBZQTKB2FcrepdEc5EYUaGlRTI=;
 b=TmL7btScduIdgYllfgKKopnGuVarX6oHludpqEm3lzFYvA2JlVwbLWyT
 Ad5Impu5adMhDWUBlZ9hieRYDQa9I3yFt2B9jTBQ2wBSdCs3Fuo+VFITG
 qwspjcvYHioPdwJqc5IrIU7aWClIHdLT9Jkmo5OmCFqDmkVO0ZkBVmKNT
 5PHJXWEKfQVUsE6oCBrwSwDQPgxjxlzC2TSm543JbriHf/GH3R85LjWAJ
 Pp39XTxgUXl4HxWmez6/dRCWtXno2Y+b9fTkdLc+/3vdXRREyRG8btxdZ
 B9NP2JbI82zwfmpcYD6ZersJu1EB71mkBsYmikDMNzozngvMrW1gO0w9K g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="283725111"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="283725111"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 03:58:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="596219335"
Received: from kerva-mobl2.ger.corp.intel.com (HELO [10.249.254.11])
 ([10.249.254.11])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 03:58:09 -0700
Message-ID: <b38b3159-2d77-f4fd-f269-d708eb1a90a5@linux.intel.com>
Date: Fri, 1 Jul 2022 13:58:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20220701081908.248239-1-brent.lu@intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220701081908.248239-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ajye Huang <ajye.huang@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Yong Zhi <yong.zhi@intel.com>
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



On 01/07/2022 11:19, Brent Lu wrote:
> Starting from ADL platform we have four HDMI PCM devices which exceeds
> the size of sof_hdmi array. Since each sof_hdmi_pcm structure
> represents one HDMI PCM device, we remove the sof_hdmi array and add a
> new member hdmi_jack to the snd_soc_jack structure to fix the

"new member hdmi_jack to the sof_hdmi_pcm structure to fix the"

> out-of-bounds problem.

Other than that:
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/boards/sof_rt5682.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index a24fb71d5ff3..1384716c6360 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -69,11 +69,10 @@ static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
>  
>  static int is_legacy_cpu;
>  
> -static struct snd_soc_jack sof_hdmi[3];
> -
>  struct sof_hdmi_pcm {
>  	struct list_head head;
>  	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_jack hdmi_jack;
>  	int device;
>  };
>  
> @@ -447,7 +446,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
>  	char jack_name[NAME_SIZE];
>  	struct sof_hdmi_pcm *pcm;
>  	int err;
> -	int i = 0;
>  
>  	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
>  	if (is_legacy_cpu || !ctx->idisp_codec)
> @@ -468,17 +466,15 @@ static int sof_card_late_probe(struct snd_soc_card *card)
>  		snprintf(jack_name, sizeof(jack_name),
>  			 "HDMI/DP, pcm=%d Jack", pcm->device);
>  		err = snd_soc_card_jack_new(card, jack_name,
> -					    SND_JACK_AVOUT, &sof_hdmi[i]);
> +					    SND_JACK_AVOUT, &pcm->hdmi_jack);
>  
>  		if (err)
>  			return err;
>  
>  		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> -					  &sof_hdmi[i]);
> +					  &pcm->hdmi_jack);
>  		if (err < 0)
>  			return err;
> -
> -		i++;
>  	}
>  
>  	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {

-- 
Péter
