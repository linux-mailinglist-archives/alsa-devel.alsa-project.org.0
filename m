Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2268EC77
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62566DED;
	Wed,  8 Feb 2023 11:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62566DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851142;
	bh=a4STZo8huxerwjlF1yGIWYxozPuOS8pHMspa39woYv8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bpRmrKEicLi0/LES3te4S/eNRrtfrQsGBe4CoVIsndSqPLXJM9YpW0la4ggpjdXXX
	 FBymhBn/vIuzgSuwv41WA15PLQxdmvaftXMTVHjU7kEbnjsboFur3A/iKmVVjWWO3T
	 jGrdMnxfQwe0Vp8bnielzIwg2qjOubAAB45HsySM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0672F80095;
	Wed,  8 Feb 2023 11:11:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93E8F8012B; Wed,  8 Feb 2023 11:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5963BF800AA
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5963BF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KWidLLXh
Received: by mail-wm1-x335.google.com with SMTP id u10so9889812wmj.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huzB20qTn2hk5Sq50TcJmPrBiboHg5g3LTY+3FZ3Yb0=;
        b=KWidLLXh9HX/nt4zg03fLQRfj3YHNKgvZjeskIue5Q9wqMMvRrH2zoh4zHSsn3PeHn
         CiGAvL9EqDb+//F5Sebnf+NX3QFSvOVr3EnfR2zW6WAZNlgsVR6PBeRbt01bWu2K7k9z
         4atmTMdZz06o8x3uc+D997ZjlM+GIeKFIuZsUXkbMNfpXhxI9b89rJeF8g5d4zCTBesg
         RwLEXKYzAMe9hd1ZqmI2GWDQ/9Kc4ckwcxmIAo/NgmKfjNtOra4MNZPKlF+fL+vN5vsw
         tAo22g/2J9hX4ObNbEQjNMEVmeEhPfCJVi5BIzhrribBe1ZCrEAecOQSh+0OVF4CI60G
         8zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huzB20qTn2hk5Sq50TcJmPrBiboHg5g3LTY+3FZ3Yb0=;
        b=oYVe9OpvhRoQU0WG8/hdF+oCojdutUrS3HwJCeP+YzmBpITh9GcRs4Qszg7GEtFTOI
         tKaNNNhr93Jc7xX1GnEeB1WCxheV6DNBWrdn1JjkZblxPFS4FOn7Ml7FQ7glg44qBW2w
         gv/EFHrygZede7O5k745VmOKIaMRbXDU8Al1jLXqTQdxS/f+ND/BrrPaMyFgqW2CcVyD
         7F1Toa48WBBF7CzMuB91us4TRRGcEkhUAEvRpjSge4FgxjzBjIaCGeEjzKH3+bwOIwt+
         3G1rfMxtLResTtMI3/8YBNeIahvTsfebPjtPP/1hk0fokNti0yI+SAaka0gK6tFXLd3Q
         OZbw==
X-Gm-Message-State: AO0yUKWOiYJIGxW7EMGCm1WTMyAmP02toMXin22fIpNJ3LI8GfKeydOg
	+EdrsNvlRSdtCEpZz2FXUx8o3g==
X-Google-Smtp-Source: 
 AK7set9SFBkBwYbJsxEoEQo2yTUSMhBjOMBIM2S+qELVNcXscqrtbGDB2RZokPCNgDbPk9mqHHZjhQ==
X-Received: by 2002:a05:600c:1606:b0:3dc:19d1:3c13 with SMTP id
 m6-20020a05600c160600b003dc19d13c13mr5894099wmn.12.1675851082636;
        Wed, 08 Feb 2023 02:11:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003df245cd853sm1340660wmp.44.2023.02.08.02.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 02:11:22 -0800 (PST)
Message-ID: <d74c7f61-46d3-4f87-5889-b3431fdfd467@linaro.org>
Date: Wed, 8 Feb 2023 11:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230208093520.52843-1-jbrunet@baylibre.com>
 <20230208093520.52843-2-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208093520.52843-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QLLGKZMP2OHJUMTO7KTOYARD2VXPM4UJ
X-Message-ID-Hash: QLLGKZMP2OHJUMTO7KTOYARD2VXPM4UJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLLGKZMP2OHJUMTO7KTOYARD2VXPM4UJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 10:35, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg sound card to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
>  .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

