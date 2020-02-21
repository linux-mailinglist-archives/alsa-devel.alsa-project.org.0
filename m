Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F06166F74
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 07:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 136F516B5;
	Fri, 21 Feb 2020 07:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 136F516B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582265435;
	bh=ZlYGlBjS4Y5Vgdso/uXf1MDPXbZ7DBzYXIE+Zl7wncs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P/G44/ndWZxpWen3bt+R9SdV3LUStvxgBlSq84Q2D32gd5+VU9VKQA3x60tZumkTS
	 +0JpOOikuaxWBlNyZJCkgv/9LYc81etnijRgP9Je0bd/ETKkvYhsgE7M5BdHQF81K7
	 5kRchLmp3pr7AeTdpSaBzjy4kjhaN1F1Ifw9ydso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF861F80240;
	Fri, 21 Feb 2020 07:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90783F8025F; Fri, 21 Feb 2020 07:08:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7468CF80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 07:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7468CF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bmK1U1D9"
Received: by mail-lf1-x143.google.com with SMTP id s23so593897lfs.10
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 22:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1vjAsiVJu0Xf8moFlCsGCMAJaKUjfw7ZDgAxe/OTIBI=;
 b=bmK1U1D9Co0bNdjfb+Z8qyJSGQPOYJ/YlJsmmQjLdyG+mc3GEI8QcnmDPDClvjSrlV
 qIWAZdaZF9lG5TNbsWT2bUyhgKw03sCn86fEovTL6AO3LS25lrytfgvN1zI8vyn0kOPb
 F8IDkLuzkoq82LcLcxsx2xVx+xR+cGhfPIfNtErtqS1DAQP3ZPS7bkMiVK/sJ0IdsE3R
 ZZWOWzcyi73Wrv6dC1C/aJ7D+J/C9dy7sXF2KgZymprTP95BFiXvVGsUUPa5dcf1AhHR
 Yvo8pvgGZ4VmWvRRHjEtHKND73qL9kig8EMj8GZ6KWa4ra1qyQILj/zoueL3KoKwMuHN
 EZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1vjAsiVJu0Xf8moFlCsGCMAJaKUjfw7ZDgAxe/OTIBI=;
 b=meG4HtELGbHM9fq8RmF2SIa1r7/bQFl1OSXX0O1Jiio7y7IgS7vE2YdgtVRR2+UoXV
 qTqd1N6d2aHmC399kRW72oen453owVAfPPExzPMXb6uvhS5sK4joOJyzBOs+5hr2yGGR
 HGJTaKzszbf7uk5k+YYTlenUVXxmDodCMEaHN4G67zhbGcaTYkd24haVajXAasmsn7sk
 858n8ooTHybV+wj2i4W4z5d2lCN9NMPu02gqymn9UBhViFfPDmkV2/VnLKcmYcBI7F5q
 r8XWMwlWTjT2Nt5wUSOlbsEaDoRltxBz1OR3/VJGnkZKQVRaQ42GsEaiR/LmyXiAV65W
 9hCw==
X-Gm-Message-State: APjAAAX4J0eHijfeka8xoBFOeKy+UF6eYfTb0/hgcqgXDmPOxEK+sr9D
 YqUWC3bWDUFZJSaa+s2ZsUY=
X-Google-Smtp-Source: APXvYqzDj/Q/sNBvdjs+fIyINcfoBTt6Aby1wfLyTGnlgZfFHhDa0HRT97+rsnLll7pN6lDNn26++Q==
X-Received: by 2002:a19:6509:: with SMTP id z9mr18447794lfb.97.1582265326236; 
 Thu, 20 Feb 2020 22:08:46 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id a10sm970539lfr.94.2020.02.20.22.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 22:08:45 -0800 (PST)
Subject: Re: [PATCH v3 07/10] ASoC: tegra: add Tegra210 based ADMAIF driver
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-8-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e6114203-57d1-bc74-f786-c2246ccb4341@gmail.com>
Date: Fri, 21 Feb 2020 09:08:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-8-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

20.02.2020 09:34, Sameer Pujar пишет:
> ADMAIF is the interface between ADMA and AHUB. Each ADMA channel that
> sends/receives data to/from AHUB must intreface through an ADMAIF channel.
> ADMA channel sending data to AHUB pairs with an ADMAIF Tx channel and
> similarly ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
> channel. Buffer size is configuranle for each ADMAIF channel, but currently
> SW uses default values.
> 
> This patch registers ADMAIF driver with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes ADMAIF interfaces, which can be used to connect different
> components in the ASoC layer. Makefile and Kconfig support is added to
> allow to build the driver. The ADMAIF device can be enabled in the DT via
> "nvidia,tegra210-admaif" compatible binding.
> 
> Tegra PCM driver is updated to expose required PCM interfaces and
> snd_pcm_ops callbacks.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
...
> +int tegra_pcm_construct(struct snd_soc_component *component,
> +			struct snd_soc_pcm_runtime *rtd);
> +void tegra_pcm_destruct(struct snd_soc_component *component,
> +			struct snd_pcm *pcm);
> +int tegra_pcm_open(struct snd_soc_component *component,
> +		   struct snd_pcm_substream *substream);
> +int tegra_pcm_close(struct snd_soc_component *component,
> +		    struct snd_pcm_substream *substream);
> +int tegra_pcm_hw_params(struct snd_soc_component *component,
> +			struct snd_pcm_substream *substream,
> +			struct snd_pcm_hw_params *params);
> +int tegra_pcm_hw_free(struct snd_soc_component *component,
> +		      struct snd_pcm_substream *substream);
> +int tegra_pcm_mmap(struct snd_soc_component *component,
> +		   struct snd_pcm_substream *substream,
> +		   struct vm_area_struct *vma);

> +int tegra_pcm_trigger(struct snd_soc_component *component,
> +		      struct snd_pcm_substream *substream, int cmd);

Looks like this function doesn't exist.
