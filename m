Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC523905C0
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 17:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D22D172E;
	Tue, 25 May 2021 17:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D22D172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621957346;
	bh=tlrVCCHYvRixYV7EhNuSmRbRJimP1H0/VZzXMOUQq2w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVacsKyWkfu+/cLSDYIQaLHE2A5aVEJRKMDgFif1FL+LjAUov029ku9cyPn54gdms
	 efL8uEhy4yL4BKHtGwSvLzA+lnSMbJaDJEPqGzfO8l6U8oqw3cTihP0AnkR4EBTTAF
	 zye6upwIPPBXo/Wz3GKdC11jluwZ2dgPwDozwp30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D24D9F800F7;
	Tue, 25 May 2021 17:40:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 799B1F800CB; Tue, 25 May 2021 17:40:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1C57F80032
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 17:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C57F80032
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K2h+JZ6t"
Received: by mail-lf1-x133.google.com with SMTP id i9so46775435lfe.13
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IFrntmU7PddzAkDzge96jDF8ouDIB5cnkfcWeXlAZik=;
 b=K2h+JZ6tueBFtMBPM5XxRFuUDrQNTec6uhRy/PaD/OY3S1U41weJT0i4140LWU4UEn
 VDmaJf+wGs/eEaqkP5IO7WoEJXl4NujIRKImmo9DacvCQwxCYBVMMmH11Ctr1KBjJfpV
 cRdbthGrtTEKt/JDatjDpKFZcTaer2cfixBrpMAexU4h48+DalqGUkR30/fE9HUMz9xF
 LXjh8xzJCtrQx0KPjEd5DqzjQX7E/iSVi3wSxwDDqrUinxLaA9t7LuJ08kCcKLsT71qV
 syODkVSAsyNolmv+uHxOzNhtIsxcd749ddNC2Qdoza1P+qNfwWDmiOOMYPiTgCabQzaB
 nhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IFrntmU7PddzAkDzge96jDF8ouDIB5cnkfcWeXlAZik=;
 b=uImSbKBZj7gB9aHgS41XioHaI2xCxssabANwActWTBNX4mxhITVc1B6Di7t1AfAepA
 b9DXDUfTgFt892P5KyGVdPkrwB/D/03laSVmtp1tkF3vly57I2xcWaeYU4vkhOBJ0hf5
 2zsMYaNPbrV5zYG56c3IXx7HWQ9DXfTOysRMrWkX/iHVJevBeFNfDFWzXOJM+/AHtdhh
 75rCXF8pS59FzpEVqW5eOHa0lNzF6lZbtYO1LlvBudg1bWXJy3xz97WWkjfJ/XwAy8Kf
 3OPWHAz01ZAjdcMppoRK+sweQC5w6oMyV/JTpI2cUNjS/YnV4WhkFbP9HDYmxVEBTz1t
 02tQ==
X-Gm-Message-State: AOAM533meZF8Ij3GGG4nHTjWJIi6XUnruUUli0pYZ/CxpSt+Egm0MHw8
 kMjmF6ntEQskq+IKPFUggaY6qZsKwBE=
X-Google-Smtp-Source: ABdhPJycwwa0af6h45l1eZwV4E8v2zg65tkgOnJuFEGrufqa2gh1wXA3dsK+vfv4FkUdj3VPMwyomg==
X-Received: by 2002:a05:6512:10c4:: with SMTP id
 k4mr13095593lfg.124.1621957250144; 
 Tue, 25 May 2021 08:40:50 -0700 (PDT)
Received: from [192.168.2.145] (46-138-180-236.dynamic.spd-mgts.ru.
 [46.138.180.236])
 by smtp.googlemail.com with ESMTPSA id p14sm2126434ljc.58.2021.05.25.08.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 08:40:49 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
 <03775d09-f3ff-ff7a-626a-812163d6871d@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d8ee8f62-6046-f7d8-5a27-0626f2eaeb80@gmail.com>
Date: Tue, 25 May 2021 18:40:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <03775d09-f3ff-ff7a-626a-812163d6871d@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

25.05.2021 11:40, Jon Hunter пишет:
> 
> On 24/05/2021 00:44, Dmitry Osipenko wrote:
>> Specify components string for Nexus 7 using the Intel BayTrail components
>> format. This may allow us to create a more generic UCM for RT5640 codec.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
>> index a81f2ebfc00c..87e0a47040a5 100644
>> --- a/sound/soc/tegra/tegra_asoc_machine.c
>> +++ b/sound/soc/tegra/tegra_asoc_machine.c
>> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>>  	.add_hp_jack = true,
>>  };
>>  
>> +/*
>> + * Speaker: Connected to SPO L/R P/N pins, stereo.
>> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
>> + * Headphones: Connected to HPOL/R pins.
>> + * Headset Microphone: Unconnected.
>> + *
>> + * IF2_DAC/ADC are unpopulated.
>> + */
>> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
>> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
>> +	.mclk_rate = tegra_machine_mclk_rate_256,
>> +	.card = &snd_soc_tegra_rt5640,
>> +	.add_common_dapm_widgets = true,
>> +	.add_common_controls = true,
>> +	.add_common_snd_ops = true,
>> +	.add_hp_jack = true,
>> +};
>> +
>>  /* RT5632 machine */
>>  
>>  SND_SOC_DAILINK_DEFS(rt5632_hifi,
>> @@ -712,6 +730,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
>>  	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
>>  	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
>>  	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
>> +	{ .compatible = "nvidia,tegra-audio-rt5640-grouper", .data = &tegra_rt5640_grouper_data },
> 
> 
> Is there any harm always populating the components data for rt5640? I
> did not see any existing UCM support for Tegra+rt5640 platforms in ALSA.

The previous patch sets components for each card, including RT5640. This
patch sets individual components configuration that is unique to the
Nexus 7, it overrides the default components string of the card that was
set by the previous patch. Other devices may have a different h/w
configuration.

The universal UCM needs to know the full h/w configuration, otherwise it
doesn't know how to set up mixers and switches properly. The exact
bytcr-rt5640 UCM works on Tegra if couple switches that unique to
BayTrail are made conditional in the UCM.
