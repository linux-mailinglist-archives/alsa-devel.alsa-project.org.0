Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF8E58A4E5
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 05:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E541D7;
	Fri,  5 Aug 2022 05:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E541D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659668846;
	bh=fa4oppNs2M0A/J3SllHZ6zUIsZf8hzu21VI0LpPKvU0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fe0gIUo2LaZ7Q/ytuaEmQ3280d8Mb6ohhddKcT0B8K4bGrHSwe/8PRtFzN9J1/rje
	 34gp9ikDDXErDMG03yueb2DT3/eAJTh7I8Ez9CcAct+gWKTEWMWddtKQaMFIiFXnd3
	 l0oUv21CZBipJJ5irJ0yknyT84CbV6bBuXF/l7qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 351B8F8013D;
	Fri,  5 Aug 2022 05:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DFB8F8025A; Fri,  5 Aug 2022 05:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E110F8013D
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 05:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E110F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oJ5ekvgw"
Received: by mail-lj1-x22a.google.com with SMTP id v7so1767845ljj.4
 for <alsa-devel@alsa-project.org>; Thu, 04 Aug 2022 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZLIpc1iSm32r58JEPZxARZQ34IGYBZDuEG4ksn924PE=;
 b=oJ5ekvgw+xjEtuMaK/m9wdncqUI0BJmyQk6XCQ6n05Ett9KmU0hbdgQjX7DdaG4OYP
 A8e89RRs15JKYQxKUdVqjIMR4Tdb1qeSLMoggtDhCZ9Yu9Sul1tRk0sPXFZ0qZuF6Tx9
 K1lom7NYUH8RuuIr2ujolCqjYlZ260ceJEIffuJz28Btewz9lKoC5z5C3CTy/5kKvQKn
 aRhXPRAv+Y/4DKDOAqhKRaWC/6zUMj0ch7r8aW8KdanfUwz7eUcYIl/GottLCJTNlD2J
 UK6BxffjmfPeToEh+INGEE07V31wxWQhjcZZ8qTBnDRgfD48dihjaroPURZcW2qDyEW3
 tJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZLIpc1iSm32r58JEPZxARZQ34IGYBZDuEG4ksn924PE=;
 b=6R4zYqxSXCQi8OW9/H1FGp45KPvW8mPj/Gy+fRuMrwuFoR93vGCXa4PES4GSsMWlfE
 JOHrcONOYadQX7tZ+oZR/91GBXTPBrY8+mr9bXSeNy2i4eJp6Wo9fH1tnA5UhAgYjxoP
 wSGWGlUORU7fa9JzF1Tl14jUI6cO9wvZ942qp5CBHzZAmpGsOfDYac3fiG9E+SkxCcZw
 Tt1pIZQI6mz1m3YKTg9os7Hjsi7rcmASpXjbS1i/cmHnP73MIHx+HmBQHGJQs0+ThHjQ
 FUuPMq5JAROXvI6ISWeMs+EKWU1fckXhXZOyNNVRE39i/EpJmzCWbKYDlR0EXb89qyBH
 l5sQ==
X-Gm-Message-State: ACgBeo0oEbSbEpsZuH8d0a14vzvPpG08Aw5zCaT0tawlHR7YbHNhMmqn
 MHritl4UmPTZUoozrwe4S/gym7gzD72cml1CE9Q=
X-Google-Smtp-Source: AA6agR7M/l1+L36ok65ljy+uPkvx9Pwu3K9f/ZOpU658ytbT6gVjj/TU1WzbMUUgeAO/PdiGnEEmOhEZ1VTPrZHtNIg=
X-Received: by 2002:a2e:4952:0:b0:25e:42fe:fa60 with SMTP id
 b18-20020a2e4952000000b0025e42fefa60mr1527762ljd.272.1659668775910; Thu, 04
 Aug 2022 20:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220614101546.1559434-1-s.hauer@pengutronix.de>
In-Reply-To: <20220614101546.1559434-1-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 5 Aug 2022 11:06:04 +0800
Message-ID: <CAA+D8APYiOVO2xF5tB2DjJWoKmkdzD9Xn3yd3r+m9qCQb01okw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fully initialize structs
To: Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>, Xiubo Li <Xiubo.Lee@gmail.com>
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

On Tue, Jun 14, 2022 at 6:15 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The driver uses two statically ininitialized struct dma_slave_config,
> but only one of them is initialized to zero. Initialize config_be to
> zero as well to make sure that no fields are filled with random values.
> Let the compiler do this instead of explicitly calling memset() which
> makes it easier to read.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Maybe you need to resend this commit and cc Mark.

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 5038faf035cba..fec56dbb64e60 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -138,7 +138,7 @@ static int fsl_asrc_dma_hw_params(struct
> snd_soc_component *component,
>         struct dma_chan *tmp_chan = NULL, *be_chan = NULL;
>         struct snd_soc_component *component_be = NULL;
>         struct fsl_asrc *asrc = pair->asrc;
> -       struct dma_slave_config config_fe, config_be;
> +       struct dma_slave_config config_fe = {}, config_be = {};
>         enum asrc_pair_index index = pair->index;
>         struct device *dev = component->dev;
>         struct device_node *of_dma_node;
> @@ -181,7 +181,6 @@ static int fsl_asrc_dma_hw_params(struct
> snd_soc_component *component,
>                 return -EINVAL;
>         }
>
> -       memset(&config_fe, 0, sizeof(config_fe));
>         ret = snd_dmaengine_pcm_prepare_slave_config(substream, params,
> &config_fe);
>         if (ret) {
>                 dev_err(dev, "failed to prepare DMA config for
> Front-End\n");
> --
> 2.30.2
>
>
