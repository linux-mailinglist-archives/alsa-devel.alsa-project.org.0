Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B53ACD75
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 16:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0DA11710;
	Fri, 18 Jun 2021 16:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0DA11710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624026471;
	bh=wsFqW9+yDGKBhBfhDrHZBW/uCoo4JvyTw1+c1oOozs8=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y+kSGtixNYKLlT6K+kMw5HnW2Lu3TkrHRaUNmyFifxeluivjo2lO8LEIhJR1Fi07p
	 LvsjdUzkBC+vMBtoocUwbZYXnCOdzQS8pIEdDXaQJ1ZUqpTNd4Uwynk5CXMgnROyFW
	 NGYWD2Qw6TOJf5+2lb5WtHOPWa5vPtBa7XvFoGKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7606F80423;
	Fri, 18 Jun 2021 16:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AD8CF8032D; Fri, 18 Jun 2021 16:26:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50B4CF80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 16:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50B4CF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lpd8EfWy"
Received: by mail-wm1-x32a.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso5903554wmj.2
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=X9a8sVzPq/DZtRtlv9ma28hJW4mL7WbxaIUzw19VfmY=;
 b=Lpd8EfWy89Nh5vPSWmkJXUp+zN59cC5JyzDZN/2QJtfZmAnmX5UgSlL/IvW7112cwv
 pUlGJr2axqA2psRzNA2qeajuHIlhDjF73oP3BGpPXo1VbgD7nnKdjDHEsJFNSj0FMzS4
 EsDUYWQoaC19kSmtaY0QULnm06xPdbwLYWOIFpNNH3sHTc/h8viYQJSfLdc2SUiBNqkY
 V5bVDy2X3+D6GM+ylwEzkBxS0YWeK+u4Shcv6F0JfBzWGDdqQVUbZO4IIamaAAtxnw7z
 YmI8XFUkp4xEiW16CYiaMoQTHKg7DC4LLKR7tImMZY/yo/ZjAHHaOAkUiKcWj6erYkRt
 rGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=X9a8sVzPq/DZtRtlv9ma28hJW4mL7WbxaIUzw19VfmY=;
 b=poVY6CkDXbt92xP9HXJ+fjXynqRPKLkgoORa//ODzpYlHfj8FHLqhZrtSV7AK2zSx5
 Z2VWtL5J8mrzyQMXh0xjpsB/xACvd5jWU2dyKVwtlukogdwKLM+x0ziUE1lWDRzRkHsu
 XUVWT28XYg8qeFFTwiqbcSwSb55Re2xhGtNjyDpRLEOG2HLMXoPem0ZMgS1Z00O67INV
 0YD+dA87Lz/+Ppchu+uGwRGA4zADuOjo+xG8uPs/mC4QTgHXozQ36xBqPxXx1HTKItWn
 hOCPNOLrwLWest4wYlt7zjF2qP7E/GuGnb7ap+5t62ivIu6gUw9FhVFGhIeQI2aZZp8L
 xu0w==
X-Gm-Message-State: AOAM530Uu1Tgag8OEd4ChE1Y/3pVJzI0Xlv/qawo2jjDei7l9Fd9G6O0
 8Os2S6yBSdJPL5hcEfToAHZ+LA==
X-Google-Smtp-Source: ABdhPJxuFZkBzALQZCDbIzThVWw3Gc0JCpcJ0VqqyA58jpNDwqoHdQYZA86kZ76742HFCH2D1kHtgQ==
X-Received: by 2002:a1c:e456:: with SMTP id b83mr11913734wmh.178.1624026371519; 
 Fri, 18 Jun 2021 07:26:11 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id z6sm4574647wrh.65.2021.06.18.07.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:26:11 -0700 (PDT)
References: <87bl89w9fw.wl-kuninori.morimoto.gx@renesas.com>
 <8735tlw9cy.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 6/8] ASoC: meson: switch to use
 snd_soc_daifmt_parse_format/clock_provider()
In-reply-to: <8735tlw9cy.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j35tfgsfx.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 18 Jun 2021 16:26:10 +0200
MIME-Version: 1.0
Content-Type: text/plain
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>
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


On Mon 14 Jun 2021 at 02:58, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch switch to use snd_soc_daifmt_parse_format/clock_provider() from
> snd_soc_of_parse_daifmt().
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/meson-card-utils.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 300ac8be46ef..415cc0046e4b 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -119,9 +119,9 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
>  	struct device_node *framemaster = NULL;
>  	unsigned int daifmt;
>  
> -	daifmt = snd_soc_of_parse_daifmt(node, "",
> -					 &bitclkmaster, &framemaster);
> -	daifmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
> +	daifmt = snd_soc_daifmt_parse_format(node, NULL);
> +
> +	snd_soc_daifmt_parse_clock_provider_as_phandle(node, NULL, &bitclkmaster, &framemaster);
>  
>  	/* If no master is provided, default to cpu master */
>  	if (!bitclkmaster || bitclkmaster == cpu_node) {

