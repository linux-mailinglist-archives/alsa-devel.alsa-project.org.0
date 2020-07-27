Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1822F2A7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 16:41:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07C4B16A3;
	Mon, 27 Jul 2020 16:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07C4B16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595860892;
	bh=0tcQc6v/QlJyZg+hGewPPKPn+f8w/hfFvbSyN+QFJiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOlDk2/8IctcKbYGR2ktOeiJlBBhyezxK/6roR7+Bt3f1UN2b1PKBIWLtTxIsrDuL
	 2iFB2v3ZMpwgzJC2xbBBP274OeY9EfOET48cFuQiLXFkqDyXFDEQyIyYy8eYDoZT2M
	 5tWIArWH+H8ctiAF4O+UsBYB8q7wSK3ZTE8EKTdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FAFAF8013C;
	Mon, 27 Jul 2020 16:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 627FBF80171; Mon, 27 Jul 2020 16:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99402F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 16:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99402F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="opp5jJ8p"
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 433FC2083B
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595860775;
 bh=0tcQc6v/QlJyZg+hGewPPKPn+f8w/hfFvbSyN+QFJiA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=opp5jJ8pUTUb6VUN4tMPebTbj1NJk5inpkBFtIBfGR+WeyR2p13yNEBKt45mun4sm
 XYyYl7Jn0+TYXdgLwZUP5+S88hiCK+eLytbu/aEowH4Qakckf2Js3NAQp9WT3us157
 EHK2OwoigCShGwxTjwkxbhptrmwQ7nih6kbM8Qt4=
Received: by mail-oi1-f171.google.com with SMTP id y22so14494665oie.8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 07:39:35 -0700 (PDT)
X-Gm-Message-State: AOAM530QPAbqyERpyLZ88f4hGqG+zbdvtH70aL7fBLm9cuDq1FZO/Sd+
 2LZjjU+7WC6ZFqq5g5JYEdill7+kLhTaaA8hNA==
X-Google-Smtp-Source: ABdhPJw/KLY1oHcWXCeR/axtLDZ8I3twNAIJ3ivC+q4hzvELMfd1+No9etzMfUkzezXN6uA5bdsso7Z16g5ZFyLQi0g=
X-Received: by 2002:aca:30d2:: with SMTP id
 w201mr18677353oiw.147.1595860774591; 
 Mon, 27 Jul 2020 07:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <87y2nk2tfd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2nk2tfd.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 27 Jul 2020 08:39:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ8PyuZLXj4bLwyConb+GdH83hjPPj2mHbqNy=w9m-joA@mail.gmail.com>
Message-ID: <CAL_JsqJ8PyuZLXj4bLwyConb+GdH83hjPPj2mHbqNy=w9m-joA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: ak4613: switch to yaml base
 Documentation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>
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

On Wed, Jul 15, 2020 at 6:31 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch switches from .txt base to .yaml base Document.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/r/87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87o8pf3923.wl-kuninori.morimoto.gx@renesas.com
> ---
> v2 -> v3
>         - add Reviewd-by
>         - add Link
>         - use generic node name on examples
>
>  .../devicetree/bindings/sound/ak4613.txt      | 27 --------
>  .../devicetree/bindings/sound/ak4613.yaml     | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4613.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ak4613.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/ak4613.txt b/Documentation/devicetree/bindings/sound/ak4613.txt
> deleted file mode 100644
> index 49a2e74fd9cb..000000000000
> --- a/Documentation/devicetree/bindings/sound/ak4613.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -AK4613 I2C transmitter
> -
> -This device supports I2C mode only.
> -
> -Required properties:
> -
> -- compatible : "asahi-kasei,ak4613"
> -- reg : The chip select number on the I2C bus
> -
> -Optional properties:
> -- asahi-kasei,in1-single-end   : Boolean. Indicate input / output pins are single-ended.
> -- asahi-kasei,in2-single-end     rather than differential.
> -- asahi-kasei,out1-single-end
> -- asahi-kasei,out2-single-end
> -- asahi-kasei,out3-single-end
> -- asahi-kasei,out4-single-end
> -- asahi-kasei,out5-single-end
> -- asahi-kasei,out6-single-end
> -
> -Example:
> -
> -&i2c {
> -       ak4613: ak4613@10 {
> -               compatible = "asahi-kasei,ak4613";
> -               reg = <0x10>;
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/sound/ak4613.yaml b/Documentation/devicetree/bindings/sound/ak4613.yaml
> new file mode 100644
> index 000000000000..5aae6126c540
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ak4613.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ak4613.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AK4613 I2C transmitter Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +  compatible:
> +    const: asahi-kasei,ak4613
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  # for OF-graph
> +  port:
> +    $ref: "audio-graph-card.yaml#definitions/port"

This patch is dependent on audio-graph-card.yaml which doesn't exist
and breaks linux-next now.

I haven't seen any follow-up to my audio-graph-card.yaml comments, so
please revert this.

Rob
