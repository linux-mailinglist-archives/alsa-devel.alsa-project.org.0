Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD34E7482
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 14:50:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354A11683;
	Fri, 25 Mar 2022 14:49:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354A11683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648216247;
	bh=wtFdY7L9jEbHbUZpEsaJVL8bmFr2sDAxxXdfZ2px3oI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BUzjGbMzJ3OHGB/77275rzFCs3mukMC3jivOf0sw4ghIlCDbVKGIc4fOPzIhsZqNs
	 i5QGzTKU+8JSxcaQn2FEujbNF5aEpxwrZ431fjYm8X7tNwu10OsQhyyWuI95rIrsPa
	 3KDaytxDCAM0dfX6moqtbfS2pSH2ZWFhiO1J8kfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C15F800F4;
	Fri, 25 Mar 2022 14:49:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F10BFF80162; Fri, 25 Mar 2022 14:49:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E34F80115
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 14:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E34F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BaJZvsjy"
Received: by mail-ej1-x632.google.com with SMTP id qx21so15440970ejb.13
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wtFdY7L9jEbHbUZpEsaJVL8bmFr2sDAxxXdfZ2px3oI=;
 b=BaJZvsjy2DkrATetK7H3L7xir9hO+k/EXO7DZZiJbce+DlXKd5VCZApZjtmo/n7hER
 1AR2mU/epdU/QxaDgsu+thXCv93/FNGJzXhbNXms8Cv6+9090pmn/0u7o82Y1RXF1pmg
 frunay+g/Y57RopSrItzVpyEsdY7RCcg4yf4dspf0qEpzfLv6E8RcWAqqkf7pQjFHDwh
 o/z7NYOSYppHFkPX2cEi1wgJpzFfBFM6QJZD6ajGMZBq7tvRIQSdCsBkZbqYHjeHwhya
 yWGdjYe9oUoPYdHc3yX8+sufKDjdzyuZHqAJZAHmaLe833uiWfA5muy5PiY8GkK17Dx4
 dpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wtFdY7L9jEbHbUZpEsaJVL8bmFr2sDAxxXdfZ2px3oI=;
 b=XmdKAdgrv0Gkn+TF0WgrzVtojYCp2SAGh+1svJJNScyjes6abuqS+sNKPGtI2RxxLa
 mf/k4TPzWtMgYb0FB0hEbmajxtfvKQzS+vu6VkgLhgiy7BA/8dnToTLAYQaC9/67P7GR
 6idZ9OqEIKYbeqvCc2Nu9aCU0ihMTPvPAdXDw47GsdmRSizKjWgqLoCAp1G6Tcg76dbW
 a52Zd9lAhPp6AEwPC/76oGPyKAWRuPk4u+1LIx9xV/fuekRbTyjBHTJAVrXTqfHCoJ+S
 lOBZnND7ybSGgMjlEI5CRXsbLaPKjVyW4ID9osKB5y8RAWwrblEVUulA11WBnKt+l1h9
 fskA==
X-Gm-Message-State: AOAM530JSsX243m4h+0JYVcpcBc01zZpA9RLuDWqoAlcfVD2jp4zo5iv
 +whTGm4yZ3LY8NLEYPLAclD9ax+Jlu5cQVg3aVQ=
X-Google-Smtp-Source: ABdhPJz3EPwc6GGnyxYAiulRj2xGw2MKAtvjd0z+LnHTEFNdudI7z/624RNYWrQ5ejxcXnuvBVN28dIXGNZElNwcEQQ=
X-Received: by 2002:a17:906:32d0:b0:6ce:e1cf:3f2e with SMTP id
 k16-20020a17090632d000b006cee1cf3f2emr11263307ejk.214.1648216169815; Fri, 25
 Mar 2022 06:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
In-Reply-To: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 25 Mar 2022 10:49:17 -0300
Message-ID: <CAOMZO5D4_WboF4S0dgSLD1m15a13c2irK2yjDV4C77_Wb15=2w@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Wed, Mar 23, 2022 at 10:56 AM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> BSH SystemMaster (SMM) S2 PRO board comes with an audio card based on
> tlv320aic31xx family codec.
>
> The audio card exposes two playback devices, one of them using the EASRC
> (Enhanced Asynchronous Sample Rate Converter) module. Note that this
> would require SDMA and EASRC firmware in order to work.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---

What are the changes in v4?

I see you removed 'clock-names' so this looks good:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
