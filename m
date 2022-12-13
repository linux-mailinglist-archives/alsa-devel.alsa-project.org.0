Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1F64B628
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 14:27:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C95E717A3;
	Tue, 13 Dec 2022 14:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C95E717A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670938072;
	bh=4LEb2GjAqGcbS1a3xKbfwCp3PVLJuS2ZEmKBnoTB4Rw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NqK75zKQs0HzGDUW4lHZoHbAfTjY5tVqDQm/vWwZF4kWSCseMdWLP8eL6baV+JIJO
	 BC/HJmD/Ez7UXGEheVlccR/l+TD3NZSlpRXzAZ0Jf4oAxpG15G7ACMQmrnzm7ySV69
	 Y/fedtYmf9BORPFfgYpDPc3Kk3oyK3skcKdnzmMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA1CF80073;
	Tue, 13 Dec 2022 14:26:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FB91F804E2; Tue, 13 Dec 2022 14:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 942DBF80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 14:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 942DBF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vJC1INFA
Received: by mail-lj1-x234.google.com with SMTP id l8so3247470ljh.13
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jMBEHcR6eYmf2LzibHeCt+uH2Wp5YbwVlZiT7yo2Dwc=;
 b=vJC1INFAqLuRsMbqX8Muf9Ap6oRaHXD23U+D4yAowDvpbaZSztKLp2+ED5Y99heYY6
 gbFz2w4vpz94p+vBlC51q8Ii6VVzsj3eRN822bv20/PXfFl/7hY4hFfzq4rFHHo1iqth
 sx/rzot9eRRSeuNLgs++Ucpv4Yo9dwwumqIKGnYkIX39K8dFU6H7/S0UTZuOyWePxiv3
 Vx4dsK0fjJPEvUy9wbHYKbSHvyyBp3VAOmLfqbKTpJzHM1J5su8jf2XF6MR4SZaZe2Sk
 Ugp3eZ/Yl2Yq/15SM4mGxm58VnbIpVk31miudytxI3hJL7nXkc9CBHBm54UjhfVNUGRg
 7InA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMBEHcR6eYmf2LzibHeCt+uH2Wp5YbwVlZiT7yo2Dwc=;
 b=Lx9xGNtdepa/mU68cxPWq0XNA5VlpG+OcUMHNJzVDvR9zsjBEAXkW3F+Sd7LGXyqr4
 B0cwu2zgvVcZHkLpIKRq/5oB5nUWBuom3hNKVtycYUTnV/MYzC1FLZ+/fhNIu53lPn7D
 mFpGwfDMCwTL7wjZ8yU8XMt91jIoZaO5e7VCzIMBhiMnDeeZIaj5aF4h6y1yJIzqVHE0
 BIkupwL8HJK7IA6cNWI3lGC0M7Tuown7VNrj+sw1PsFPX9cag2z6E/3epgLklPk0+Zdq
 bts5EF1R4sbw0w8cfJTFkL214u3cE77TNJks7OpXFJBdivzzWhJqhTaSa2t2XQRHpYZg
 Vcuw==
X-Gm-Message-State: ANoB5pmzo8ue3sMG6Rjwe3hnDU6QmTUdzMnI0IDDK822AW2ADXL96mND
 cMix9b8iPhrWDFfpF4fNKWBvog==
X-Google-Smtp-Source: AA0mqf5nxujINbnB+Mmis+ae1GJLYoV/F5sxaSRZ7uTnNZPAN7ZVhq6Huk5DNCJ2Xpnren1UHTbOdA==
X-Received: by 2002:a05:651c:887:b0:26f:db35:ec42 with SMTP id
 d7-20020a05651c088700b0026fdb35ec42mr4677813ljq.28.1670938009376; 
 Tue, 13 Dec 2022 05:26:49 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a2e9147000000b0026c4305e5e2sm263699ljg.53.2022.12.13.05.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:26:49 -0800 (PST)
Message-ID: <b52410b4-e2ac-660d-cf6e-0aa9ed0a72b5@linaro.org>
Date: Tue, 13 Dec 2022 14:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: microchip: use proper naming
 syntax
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
References: <20221213112851.89212-1-claudiu.beznea@microchip.com>
 <20221213112851.89212-2-claudiu.beznea@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213112851.89212-2-claudiu.beznea@microchip.com>
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/12/2022 12:28, Claudiu Beznea wrote:
> Use the following syntax for Microchip ASoC YAML files:
> vendor,device.yaml
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  .../sound/{mchp,i2s-mcc.yaml => microchip,sama7g5-i2smcc.yaml}  | 2 +-
>  .../sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml}  | 2 +-
>  .../sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} | 2 +-
>  .../sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

