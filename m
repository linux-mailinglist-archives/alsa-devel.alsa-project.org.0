Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E17771E3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 09:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD9F1E8;
	Thu, 10 Aug 2023 09:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD9F1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691653713;
	bh=SYjY3g07k8wvjYgH/5nZiRBqaJgqOomNi2+4zgo3JEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NjEjOM3m/YpkTpMXJYTG8+Ol3+s2lyYeiqk0K0fQ0fR3ps/KnpXci09mIiqSIcVT6
	 7oor3TiR6fbaoMWESyVM79ofNcZ8UodXujNSuxjLZBnfkOn7XrGpfPJiG0dgBz6Koq
	 Xi1mBVh6sj1DY2pL92FF92AZkJsr98Yzwg05VEjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77C8CF80549; Thu, 10 Aug 2023 09:47:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02513F800EE;
	Thu, 10 Aug 2023 09:47:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4072F8016E; Thu, 10 Aug 2023 09:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEC7EF800EE
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 09:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC7EF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TCouXo8h
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so714797a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 00:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691653647; x=1692258447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhpGgdbtPxtlzBnzGvNtLx/+CntVAPL8Getc9S/EtvE=;
        b=TCouXo8hPM/jVxiHx4HiCypCk6rJQPbI9AuhBPVcn/DeoHQoGs0K/qmCBg/fXBxrnm
         x9ndiKsg6ceAeVt7oq4Ax2tf5qYsxftiA8FXg4oYaev50pnzZ0Ndp7Q5YOHJqxUNhVod
         qyQi4hFrls3IYYHvBlt23AoWpVRhRZnIhEm6+jfNyVfgIKcmJD7VmucVkf172J7NdzpT
         U497GQCzvnuf6QEpie6uMYEQDyvoVDoisfnAMpwkqdfcq6xl+xKIgUtw8M/p2sM5uLkM
         WTcUgemTcfTqlK7Yij1gZunpx3csb95oeh96TtGz7ByTAQRAZNyRkHay/kkaLS5hAU4N
         jkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653647; x=1692258447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhpGgdbtPxtlzBnzGvNtLx/+CntVAPL8Getc9S/EtvE=;
        b=D7OE51tDj4qONY9Ci8ZNKu8MUpjjmYoYchAuXz6emwDO9IrAOolAieoec7F3IVQ9DD
         i2uY8RemrT4AR14JZPjUzXqhemGWVVVHfcYXcLOtckWpMJUPtdT2CmpnEC6o0rLmT8Dx
         oWVmsgNg9sBatvq+08oSO5oVNSHTOnvHs+iM0hY1KYekmd8IpB3fOB08FyHb7RKVZD7c
         XA4OZzFOQIu8+J+joGm+MKfNN5ww3qsshU/Jmzyyv6mmL/Kkf+yqevuwVvxQ0k5u6v6V
         k0ZGgAp56a2TCX9ChWudleWzcirJpaDQiMOJ5Cus+FEeSyvl/uatz+TxFnu96GuASMd7
         tObA==
X-Gm-Message-State: AOJu0YwbNd472lGcoiuyyPD9ZiaHRqpaaTYuyo5iQ5YAXn1cW1weeNQg
	R6xlR3yXWD04pg6b7sOg4Jl4bQ==
X-Google-Smtp-Source: 
 AGHT+IF9zsTmioOuHxTFGoxEizbPFEc/AaHn3qyFS7Ire5UldEq2+XXEFPOCEZP4aWihn4A+p0JOyg==
X-Received: by 2002:a17:906:2189:b0:99b:cf0c:2cb1 with SMTP id
 9-20020a170906218900b0099bcf0c2cb1mr1357849eju.66.1691653647608;
        Thu, 10 Aug 2023 00:47:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 w20-20020a170906385400b0097404f4a124sm560321ejc.2.2023.08.10.00.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 00:47:27 -0700 (PDT)
Message-ID: <137a734e-0e5a-5fcb-f0d3-1fdbb5e8da34@linaro.org>
Date: Thu, 10 Aug 2023 09:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Judy Hsiao
 <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela
 <perex@perex.cz>, Rao Mandadapu <srivasam@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Mark Brown <broonie@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
 <169165201641.3911557.18445521260746432395.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <169165201641.3911557.18445521260746432395.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: I7XWOZQJ4YRFJMOMY3SEJIW6JZ5LFZBA
X-Message-ID-Hash: I7XWOZQJ4YRFJMOMY3SEJIW6JZ5LFZBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7XWOZQJ4YRFJMOMY3SEJIW6JZ5LFZBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/08/2023 09:20, Rob Herring wrote:
> 
> On Thu, 10 Aug 2023 08:32:50 +0200, Krzysztof Kozlowski wrote:
>> The mediatek,mt8188-mt6359 Linux sound machine driver requires the
>> "model" property, so binding was incomplete.  Reference the common sound
>> card properties to fix that which also allows to remove duplicated
>> property definitions.  Leave the relevant parts of "audio-routing"
>> description.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/sound/mediatek,mt8188-mt6359.yaml  | 17 +++++++----------
>>  1 file changed, 7 insertions(+), 10 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 

I think the bot responds like this if the patch could not be applied.
Probably we can ignore it.

Best regards,
Krzysztof

