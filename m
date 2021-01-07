Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FBC2EE71C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 21:43:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 544DF820;
	Thu,  7 Jan 2021 21:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 544DF820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610052233;
	bh=nyzb/NZIy0yTBLIJdeLSTy0/vrIiDJghtQHaVRGdAnI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHjYjuAB5rUFvXILPH92qoddHQe0m81RU8pOFPNbg/veLG7ROyoTTyQVLDNwQlgOf
	 uBbeFttEMeCrrHheNZIXMJps+NBZ45I/EkUul5x/FAfu83UifS2t3vLEhky3VPKwBx
	 aUt4aM4bOi3dNHDvt5Axm0p75zSRQxsN1jPgHoeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B63A4F80268;
	Thu,  7 Jan 2021 21:42:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836CBF80258; Thu,  7 Jan 2021 21:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8F33F80096
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 21:42:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F33F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J4ajw1Km"
Received: by mail-pj1-x102f.google.com with SMTP id j13so4556117pjz.3
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 12:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cuoCbRQw3rMvERteCyKGrrf9/yf2A1AnTY627fg17lw=;
 b=J4ajw1Km7zhXbjuJeqS8QRw1QcroU5MLXyTDJVcOw4f2cEgzL6mt9s9ROa89atXqy1
 jTI03VhAPcKo0AARPFiMmZHxw80E1S2ROvUegmUBhEMM4uTkuNYeiVnbKOWY+JudEhbg
 Q8zTy0sLJOM95B/eXOWDvbhAU+ow+YXmx1TvXXF7o4wz3fxMU7fjS+onq9O6vGDLz5FO
 hVLnr0iKsD2b1pUtm/LTtq1JnkrXirUav+bVitTh/iQ487b+xUvHDFVXstaN0TKkwJjR
 AXGkPqK2dGiZlKo7AtLwVyOCSJ/4Ojn60hT9TA+OpP7Vig8urYnUdoD8h1qdc0mlAAnm
 kj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cuoCbRQw3rMvERteCyKGrrf9/yf2A1AnTY627fg17lw=;
 b=K/EFMXPno08v+lHGRBUBTTsZZGg+U9UVQ2ehNp1fMDck5gKBWn/adsDrjujfGt2r+Q
 qCBg+hoDsfx3JDfvZeJW9DkGD1WO7bSTr0sqyPZFyNJvPM/c53IIsQOgEXmJUvO5kdBk
 n28t0TlP19JQguKHqqoSUy8unIXjcUAKBh7coa27a4HgFS6xkNAYmdzMivl+KyrhPbaX
 sjspMLWNjUxs1/VmN3tr/Njg074hkwiv43zq3/aLtNWKR6BMzAJKVMrA5Uewr0BzYv7r
 hO30YRJFsRxSk9ICUNMtW7vNVImnrqd610fCzlgMeISCssfNgKZ2XYcEWAIaA6RUsMjL
 7AqA==
X-Gm-Message-State: AOAM5327L9sM1w3tOJ9smpwYIOj224CsatxYB4JsUXsPxJ1aG1e6YTnr
 uqPeE9cWRmLnrXGPNinYuGE=
X-Google-Smtp-Source: ABdhPJwju93JWZHMwJy8biEF4Pf6JIHfmAxA2anJVCDB+3xn4SiWeKp7PuCBFtNeopmeEu5dDi1ADg==
X-Received: by 2002:a17:90b:512:: with SMTP id
 r18mr265953pjz.166.1610052124445; 
 Thu, 07 Jan 2021 12:42:04 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 22sm2891150pjw.19.2021.01.07.12.42.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Jan 2021 12:42:04 -0800 (PST)
Date: Thu, 7 Jan 2021 12:42:22 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: Fix return value in
 hdmi_codec_set_jack()
Message-ID: <20210107204222.GA11567@Asurada-Nvidia>
References: <20210107165131.2535-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107165131.2535-1-stephan@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Thu, Jan 07, 2021 at 05:51:31PM +0100, Stephan Gerhold wrote:
> Sound is broken on the DragonBoard 410c (apq8016_sbc) since 5.10:
> 
>   hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at snd_soc_component_set_jack on hdmi-audio-codec.1.auto: -95
>   qcom-apq8016-sbc 7702000.sound: Failed to set jack: -95
>   ADV7533: ASoC: error at snd_soc_link_init on ADV7533: -95
>   hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at snd_soc_component_set_jack on hdmi-audio-codec.1.auto: -95
>   qcom-apq8016-sbc: probe of 7702000.sound failed with error -95
> 
> This happens because apq8016_sbc calls snd_soc_component_set_jack() on
> all codec DAIs and attempts to ignore failures with return code -ENOTSUPP.
> -ENOTSUPP is also excluded from error logging in soc_component_ret().
> 
> However, hdmi_codec_set_jack() returns -E*OP*NOTSUPP if jack detection
> is not supported, which is not handled in apq8016_sbc and soc_component_ret().
> Make it return -ENOTSUPP instead to fix sound and silence the errors.
> 
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Fixes: 55c5cc63ab32 ("ASoC: hdmi-codec: Use set_jack ops to set jack")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

For imx-hdmi:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
