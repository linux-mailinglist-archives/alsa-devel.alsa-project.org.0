Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78442477638
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:44:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06E5527FE;
	Thu, 16 Dec 2021 16:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06E5527FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639669455;
	bh=Lknv20k1dCygghp36ydIgpfktPD200vDHwJdPEJJ9uo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufUk5b4B+kyYLC3P3hxaQIZv2y7RbuxpwMVhKmvKEmHYsEe1RCPvLTRdqoq1QHSsm
	 wsf/v/lLtLfx2RCYgENXVu/VrBgyf/Fwv85mAt+gjLwdICRu1Tfmgh2ZNlLt0i28Hf
	 0tvsJBZHdf5zd4rRlPzC71sSG/BHPCqH5jAPKoN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6422AF8015B;
	Thu, 16 Dec 2021 16:43:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5FE1F8014C; Thu, 16 Dec 2021 16:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C251EF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C251EF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eDUAjQFU"
Received: by mail-lf1-x12f.google.com with SMTP id z7so50407553lfi.11
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xT/SiTniM/eQ/R5+rML11O3ecWALbJayKGmVc/zKnAs=;
 b=eDUAjQFU4pujVpoke1B2Ce2DlcWwNzL17RKV9V6JUts6HbLEXAMq2STRc4kzJ8boUz
 B7R9RJQgQtdt7cf6pcTPa16ZtGntHnvNS/J6bkb4xkNIuPZNWGESjob6LMV/pMuHyICu
 nYzW3fRQ53vO+WuuHmtrmiiniG4zHgvBLTejeiJoYfInfvBfY2GGSwa6AlrJab6TdBbC
 7Ma5VKLSWQKxuaEiwraTPfbJu7DGXNjBlvp/0ApwrqiRRK42WF5XjYMh5X0odMOZEQqy
 KgbIV7sRQsbC0b5IsQmdPRAE3kB3j11KRct2kNJRRrY7oSoKUemT9npq2rI/I/jytwJo
 op4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xT/SiTniM/eQ/R5+rML11O3ecWALbJayKGmVc/zKnAs=;
 b=bJnX/z/OoTpPmYmc74uxfIEdxymR9HdpmlSD/BmNPSaB7MQZRoFNzQr6mys39UHAcU
 /21uVHMka5fBQa0rgZiX5sj9MY3WSftC8b/gvh1d/g2AovJ6j/dcNzBHo/DJA1Ay3m4F
 jrg7TkQZq2z0mZUmRD5Rko43QN9plu7WF1Ehj33LSXYtz9MjdA+F/CP3zu1H/4g1KedP
 s3n6NIL8XgTcWRX88D23PTpNUEiguN290pvJdBWvhhLuRlKvDK8e3IN9qCnCdIXgYoRC
 YVd2V/Ig3xWzH28Roi2kaUaFsXTIKXu/nCDYYqFS5Q/RjMM1OcEgH+7N5AFrrI48CgXg
 7bBw==
X-Gm-Message-State: AOAM532oQupI7vT5QfdHNO+q3UO/KGbbaMYg/mwjFRpX9LgEVTzyKukv
 tofmC/YkMZ/0uJpARDG6DBM=
X-Google-Smtp-Source: ABdhPJzrTLDA1Jn72VfYP7tscsKDTD/B1+9QqstauFMJLrAGBEUP0kWlPKjLAbc2kgKzJNPD0OB4zg==
X-Received: by 2002:a05:6512:682:: with SMTP id
 t2mr14590038lfe.503.1639669374608; 
 Thu, 16 Dec 2021 07:42:54 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id o19sm1184608ljp.124.2021.12.16.07.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:42:54 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: sound: nvidia,tegra-audio: Convert
 multiple txt bindings to yaml
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211211224946.79875-1-david@ixit.cz>
 <a84213cb-272a-f1b2-338f-ed8ed0bf133d@gmail.com> <YbtC2I49D0pdcyLY@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <75214d23-3b5f-48d7-be80-8ea17637f3ac@gmail.com>
Date: Thu, 16 Dec 2021 18:42:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbtC2I49D0pdcyLY@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Heidelberg <david@ixit.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, ~okias/devicetree@lists.sr.ht
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

16.12.2021 16:44, Thierry Reding пишет:
> On Thu, Dec 16, 2021 at 05:52:12AM +0300, Dmitry Osipenko wrote:
>> 12.12.2021 01:49, David Heidelberg пишет:
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    sound {
>>> +        compatible = "nvidia,tegra-audio-rt5677-ryu",
>>> +                     "nvidia,tegra-audio-rt5677";
>>> +        nvidia,model = "NVIDIA Tegra Ryu";
>>> +
>>> +        nvidia,audio-routing =
>>> +                "Headphone", "LOUT2",
>>> +                "Headphone", "LOUT1",
>>> +                "Headset Mic", "MICBIAS1",
>>> +                "IN1P", "Headset Mic",
>>> +                "IN1N", "Headset Mic",
>>> +                "DMIC L1", "Internal Mic 1",
>>> +                "DMIC R1", "Internal Mic 1",
>>> +                "DMIC L2", "Internal Mic 2",
>>> +                "DMIC R2", "Internal Mic 2",
>>> +                "Speaker", "PDM1L",
>>> +                "Speaker", "PDM1R";
>>> +
>>> +        nvidia,i2s-controller = <&tegra_i2s1>;
>>> +        nvidia,audio-codec = <&rt5677>;
>>> +
>>> +        nvidia,hp-det-gpios = <&gpio 143 0>;
>>> +        nvidia,mic-present-gpios = <&gpio 132 1>;
>>> +        nvidia,hp-en-gpios = <&rt5677 1 0>;
>>> +        nvidia,dmic-clk-en-gpios = <&rt5677 2 1>;
>>
>> I spotted that nvidia,dmic-clk-en-gpios is undocumented, but DTs and
>> binding are passing the validation. We will make another patch to fix it.
>>
>> Rob, could you please tell whether this is because unevaluatedProperties
>> doesn't work yet or we're missing something?
> 
> If you update dt-schema.git to the latest "main" branch you should have
> most of what's needed to make unevaluatedProperties work. However, there
> seems to be an issue with some $referenced schemas setting
> additionalProperties to true and then that gets propogated to the schema
> that included it.
> 
> Rob came up with the patch below to fix that:
> 
> --- >8 ---
> diff --git a/dtschema/lib.py b/dtschema/lib.py
> index 3cc5e428b0eb..a0f22aab935a 100644
> --- a/dtschema/lib.py
> +++ b/dtschema/lib.py
> @@ -367,6 +367,9 @@ def fixup_sub_schema(schema, is_prop):
>      if not isinstance(schema, dict):
>          return
> 
> +    if 'additionalProperties' in schema and schema['additionalProperties'] == True:
> +        schema.pop('additionalProperties', None)
> +
>      schema.pop('description', None)
>      fixup_interrupts(schema)
>      if is_prop:
> --- >8 ---
> 
> I'm currently running the tools based on that and it's indeed been
> flagging some properties as unevaluated that weren't there before.

Thank you! The unevaluatedProperties indeed works properly using this patch.
