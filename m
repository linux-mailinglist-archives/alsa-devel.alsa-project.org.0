Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810B28090A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 23:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F261AC1;
	Thu,  1 Oct 2020 23:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F261AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601586254;
	bh=uCIw1x/2LsiAU95AYPoBlH3Rhdxkx5od1hTGIlH2yCs=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tlK9wPvkETeIwuo8Fa2R/eWnXtG6oPEnZbu7OhElSN2KWonFtGnsiRUqY6ldVIkRh
	 52g9OfIF4rjJNO+HTzEaIbPFQvg+hxkTdojHZztSMzY2xBpky8Xqy9BH+lIngqbrQ9
	 rVPZZx4PTPVL/r1d4NO+XvPenAle/4euhRlT8HQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6642F8020C;
	Thu,  1 Oct 2020 23:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A09F801F5; Thu,  1 Oct 2020 23:02:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0203EF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 23:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0203EF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AN/J5VwA"
Received: by mail-lj1-x242.google.com with SMTP id c2so14900ljj.12
 for <alsa-devel@alsa-project.org>; Thu, 01 Oct 2020 14:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SSNs0bfnfbFBTT00Scc/o2Q4LHQ5DSHk1qEp/Pz4D8E=;
 b=AN/J5VwADYA76Pgb1ILLs3QyvSdQKgGFA89Kz1paL/SRfryKOCMqk6zlKdaD9gorXU
 J6emBupStWrUuHgxUd0ww5/fdlFRlQyxd1neUPsaveIVpE0dt2+73cC53ynTFyE0UsmB
 U8RJikjArbMo3qKrJTvHtpZs4Excgn57IjeA4/1C2UIr/6khVCfA+1+BiNiMQymXXmeN
 o9BxJZZFMEyg6yEhKd1tYGb6efUxGNjV94/zCuNqpYeWxswaFQKxUbpH4IE/bixZgC5c
 bWO2pnew4qNYuc8wobT909+iNWVACvta0ikYoM4I9HyjMRWs4GyCNC38Hrj0Cp/Z0qNA
 8MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SSNs0bfnfbFBTT00Scc/o2Q4LHQ5DSHk1qEp/Pz4D8E=;
 b=IEenn8urbQwr5lQuZNPWMVC6wMApm3GSB0i5wIxVeOWAHXaRYwcvBsnywR00bJKnK1
 DQ9phq0YwrdUztQ4ncuCInc767N7PW6dYl5OQ9Seu1hbkBul6JGuCXY1ufejc/W5fOZJ
 vIgWSXGSOmLiZ2jy0a8eiEZpGCAMdJW8SqZo66rG8YB1HVDsWm1QA6jYfbtAf22FMoBK
 CQzn4g66WtS+fXjoBLeJ4LCkZNviTDqpm/ycWZo3MvJvDbHXOkRwHdG/z5me171m7jVI
 ZJ9XsPbWNAiA0v+CGRsLGTQ2RM/lEKM9jMsc6aNgi4NRf1DDaOG7Dw25kAVrSZTC980H
 yNeQ==
X-Gm-Message-State: AOAM533SRDMe55RR1Xu9g8umwY9rzbA6B7ntjsURcN7JePbBLLYeuB6m
 7NxckkK8u5icYO0po+JSmuw=
X-Google-Smtp-Source: ABdhPJz5XnRfga60sGw0/6zljLrglpxtNc3A59nAJ7RuHN1rqqluDt0t8vcaChmCNLiNImD8glh2Mg==
X-Received: by 2002:a05:651c:200b:: with SMTP id
 s11mr2830951ljo.196.1601586144655; 
 Thu, 01 Oct 2020 14:02:24 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id h24sm560686lja.32.2020.10.01.14.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 14:02:23 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
From: Dmitry Osipenko <digetx@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
 pierre-louis.bossart@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
 <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
Message-ID: <352b5f57-baa5-8905-4ac9-1281268270a8@gmail.com>
Date: Fri, 2 Oct 2020 00:02:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 atalambedu@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 nwartikar@nvidia.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

01.10.2020 23:57, Dmitry Osipenko пишет:
> 01.10.2020 20:33, Sameer Pujar пишет:
>> +/* Setup PLL clock as per the given sample rate */
>> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
>> +					struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>> +	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
>> +	struct device *dev = rtd->card->dev;
>> +	struct tegra_audio_graph_data *graph_data =
>> +		(struct tegra_audio_graph_data *)priv->data;
>> +	struct tegra_audio_chip_data *chip_data =
>> +		(struct tegra_audio_chip_data *)of_device_get_match_data(dev);
> 
> void* doesn't need casting
> 

There are several similar places in the code. Not a big deal, but this
makes code less readable than it could be.
