Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4C293D4E
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 15:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E1A7165D;
	Tue, 20 Oct 2020 15:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E1A7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603200406;
	bh=ZaKgderQG4KKZH6fH+HyuZTcQv1aic4HE94Cqcbe1RY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0KLIS5izLvATdYYdOfe70RuzrKhvitkZL4IWthgWwrXaq2WPWs1DPZpCEdX44Drm
	 c5FerVWte3Xj0E/Ao2shCoLY0o2hmkaUGAF8+5dpglBr3IAFNwR0mT40oHr+Jw9WRF
	 d86Zvtqv6oMsXoDxA7AeG6NO9NM8lj+44Qkryi4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0FE9F8010F;
	Tue, 20 Oct 2020 15:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78A39F801F2; Tue, 20 Oct 2020 15:25:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B79D2F8010F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 15:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B79D2F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oMLMoBv8"
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A645922247
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603200292;
 bh=ZaKgderQG4KKZH6fH+HyuZTcQv1aic4HE94Cqcbe1RY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oMLMoBv80hIxboOAiLeXVWq+xzfjYExK0+aAYH/Glp3Pe78NPfGerVw9m4mjjYFrO
 M90N8EAaloVWWbe8yl6W/TqmoF1pgWGDlbLJgLWBW5P9lALjjJCnv/wjH64R8OG/aR
 A5AfKmrc+BaDOCNR8+8jSrmF0NgQBfbGZwiG/Z0o=
Received: by mail-ot1-f52.google.com with SMTP id m22so1697851ots.4
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 06:24:52 -0700 (PDT)
X-Gm-Message-State: AOAM531hYEtn8LIXOvDSTtwc+5o67c5+Oz1yDMP7B26TlqleJ45IiScy
 5OnxkfsCFBV4dLJh5eGdDBEz4C02fZEr3w4YUQ==
X-Google-Smtp-Source: ABdhPJydcSIKB2h68GX/LgNGhYJ62BnuNy3smEVojrJZ6JNICv7hKDMocPUZoKv8WcFtfUrf9fI4R28od7lNCSbidaw=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1611217oti.107.1603200291871; 
 Tue, 20 Oct 2020 06:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-12-git-send-email-spujar@nvidia.com>
 <20201019221612.GA3690258@bogus>
 <f6d098fa-cbc2-7563-a68c-5d00d71d128f@nvidia.com>
In-Reply-To: <f6d098fa-cbc2-7563-a68c-5d00d71d128f@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 08:24:39 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5mLqHBOhsjA6KnjFbyKymoyr9ubVG7ehWvE7GdTACrg@mail.gmail.com>
Message-ID: <CAL_Jsq+5mLqHBOhsjA6KnjFbyKymoyr9ubVG7ehWvE7GdTACrg@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] ASoC: dt-bindings: tegra: Add json-schema for
 Tegra audio graph card
To: Sameer Pujar <spujar@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, atalambedu@nvidia.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, rlokhande@nvidia.com,
 Stephen Warren <swarren@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, mkumard@nvidia.com,
 viswanathl@nvidia.com, Liam Girdwood <lgirdwood@gmail.com>,
 nwartikar@nvidia.com, Philipp Zabel <p.zabel@pengutronix.de>,
 sharadg@nvidia.com, dramesh@nvidia.com
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

On Tue, Oct 20, 2020 at 1:16 AM Sameer Pujar <spujar@nvidia.com> wrote:
>
>
> >> Add YAML schema for Tegra audio graph sound card DT bindings. It uses the
> >> same DT bindings provided by generic audio graph driver. Along with this
> >> few standard clock DT bindings are added which are specifically required
> >> for Tegra audio.
> >>
> >> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> >> ---
> >>   .../sound/nvidia,tegra-audio-graph-card.yaml       | 158 +++++++++++++++++++++
> >>   1 file changed, 158 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> >> new file mode 100644
> >> index 0000000..284d185
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> >> @@ -0,0 +1,158 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Audio Graph based Tegra sound card driver
> >> +
> >> +description: |
> >> +  This is based on generic audio graph card driver along with additional
> >> +  customizations for Tegra platforms. It uses the same bindings with
> >> +  additional standard clock DT bindings required for Tegra.
> >> +
> >> +  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> > You should be able to just $ref this at the top level.
>
> I am seeing one problem while using $ref like below.
> allOf:
>    - $ref: /schemas/sound/audio-graph-card.yaml
>
> I see below while running doc validator.
> "Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.example.dt.yaml:
> tegra_sound: compatible:0: 'audio-graph-card' was expected"
>
> Is there a way to avoid this?

Adjust the schemas so the constraints match. You can't say it must be
one thing in one place and something else here. Your choices are:

- Drop compatible from audio-graph-card.yaml. You can define a 2nd
schema that references audio-graph-card.yaml and defines the
compatible.
- Use 'contains' in audio-graph-card.yaml and then make
'audio-graph-card' a fallback here.

The best option depends on what existing users have.

> >> +maintainers:
> >> +  - Jon Hunter <jonathanh@nvidia.com>
> >> +  - Sameer Pujar <spujar@nvidia.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - enum:
> >> +          - nvidia,tegra210-audio-graph-card
> >> +          - nvidia,tegra186-audio-graph-card
> >> +
>
> >> +  dais:
> >> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/dais
> >> +
> >> +  label:
> >> +    $ref: /schemas/sound/simple-card.yaml#/properties/label
> >> +
> >> +  pa-gpios:
> >> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/pa-gpios
> >> +
> >> +  widgets:
> >> +    $ref: /schemas/sound/simple-card.yaml#/definitions/widgets
> >> +
> >> +  routing:
> >> +    $ref: /schemas/sound/simple-card.yaml#/definitions/routing
> >> +
> >> +  mclk-fs:
> >> +    $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
> >> +
> >> +  prefix:
> >> +    $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
> > And drop all of these.
>
> Could not re-use because of above compatible problem. Also require some
> additional properties for Tegra.
>
> >> +
> >> +  clocks:
> >> +   minItems: 2
> >> +
> >> +  clock-names:
> >> +   minItems: 2
> > Don't need this.
>
> This is required for Tegra audio graph card to update clock rates at
> runtime.

I mean you can drop 'minItems: 2' as it is redundant. The 'items' list
size implies the size.

> >> +   items:
> >> +     - const: pll_a
> >> +     - const: plla_out0
> >> +
> >> +  assigned-clocks:
> >> +    minItems: 1
> >> +    maxItems: 3
> >> +
> >> +  assigned-clock-parents:
> >> +    minItems: 1
> >> +    maxItems: 3
> >> +
> >> +  assigned-clock-rates:
> >> +    minItems: 1
> >> +    maxItems: 3
> >> +
>
> It is required for initialisation of above clocks with specific rates.
>
> >> +  ports:
> >> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/ports
> >> +
> >> +patternProperties:
> >> +  "^port(@[0-9a-f]+)?$":
> >> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
> > And these can be dropped. Unless what each port is is Tegra specific.
>
> May be I can drop this if I could just directly include
> audio-graph-card.yaml and extend required properties for Tegra.

There are numerous examples of doing that.

Rob
