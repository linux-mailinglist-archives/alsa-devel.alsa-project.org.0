Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9A676D38
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jan 2023 14:47:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B308B41EF;
	Sun, 22 Jan 2023 14:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B308B41EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674395253;
	bh=pjuDl3owa7PnqoV1aTQJaiY79Pao9oSHRj5j4jdaWRQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pwZjEgfAk33NlPzxIIAhGi3k9D3EECxMK1m+7mGfvVgnJ9axQrxk21W4FXrDoP9nS
	 pWVj8loc6mKkE4Mpbs7IQHQfDzT20alkwgbVfC3ZKv1BcwMADEVdqLL0xx1HVxgJOa
	 AAW80quudilcnTO+nnkOeJ7h1E516+LA8YVN/064=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AD9AF8027D;
	Sun, 22 Jan 2023 14:46:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F1F4F8027D; Sun, 22 Jan 2023 14:46:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B71CF80254
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 14:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B71CF80254
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vQPJK9GF
Received: by mail-wr1-x42c.google.com with SMTP id d14so4909623wrr.9
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFFimDQzUT1PUoeHrXHw69cxuwe+XSqmYUr+SVIxlF4=;
 b=vQPJK9GFuxfc92n1GVN7YgZabgxrYsm9G+/j3rlPaQ+VnwW4W5IF9cZpQ8ETyHdmjD
 FULKS758vNRCthYOimn2dQv4CO1bpBGT4dZ32TLvC5MIOWwDBBJuZIxmyW9T2+KV6ntG
 s0lQQxZx/ECV5nLd7lAq//Q64KD6vuCw36+XTa2bFNItJfwQaiZ54/j/y6BW06ZFF/vg
 WbNhxuzQDc3+o+UwdNS2Lean2nfY5+pEN/b1mvaf+kgTInzFCgIaznnp+8gWnFF/1ocs
 XLFV7V/U4G8nRnLpyixRGhSJdPaT94FGlId85vS8/gf5Tc70iMGDBfQ8I19WvmggMXuB
 JJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFFimDQzUT1PUoeHrXHw69cxuwe+XSqmYUr+SVIxlF4=;
 b=7xkl7zksEgZQkCvvq18c4vwsFdL7UXuTWw1q9yJ01ZeGE/bb2BrhvSMI1dPJeYHyat
 ViPJrpHeFPTC0wFSRqwP9kEOQqkyL4c2Fwn6FCakA8y8wInGLwiJOA9YCzkDPRkXguDq
 FxNrwKrrxJTIacsL0uyUkWcaB8NxCuAvk0/5Iwe1v9P5QfxsYAOMMXwZfoLXp768SN0P
 4dGZSUIlROTwarPrEFgvO+EpqV4fDafbK9GlosqSdn/emQqCCGaD4BtBjXtcWtEItIEu
 RdCWShzyVD0dWie9xbP1JgwIrH9YhmW9EtYew3kYMvJh6e+5Hx+5XQ0edZtA4wO8ez0f
 sGQw==
X-Gm-Message-State: AFqh2kqUAv6wIjvP7LFMu5iMxKafoeP2NS6yG+jLtM8biyt4l0Bni4ND
 TJX1dj6rl9kN7+dE9KQOGkNwyA==
X-Google-Smtp-Source: AMrXdXsmHGxxuzbOxrsyoftSwkYKBiSqeEBXUurIb/qV9nizgaB3FVmhg7YCwlBr64dr3O6+IzdBPg==
X-Received: by 2002:adf:dc81:0:b0:2a1:328f:23aa with SMTP id
 r1-20020adfdc81000000b002a1328f23aamr18765409wrj.6.1674395183571; 
 Sun, 22 Jan 2023 05:46:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adffe4f000000b002bdd155ca4dsm26032092wrs.48.2023.01.22.05.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 05:46:23 -0800 (PST)
Message-ID: <443199bc-1188-f3a2-b842-a941d91e1dd1@linaro.org>
Date: Sun, 22 Jan 2023 14:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: Add Renesas IDT821034 codec
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20230120095036.514639-1-herve.codina@bootlin.com>
 <20230120095036.514639-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120095036.514639-2-herve.codina@bootlin.com>
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
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/01/2023 10:50, Herve Codina wrote:
> The Renesas IDT821034 codec is a quad PCM codec with programmable
> gain.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - '#sound-dai-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi0 {

I didn't notice it earlier - this should be just "spi".

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

