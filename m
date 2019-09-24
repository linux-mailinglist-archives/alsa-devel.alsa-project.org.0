Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865DBC55F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 12:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C733B167B;
	Tue, 24 Sep 2019 12:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C733B167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569319542;
	bh=VaS+sIidOTPz56us3XUmhKlQNuzL7iK7fS1I9HmRwv0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WKXyjqfyIWcA6v3AhqK1SsPNVkwi1e3iL+QKX5lndbrjRwWE95a8Uzfl9QS8CUNxj
	 TxRrfNxzaTHpiEc/C3pzkEsKElEor0WAlrmtcW7YIjZV9VUovN/S3yI6lnxBlB/RXR
	 W+h+S2xVAWsrR64eQMBZLaCV8Vu61/ONr+ym4KiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55BA8F80533;
	Tue, 24 Sep 2019 12:03:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21B44F8045F; Tue, 24 Sep 2019 12:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0496AF800B4
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 12:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0496AF800B4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 03:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="193402869"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga006.jf.intel.com with ESMTP; 24 Sep 2019 03:03:48 -0700
Date: Tue, 24 Sep 2019 13:03:47 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: sathya.prakash.m.r@intel.com
In-Reply-To: <1569312546-16393-2-git-send-email-sathya.prakash.m.r@intel.com>
Message-ID: <alpine.DEB.2.21.1909241216510.16459@zeliteleevi>
References: <1569312546-16393-1-git-send-email-sathya.prakash.m.r@intel.com>
 <1569312546-16393-2-git-send-email-sathya.prakash.m.r@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: naveen.m@intel.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Intel: boards: Add CML m/c using
 RT1011 and RT5682
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Tue, 24 Sep 2019, sathya.prakash.m.r@intel.com wrote:

> +       /* need to enable ASRC function for 24MHz mclk rate */                                                                                                                                         
> +       rt5682_sel_asrc_clk_src(component, RT5682_DA_STEREO1_FILTER |                                                                                                                                  
> +                                       RT5682_AD_STEREO1_FILTER,                                                                                                                                      
> +                                       RT5682_CLK_SEL_I2S1_ASRC);    

please align to opening parenthesis to align with rest of the file.

> +static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
> +	/*speaker*/
> +	{"TL Ext Spk", NULL, "TL SPO"},
> +	{"TR Ext Spk", NULL, "TR SPO"},
> +	{"WL Ext Spk", NULL, "WL SPO"},
> +	{"WR Ext Spk", NULL, "WR SPO"},
> +
> +	/* HP jack connectors - unknown if we have jack detection */
> +	{ "Headphone Jack", NULL, "HPOL" },
> +	{ "Headphone Jack", NULL, "HPOR" },

like other reviewer commented, there is a mix of spacing that should be 
fixed. OTOH, there are similar mixed styles in existing machine drivers, 
so that's probably where it's coming from, but better to still fix in new 
code.

> +	/* DMIC */
> +	{"DMic", NULL, "SoC DMIC"},

Here's another instance of above.

> +	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> +		component = pcm->codec_dai->component;
> +		snprintf(jack_name, sizeof(jack_name),
> +			 "HDMI/DP, pcm=%d Jack", pcm->device);
> +		ret = snd_soc_card_jack_new(card, jack_name,
> +					    SND_JACK_AVOUT, &hdmi_jack[i],
> +					    NULL, 0);
> +		if (ret)
> +			return ret;

The HDMI jack registration part will need to be updated once my
series to support snd-hda-codec-hdmi goes in:

https://mailman.alsa-project.org/pipermail/alsa-devel/2019-September/155456.html

... but your patch is ok as it is. I'll send a patch to update this 
machine driver as well if your patch goes in first. There's no harm unless 
you explicitly enable the new HDMI codec driver in Kconfig.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
