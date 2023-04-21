Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA86EAF5A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62026E94;
	Fri, 21 Apr 2023 18:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62026E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682095183;
	bh=R+4wNGZJwdIlZem3UyYR1SeO0EaOLv32ssSHqgYmO24=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YnV6NVENjgpl5uwRKGi5bqlciAXFE/7b74TEXZItP8tunYE5CIaefpd7JQJMwYQw+
	 IPbecMVwLntwFhyqZSGnXYDvMWbJR3dU7EYbyL94SumQCTQqTVGznFYK0i0itLlj1d
	 W7HLQ/aGOle0p16k9XMcAOmnUgOrawHEsBApPios=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F8EEF80149;
	Fri, 21 Apr 2023 18:38:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FDA0F80155; Fri, 21 Apr 2023 18:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7813FF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7813FF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Yh+uT6I/
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so13887496a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682095117; x=1684687117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f37z8CaRZJ71kt5G3XjzfdmlNPZE2d/uOWK39okAU54=;
        b=Yh+uT6I/cylCmOik3uAz+q7RnLYjpKL0xi2y7M3WWvKnZ/zvaMgljyj90TsRzp/sag
         6dWZEKjPfLlrTh7Lhuo7ZAueaUYXJ6CEM1ALziDuumr8u5OEQKYQpl7l5KpMYGBks1nr
         Fu9UDEx2uKV0YzlYyxW/USkR4ZDz96BoY1HkzGMbuTNLKPyyVF+1XSQSX4P5Z3GnJCEQ
         Hh1zHpOslffWEC4w8LonVQU/udxu9P1Yd2H57zHY27SITEzj74L+Ep5vxDlBdVhWiwL/
         mtGcg1ZSav168p+nsNz6gDRCcvmiNE3U6G1ve0WjR9N0v7BBrOvZCtpetCRaXpNrTVUG
         So7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095117; x=1684687117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f37z8CaRZJ71kt5G3XjzfdmlNPZE2d/uOWK39okAU54=;
        b=lQ+kHOOgLFsTy8DryLweMVjwaOOY9QBAAZD53OXiRIos6IPT70+dgJQKf/iB9DeAAK
         0TWwTv6s/Iuo6eHtXby4S/q8Rf2dosHUwh4oeIoDORme054uDhCPv9njPOtYKre0Gy96
         MBRBhyRdGGwRkuM8TWBnMBynBVI7Ybip2hRVLZEnaqqaD2IZCH1dqCm97h/PPQ0QaUSe
         PwapUZJ7TeKVhDdH3L94pHdq34MMDlVMQRF4Npf6k/85NEgURH4lYMRlVBgrpWfru0QH
         zWMHoVx5fIZ5a4sf7SFz+h2wCs+Krv4Awk7syXlVeUn9o11QapF4fyCo0wsLUTiLrNCQ
         5mCw==
X-Gm-Message-State: AAQBX9eJg3x1XmRDqmluzGpOwCw/aWV26XO6X3nLopC4mx/9wjaUR/uu
	TyC22hAd7fpbRqjsXcYIrF6bHA==
X-Google-Smtp-Source: 
 AKy350Y5t2Mc35ymMsh34woQ4uOvfYlOh9Dztn2hRVclw2MWmuBmIVK6FrtfRIKhUxRdQZI2OGeFeg==
X-Received: by 2002:a17:906:a007:b0:933:4d47:55b7 with SMTP id
 p7-20020a170906a00700b009334d4755b7mr3158319ejy.2.1682095117535;
        Fri, 21 Apr 2023 09:38:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id
 26-20020a170906101a00b0095729352bf3sm802923ejm.215.2023.04.21.09.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:38:37 -0700 (PDT)
Message-ID: <246b2227-91c5-5425-7af4-b2d082f76fc9@linaro.org>
Date: Fri, 21 Apr 2023 18:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/4] dt-bindings: riscv: Add item for StarFive JH7110
 audio board
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-3-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420024118.22677-3-walker.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3LIMCAMWXNL5ILKDNSHJJAWMZPNNCZK6
X-Message-ID-Hash: 3LIMCAMWXNL5ILKDNSHJJAWMZPNNCZK6
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LIMCAMWXNL5ILKDNSHJJAWMZPNNCZK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 04:41, Walker Chen wrote:
> Add bindings to describe the audio board that works in conjunction with
> the VisionFive2 board.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

