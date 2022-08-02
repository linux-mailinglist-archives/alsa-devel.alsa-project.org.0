Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB3587ADF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 12:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838EF84B;
	Tue,  2 Aug 2022 12:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838EF84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659436922;
	bh=VtoQ55mpUsbtDflZZJA+WT6QidqQ5ARCyKjwQSjySp0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahIZ/RghAFibMkJ3v6zWjLjb1tLt8KYCNFqJEogrJyK6FiRdR1dODHnNVS+i2bHkw
	 7jlGzB6Dsw8RzZohRb4UqUGzLQ1N0fFbWpa9ClAQTfER+I1AvDyOWw5Be3oE6eEF6e
	 Ef6tjPqT3bZY9d7Jts5J5aYRMbJImyufVWeblVmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06450F804A9;
	Tue,  2 Aug 2022 12:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12A07F8026D; Tue,  2 Aug 2022 12:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72667F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 12:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72667F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qhkT18pq"
Received: by mail-lj1-x22a.google.com with SMTP id s9so9185949ljs.6
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 03:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6zonPHc10wroJYzLLqDfZXlsbdw9PnagEXnZiDm2IM8=;
 b=qhkT18pqWd4Ope24rPhU4UQNXEeEhU8JPJvRH/jsNkNGnGEFvkoGfIvgq/QU0EDJIE
 uaDX74nH7ivlK6+KPpyITD9GALgHx/sBnO6Nv8C47nSStcHeSLqvR/s38UOtPflpYa0D
 fsNzs6BYIi4hPckKg3zHv2VujKa1YpGYaD7+IkrOttF+n6fk9mdpeuTF2Dbh8Ns/lfPM
 KZr8r+p1NbVIrlggQQmoKDrM5DnXN8welF9mX+hK7WaG10TaKLX8QL7BduNSr0f5CmIb
 HF9e7jzB2fegrDnl9gcIA78opJ3eZ6WvYJ1lwjS8jCt/x2mBVE+uWkkXMCsMAkAfTG8b
 3sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6zonPHc10wroJYzLLqDfZXlsbdw9PnagEXnZiDm2IM8=;
 b=IL41Z37vKKaJ4+rfiakavszHp2peK2JmstxkAhu1eg0rqHo38YKMRKm5CoWhIXAJKo
 KyXIxbu/wLY1Kw5kkecV9z8bRIEJk7uVeXO5UkU/0+L9nZQpXNUl990RuSuIMiBwZ3sr
 WPYbKVHGGGXdkQpEEfa9jbPdFRiEOcERJ8nLPyx1akWxvCaZpcSy19qioTqS4wMAQUMg
 YErBwotWhQ15N6IXK8fxCXCfUlReshV2HQwdXLmKCqz9KjISVXBKTg3Tr0PDZ8lyrg68
 3IaXcSJtB6TmqskssETt0+nq1X15A5iRTyh86BhMS9+cDIvYUuMwZswe/g/KmXr2g6uS
 gO5A==
X-Gm-Message-State: AJIora+849XKX/jrqHh/nzhbl3xDhpD5nYGA8qH1GVmQJnBKK5TCthCF
 dFD/apgE4O9lnZL0WGRDp30FHg==
X-Google-Smtp-Source: AGRyM1viAq740fqolN8iRpjad6KZJCVIGS0x4H0903BIUCQeult2NlMhLbS6JRtnajWOcqV+6gk1kQ==
X-Received: by 2002:a2e:a812:0:b0:25d:d922:d with SMTP id
 l18-20020a2ea812000000b0025dd922000dmr6081524ljq.181.1659436858230; 
 Tue, 02 Aug 2022 03:40:58 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 a42-20020a05651c212a00b0025e3f7fe9fasm1342295ljq.67.2022.08.02.03.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 03:40:57 -0700 (PDT)
Message-ID: <1bbb7f38-69ba-583c-e8ae-ccff3ad8f08d@linaro.org>
Date: Tue, 2 Aug 2022 12:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: Ban Tao <fengzheng923@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 alsa-devel@alsa-project.org
References: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31/07/2022 14:51, Ban Tao wrote:
> +    dmic: dmic@5095000 {
> +      #sound-dai-cells = <0>;
> +      compatible = "allwinner,sun50i-h6-dmic";
> +      reg = <0x05095000 0x400>;
> +      interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
> +      clock-names = "bus", "mod";
> +      dmas = <&dma 7>;
> +      dma-names = "rx";
> +      resets = <&ccu RST_BUS_DMIC>;
> +    };
> +
> +...
> \ No newline at end of file

This has to be fixed.


Best regards,
Krzysztof
