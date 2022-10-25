Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6B60CBD1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4B405268;
	Tue, 25 Oct 2022 14:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4B405268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666700881;
	bh=d7PnVpDND9q6ZUyTJMosP4xuHPXooAlaCKp1KBcs6Tk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/qvMoFXcWr/9Y9V8UspCFch/ifWF+TlP7DSZcPPT0PS95XYlXDX72yYag+wFrIaG
	 H4RUmnqej2wf74WoHHDswKa6St5Gb6GBYaRkDyEXDtLMcNboqa2K6ByZqOLWqALaxh
	 wXyqHlwMcfcfn5vO8E3BmyeTbnocqO1TfAzSyCpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90597F804AC;
	Tue, 25 Oct 2022 14:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E73AF80240; Tue, 25 Oct 2022 14:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D41F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D41F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ty+JBmSB"
Received: by mail-qt1-x836.google.com with SMTP id cr19so7384593qtb.0
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xCIU8CZjfuPZw7IS/sRiIMsineNAClLLYlq1Bt65gWI=;
 b=ty+JBmSBnsoFGQoN3FXgSzneooTBYtKYwlu9c6DqoYdZCjylA4+3SGvmOyGcw0EtW3
 PdTYmJOMFd9R8PDUnsmwKjyc2gdo6c1Y09qcZOU+4kAfOnozKWRuER+6ofzO5YkM73fc
 CEEO4JkJEgzv+WKgfBbgrG0p1HTo6II37FW5LspmNYqzy1x1DrVmnAB0a+dqxxabAhqa
 BC2wOJcaF5lUTxND52MSe/AEnVp6QmL0t7VHRnv08qVP0tViL+lPhsbta0FcTIetAZ5C
 ycvGDrTe9wW2CCxZrzqALE3qDr2btEXOWON7R0wjjOcktz3lknY0Z4ZHTat57cVMsPZC
 oxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xCIU8CZjfuPZw7IS/sRiIMsineNAClLLYlq1Bt65gWI=;
 b=m/SWPxaJ3sqR+zw3x7uaGuFiEtQ6b/cSpr+CwUNAtR5Q+JijqTw/dDTnL14l2fFD4h
 9C/hqmgjeHnq9q/oTsgT+rUDwbkudTIi6ZdLFeVftwo3a3gHDKSJQ69YtttFMc1wYXzo
 KyWd6A2is0aTNTibUVWYga9m1gTqGF6Mjj1/Mjh+N0WlhsugiIWa87PTQ3uGkCqTl/m2
 T8lE8cmMSlOpCNmuoSbhxj5lB53oJLWl5xXR24f+EcMZ3/rok/Rcn9wbE2HgPich1Ld3
 4jo6UsmB/kVDsxIvFauQzMI3jQcV0YcGtwhXFxFrypBE0gVxSyGT7Vqsr3jdZXYFWISN
 LgxA==
X-Gm-Message-State: ACrzQf2ucJTbqNcikvxP22ZQjbScTPbcIfSE6UblJoRPvA3hc+zecksF
 cKYz4QVlLGHbkTbEiQfzwOwfKQ==
X-Google-Smtp-Source: AMsMyM616hRFDMD78cMDiRdvGGqoFXuOCYHofMIyqXoqO7EGsp72sOoMZz4ijuR6Nlf4tF3bGhCT8g==
X-Received: by 2002:a05:622a:310:b0:39c:dc1f:dba6 with SMTP id
 q16-20020a05622a031000b0039cdc1fdba6mr30526799qtw.121.1666700812319; 
 Tue, 25 Oct 2022 05:26:52 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 135-20020a37068d000000b006b5cc25535fsm1889640qkg.99.2022.10.25.05.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:26:51 -0700 (PDT)
Message-ID: <a344ef3c-edc7-99f7-4507-9c7378f38a87@linaro.org>
Date: Tue, 25 Oct 2022 08:26:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/4] ASoC: dt-bindings: rt5682: Set sound-dai-cells to 1
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-4-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024220015.1759428-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 24/10/2022 18:00, Nícolas F. R. A. Prado wrote:
> Commit 0adccaf1eac9 ("ASoC: dt-bindings: rt5682: Add #sound-dai-cells")
> defined the sound-dai-cells property as 0. However, rt5682 has two DAIs,
> AIF1 and AIF2, and therefore should have sound-dai-cells set to 1. Fix
> it.
> 
> Fixes: 0adccaf1eac9 ("ASoC: dt-bindings: rt5682: Add #sound-dai-cells")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

