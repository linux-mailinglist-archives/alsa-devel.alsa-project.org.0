Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48F657689
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 13:38:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E109718F5;
	Wed, 28 Dec 2022 13:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E109718F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672231103;
	bh=/gdigYLlotNH44gF23aO8kFiBAJCshjeHKDPWidrRBw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NDio6fiQpaqnGVP5TI322uAqFhvL7T63M+jWPzm2Vz+rBQXIYNC2qRXmtY8e2D48E
	 SoKTfRA+XtGOgkghkP9W2xU7w+LzWWekr6MRAlTj1kU66NOGTNeSd0DgryLTN4RkoZ
	 OPz5u0ofvpWjus9Jp2U5yX68t+b0Q6MjD67Tya4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D83F800F0;
	Wed, 28 Dec 2022 13:37:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F08DF8042F; Wed, 28 Dec 2022 13:37:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2AB0F8023B
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 13:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2AB0F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WOVDjahb
Received: by mail-lf1-x135.google.com with SMTP id bt23so6793957lfb.5
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 04:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=szUYv0uneyN7YHYxEv+1bpNF1FTM8iygqyO0FKMlC7o=;
 b=WOVDjahbgzvlWA+I1nfhLWRgkZ9OLauPupQIX9iHFBEbdG8UN1RK9cBk1C1lyT3fTt
 M8sP2kN+ZfEc0G/6RdgTqJ8VY/1ISqEaKr6aGlvBLyAp1z+6nm656TsD+NlwlHqAqUup
 6K1j9LRupJG4y9A3X8omkxFf7AoNQ2HTj5Jq/V8I9J0C+nIOWRdneTA+I4UZ/UiAHjAi
 ahjoVbi51mljf696KPwr8etfQCOeRJYRFbfXjkDtECh+NQiS182weSxvczkUsV01bKTf
 9FbvEHLrlGbTsDPaiqZBZsi68TiUfCAbJejheVLEvaTvdgfLnLO/DxzpGHofAqiqCkej
 I4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=szUYv0uneyN7YHYxEv+1bpNF1FTM8iygqyO0FKMlC7o=;
 b=fJ8MvaYyISBVQLC/1v7cBdL7+/aSvjW+DxQHMLC6907Ea35ES8c3VzQkv8uH2Js5cg
 erKis5vb1LPFjcWAfIMpMpmYxdU5wIv9lu8fY+a1p0CFhcqCIxYszPLdykEb/sN6wmyd
 HOX21JMmRcegMAudvcrRJDAc7nEz9YZZOAowkvOa2xyIzdsFBYjGPaaQJEY85eWek7xK
 CGi5Y7rgWWI6vDZJGkXrF2CiwiIjEhADWB4Bg9uL20q+KbdoniwrHafKlQ7iLIqjEBKj
 NhX7cr/NnXbDc2nxY5S63F1Q9UlzREBgPM+P/KwZMrj82w/HW/+J8wPATx4RLM1DyTZu
 c6xw==
X-Gm-Message-State: AFqh2kp8uGXpT6nR1q86KCZ9AFun/B7dUEvxT+6hRbmniU0SBwwiDDu7
 P8Rv1fq9goWhXemMscazoOpq9A==
X-Google-Smtp-Source: AMrXdXvZp7CP84l0lYhtw+B8zuMLZIv9fPypPu/nFTNLtiVo6H2Eh797Bsi99jc32fqou298yyIzXg==
X-Received: by 2002:a05:6512:228a:b0:4b5:7f79:f8bd with SMTP id
 f10-20020a056512228a00b004b57f79f8bdmr9812553lfu.22.1672231034559; 
 Wed, 28 Dec 2022 04:37:14 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a19a415000000b004a46f92a15bsm2661813lfc.41.2022.12.28.04.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:37:13 -0800 (PST)
Message-ID: <cae5273e-aac5-0c4c-6686-fb2cbc5379e3@linaro.org>
Date: Wed, 28 Dec 2022 13:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
Content-Language: en-US
To: tongjian <tongjian@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
 <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 28/12/2022 13:22, tongjian wrote:
> Add support for using the rt5682s codec together with max98360a on
> MT8186-MT6366-RT1019-RT5682S machines.
> 
> Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>

The author and SoB should be full name. Is this correct (full)
transliteration of your name?


Best regards,
Krzysztof

