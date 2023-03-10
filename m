Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90EE6B548E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 23:37:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27DCC1890;
	Fri, 10 Mar 2023 23:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27DCC1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678487825;
	bh=bTFnZokBEz4rprEPl3UManjbjqbRC+16C4m3AZ8R4LE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lfO9VNCv7rfnXGp750ZrjxBMOdgrDNSErJ3E8faO2dLbHl7Yn8tWlPbILtSxPq7wm
	 d58Sr+3bbYoojlgNcVkRVEZtN3xu9z9HPJlBDwX//yD5jLy21ygOa1vcfA7qNi6omV
	 t2gB/W/n9h3jB7SScxrEVcCDv1Shp6ojLhanCEls=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D6EAF80236;
	Fri, 10 Mar 2023 23:36:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 806C7F8042F; Fri, 10 Mar 2023 23:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDEA3F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 23:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDEA3F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wrFNkUjO
Received: by mail-ed1-x531.google.com with SMTP id da10so26593311edb.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjRNBwwTPW7bwG9Y1aTb7hINs3HIiC7ZML62hdb82UY=;
        b=wrFNkUjOR/8mBlqWHqFvnPlt0eBSOuSoANyPrBahyHe/j8K3jFCcyLppOitiJAmddy
         jXoRkp3Vh8BYjOHjC4xa9PBL214qCBSje/l5JOtxJnaJPRTEMCnhKDoT9vYW3dHtLSzU
         /ynE0BZ0OVVrDQmD31e2rlJRq9dZWehpfbnG3ryG7t14feqhtsUpPSw3IM9tjM7iQI5E
         DrKpyM1LMaircpbTwBssyRrPQcgJN0J9nURfuXNc3VuKsxZlXXwVhXQad0QpNTxyoYIw
         UwW+bL/NQwZOK9u2oXs+Nf7ILou4ebHfC9MghGdEdwv1p82+zA1aGkrcKOPzxxVc7CSZ
         JUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjRNBwwTPW7bwG9Y1aTb7hINs3HIiC7ZML62hdb82UY=;
        b=M/s90IMgeNsR79Dv4iDxRMX8HGZFRi0N5Wn/y+1L0V3K/cPo2t/a8EnIHWLApiPMGf
         yfXdQ4ciKQbO0rZixIawpRoZrNdPdkfddWb6lkrDkkOE+FAPVEkgjZ/++f1sSydCoiVk
         1Mdsdu7EJlyFOkJZuW/YcW6Lw/GB32Wzq2HDgUE61i1TIjQma2y0HYR8D36tokgcB137
         ku9gbvFJ/VCJ/L5/jkaWZkNg5P2cszT1Rj1c+22lq5T1BhnbnRJW/2/5L524lDZrWqqu
         utFMyUBI6TMElUDuoPmFDeEIBr4cOA/rKNhGDTC/qxFgWifJELMtk/a9XDDxCzTGYvhT
         d9KA==
X-Gm-Message-State: AO0yUKW2K0O4B1rl0EehcSlsu9jVtJN0tfHv+9Fpa3wl0BKoInNqyDaj
	X7ta1T42Wh8wiJ7+adc9FhIKJw==
X-Google-Smtp-Source: 
 AK7set8KBGk0VRX4+OMl8MnQ6Ri7sbXXfqVhgYiiGmWP3CaaFxwKnzFF2SPMq+7nspOgXMiyLgYXfw==
X-Received: by 2002:a17:907:a0d5:b0:88e:e498:109b with SMTP id
 hw21-20020a170907a0d500b0088ee498109bmr35691157ejc.5.1678487756766;
        Fri, 10 Mar 2023 14:35:56 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:34:52e3:a77e:cac5?
 ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 b18-20020a17090636d200b008d0dbf15b8bsm354390ejc.212.2023.03.10.14.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 14:35:56 -0800 (PST)
Message-ID: <696af359-6734-92ce-4c63-8ba83f477ac4@linaro.org>
Date: Fri, 10 Mar 2023 23:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] power: reset: qcom-pon: drop of_match_ptr for ID table
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>, Oder Chiou <oder_chiou@realtek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
 <20230310214333.274903-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310214333.274903-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: I554KJSGVAOTTSOXCSV4J67WQC7GGB7B
X-Message-ID-Hash: I554KJSGVAOTTSOXCSV4J67WQC7GGB7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I554KJSGVAOTTSOXCSV4J67WQC7GGB7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/03/2023 22:43, Krzysztof Kozlowski wrote:
> The Qualcomm SoC power-on driver is specific to ARCH_QCOM which depends
> on OF thus the driver is OF-only.  It's of_device_id table is built
> unconditionally, thus of_match_ptr() for ID table does not make sense.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/power/reset/qcom-pon.c | 2 +-

This one is a duplicate - I already sent it separate. Please ignore.

Best regards,
Krzysztof

