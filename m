Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207FA784A87
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 21:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449E6825;
	Tue, 22 Aug 2023 21:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449E6825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692732973;
	bh=CgHdeSo0V5+Eh639EZfsWY2KtTrGNimkRAaPyziA+To=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lMeq8dJyjmShqNmvSbQX2+eqgfmBqXDrTOHN6d2kEMvsLv7m1lb6Oow0y6cY2hkP0
	 heuXsJ7CtS3CEaGlaURQMy0AjORvkQPu7YZ36IxXtBcy5kI7Aw3oY6o4yoSBtPqDVm
	 PWKo6qYQ2FS1AeTm3HGdiPKS5sCAxBHSyFk9MxxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8A1BF80158; Tue, 22 Aug 2023 21:35:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C164F800BF;
	Tue, 22 Aug 2023 21:35:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E65A8F80158; Tue, 22 Aug 2023 21:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C14D8F800BF
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 21:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C14D8F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O8p0qOje
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c1d03e124so614798066b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 22 Aug 2023 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692732889; x=1693337689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCcpTzBWSQ+IC9LwkeK4zV70VWPirwKEsLz20+SIVmI=;
        b=O8p0qOjeOgdnidaekqarL8jgxvSEdVprXfjJAmpTMB++3auX4nxd5++LFA/NI+NzpR
         z5qaVw39ymBlfaAJS0W6u7Ky3zpqr4znAD9dJW4DFfHRbTUemeXute5+wzBGm3ea6Nbr
         TZFRlem/nwuBzPJXOkRCL5/fZ/DNjovlh1bixDZb6vM6gPWx7VUWlXW5b9OmrjLGufse
         hxIEY2fkMV/oeu9M1YDVQawwF/iP7y9siRF5C/PVhI43XTMK+SklCheeW5eMhLsLFNK8
         ii8NsC1kDpT738PPvfeHeemw1CTG9+8YEBX0WnjajEH/7D6/d3P0JYCQKM4iHaCVl9X6
         CtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732889; x=1693337689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCcpTzBWSQ+IC9LwkeK4zV70VWPirwKEsLz20+SIVmI=;
        b=QiAX2bvRhhAQwSkK49YhX1WToS1MhV42MoqltaqphzZFHsLJ3hEYqNM/MqTKUwmMzM
         xC/LBrGA8MIfS9SATa7j03qyclVYxvNl3vFvE0ZKz4kOzLqod1R+fQkat8vaYt+EE1bP
         v52PYO8xwrwdO+I6YNXdhjRLPpdAB20Tun64Qo9q+jkJL9mLmfE2Dn4mXiF8WE2wFKUS
         fLI4yoOISNM+g72Ur/YQAhoRh/HyZzoWaoCudqONwe7yceNOrpy6SlXc/y4cA1JURpEJ
         qNQe4aKqdChavNIAiQ/LaKcGzhado8sPOXVMswoExWPEhxBR8BJHNpNqU3Xi5M0EhCgb
         H5kQ==
X-Gm-Message-State: AOJu0YyOKq+FhU/j7uaiS1ByYNTijLSkoEtY0oQQlWPFovSn5hhPAe9I
	RD6rv5js+amsRxs03OYngaIWww==
X-Google-Smtp-Source: 
 AGHT+IFOfpyf9WYKtBPs4WToe/nFPbsX758TLW9u3YBXfFA+NpzYCUytpJ8TL7xHGho5/FmGM2623A==
X-Received: by 2002:a17:907:7714:b0:99d:fd27:b38d with SMTP id
 kw20-20020a170907771400b0099dfd27b38dmr7517648ejc.70.1692732888906;
        Tue, 22 Aug 2023 12:34:48 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090606c800b0099d959f9536sm8827134ejb.12.2023.08.22.12.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 12:34:48 -0700 (PDT)
Message-ID: <f14b9ce4-0cb5-5b76-ce9a-a3db9af9a9bc@linaro.org>
Date: Tue, 22 Aug 2023 21:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230821144151.207339-2-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GX5GKQYRQSGRH6ZZXRQWDXCRO3L5S3HX
X-Message-ID-Hash: GX5GKQYRQSGRH6ZZXRQWDXCRO3L5S3HX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GX5GKQYRQSGRH6ZZXRQWDXCRO3L5S3HX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/08/2023 16:41, Xingyu Wu wrote:
> Add the StarFive JH7110 (TX0/TX1/RX channel) SoC support in the bindings
> of Designware I2S controller. The I2S controller needs two reset items
> to work properly on the JH7110 SoC. And TX0 channel as master mode needs
> 5 clock items and TX1/RX channels as slave mode need 9 clock items on
> the JH7110 SoC. The RX channel needs System Register Controller property
> to enable it and other platforms do not need it.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

