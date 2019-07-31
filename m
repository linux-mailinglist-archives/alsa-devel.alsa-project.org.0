Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E27CFF0
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 23:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E131167A;
	Wed, 31 Jul 2019 23:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E131167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564607981;
	bh=WyWvr71le6MfqHcSMgLglR8F/KU6AKiM10K1VHykD/Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCvsvLdhRSyQeOKSskYGewEp6EAEVjaPLr5JV39COr+nvdONH5WRAEAx4mPr2pYWt
	 mraFoa58fHambrCS4eTcF9QChV2q4QZWTerPNx5F/oDMDWzHM/N2IHU1nXY8Q7BSb8
	 GlHVCWTEmZAn6qcbmrGjZ4AiwfrrjcQXqYzGm1QA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B1BDF8048D;
	Wed, 31 Jul 2019 23:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 540D3F800C0; Wed, 31 Jul 2019 23:09:54 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF79EF80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 23:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF79EF80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AEnAskS6"
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B60421842
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 20:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564604493;
 bh=uPV3P01fdDXwMC2cp3sSm5uScorHAgvNqHFvPCSEGX4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AEnAskS6xAAvTRE0lKbqhHqm56UPT/l0aF8ey/7glcr1N4YxT9JBi+CufNHLY6dDK
 gzD2JGkqICh5d4yd9yN7h5CuWmeyu/4es5cE9nipVVG28YHfKtkHayDfsuYW4Jc48e
 LXKJbg+r1reEDYBM7XGPCH1lAOlDkOcUNDLRhtYY=
Received: by mail-qk1-f171.google.com with SMTP id v22so50196266qkj.8
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:21:33 -0700 (PDT)
X-Gm-Message-State: APjAAAW0L9qLLi57V9SmfSM30x3mvvARyXfyEZKx9nQk+/PHOrNombOi
 NMmTn25hQ3ubI+vrpkcpGbLLvQbr47jrCRV7ww==
X-Google-Smtp-Source: APXvYqx/FUJ2et44J7TQ9mbGJUlcFyES8MnWGe+AQ/ZmcKGbi55yNvCflF0msvkyq6b1XqZwq80IkL9tQOi07uZbE2M=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr17417772qke.393.1564604492244; 
 Wed, 31 Jul 2019 13:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <5b4fae5978d309641fa8ba233a9efe2b48201cd6.1564603513.git.mchehab+samsung@kernel.org>
In-Reply-To: <5b4fae5978d309641fa8ba233a9efe2b48201cd6.1564603513.git.mchehab+samsung@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 31 Jul 2019 14:21:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+n9g5d7GkJRJJohfQywzuQNbOam=FbsDCaQu86Z+4zfg@mail.gmail.com>
Message-ID: <CAL_Jsq+n9g5d7GkJRJJohfQywzuQNbOam=FbsDCaQu86Z+4zfg@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Evgeniy Dushistov <dushistov@mail.ru>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, jfs-discussion@lists.sourceforge.net,
 devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [alsa-devel] [PATCH 1/6] docs: fix a couple of new broken
	references
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 31, 2019 at 2:08 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Those are due to recent changes. Most of the issues
> can be automatically fixed with:
>
>         $ ./scripts/documentation-file-ref-check --fix
>
> The only exception was the sound binding with required
> manual work.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt | 2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  MAINTAINERS                                                 | 4 ++--
>  drivers/hwtracing/coresight/Kconfig                         | 2 +-
>  fs/jfs/Kconfig                                              | 2 +-
>  fs/ufs/Kconfig                                              | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
