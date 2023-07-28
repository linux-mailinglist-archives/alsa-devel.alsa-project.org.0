Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658D6766D9F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 14:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A45183B;
	Fri, 28 Jul 2023 14:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A45183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690548746;
	bh=JzdEukCtt8cZhLWRKlkkqjM0UmtZtQUt+RZ3eXG9C1A=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PEG22r8b/8ZeGqWavDDnVJ3ulr0Hy7Gariueb2lqvXrkaJnUl4cB/ErRZgBr6Bw5O
	 p5RpE+j453fu7rWJgOTpAoyIC9440ro+Z7noPDhcPlK93LDIGTGPa3YxvF7jB7eWlM
	 DGiVeGyT24n9HElSWVMoiC3SgMFaC/MFebDKAEmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49FEDF801F5; Fri, 28 Jul 2023 14:51:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCDC2F80163;
	Fri, 28 Jul 2023 14:51:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 053FDF8019B; Fri, 28 Jul 2023 14:51:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AB00F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 14:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB00F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wZkbNGqQ
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9923833737eso284080066b.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690548689; x=1691153489;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gedJLHyl9jYC/USPCijx0sE3um9fSLBbzPsw2ixUmqY=;
        b=wZkbNGqQ3uw7mcIwc1dl7W5fqIdyvKuQUlDtB8gOcchltE1RNPokOIfX3a/CvA/g5t
         mw2xEn50S9OLn2pNFVCuTMP86YFrvZKsDIBDutAbKKuSiTQPY8/b4MCrKdJQYFfOKVv/
         Ty3Lw8A0HAfx+lgEd/6uJxOqks62xu8+dJP4KoIOWfeIZFIK1rb2giVKIpibsczYWqqU
         7k0zJTnEguhscCH+pXhGphDy2A0CNjWyoqyxlXMi54Vl+hVfx6m9a3Zt8jdwrObAQcnt
         S/tQrXjg6JBJYzZih7sFc1ERLc5iEP5Uq26CzNJrJcWUunD0PCgjfVnRAEgG4GAUcgk3
         KGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548689; x=1691153489;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gedJLHyl9jYC/USPCijx0sE3um9fSLBbzPsw2ixUmqY=;
        b=JNw5B3oxrFYM6jbTWhgWAy0AORmy0BwWIGAXTdyGge9X+JWwH1DzZYcjZ48ctz7vRa
         lBMuFM9OuxNGVOTcwixe1ecXPKBExCVps3XFXhf+xdvCdY3TYo0tE5HSQQVf5HpH/9Xn
         oiXmPJVxTws7Wnlre9JpU8QI87DH6RB8B8nYPYD7oiXawul2h6zAcDkXIygpHRn0Tfdt
         Q1Tdc2EP3uTnFaYO2jxNz+hzcgrFuc92YTGrRs8GcDQ7agaynndPPZgSyZb/V33rVkHL
         zrh8j1JvXUYYj3q+7aCVoe9MUnY4n3z5AuFwwanLGqKtrgNwWcouqfzhNA6+RUNmiLwV
         gD7A==
X-Gm-Message-State: ABy/qLaXPAMPrb9Gu+sCUIBovB44r5fXksyIkcI2d6brtXvEziAjvaHf
	DujC2Zh1AcUtFC0iQKmkt70n9A==
X-Google-Smtp-Source: 
 APBJJlHax6AsxJudUM5VqzR8XMQAFX9jqhmnuuAP0jJ/YQ0xu9Ni7Sg1fWIzJHA9rNtfwWtbo3ixhQ==
X-Received: by 2002:a17:906:319a:b0:994:34a2:8727 with SMTP id
 26-20020a170906319a00b0099434a28727mr2157378ejy.41.1690548688933;
        Fri, 28 Jul 2023 05:51:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 sd26-20020a170906ce3a00b0099bc08862b6sm2054522ejb.171.2023.07.28.05.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:51:28 -0700 (PDT)
Message-ID: <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
Date: Fri, 28 Jul 2023 14:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-7-maso.huang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728090819.18038-7-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3T4CA6VL3XNOOOCMGIPZ2CLOIQZFALSH
X-Message-ID-Hash: 3T4CA6VL3XNOOOCMGIPZ2CLOIQZFALSH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3T4CA6VL3XNOOOCMGIPZ2CLOIQZFALSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/07/2023 11:08, Maso Huang wrote:
> Add mt7986 audio afe document.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

You should constrain your clocks per variants. I doubt that they are
really so flexible/optional on each SoC... or maybe missing clocks are
result of unimplemented parts in the driver? But then this should not
really affect bindings. Bindings still should require such clocks. Your
DTS can always provide a <0>, if needed.


> +
> +additionalProperties: false


Best regards,
Krzysztof

