Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8EC563636
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 16:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D4B116AE;
	Fri,  1 Jul 2022 16:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D4B116AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656687226;
	bh=+0IW1UANJAvSztKc823tMAh+F6Z/wI9gBYC999IMRsE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQQQl2+07eeX27L4U9zGba9/iroEAWqVNj22EoZpqKGVxk5NQ4fhxN39DeIaASO6f
	 nkiG2cBVF755/sfP9nNf0Pg4/kT5m2uhNcyQAcgCB59eR/RgjOQceuEATR5CWeL6GS
	 3RzBgIvOearAPL9IVOzynRF7l3jaJ7Cqt2R/sXE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1320FF804F3;
	Fri,  1 Jul 2022 16:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEE67F80256; Fri,  1 Jul 2022 16:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34127F80155
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 16:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34127F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iDq+mCeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656687133; x=1688223133;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+0IW1UANJAvSztKc823tMAh+F6Z/wI9gBYC999IMRsE=;
 b=iDq+mCeRGHDmUoZ7E7G3Srz99xDeez2P+po/CFexHEWOxTVUmAfNT7jV
 uYlU4VWAU/Y/6m1wZFt5dxIyqidAlz3UOC1XCcgtNCu6o5dSy/xb1notm
 Fg7NWfLVFrqn11KD7zYAmEmqUsuhhEb93MfDP8Voy1YjG+3gry0xlxqX+
 +bqqJU/iuTQeRQ97clt0LDwoAZ8y8dP0vI3f2DgCZ+5QzuwkNMZKpXkNc
 S10TvXEZZN5fgBGZoHcgGvHPd31MoR3kq5CmLvMwxXpTuemQ1cmC7G+LA
 N46HJvDo1o5NLDbhf0njsdDC2xK0D3wkPiuoWC5o66RxJoAOWRXgydfmb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="308183761"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="308183761"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 07:52:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="541758296"
Received: from swathigo-mobl3.amr.corp.intel.com (HELO [10.209.128.76])
 ([10.209.128.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 07:52:07 -0700
Message-ID: <65a5e374-ff3a-ec2d-af70-c042c22decdb@linux.intel.com>
Date: Fri, 1 Jul 2022 08:53:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20220701081908.248239-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220701081908.248239-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>
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



On 7/1/22 03:19, Brent Lu wrote:
> Starting from ADL platform we have four HDMI PCM devices which exceeds
> the size of sof_hdmi array. Since each sof_hdmi_pcm structure
> represents one HDMI PCM device, we remove the sof_hdmi array and add a
> new member hdmi_jack to the snd_soc_jack structure to fix the
> out-of-bounds problem.

Valid fix aligned with other machine drivers, but the commit message is
incorrect: the 4th HDMI link was added in TGL, not ADL.

See e.g. 'Google Volteer', this quirk is already enabled:
SOF_RT5682_NUM_HDMIDEV(4)),

I guess existing topologies for Volteer never used the 4th link?

Wondering how we didn't this problem sooner - and if this needs to be
added to -stable, or if this is only needed for newer platforms.

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
