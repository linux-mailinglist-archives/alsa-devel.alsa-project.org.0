Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3BC3D4242
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 23:37:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04B22176B;
	Fri, 23 Jul 2021 23:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04B22176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627076265;
	bh=KoXwRrtjOkbugRuWMEWlNE6t+O5VN8rFyqOw6BtNHW0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQmjCdAwdVKkQ5sgqafH/8/f0diZlwTBV3QBfUPKKno2rkZ9IJZhE6hTFxZabvLG6
	 pf1L3NaSUdvhAOfr139KfJ46A4phafAU6J331Tm+P0axSEGg5VmSbESZUE8sS4W7wU
	 wMhhcvqMvpCW5zVf/twLxoeRHh94/9AMP0nktvgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB8EF80086;
	Fri, 23 Jul 2021 23:36:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7219BF804BD; Fri, 23 Jul 2021 23:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A932F804AC
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 23:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A932F804AC
Received: by mail-io1-f54.google.com with SMTP id r18so4227995iot.4
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 14:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tdi7EeiWTtpNiVfVfwgzNPlGS395l4AH9igsJkLh0DU=;
 b=VJLF/SBpWcmlxiXPRnBod8KwLmqR4YO6yt1IqGDwo96HJD3fO9xRQnnSm/O0hCqgjV
 1ZoXxnwMW6k8RvzlDHWmjo9e/iFvGm9uWLkM5egA1RyLKtkEJ/Yl3AqRDk3LCOcCg9nL
 QDWrWxiUAtUu5GY0wBM4pzQ6zaj3f0U/JSdPx4En2Bg16Ts9tY1ytc6uz4fkTK5vQbYL
 ud4/4cbku9B6NamuK4SOLucItnAWQqbNGlCvxcy7wDxxn3TlNxb9DGQRkCMAfnOtENH0
 kLHn6YAgE/6qMezjWUm3DLtWPlG1M7fm2zYSX4dBL/Pha/69IAh02WmVmYyIDWtPtzFc
 d/cw==
X-Gm-Message-State: AOAM530ZpdSTxcRWjHIdJiH27Ktujw2Sr8a7PIPtJO2yvoYxkU4yyiG1
 HMlGY0Fo9t0Nj2BzFnSlMw==
X-Google-Smtp-Source: ABdhPJwQEliVWV65WDW65EHljYR1LZXNiOWSR80/suR3nYXOCGqErLYhbX1OEd4tC5yXBXhwBZKfpA==
X-Received: by 2002:a05:6602:2406:: with SMTP id
 s6mr5339616ioa.159.1627076206694; 
 Fri, 23 Jul 2021 14:36:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id j2sm1108477ilr.80.2021.07.23.14.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 14:36:46 -0700 (PDT)
Received: (nullmailer pid 2631446 invoked by uid 1000);
 Fri, 23 Jul 2021 21:36:42 -0000
Date: Fri, 23 Jul 2021 15:36:42 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 04/54] ASoC: dt-bindings: Convert Simple Amplifier
 binding to a schema
Message-ID: <20210723213642.GA2631391@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-5-maxime@cerno.tech>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@googlegroups.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

On Wed, 21 Jul 2021 16:03:34 +0200, Maxime Ripard wrote:
> Simple audio amplifiers are supported by Linux with a matching device
> tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: alsa-devel@alsa-project.org
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/sound/simple-amplifier.txt       | 17 -------
>  .../sound/simple-audio-amplifier.yaml         | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/simple-amplifier.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
