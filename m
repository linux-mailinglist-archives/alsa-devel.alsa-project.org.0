Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4A38E83B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02EF61614;
	Mon, 24 May 2021 16:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02EF61614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621864932;
	bh=ub3covR8TYkM+x9TNd4r2tWvz6RYpYmJfZ2B0KJNeGI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjO9V5TQr/fu1PEgxpvxA2EnTPEtioIMTWe3ZFIFKx0nR8xoBHhgRCq46LLMavlt6
	 lFnjtJ5CQifoiiwXh4cIVHgMmYPR1GveGmqpRelqHlwy4P/FwWrYTCtrzqYyCkd+il
	 1arfIrCUUagDjhd+dy0prOx8VGRBjXWuuE9EcKU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 859F4F8021D;
	Mon, 24 May 2021 16:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FBC2F8022B; Mon, 24 May 2021 16:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D34AF80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D34AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aD5eb/2J"
Received: by mail-lf1-x12f.google.com with SMTP id b26so24757965lfq.4
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wVc2l62cdFstgwVjKRszvWIRoE1c3Blnck06ieikPIg=;
 b=aD5eb/2JmDlsbuccsKLMFcqJcBu6hl+gIhyecjMjf9Wp4ohwSl3/zIHt/BqoebtTW1
 ZCP7l0erbz5YNCT+Lelmzp0gHLwIgy/F9ZVtH3IXRiE7y6fLKOlqTRFcE3Yy7RKN7VUH
 7ZNHRiA1qk3I1NT1XZt1/TEaGc7XEmzwmdfaJ7iCfmNdM6ntAycaat2InsoQkS8Aow94
 AI8WUqv97yy5x6me8Dl/Ir216EGhZ4Lz1BS5wb0czXoIA34hpl7kXcu5Sa5M+YaLRanA
 oUThSsZB/Sgjxm6bALDZT8RAXpA4q8caIAv9rY15Q1ziIcKGDBFudtYIeRIRFRMBkNzl
 TfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wVc2l62cdFstgwVjKRszvWIRoE1c3Blnck06ieikPIg=;
 b=ax3wRglxp627PyVHozVEhN+VK01Jwzlr9KY/f1N1O1KriRBW+6J5jGt47sFJS0ry+b
 SCyTxRIe6qgPnrViTYht85CmRLXTufdeDIb8u2szfUaKDhv6XU+O5v19BHDd/S+uc4/9
 cnhpe9QrBQ2MYP8ebjCsLrDLQi7G4VL9fUhnNwYaeY206ygHE1iaIl2FMQa46xqi7QT2
 RFP+AwIdG3MaElyBG12FNPf/hY5J9ftoplfnmNEQfCE0DpEwbBO8UMFXR7hPjX8sFm56
 nKZFWhYv6MT8u90DhUMmGvSAvkErQudctFjCe5jdyBHaxttJLBiT8JeStAuNBBiVOKM8
 vW7w==
X-Gm-Message-State: AOAM531VRwzD35T9l4N1jJq2+OPsJrAMGgu+MvZAZKysBiglmBIliRMr
 0ZslYOEbk63ZToaIxvBZbZ0SC8Pp4jg=
X-Google-Smtp-Source: ABdhPJwe8HZoOudrB7of9u9ftFqXovADXZUIFQen5Of5GgAtTT+0iiU6KEC6tG/60fpMZlSmNNrLGg==
X-Received: by 2002:a05:6512:3684:: with SMTP id
 d4mr10581528lfs.90.1621864828233; 
 Mon, 24 May 2021 07:00:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.googlemail.com with ESMTPSA id s8sm1763804ljg.89.2021.05.24.07.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 07:00:27 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To: Jaroslav Kysela <perex@perex.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
 <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
Date: Mon, 24 May 2021 17:00:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
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

24.05.2021 13:54, Jaroslav Kysela пишет:
> Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
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
> 
> Perhaps, it may be better to handle this string via the DT config (create new
> function like snd_soc_of_parse_card_name()).
> 
> The "codec:rt5640" should be set in the driver (it's fixed), but the
> "cfg-spk:2 cfg-mic:dmic1 aif:1" part is suitable for the DT config.

Not sure that this is possible. The DT is an ABI, while components
string has no specification. Any changes to the components string will
require DT update.

I think it's much more feasible to have a database of components within
kernel driver, like Intel sound driver does it for ACPI devices.
