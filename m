Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83731173C29
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 16:49:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1757C16E2;
	Fri, 28 Feb 2020 16:49:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1757C16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582904998;
	bh=Oy2ldJn4Mh6A6U9cW0jozVZjlJ2RPb9dnTRhitgLVgk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpBBXZTt0+8pHp/St3k60i64b4v63et+U3AB+KIKr65LS6wjYxTyAf8dR7dNjCTF3
	 lihAiCIrXysIEoKATA0z+/vZmGrg3DcxF1fUfGmKYbyM9EMo4cWhrym3kl6BKg9kyu
	 v/Z3tLRLkgRtNR5z4cQRuM3kvgz8pEOCq9dDhJig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F98EF8014E;
	Fri, 28 Feb 2020 16:48:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87727F8014E; Fri, 28 Feb 2020 16:48:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2ADBF80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 16:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2ADBF80113
Received: by mail-ot1-f68.google.com with SMTP id x97so2977103ota.6
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 07:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=04LO6bJs9Ua8w0YW0IQRrzZktCzF8p2YIFQW4LHwyB0=;
 b=VcsrAJX3MqonwSVm5qsoLXe512GjY859auzQuFVTC6ElGWYAM6YvysnAMKMXPFmiPe
 Hc23frArgKrANN+4dVg5QfXMYARPO36rla2KykgQgmefTfGosL1H//m2/esLPzLtAtCq
 CRCFdAdsbzSUUEgyOk1jo6r05sktNqbBPi7V+ubRjMB5U6LUpYSVsxexkA2ktQu6p4ef
 ZYnnmKYuX48C8Fy0gCZTLbic6pxfFyyrf8bqwDD+CQ4ZcAj8fzAip0gkh9mviQTdk4Eh
 DCWm5uquzRk8aWv6Pu4TqVmGof8CagiolEGE9qCdXvZ4ZfZVrIebrf9atNhcow3U3zxh
 4ShQ==
X-Gm-Message-State: APjAAAUCkFdPp1qQwD/TUZc6Sr4GgqZ93sS+NxsP8Pil7ykcHO32ptgR
 W8HIvJB7yYJLih1Ogr3B7A==
X-Google-Smtp-Source: APXvYqwV+P2KDc8CtB9VtadeSMw2dPxupLHtu2jRnsumBHTjh6d8J/zLIoII9iqRfrM9E79eDylpmg==
X-Received: by 2002:a05:6830:150:: with SMTP id
 j16mr3791728otp.301.1582904887823; 
 Fri, 28 Feb 2020 07:48:07 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k201sm3273559oih.43.2020.02.28.07.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:48:07 -0800 (PST)
Received: (nullmailer pid 24254 invoked by uid 1000);
 Fri, 28 Feb 2020 15:48:06 -0000
Date: Fri, 28 Feb 2020 09:48:06 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/9] ASoC: meson: gx-card: fix sound-dai dt schema
Message-ID: <20200228154806.GA19636@bogus>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224145821.262873-2-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

On Mon, Feb 24, 2020 at 03:58:13PM +0100, Jerome Brunet wrote:
> There is a fair amount of warnings when running 'make dtbs_check' with
> amlogic,gx-sound-card.yaml.
> 
> Ex:
> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0: [66, 0, 0] is too long
> 
> The reason is that the sound-dai phandle provided has cells, and in such
> case the schema should use 'phandle-array' instead of 'phandle', even if
> the property expects a single phandle.
> 
> Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Hi Mark,
> 
>  The statement above is based on this LKML discussion I found:
>  https://lkml.org/lkml/2019/9/30/382
> 
>  To be honest, I don't really get why the consumer should know whether
>  the phandle will have cells or not. AFAIK, the consumer does not care
>  about this ...

Yeah, I think another type definition is needed here to distinguish 
between a single phandle+args and an array of phandle+args.

In any case,

Acked-by: Rob Herring <robh@kernel.org>

> 
>  .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
