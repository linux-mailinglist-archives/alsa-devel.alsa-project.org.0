Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11047746E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 15:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490201F77;
	Thu, 16 Dec 2021 15:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490201F77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639664766;
	bh=mkTC902VJsukGWYp0cd2hXrBg3Mu9ttjfy/WA0MbxBs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkrW/yVHzBeQbEFpPVzLdhbTM0vIal5in4rZ0WUBqHNPWkuHyHbGuigXsprjz2V1I
	 Zh/h7X5Lh0OHemJe+k7eTtf7SYhuh3icV5gQ+Pxqb9FZ8NkKGy1rAUvt2SJkb0Epow
	 uy7N41+Y6OuviXNDT29GFu4yTrpbQ3S+FM/J+trw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96181F8015B;
	Thu, 16 Dec 2021 15:24:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0AB9F80116; Thu, 16 Dec 2021 15:24:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66132F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 15:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66132F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="igVil4d7"
Received: by mail-lj1-x22c.google.com with SMTP id a37so37682072ljq.13
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 06:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3te9pe7rOJHos3EuPgW4pF2bDr58GHICUC52sb6TTQw=;
 b=igVil4d7hecRf/ZlSHkjGruHgf+4OOe4/KwyAc3HNyI/F2/EASnbWlmBW1xTb9kyIf
 LCsjrURmGl04f3eT9XO2PC7S7qc7QHJF7vXVdsW221Oir2aAxMMhWcEDjv3yX9WDczqV
 ZDS/IvjvPnck+FzEw10c7WJJf3Hs1whJzcS4oMZEwL83kIugA95UTue+8vljF7orSw/F
 W1pN26OniH5nNBEyrLvvldgEsL7ZcXLfrgZgfW/+EJCzdM179Fnek2baPlSqDFWaJuu5
 R2hxrJEuFfzP88gWkIzimlDjZBs6i7mip18yIbHvCl3zFmfzJdLvHKsnANZ9IEim+FqC
 +aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3te9pe7rOJHos3EuPgW4pF2bDr58GHICUC52sb6TTQw=;
 b=100oSgGl9I8AJDZ81+JA9r5jKLrrv+UUeExbuZ2dYLw+diyZSSPnPE2Q5Z0K1+w+Rl
 XeAK7tvcEwBGAR3pD00u+kSUAXxUAzQs4urIReNH+JkSpq5KPubLFgI6R+riVCDc6qWI
 oyK5aqUqN5V5H+LMTOn/FHjAAnHgiWAQ/GbNV+8SO8wbQiKjxhrnbuCPPCSSATNCGg92
 oeisZuFUNGuPjlg+Es3uGNljqxJ464zS9SrBtANrwvHbsqtkUDSKa3/OQHdWi1z4MJnK
 hRTlto+Zu+9dJIAVa388mgAVHFbAMU/vD+bdZZjrh99cX7Bl4wjRjJP/V5GK2jxWZypS
 5Ikg==
X-Gm-Message-State: AOAM533Ke72lzE5n0NPyZMNXFDhTJqrpZIKPovdqDXq+emDw7dOJED/t
 1JCNhX0w8kTC/ZItFe56QXo=
X-Google-Smtp-Source: ABdhPJyZgc6J3PJapwYvBcgEEKZ/Jerd++aLCQoky0Jcr64DLrgfwsKC+jhHtu9KLPZdgvdP4/NUvA==
X-Received: by 2002:a2e:948:: with SMTP id 69mr15645160ljj.82.1639664692137;
 Thu, 16 Dec 2021 06:24:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id a12sm896315lfk.227.2021.12.16.06.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:24:51 -0800 (PST)
Subject: Re: [PATCH v4 20/22] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-21-digetx@gmail.com> <YbtDNbdJqCGTaMNs@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7cc2693f-df2d-b3ca-5336-4815d98a67cb@gmail.com>
Date: Thu, 16 Dec 2021 17:24:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbtDNbdJqCGTaMNs@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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

16.12.2021 16:46, Thierry Reding пишет:
> On Sat, Dec 04, 2021 at 05:37:23PM +0300, Dmitry Osipenko wrote:
>> Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
>> Tegra20 devices.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
>>  1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
>> index 72cbe32d0c1d..dde228bcbbff 100644
>> --- a/arch/arm/boot/dts/tegra20.dtsi
>> +++ b/arch/arm/boot/dts/tegra20.dtsi
>> @@ -186,7 +186,7 @@ rgb {
>>  			};
>>  		};
>>  
>> -		hdmi@54280000 {
>> +		tegra_hdmi: hdmi@54280000 {
>>  			compatible = "nvidia,tegra20-hdmi";
>>  			reg = <0x54280000 0x00040000>;
>>  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>> @@ -1063,4 +1063,24 @@ pmu {
>>  		interrupt-affinity = <&{/cpus/cpu@0}>,
>>  				     <&{/cpus/cpu@1}>;
>>  	};
>> +
>> +	sound-hdmi {
>> +		compatible = "simple-audio-card";
>> +		simple-audio-card,name = "NVIDIA Tegra20 HDMI";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		simple-audio-card,dai-link@0 {
>> +			reg = <0>;
>> +
>> +			cpu {
>> +				sound-dai = <&tegra_spdif>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&tegra_hdmi>;
>> +			};
>> +		};
>> +	};
> 
> Should this be status = "disabled" and then only enabled for platforms
> that actually enable HDMI?

Assuming that HDMI node is disabled, we assume that the card won't be
initialized. It won't be a problem to restructure this card in DT later
on if we will have any other use-cases than we currently have, but this
is unlikely to happen in practice.
