Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A298623E7C8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 09:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17199852;
	Fri,  7 Aug 2020 09:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17199852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596784800;
	bh=NUt34D/6YEtSDuqFEZZoKde/qrGAp0Eyp/6vO+rdzxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKKSp/tmrB0mWrx9ymhaj88u9g7aheR6aDRjPcg2xw/0Goj/bPj0Fg8ahEyYC2He9
	 o2PDH5msCF3Mhlg6WG9Dli3WbkJ19Trh8dxE4lAqsNFwDUDBhxsYTJTqMcC8ltn7Yr
	 nfHxpL0rGVyi8UJfBeqzFBliYEKHQ7cEQK9BrnXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A959F80234;
	Fri,  7 Aug 2020 09:18:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5415F80218; Fri,  7 Aug 2020 09:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26580F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 09:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26580F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a/CYaZUT"
Received: by mail-qt1-x841.google.com with SMTP id b25so639841qto.2
 for <alsa-devel@alsa-project.org>; Fri, 07 Aug 2020 00:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjBgjmOHw57678g0o5hgG5E9h3ORFUrabBo5u11RIkM=;
 b=a/CYaZUTnaXHYxqHoecfCwYEelSne77o/fgIVbDNgujdYRVXwWmuaYBlO1L60+Q7wi
 VAV9GzcIaEiwrsQqXgQ3CbqbZwpM7Rm67s3wC/vPd0V1vU10vpdIVlwFdQSGnXWT9iFL
 FrBz/EmG2SzhpE4MAtfAGijqdjnGgI7x9BkGB8b9wkvXFAs3sWZfS3cuNBWuUjeF144e
 WqmS/sjKnHERyHXHj1D4ub7NJFhZrZzLmQcpm9CfbG1MfC82t2ZP2lvZExDnEwQGDZ6T
 C7y9vnBi+pglIAzfJqty3goo1Mshzlovbmb77WUsXZEshGSm43rphjfMNd8HoqJuCBZC
 OelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjBgjmOHw57678g0o5hgG5E9h3ORFUrabBo5u11RIkM=;
 b=bsAJKsG7rpgGEB/PusgkqY4PwQXWIbadPteyXUdqTjH+XO2JmheqwGcTzrYS4RpClS
 DbAgUAGlKxv9bjwIk+poqpv9GGwi1uAPjjkYCj9ACw6wSRdzu9K44tr1+VarJQRx8cNE
 3x6+pWc3UBnx0Df/uNW5BFDwVN4JpRjw4/ipWJIe02dmKycPdwaPXPYDIHPVY3phAhDa
 uTnatCUicmpM2xxAYxUHx4lsT4ljOiy4QWCK8vTFE1gYoeVKJ+A+yjPo1xhVoKVSkfgd
 KjffESB9um6CyxhL+2YZ7bofZaZkBgUDXunqOij7QSFge8hHgxS0tq4lcm+wVrylSsHz
 MuQQ==
X-Gm-Message-State: AOAM532cgg9gqkwUypQL02gSMrlllmEjH6NmUswBAqmGm2nHDA025jJD
 k5nsCgzefA79V+9EBSgZ25rFmDU+6yVQtJwTvig=
X-Google-Smtp-Source: ABdhPJwH6rQ4Xtx8TIDeCErClcwMqaVFrhF6ev68LM4jAENVmB3yaTIBDChUTbXFpgYfNjU12TzCBsz0qDFzNQ4T+OM=
X-Received: by 2002:ac8:450c:: with SMTP id q12mr12563634qtn.292.1596784688131; 
 Fri, 07 Aug 2020 00:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <1596699585-27429-1-git-send-email-shengjiu.wang@nxp.com>
 <20200806123721.GC6442@sirena.org.uk>
In-Reply-To: <20200806123721.GC6442@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 7 Aug 2020 15:17:57 +0800
Message-ID: <CAA+D8AOqaEEGuVp_vaSf6XAyjjCd=azj2qgKkqagvrtBNr9Mqw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Get "extal" clock rate by
 clk_get_rate
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Thu, Aug 6, 2020 at 8:39 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Aug 06, 2020 at 03:39:45PM +0800, Shengjiu Wang wrote:
>
> >       } else if (of_node_name_eq(cpu_np, "esai")) {
> > +             struct clk *esai_clk = clk_get(&cpu_pdev->dev, "extal");
> > +
> > +             if (!IS_ERR(esai_clk)) {
> > +                     priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(esai_clk);
> > +                     priv->cpu_priv.sysclk_freq[RX] = clk_get_rate(esai_clk);
> > +                     clk_put(esai_clk);
> > +             }
>
> This should handle probe deferral.  Also if this clock is in use
> shouldn't we be enabling it?  It looks like it's intended to be a
> crystal so it's probably forced on all the time but sometimes there's
> power control for crystals, or perhaps someone might do something
> unusual with the hardware.

Ok, will add handler for probe deferral.

This clock is not a crystal, "extal" clock is for cpu dai, it is from
soc internal PLL. which is enabled by cpu dai, here is just to
get the clock rate.

best regards
wang shengjiu
