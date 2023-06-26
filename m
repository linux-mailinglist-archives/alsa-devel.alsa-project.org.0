Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9794673E378
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 17:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E190851;
	Mon, 26 Jun 2023 17:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E190851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687793758;
	bh=3sNiMWpccYKrUR/vOaQ7NtgaoLf5jkV2sl9iJTffUwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SH2FY4ezbpCHW5V9aTYp85RCczQOeiKWcOCX2MWFcqX376rQaWUsLleij65dTaQQk
	 ewKTrIX67cx6H3gtSh7f5FAxhcdWfHqOCJe1+0Jlya9fWJqQaiEU2XUk2vPRbxPEDu
	 cUGps43Nj7QSt/2VPlaY4FQFC5LIj3ntz9AuVJJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15BFFF80246; Mon, 26 Jun 2023 17:35:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A96C0F80169;
	Mon, 26 Jun 2023 17:35:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BAA8F8027B; Mon, 26 Jun 2023 17:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66A4BF80212
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 17:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A4BF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZTfd1hsU
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-311394406d0so3036456f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793699; x=1690385699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyXF+o9wj/oq2REDkSaZZ6G7zdUVUsRy4dXWDEbehBk=;
        b=ZTfd1hsUwLmVqTbM925y9XW95cMMxMS9/Yt3r3RwEzpvz40wTPkuNAXbM7jPD7j95K
         KHjljdtVdCDEAEth1RrsZWhG9VUohTDguirwqJgMrQzf2jq6GlwW4RVwNlub/+4KxLI/
         p4fj6qOCoOYg1FwnWlMm9Co5YOrmTBl/VHwhiu9LOvswlGA8lVBU8L1Lwt/V7oagEXTG
         nfxNrnk7s7UflcPglLPNmjp/eqollpE+12cRJUzThGTXXezmpyKDhr3L9ICldQLXnyLA
         D054E+8e+x153t0fLPXqMLQP8qHZBxVJxZHmz6OMX+9ex/i9c4tplT3CpmpiZBkF/ndm
         u27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793699; x=1690385699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyXF+o9wj/oq2REDkSaZZ6G7zdUVUsRy4dXWDEbehBk=;
        b=ZlEEU1b1LbKOqUQcE0e/jODCd4xctt0nAaLPyxm8vSfDg811aiCqVsJ2usOQH1UTQX
         aFptB8EtlIapHrDM7f/wbSIWz3FXiFCXLjoMIcNcKOEzuEi4UQKqcMIjG86/P4sjOAwd
         XO4r2JThzr13aEWlJHlsYZnqmzUzJvUl0Quo66yeJzigYkGdFSZJBq4GYElEXI9+gjPK
         VpWOVVAXHdxXy4o+ro7eu1i7Vd/MUdpIGjbUAqCzAU42+ZFEl/q0cUtiviCQdwzoxRHd
         6Ju9noxxpo9S7ENMzB7lPmBdOxLpqRQbg8xf29vYKn7+yOXAPnP+/7AxiUAJlUSL8P2E
         wPtA==
X-Gm-Message-State: AC+VfDyEN9QnoRrJxYwps30Xw1tlQ1G/ffuV6YrUkbbmKKnW4kkUc5Wh
	z2XpeHMPicMeukhYTuwVGdrjU43M/wqd62fBDN0=
X-Google-Smtp-Source: 
 ACHHUZ61yHu8nog+sCkK52c4zYTdKwCHOnJ1SgnrNj39cUUfGFLp8MGAJGP8r88trdeyUAaTpd5tgA==
X-Received: by 2002:adf:ea09:0:b0:313:ecaa:1e69 with SMTP id
 q9-20020adfea09000000b00313ecaa1e69mr2673383wrm.11.1687793699463;
        Mon, 26 Jun 2023 08:34:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 g8-20020a5d46c8000000b00300aee6c9cesm7718559wrs.20.2023.06.26.08.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:34:59 -0700 (PDT)
Message-ID: <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
Date: Mon, 26 Jun 2023 17:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-2-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-2-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VMACFURDUZFCP5QFBC3CUEBORORZB7FY
X-Message-ID-Hash: VMACFURDUZFCP5QFBC3CUEBORORZB7FY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMACFURDUZFCP5QFBC3CUEBORORZB7FY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/2023 13:09, Hal Feng wrote:
> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.

...

> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwmdac-dit {
> +        compatible = "starfive,jh7110-pwmdac-dit";
> +        #sound-dai-cells = <0>;

BTW, I don't see any resources here. Neither in the driver. I think you
just added this for driver, not for a real hardware.

Best regards,
Krzysztof

