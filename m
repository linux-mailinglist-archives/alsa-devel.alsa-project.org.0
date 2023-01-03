Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D565C38F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 17:08:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAFE42CB5;
	Tue,  3 Jan 2023 17:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAFE42CB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672762126;
	bh=10rPs+q/6GprahqHx1aTzXOGUTqi4tY+HjtFhoTQcd8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GQDNg5jEuITbQAAGVicxWDxe39VnfIBZf0SH68ujlLQ4LjV7A7ClgViJV1BxUtfcH
	 Q6ZTBPQ3uJ5ozJIn1hsd6uHg6/tsOLqwVyrtn7SbQ+fGCc9KbY1D8pgSCULMFbvNWh
	 3XQ3zZKZw9KWWBcint3OUQmw2bQKYAjzS5/N2snw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C0CF804AA;
	Tue,  3 Jan 2023 17:07:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D89E5F804CB; Tue,  3 Jan 2023 17:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C543F803DC
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 17:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C543F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QNy+9LN7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672762048; x=1704298048;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=10rPs+q/6GprahqHx1aTzXOGUTqi4tY+HjtFhoTQcd8=;
 b=QNy+9LN7otTb394l5TnYnXgPDbhU75nGM9u8thXW9mC2o/m5Uf/mvdwS
 nV6WRETgXh9Mvic3DYqdKnaUqfc1P3sj2rg3RAkfLKW0c3AoxfTAPnDCy
 2gWW/tRYS7QyAWsDVbvoSHMJWYaErN5j0hMPTv9nQpWRDo10EgzsY/gM3
 R+M82jg4FT6TlDFMoP/NiVb2zwjWaSHEiwUW/nPclLfpDCe1n/GsgYUH3
 J3jiJTRMiubGAmuD6+lNXyHd1hYfflXhSUw/eNe7IyA/D21LT/xK+j7kB
 9naHrizYjj3StHEsq3Aqy8dOa1vXYFuWPDxiEwPEPe2/FdNaMOESyBZon Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="305196336"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="305196336"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 08:07:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="743546034"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="743546034"
Received: from nkpuppal-mobl2.amr.corp.intel.com (HELO [10.209.178.199])
 ([10.209.178.199])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 08:07:21 -0800
Message-ID: <393a6418-0963-4859-3212-2f959be4f14f@linux.intel.com>
Date: Tue, 3 Jan 2023 09:13:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: Intel: sof_ssp_amp: remove unused variable
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20230103073704.722027-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230103073704.722027-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/3/23 01:37, Brent Lu wrote:
> The variable becomes useless since we moved the snd_soc_jack
> structure from a static array to sof_hdmi_pcm structure.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_ssp_amp.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
> index 94d25aeb6e7c..f75800d9d6de 100644
> --- a/sound/soc/intel/boards/sof_ssp_amp.c
> +++ b/sound/soc/intel/boards/sof_ssp_amp.c
> @@ -105,7 +105,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
>  	char jack_name[NAME_SIZE];
>  	struct sof_hdmi_pcm *pcm;
>  	int err;
> -	int i;
>  
>  	if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
>  		return 0;
> @@ -124,7 +123,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
>  		return hda_dsp_hdmi_build_controls(card, component);
>  	}
>  
> -	i = 0;
>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>  		component = pcm->codec_dai->component;
>  		snprintf(jack_name, sizeof(jack_name),
> @@ -139,8 +137,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
>  					  &pcm->sof_hdmi);
>  		if (err < 0)
>  			return err;
> -
> -		i++;
>  	}
>  
>  	return hdac_hdmi_jack_port_init(component, &card->dapm);
