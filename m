Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52C18C069
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 20:30:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C6F217A9;
	Thu, 19 Mar 2020 20:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C6F217A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584646226;
	bh=9pMYflegiAAZddD/XQTVh7fZU1uXy+lotoeiv0tTTwU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQjSbgvHBVWpgYxNDcmp7O8jal0qqY36b6icPKnECGC1SFXKLLrWLsTgAGOPpmL5u
	 lu+oq0qovep7e9O45XqkgFH1AHq+NUFRgmoGubYN5/PiVfQiiydwTghfYj5gat0Mok
	 6tqZUuicWjzni0Ia1KNCwsYcjX+8DdAUKC1jShfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E11F4F8024A;
	Thu, 19 Mar 2020 20:29:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C262F8024A; Thu, 19 Mar 2020 20:29:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5093F800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 20:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5093F800C0
IronPort-SDR: fBUgugsgRPpAaOkluEg53bMlze4AXMtqVxIa8g5B73bi9lonXvR3n3OzO4vQqqPnLDvb2xKhlO
 wbFWmGHP1DmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 12:29:15 -0700
IronPort-SDR: HJk9UGB0pFLCeijcEO7heIOLrUSG9AkWwihnxQGX/KUNafMc07oM6K76oHTP+3zg1IpK5+aAZ/
 9wJIIv/vZhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="391905457"
Received: from mallani-mobl.amr.corp.intel.com (HELO [10.255.35.49])
 ([10.255.35.49])
 by orsmga004.jf.intel.com with ESMTP; 19 Mar 2020 12:29:13 -0700
Subject: Re: [PATCH v2] ASoC: Intel: boards: add stereo playback by woofer
 speaker
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1584504614-15191-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e12440ca-f1e9-cc84-da68-5a1b53c38ce9@linux.intel.com>
Date: Thu, 19 Mar 2020 12:15:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1584504614-15191-1-git-send-email-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com, mac.chiang@intel.com,
 broonie@kernel.org
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



On 3/17/20 11:10 PM, 
"mac.chiang@intel.com--cc=pierre-louis.bossart"@linux.intel.com wrote:

Fixed email

> From: Mac Chiang <mac.chiang@intel.com>
> 
> support woofer stereo speakers individually

Both the commit title and message are a bit misleading. should be 
something like

"
ASoC: Intel: boards: cml_rt1011: split woofer and tweeter support

Support Woofer stereo speakers by default and optionally Tweeter stereo 
speakers with a DMI quirk
"

The rest looks mostly good except for one memory allocation test and a 
couple of nitpicks. Care to send a v3?

Thanks.
-Pierre

> @@ -302,10 +378,8 @@ SND_SOC_DAILINK_DEF(ssp1_pin,
>   	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
>   SND_SOC_DAILINK_DEF(ssp1_codec,
>   	DAILINK_COMP_ARRAY(
> -	/* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
> -	/* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI),
> -	/* TL */ COMP_CODEC("i2c-10EC1011:02", CML_RT1011_CODEC_DAI),
> -	/* TR */ COMP_CODEC("i2c-10EC1011:03", CML_RT1011_CODEC_DAI)));
> +       /* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
> +       /* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI)));

is the alignment change needed?

> @@ -456,6 +525,65 @@ static int snd_cml_rt1011_probe(struct platform_device *pdev)
>   	snd_soc_card_cml.dev = &pdev->dev;
>   	platform_name = mach->mach_params.platform;
>   
> +	dmi_check_system(sof_rt1011_quirk_table);
> +
> +	dev_info(&pdev->dev, "sof_rt1011_quirk = %lx\n", sof_rt1011_quirk);
> +
> +	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
> +				SOF_RT1011_SPEAKER_TR)) {
> +		rt1011_dais_confs = devm_kzalloc(&pdev->dev,
> +					sizeof(struct snd_soc_codec_conf) *
> +					SPK_CH, GFP_KERNEL);
> +
> +		if (!rt1011_dais_confs)
> +			return -ENOMEM;
> +
> +		rt1011_dais_components = devm_kzalloc(&pdev->dev,
> +					sizeof(struct snd_soc_dai_link_component) *
> +					SPK_CH, GFP_KERNEL);
> +
> +		if (!rt1011_dais_components)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < SPK_CH; i++) {
> +			rt1011_dais_confs[i].dlc.name = devm_kasprintf(&pdev->dev,
> +								GFP_KERNEL,
> +								"i2c-10EC1011:0%d",
> +								i);

if (!rt1011_dais_confs[i].dlc.name)
     return -ENOMEM;

> +			switch (i) {
> +			case 0:
> +				rt1011_dais_confs[i].name_prefix = "WL";
> +				break;
> +

spurious newline?

> +			case 1:
