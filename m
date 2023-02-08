Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C007A68EB83
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973F6839;
	Wed,  8 Feb 2023 10:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973F6839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675848906;
	bh=9+nccERX+E6QWW+tXul5TSC8hDkskscKY4bDg4HUvH0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PkSpRF7ZwmaQ3ts+hk14PsVwNvz1cuQW00XQVBr8Vb3qKYykLuFO2tKXpFUNAVUyx
	 95M8KWDmOEK+QsjhuhJQ9Sh0AA6s41S1IEb7vKveX6b3uwF3ykT50Z89yvoJE0Ig3S
	 6TvQQoV9mC8rSW7smScZcW0IqYNTrOAHJ10ssXY0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1AE7F800AF;
	Wed,  8 Feb 2023 10:34:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67C09F8012B; Wed,  8 Feb 2023 10:34:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4B85F800AA
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:34:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B85F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qr97IGN2
Received: by mail-wm1-x32b.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso978452wms.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 01:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB2bPp50WgZSDJ/Lsp3Za88vOItyDoAVOCUqcyCy+KA=;
        b=qr97IGN2pyQzY2tS48eqrFPTHsuBfvHCpaJtyNguRM/Sel5MdcdzI226ZmJGbGnZTK
         zoXUVNn9U6be4SoAHLpuz6jGfQZaPuccmftX1Pxh1mkGBkLHrq/XYkrzTcpLBuQ5uWUX
         c6J1lYFuvWIt2VVQJg/Fllj9bRitYkWmbgcfR4uu8ECDbJWZYFzfJg/ufRlYZhNSxr/F
         9jI6xFJFtojRuyuiU09VqGBobk5qIuaJvgVAIaCJ6NkyeGOUxgAogaViIDXc/bL6QDaX
         0/EIJmxX0z15cfsCVD/B57ryUSY9YsHsODP5EoZsx0KmY1eDpW2PJ69bzBvdWDdGE/3p
         E+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dB2bPp50WgZSDJ/Lsp3Za88vOItyDoAVOCUqcyCy+KA=;
        b=JSF36lS4/ZFz6ZPWiCUn12lcOB0E1lewLw9BlZDkigMYukLVjIx2cymB86PTbSwNlw
         Ly/pqgu6k9EPjEZmx/1vuKNrNUiRQ4yzHSiqokjlHViQpPPY1jaizAFEaSyGIfz5SZo1
         /YB9vN4BRcnb0pg7VsASnaQs5fAxuFFnzGSSuWi/krvtGCU7irmhdqgfesO1WAFPaVU4
         X85PHTmujFIl8WKTV1yoGCcT3iBEj4UbUcK/545TZvYa4rR+4eb2Ng8xIcFK9PUqdPq7
         v/V8LoCBFRvLlxX7utWhWIMYkcJOoLJj+v9vjlfRfiCs3HUtY+Ng65IxowkfnllF7PYT
         9oEQ==
X-Gm-Message-State: AO0yUKUkfF+4wKPXjxfQFY7djrsDcLEArTKddIKpKlbYBnZa7TEC8JHJ
	5ozBnD8TRr3UXFdd1OGHGO1CNw==
X-Google-Smtp-Source: 
 AK7set8yfhlKW/XXdIic534Q5oN5SJL8PWHGQyewtvP85A4vzLE7Y4CcXt+WYFhwgvnw7GkY24z8AA==
X-Received: by 2002:a05:600c:3412:b0:3e0:481:c88f with SMTP id
 y18-20020a05600c341200b003e00481c88fmr7922009wmp.30.1675848842970;
        Wed, 08 Feb 2023 01:34:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003dc59081603sm1253932wmb.48.2023.02.08.01.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:34:02 -0800 (PST)
Message-ID: <481a2a2d-bf2e-b707-1a32-8199eeda78a3@linaro.org>
Date: Wed, 8 Feb 2023 10:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] ASoC: dt-bindings: irondevice,sma1303: Rework
 binding and add missing properties
Content-Language: en-US
To: Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
 <20230208092420.5037-8-kiseok.jo@irondevice.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208092420.5037-8-kiseok.jo@irondevice.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RBCUZI6O62XXM6DWTUXHVWSSG72VAM5L
X-Message-ID-Hash: RBCUZI6O62XXM6DWTUXHVWSSG72VAM5L
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBCUZI6O62XXM6DWTUXHVWSSG72VAM5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 10:24, Kiseok Jo wrote:
> Add the missing properties as compatible, reg, sound-dai-cells.
> And then check this file using 'make dt_binding_check'.
> 
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
>  .../bindings/sound/irondevice,sma1303.yaml    | 23 ++++++++++++++++---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

