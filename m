Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DAC599526
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 08:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45A371651;
	Fri, 19 Aug 2022 08:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45A371651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660889621;
	bh=PucRphcMsq837UrCMRPI4JNrwvEktr/dACvg2vFkkMY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pm/Yr4EFrzlwfc7TQ+6VHRWq7KkA/44g2WaVqvYbAOqE62Q3ATVpsLNnSgQC8+s/6
	 WcW5L6/jS43qpmVspGefwX/c5GMBugTv+a5By4HzmaJV6fIyu4PGct9AZaZ3R3DhSD
	 D5tr/UZXpK6Pe4V/D7sOtFXjmuRsvIRTJ/+FAyjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD52FF800EE;
	Fri, 19 Aug 2022 08:12:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4EC2F800EE; Fri, 19 Aug 2022 08:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BE68F800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 08:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BE68F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LlBUFZ0K"
Received: by mail-lf1-x12c.google.com with SMTP id u9so4836730lfg.11
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=JT4d+qIXOiD2c32PCe7VpC8Thaw9HKeDvaLegiyeoBs=;
 b=LlBUFZ0KtnEfoOPCl6+O8eSzoVMWvALL1/uzU8K4LZM4oP1qaxQmyOh4Q5o0/FdWij
 XD0AXh0ohnUTEGwV6ZrBbptWn+nXE5Lp7eG/vEcagIUmTK7NTCXsfQTXcY4SQpal6b+o
 kJeA6rdNrAUqfkW9R1iK3AmiFII5BYHSRObG6w7vxsUAxgXJq3Bwmv93yY7BzQRFlFQt
 57ll7i7YbB6G6ZeylC0kOoCeg4tCtBAstcxc1pymcsPIETiJumcQgMamBnkUAsrLupLM
 NLw4aaHGLsLbd6dB+68tHIcM3cjLgs+eD/KlyrA37JCl81+D3yLDnVX/YmjCHLscHwFf
 mv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JT4d+qIXOiD2c32PCe7VpC8Thaw9HKeDvaLegiyeoBs=;
 b=NZkuuTOufQgS4ZENSwABhi3bV+0NQ8rHdOvJhkFqO4OW/BzmoDyzqL+wcK5jE9obkC
 UWRjy6osySP0jhYrhmK/yamdcynS/RPOyd0bxOyXMfyiJb8HDuzdNe0gpcfEVjJoL++V
 DfV9+wFMM2OXT+uXVbefWGJtNWVwLdg/OIO6o8v6dc0Eafapm2Wqxbg5gIvCPK4n78/o
 ugaKLeQvdEXhJ5tZnrFV1o3sTNuwICpv02q0vitRxnVA/rxiWwGsnKlxpjmkUp2gVCK8
 XaJJpEnezGsyCpYetnvp32TS0EFj7Hlz9Z/xVxk3l04/mrNwo3eHVeXm3mlIfkF4cWs8
 8ByQ==
X-Gm-Message-State: ACgBeo2u01YMqUxu/YR6BqmG8RvcCBq6RCpddqmLulSF6UPX1PQrmH6E
 +2lmiW/+bdR+KwCXq+gNSure5A==
X-Google-Smtp-Source: AA6agR6egBZWlTgL+lYH4tALCwa73LhErjRYFg+F5pOPcScNcEExN8yGp7Q5NJ4D804cjTkDXUtk1g==
X-Received: by 2002:a05:6512:32c2:b0:48b:373b:5503 with SMTP id
 f2-20020a05651232c200b0048b373b5503mr2055113lfg.192.1660889555612; 
 Thu, 18 Aug 2022 23:12:35 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5?
 (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi.
 [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
 by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0025e6a3556ffsm467473ljj.22.2022.08.18.23.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 23:12:35 -0700 (PDT)
Message-ID: <ce1ea6c9-79bd-5dfa-41c9-38e49c9df735@linaro.org>
Date: Fri, 19 Aug 2022 09:12:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] ASoC: apple: mca: Start new platform driver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-3-povik+lin@cutebit.org>
 <53c8f062-a760-c65f-479e-53e7991b3f66@linaro.org>
 <82B580B4-85BF-4ABA-B098-98E3CA9EE247@cutebit.org>
 <414CEE0D-AED4-4900-88BE-A3BD993D79DD@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <414CEE0D-AED4-4900-88BE-A3BD993D79DD@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 18/08/2022 20:54, Martin Povišer wrote:
>>
>> Same as above, there’s supposed to be
>>
>>  resets:
>>    maxItems: 1
>>
>> in the schema.
> 
> Preparing an iteration of the series, I see there *was* the reset in
> the schema. Let me know if there is some issue with it.
> 

Indeed there is one, I missed it. It's OK.

Best regards,
Krzysztof
