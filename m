Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869967C52A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 08:55:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464261E1;
	Thu, 26 Jan 2023 08:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464261E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674719711;
	bh=1kryI9fmp/0/7tgRDGf0+gzDLXBckxfaq5aCAfPWxFM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eQLs9FvPufo/yQlFkpz2ajwSLOJO6NaFvhqlWGj4m42zSVx+sUHwAB82fbiAV+Lnf
	 pG+m9Y08vJRfDk1p3qnkPNgpZvpQNGMIbq5W3o5gzqMDNXvcxt8B/DeE6YbHWgvdrl
	 3odx3Hprc+I46hZEYvYc+5j02DsuI3GM+0Rck/iU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 649FBF80224;
	Thu, 26 Jan 2023 08:54:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68EF7F8027D; Thu, 26 Jan 2023 08:54:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFD7F800AE
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 08:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFD7F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DagpuqJm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674719645; x=1706255645;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1kryI9fmp/0/7tgRDGf0+gzDLXBckxfaq5aCAfPWxFM=;
 b=DagpuqJm8Bt1xKF5IXZqQ2Sb7at2RwfnAS2ISzdAt2zrI7HqCndBQrdi
 8GrquUZEwzG1iJJkNdtZgy13AlKUsx5ijeixNe8fVcmoa//kGT21aSYHW
 7fWTQ3Qtfo7+4p1xmX2T3kKc0wVX84dvWPHr6lcUVA8u0MEJu3qEwlqT9
 aAbxDbEzE60R+66sY/sfs6Q+CrMd9u77Y7Xww/Fzlw1eDnKyo2FblENCw
 aFOj6yjVXNOX+DnvUn7T63L5t6cXc+bymYTmb++ndfdXs7JoaLOqw4f57
 YBTIBDlJLpFcnHpQf/qTAPno7eFATCf5Zm63W5vNf8R43BmYZOA0Bi9fh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="325430953"
X-IronPort-AV: E=Sophos;i="5.97,247,1669104000"; d="scan'208";a="325430953"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 23:54:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="805294069"
X-IronPort-AV: E=Sophos;i="5.97,247,1669104000"; d="scan'208";a="805294069"
Received: from mericx-mobl.ger.corp.intel.com (HELO [10.252.29.93])
 ([10.252.29.93])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 23:53:56 -0800
Message-ID: <6f0301dd-ce1f-084a-f29b-27bf897804de@linux.intel.com>
Date: Thu, 26 Jan 2023 09:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/5] ASoC: amd: acp: Refactor i2s clocks programming
 sequence
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20230109132104.1259479-1-venkataprasad.potturu@amd.com>
 <20230109132104.1259479-4-venkataprasad.potturu@amd.com>
 <92052eef-3c61-7f3e-75c1-09b76cd38e24@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <92052eef-3c61-7f3e-75c1-09b76cd38e24@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 25/01/2023 19:15, Pierre-Louis Bossart wrote:
> This patch adds new Sparse warnings [1]:
> 
> sound/soc/amd/acp/acp-mach-common.c:189:35: error: restricted
> snd_pcm_format_t degrades to integer
> sound/soc/amd/acp/acp-mach-common.c:333:35: error: restricted
> snd_pcm_format_t degrades to integer
> sound/soc/amd/acp/acp-mach-common.c:478:35: error: restricted
> snd_pcm_format_t degrades to integer
> sound/soc/amd/acp/acp-mach-common.c:619:35: error: restricted
> snd_pcm_format_t degrades to integer
> 
>> @@ -193,7 +163,11 @@ static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
>>  	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>>  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>>  	int ret;
>> -	unsigned int fmt;
>> +	unsigned int fmt, srate, ch, format;
>> +
>> +	srate = params_rate(params);
>> +	ch = params_channels(params);
>> +	format = 8 * params_format(params);
> 
> This last line looks suspicious, no? format-to-physical-size conversions
> should be using existing macros.

not only that, but the "8 * params_format(params)" is certainly not
correct for the purpose.

params_format() returns SNDRV_PCM_FORMAT_*, which is basically an enum:
SNDRV_PCM_FORMAT_S8		0
SNDRV_PCM_FORMAT_S16_LE		2
SNDRV_PCM_FORMAT_S24_LE		6
SNDRV_PCM_FORMAT_S24_3LE	32
SNDRV_PCM_FORMAT_S32_LE		10

include/uapi/sound/asound.h

> Should it be
> 
> format = params_physical_width(params);

I believe this was the intention.

> 
> ?
> 
> 
>> +	/* Set tdm/i2s1 master bclk ratio */
>> +	ret = snd_soc_dai_set_bclk_ratio(codec_dai, ch * format);
>> +	if (ret < 0) {
>> +		dev_err(rtd->dev, "Failed to set rt5682 tdm bclk ratio: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!drvdata->soc_mclk) {
>> +		ret = acp_clk_enable(drvdata, srate, ch * format);
>> +		if (ret < 0) {
>> +			dev_err(rtd->card->dev, "Failed to enable HS clk: %d\n", ret);
>> +			return ret;
>> +		}
> 
> [1]
> https://github.com/thesofproject/linux/actions/runs/4005001249/jobs/6874834205

-- 
Péter
