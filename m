Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54A777057
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C044822;
	Thu, 10 Aug 2023 08:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C044822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649028;
	bh=Begg3pmvfG2SjUoKdVbhHQ1QeiKoXWOgKsiACsJEwIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IyHbmPzlyKquDqTOptzKLDUGm5AR39zSHJbzAQZHKqGimOtQCWEXefScCNfVKGSX3
	 tnoyqiMS4dh/wVdxpUCs0BjOE47IcAzLBPQaO+aYqOfz0pk6ASzTL391r1tHTrftey
	 BEhdk20KGl8DJhCU7g3W6XVZTX0ti9Yvom6+G8oQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B173F80510; Thu, 10 Aug 2023 08:29:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF766F80166;
	Thu, 10 Aug 2023 08:29:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDD77F8016E; Thu, 10 Aug 2023 08:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 001BDF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 001BDF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gAH36ndi
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e587eso5094865e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691648957; x=1692253757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RmzlTlEgcYnJC16d1sILZcykRMmU7oi2/EECxLz3EA=;
        b=gAH36ndi9Z8jmOqcwwQ7x/zvyE9DXiTJt+CSTEM/FkIiLCr2eMFExpHOad4v/Jw4OM
         aaDB6r6JMaGe4n2ZCqSk+DHv7LGjeGSUvXvmU7RGXLZqb/SXV6ThYGEKB9UlYWlwxdNc
         PKnwXATug8YqgRO0/yRIjFZ8TtGtkZvT+1bVlhhsBCqof40RT8tqjir28cicrtOA+3xQ
         FP3jTQwhRlIp6UjWZTYBaTZgo2WcI9+cyzqAskTHDPBCHAX/VC2Hgy4NL542stdPHVhe
         ew6+J59IPPJLaayqRgDMORH75w/IvfZI4tsdX8RtgGAAwM9Xon4XoeDPAiA3X8wPlwAW
         9Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691648957; x=1692253757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RmzlTlEgcYnJC16d1sILZcykRMmU7oi2/EECxLz3EA=;
        b=AWPseY6M5xDoOSl3a9INjUI4yaxAC5y1irlZzB/31lTPvu42IH2s6xTjXApmsyQSI0
         zwJernOzTeHYldUW1iOb9Lvldk4CrUB2kynyT/5iGPyDtfLqA2saKzYMpxcId7TqxKgr
         trW7Hm9kkLhkSA5i2r6shL9jKxwdEPGQcNz4AMmoVnQXuE4elr7vMqhBXG7kRmP65FjM
         VNBswxWrkL5zvZDGPr0Sx74GrwLBEN6xn6jQzfb+Y6ydj0CKISjwS/1PyVPJnG69s/YU
         jgw/EfjWLJRqvxm5R+JVTuk7gFA5+RT1IjanzPBW6btoUXU7YCSG0Rmt6107+B0zaXhR
         Zwpw==
X-Gm-Message-State: AOJu0YwF+6RdHDEgC2wb2LHRKRlDQpoItS5T+ZE4lmk5dzqh87cpgEGu
	KTTujIvF8WbhJvqtojMXFypcJw==
X-Google-Smtp-Source: 
 AGHT+IHfM/E+7Vgu6aFKR01Zqy+crsACs4Det4aFk46Ou0O9aYDEJPY0PlHY2lvhIjir+EnM/ZCkWw==
X-Received: by 2002:a5d:62c6:0:b0:317:65de:4389 with SMTP id
 o6-20020a5d62c6000000b0031765de4389mr1331788wrv.61.1691648956800;
        Wed, 09 Aug 2023 23:29:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 k3-20020a056000004300b003177074f830sm1026903wrx.59.2023.08.09.23.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 23:29:16 -0700 (PDT)
Message-ID: <b786f564-b2dd-8b6c-c4a3-c861cbf74f16@linaro.org>
Date: Thu, 10 Aug 2023 08:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 01/12] ASoC: dt-bindings: amlogic,gx-sound-card: correct
 maxItems constraints
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Rao Mandadapu <srivasam@codeaurora.org>, Judy Hsiao
 <judyhsiao@chromium.org>, Trevor Wu <trevor.wu@mediatek.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
 <1jr0oowg6m.fsf@starbuckisacylon.baylibre.com>
 <076d8a7d-8369-4e88-9997-d54b91b7920d@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <076d8a7d-8369-4e88-9997-d54b91b7920d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SBJC2MCUFMOXFXP23FQIKHPM6OBAYKSL
X-Message-ID-Hash: SBJC2MCUFMOXFXP23FQIKHPM6OBAYKSL
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBJC2MCUFMOXFXP23FQIKHPM6OBAYKSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/07/2023 16:46, Mark Brown wrote:
>> The upper limit of 8 might work now but is very likely to be wrong for
>> the next device to come.
> 
>> Is there way to correctly describe this "pair" contraint with DT schema ?
> 
>> If not, then I guess the most adequate solution is to drop minItems and
>> give no bound, like simple-card is doing for the same type of properties.
> 
>> Same goes for the audio-widgets property
> 
> Right, dropping minItems seems better than pulling a maxItems out of
> thin air.

OK, I will drop the min/maxItems and send v2.

Best regards,
Krzysztof

