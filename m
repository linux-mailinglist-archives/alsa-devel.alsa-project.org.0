Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6035F5801
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Oct 2022 18:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 921A215CC;
	Wed,  5 Oct 2022 18:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 921A215CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664986045;
	bh=XGeSFg2zHyarWq0dddUL3JJy7Z5qt/MndwL/BaETKTc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Auj1sBosvQiY03/FLme8dTdXcF96xYj1rzVrvDEr+QdjD0bc4BArArnRvoHHasvLb
	 aDhEyB4mXux3upqC9BtA1wf5uhVkyFsSV26uhjbRi0lc8U1v2+MwkmSgzlEbc1m1En
	 J3ANsCQnjamchcExxuFxw4Li4P+PG81jA4XQFUpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C03F80212;
	Wed,  5 Oct 2022 18:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 241ACF801F7; Wed,  5 Oct 2022 18:06:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB7E8F800BF
 for <alsa-devel@alsa-project.org>; Wed,  5 Oct 2022 18:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB7E8F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FAq/yy0v"
Received: by mail-lj1-x235.google.com with SMTP id q17so19236930lji.11
 for <alsa-devel@alsa-project.org>; Wed, 05 Oct 2022 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ZERdQhbDaczv0NU+A7eG7s+5FSgBpXxPUoSQA8lbTHU=;
 b=FAq/yy0vyfShg8VUiTgEhCo5u+QOkCp1Kva7RTp3z31hiGpLzW9YdJPaTLQ6DhL/gm
 tUvb9YN5jGFenVCT/Kk2sCnpNUR8CSo23Yf5fBzYZdoqok4qOf+IGCjLmZH6JFjN+kEf
 ZkkvyWX4FYcIHSrVNVqAyv09PEsqbx8ifO9DmVuJBsPrESh7TBeQvHQNKHlyjxLQczyq
 BiEMz3/W/iwte9XZhdtCwXEuUMx9pCgs0n+3AWyF1juzWZ5qpelHhG/XPDxA5ioWZk35
 plinV9zxeg9LkiShuXurgCzCYcoR9oEcdfGcHLNu67aPV3ubttklLuEqUiL8umDJGpc9
 Z6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZERdQhbDaczv0NU+A7eG7s+5FSgBpXxPUoSQA8lbTHU=;
 b=KmkZnSEvExUrvXsiEhldKqGGyNKU0fixMJRKtpg9fc2PAVzXimBGXLOqrZMp2u7KFm
 0KVo7w93x7j6vwvoctN+ImQKIyQzPIqQg5Re7wFq/xSpNGQSWSHXucjIqYxDS86soFDx
 gvqZ+jMuvrbOe38PZ/TFMQHltCK1ZOuxNuVhF6B4OmL646I4r2j2Js00Fs2bSgWxn9Dj
 4GGBENcQzdXMQdPDxvbRuugk5OC61sBPUt3xLUFB01qlVySQ7twwf00+Albio9lR2nCY
 JzJDWSoXxiFMtPcRtn28xwrHLCS1aJWcFuTubUxYHhMYkhTOilTmw9gTPgJ79QYhjbJI
 VJfg==
X-Gm-Message-State: ACrzQf2YOvqVU9r/oRnEGl0FEldB7Noho4PQW2dUnuaM4dazbDXsQZUj
 79oG7AVlMM/qWUJeFJgsBm1x9A==
X-Google-Smtp-Source: AMsMyM60n0F+taJnxZ8SXzF/fswONKQciihMIO8DZjGfogCLT4EOzDmvfLuPvGPb5MDf4kMPMEKwFw==
X-Received: by 2002:a05:651c:2107:b0:26c:504f:6de4 with SMTP id
 a7-20020a05651c210700b0026c504f6de4mr129707ljq.414.1664985975207; 
 Wed, 05 Oct 2022 09:06:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 i2-20020a2ea362000000b0026c2fec2f8esm1653243ljn.84.2022.10.05.09.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 09:06:14 -0700 (PDT)
Message-ID: <365e37ca-1c70-93ae-8507-35f08639088f@linaro.org>
Date: Wed, 5 Oct 2022 18:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: add pin-switches to
 audio-graph-card2.yaml
Content-Language: en-US
To: Claudio Cabral <CLCA@bang-olufsen.dk>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20221005142734.2724537-1-clca@bang-olufsen.dk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005142734.2724537-1-clca@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>
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

On 05/10/2022 16:27, Claudio Cabral wrote:
> Document support for pin-switches in audio-graph-card2

Full stop?

> this devicetree property behaves the same way as its homonym in
> simple-card

Missing capital letter and full stop?

Instead please describe why do you need pin-switches in this binding...

> 
> Reviewed-by: Alvin Šipraga <alsi@bang-olufsen.dk>
> Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>

Authorship or contributions (SoB) usually means someone reviewed it and
there is no need for both tags. The combination of both tags above is a
bit surprising.

> Signed-off-by: Claudio Cabral <clca@bang-olufsen.dk>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-card2.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Best regards,
Krzysztof

