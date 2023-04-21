Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE136EAF53
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E69A2E97;
	Fri, 21 Apr 2023 18:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E69A2E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682095098;
	bh=7Ah+CeE2jc4TmQFK2IBK5AHSxR0nH4RLt0ckWxOm/cs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HB9V+s5PyBazXCAM4t7IddTeFNAFqdhWl+YZwF8pk/V35U+Dl9UMA49EWCY6Psvq2
	 SIz4Kd0GMp+Wr8edgCRFWoU0ektBUpIwAQq5tXZQxKEyQqIGmZej+2QPO2+1I5zMc9
	 y8FaxiOnX2os8nzo+cBK4DqpPhkUMu0UjbjPs344=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DE1F80149;
	Fri, 21 Apr 2023 18:37:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4AF0F8019B; Fri, 21 Apr 2023 18:37:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D563F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D563F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cUGizRfj
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-956ff2399b1so241265666b.3
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682095027; x=1684687027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qwm7nC58x6Qg4M4BLeXeY+IRBzBS+KjdazE+g1goFZk=;
        b=cUGizRfjIXcfg5P+5cJVp+JcsumxnDw52sCla7aQOesNv3HWTeGTTUu+clkj3SO+Jt
         UkF8A4atIopljeZlvVBVZdeU5Ou0dmG8E6IPK+E1zwSjNSreqwOalmCVtFltT1SUawKF
         LIl0BKKYc9AE7QvABQHHlZVoXPPDBGb3cWkbSyQPWHZgatjXZVCjRQ9P1BrqGCVZGVyI
         uYQEdPxPBIBb4ja+UdS+qctfV2wGQPV4zOqpyCRmohvt5J+t0SU0R5z8z6o60umlZf9e
         S/hQSXUIqbelyvbSUwVkBtqqbqT5e7VHXu0owa5LQ1q9Z5vWa2OxOTekB/FwGHKcpEua
         GNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095027; x=1684687027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qwm7nC58x6Qg4M4BLeXeY+IRBzBS+KjdazE+g1goFZk=;
        b=KXzDIAmLnlccBkrjf9bnsUSnhx+4H9dLFswNvZTp5nl80Z23g5o8gmrdwWlh6X3W4+
         bbQbXFqOIhuSR2s5x11Ge21B2Gv3i97jqzkJkyzRZLdhhE+74vvvClpDa28a0BFo/Pjg
         Qtwqlk/HfMuHpIcPa7Owm2as4nwbBCPaUir7mlZmYep/JeaCBZ5/kw+JhVTuLEzF76Rq
         dVB+uhw0/N77Vp5WXM4umjmyodkMFNgWdfBjz2M53MA2CXlD2COt1UxYRYylG5P5S20T
         5+vDAtwQnJHlfPYM1CTi3IQVnAsYU4qEg58m0gcotbGdFZvTMpjJqvE9HT59zcI9AFxc
         d33Q==
X-Gm-Message-State: AAQBX9fq8WZQBVRkAZcMd2Sse4UzkgabEk1u9zYjmgcv+sikNuuq1kXy
	wol5vWm2jkCuet89fUQjMHtgyA==
X-Google-Smtp-Source: 
 AKy350atdmkxUyilew1Q6xsOtvyIiqhC+U/ckBLAq7AQ8Q8Vu+X6Eirq+VWhTiX9BrshfXr7DPPUEQ==
X-Received: by 2002:a17:906:fcd9:b0:94a:56ec:7f12 with SMTP id
 qx25-20020a170906fcd900b0094a56ec7f12mr2820823ejb.30.1682095027250;
        Fri, 21 Apr 2023 09:37:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id
 op4-20020a170906bce400b0094f39379230sm2254990ejb.163.2023.04.21.09.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:37:06 -0700 (PDT)
Message-ID: <6747425a-fff7-c873-bf7e-05786d67cc7e@linaro.org>
Date: Fri, 21 Apr 2023 18:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add TDM for StarFive JH7110
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420024118.22677-2-walker.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: G6LTIP62OV2DVLXGPPKLUZXEJ5QGVPWC
X-Message-ID-Hash: G6LTIP62OV2DVLXGPPKLUZXEJ5QGVPWC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6LTIP62OV2DVLXGPPKLUZXEJ5QGVPWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 04:41, Walker Chen wrote:
> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/sound/starfive,jh7110-tdm.yaml   | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

