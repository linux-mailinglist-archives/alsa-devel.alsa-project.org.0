Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5517BA3AB7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 17:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD181668;
	Fri, 30 Aug 2019 17:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD181668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567179879;
	bh=iUoAwbTZ8AlLlHrlVuHhCPS/zurSLft9vJ3qv30Rm6k=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=svIso/ryW8FUb5Z4ZcrdoPFz9TXk4/xKuVw3H555/U9QkIHtDrRD3rw9kzRNlktRC
	 B76WvS9knG9n6te5dxi+vBHoUlgcEbuOVEbI96kElsfZX4LG4bQkXbHGfIIqp9VP7s
	 UFQSucGeQ9sVT36QhWIjHSJuvEt6BCknjZlqyBv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F5BCF805F7;
	Fri, 30 Aug 2019 17:42:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E53AF805F5; Fri, 30 Aug 2019 17:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C5B0F80445
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 17:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C5B0F80445
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OO5kl0tp"
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A50123428
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567179751;
 bh=rjS27z1lBNhCEThrZ0kRF0f2b7v4SWdYVwASALBqm7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OO5kl0tpPfjShjhR6s2bDqoUlEMqS5fbn+z6GfVIp97MAo550syQk1WnY71NzWEd3
 QR+DaJVTCupCau1tgKTb6Ywl6eia1MEpIJ20UNOsZDGp6D0KHbDRYzF/qckNMovc7/
 uFeUE6mNBqeL5c4bK2+7vXzmoLX0SJl5HLXKvw/c=
Received: by mail-qt1-f176.google.com with SMTP id 44so8004485qtg.11
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 08:42:31 -0700 (PDT)
X-Gm-Message-State: APjAAAVjnpROzycnconD+qY6XWbstYJeLIlJ0ast02AfJtdMOWfUPE3c
 tHFUeO1rJ0jzjsovd6EU+sf1LYRmYnzRD4/E1Q==
X-Google-Smtp-Source: APXvYqxBnsuq9Cl2AYxJ3+2RNMJO5TFFSdIRuxFvXYjoIaLcgogQZmTxJVQow0WheBHwlDr5sYneLYlM9P1u/GoXMGg=
X-Received: by 2002:ac8:6b05:: with SMTP id w5mr221266qts.136.1567179750860;
 Fri, 30 Aug 2019 08:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190828125209.28173-1-mripard@kernel.org>
 <20190828125209.28173-5-mripard@kernel.org>
In-Reply-To: <20190828125209.28173-5-mripard@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Aug 2019 10:42:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL7nE8+XK0m+1UKCUypkkgb4Nky7ternsx0zkTxiSejRw@mail.gmail.com>
Message-ID: <CAL_JsqL7nE8+XK0m+1UKCUypkkgb4Nky7ternsx0zkTxiSejRw@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 5/5] ASoC: dt-bindings: Convert
 Allwinner A64 analog codec to a schema
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

On Wed, Aug 28, 2019 at 7:52 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner A64 SoC has an embedded audio codec that uses a separate
> controller to drive its analog part, which is supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Fix subject prefix
> ---
>  .../allwinner,sun50i-a64-codec-analog.yaml    | 39 +++++++++++++++++++
>  .../bindings/sound/sun50i-codec-analog.txt    | 14 -------
>  2 files changed, 39 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun50i-codec-analog.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
