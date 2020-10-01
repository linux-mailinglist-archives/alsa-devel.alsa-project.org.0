Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07162808E5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 22:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9081AC1;
	Thu,  1 Oct 2020 22:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9081AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601585939;
	bh=6NLN+KZDnC8yjiz+M0cKf2KZHxPcPUmhfBD8tjv4in4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVW1cRzbFT0EH8y73oU0Xm18ijo9qB7C6ZNHNjRYkKglWOWoL+HiOOI73EhaP3l94
	 y//uoq1j6+K79cjnXJFwNY6s1jlKLdVtolz85W3tsS2Rij+WpaO3pODS4W+OR2ZlPQ
	 F7U9Yo2dgxbbcdzW70kgjPr4+8FnYFjXvBhBCa8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 443C7F8020C;
	Thu,  1 Oct 2020 22:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC1A0F801D8; Thu,  1 Oct 2020 22:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 780F0F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 22:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780F0F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pB1zmEc6"
Received: by mail-lj1-x242.google.com with SMTP id s205so23068lja.7
 for <alsa-devel@alsa-project.org>; Thu, 01 Oct 2020 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XflpFmvYU4ZauRyF/CvBEwazfjgIznjHbxbdFQln060=;
 b=pB1zmEc6F+GNDrYLg2UDm3+/iTPpyEZy82EwS6wWv6/OIbXMKTiu2yN//9Ac84AiNg
 gTXy52KKNB6js3gVl0ifMsGb85RSdIHM+Ln17kx1FCqgfg24pXWZlcP2s90nvmWrVM8g
 f4OTw3GEdfH48iFyfS1wUWfouG8Xb41rFGvMYH7uLW+gwoAZZ80Eb2es1GBX+QFqJuZT
 tIy/40aGUd+Ld5xjZecBZoiwey8WewTHJBUr7c98dsRf4z5orc937BsQ3dLa+8wtKxd4
 QUSLJjImPfuVBbG7KLdWIM9TQkD1nLXri/a2+ktop2U2v3DGIuYLL3XP/0jKV8XGblP9
 3mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XflpFmvYU4ZauRyF/CvBEwazfjgIznjHbxbdFQln060=;
 b=jDGScbuze0NgkKw9/yfDhIpg+/Bg6Ng6pPnViPdfuOK8KATbfLwoF2wzAdte+BEHNu
 5/tCUSvkWV/geizy0bFIgCxv3Gy+Ldn76Tw13TXoOtrsxGPRsznVaSzkKBblRMWSeM4r
 8ff1liXI8k5Vi/wCSmjZB80TEPeciABcrNhx/Y09PUGlGohpxtS1kEm6ezOmprkwRUMN
 2SLswbkLYaCb/+4Of88LvGnJIqH9+6aJ0kM0M4b0nLouzbyhDfxcbAz50Zz8k8DaV0k5
 JcaCEofcpHiKXTZc/+oCyNF0m9VGOr4V0//FeqaGuWWEuB/ZP/Jwyf0vyICEsn6q+HUX
 xe8w==
X-Gm-Message-State: AOAM5303H4eW93EUCAyMXYJMnuTSxAdhLOZKhagsMq09rVh4wUb3D086
 Vju46HdImZbGDMLmE3i+nCw=
X-Google-Smtp-Source: ABdhPJzzGOQYtFDLJ0Uinx31Or+7BavRRvl4lQZJncQmtxUElVDfDWAHIwhVcDOYFMPCeoTTheo3UQ==
X-Received: by 2002:a2e:9d8a:: with SMTP id c10mr3146731ljj.83.1601585824206; 
 Thu, 01 Oct 2020 13:57:04 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id g23sm712844lfb.230.2020.10.01.13.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 13:57:03 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
 pierre-louis.bossart@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
Date: Thu, 1 Oct 2020 23:57:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1601573587-15288-11-git-send-email-spujar@nvidia.com>
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

01.10.2020 20:33, Sameer Pujar пишет:
> +/* Setup PLL clock as per the given sample rate */
> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	struct device *dev = rtd->card->dev;
> +	struct tegra_audio_graph_data *graph_data =
> +		(struct tegra_audio_graph_data *)priv->data;
> +	struct tegra_audio_chip_data *chip_data =
> +		(struct tegra_audio_chip_data *)of_device_get_match_data(dev);

void* doesn't need casting
