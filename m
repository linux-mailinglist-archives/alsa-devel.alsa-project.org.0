Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3F55C0CA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 13:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87EBB852;
	Tue, 28 Jun 2022 13:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87EBB852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656416970;
	bh=OQ7gSOVYoyciQJQuwoFpqkOmXrv1ZhhQm0Dgs3oTPmg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZRYclnyxRaPmL+AK/toqqiRPcAgVhZHnUGQb6TJ5RXb3eO9yIPtf2dfDnwdT+R7IN
	 BunDWtPriJA86eCjLmcOUx8yr7GmKjblCkSU2kOr/xaJqzrDaEVayYUfmVIFr9dzPX
	 9Wo/3ALCfe9uoj443NFaOgFb4//eKWGsgs0TqfxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B46DF8025B;
	Tue, 28 Jun 2022 13:48:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24737F80167; Tue, 28 Jun 2022 13:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E102CF80107
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 13:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E102CF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QC3iqfjn"
Received: by mail-wm1-x333.google.com with SMTP id l68so2140230wml.3
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ARDmPpFNeFd3U7QLTpOGaojt5BbAFGKGYsuOK9qTd/Y=;
 b=QC3iqfjnPtGeUUoqjsBCAjO4k82ZGz5gPrW6KmnT8jqVZZFHuLfsTIWX7Ck3NZ7ovW
 D5RN/7dMWONHz9D7GSa97LK0fHN+HrL12HNmKCp+rXZjSS24TKUVGTBHIJlIUhaZzl5I
 z9If9u744CQNOaFLAOj3jhqegHVI9bRc6kiFwpNUy0kislXxzquNBEjd9XYzpjyRqAXx
 QTPZV7Vx0amDskRQR0t6tn4jOa0x2g9SRNQzhHnltOsTEZIFBQbtFHSNfmWvYUOo4Dqw
 J9aPeMlYfSU8QWVV5KnZawc7Mi+4nZJk5IiRJv8BDt2hyju+Sjx5F4bzBYy3J3wz9Kab
 wZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ARDmPpFNeFd3U7QLTpOGaojt5BbAFGKGYsuOK9qTd/Y=;
 b=2VeCr9Nk+FtQG2lrY4UXbpGV7pcM919/xfBvriQH6UyeUNnfIH1kjzJOX0wtn9Tnb8
 h5p1bbm23pXXRKXyt9ca8nSwcbAe87igY7yOaeCTFHZ3BzyPJdHOVIquxGWn/UmDq3MJ
 iSojJMjMIxLNfHfSpThMKhFGe/pItTQDYWRzHvxm4NOJu9dzqCBxrOpI8j2VZKeKEH2z
 prNI/2awgZpRt6gx8RV9JlSsRNqOOUwe74Utixe+Hih9NDk09TVSkAJO38bWNa9wiJJo
 EBiUGTLXijyETzN/nUBZLskOXum0lIIuqSgzQpcA9WRoNUSyPg1gHwwfpOJUg3lU651e
 gcfg==
X-Gm-Message-State: AJIora8/Z1LIZsCJLdq+zNoAOsBlH5svcQ/luRyLFkLWIRlJ6iiR3ZKo
 5bDuq9gjL8Vj++cBTKB9/aWlFw==
X-Google-Smtp-Source: AGRyM1vjuaRUvUxcebxJCjSQw/GD3dvJigLw9hhUiaZGLGlGKkF787hpFCshgyALl40zm7XgkZYmfw==
X-Received: by 2002:a05:600c:583:b0:39c:3637:b9f with SMTP id
 o3-20020a05600c058300b0039c36370b9fmr26740830wmd.79.1656416902293; 
 Tue, 28 Jun 2022 04:48:22 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 bn24-20020a056000061800b0020fe35aec4bsm13115711wrb.70.2022.06.28.04.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 04:48:21 -0700 (PDT)
Message-ID: <14f6b7eb-cacb-91a5-ce06-9702618513b9@linaro.org>
Date: Tue, 28 Jun 2022 12:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
 <Yrrf5X8wstW+DXHF@sirena.org.uk>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Yrrf5X8wstW+DXHF@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, krzk+dt@kernel.org,
 bjorn.andersson@linaro.org
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

On 28/06/2022 12:03, Mark Brown wrote:
> On Tue, Jun 28, 2022 at 01:28:57AM +0100, Bryan O'Donoghue wrote:
>> The documented yaml compat string for the apq8016 is
>> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
>> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> This doesn't apply against current code, please check and resend.

What's the tree you are applying to here ?

I applied it to linux-next just last night..

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-27-06-22-msm8939-no-cpr-v4

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=linux-next-27-06-22-msm8939-no-cpr-v4&id=5822d52637eff65b826097634d9a99a9bf1bf2b7

---
bod
