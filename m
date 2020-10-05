Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71828371F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 15:59:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E715217BA;
	Mon,  5 Oct 2020 15:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E715217BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601906376;
	bh=wiYCoTGBHHPeprS5qsEP618osq/N7LLvuSOEaZgXU6A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arQp7HTwPuLXuua1hVd1Y336QdDvgxPtdsyKbGfjqqYhmek5/LGLwncKnW9/Dcl6K
	 SL57VVXpQGSRTNSZevo/CLZMpJ2WCrqls7jf4NHVtt01Pokv4k288SpOFrEUi4rLAG
	 88vxiVrzkrTiFkJ6Qgj1uqPGaPZCQO7X2OTkqfyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F365F80245;
	Mon,  5 Oct 2020 15:57:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC714F8025A; Mon,  5 Oct 2020 15:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 694E5F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 15:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 694E5F800C9
Received: by mail-ot1-f66.google.com with SMTP id s66so8669446otb.2
 for <alsa-devel@alsa-project.org>; Mon, 05 Oct 2020 06:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HLXvvMEroZCyEvFhhBCVsUsG4CTHlceWSEkbwHb7abs=;
 b=qnNX/X3lMLbCwilxkGMdVm5vF4yq5QXlcYRB5pjdf1gkko03SLQBN8Xjn2gw1WMJzX
 0xFOkEVW6+1Va2yFJdtkYBFTwTP5fQqeLs8Gg0Zf/itGk0kbUdelx2OKsTYaHKeuh3ZE
 kXbU5K8e+gJQAKzco69n/n2Ehqpu/wph3QOr6hFsOlH4O4eBsP1vbtCVJm2MTxmn0k4A
 wzzQL+rfh3OjGi4KLNijca5HiwHITXdp5IO7afcwgMFzcKA7/ltjWEvd935PwHuowde9
 FRjTlHyJWulWB3+L8gasbUPavxqnNnP9mxtHdfbuSQ3dOuTCZuvSFX+ZWzXprsVLgemN
 JBaQ==
X-Gm-Message-State: AOAM532eXoG+UozWmekAd3hwx5x6qy2w5qJP6gDxFg5Js13cNQQ4LAht
 /BJKYmHwbPqeOl9nNXxLuw==
X-Google-Smtp-Source: ABdhPJxLkuPrQ//lVhFii7F2n6/PROn58UkLIGod7jgA8Wt9oD/eivK+XCX5n8q/tj7bRI/v6tqR9w==
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr11762976otq.302.1601906261016; 
 Mon, 05 Oct 2020 06:57:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f11sm14515oot.4.2020.10.05.06.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:57:40 -0700 (PDT)
Received: (nullmailer pid 90619 invoked by uid 1000);
 Mon, 05 Oct 2020 13:57:39 -0000
Date: Mon, 5 Oct 2020 08:57:39 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
Message-ID: <20201005135739.GA87274@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 maowenan@huawei.com, tzungbi@google.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Fri, Oct 02, 2020 at 03:35:40PM +0800, Jiaxin Yu wrote:
> This patch adds mt8192 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> new file mode 100644
> index 0000000000000..43852315f1867
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek AFE PCM controller for mt8192
> +
> +maintainers:
> +   - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +   - Shane Chien <shane.chien@mediatek.com>
> +
> +properties:
> +  compatible:
> +    contains:

So any other string in addition is okay?

> +      const: mediatek,mt8192-audio
> +
> +  interrupts:
> +    maxItems: 1
> +    description: AFE interrupt line

Drop description.

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: audiosys
> +
> +  apmixedsys:
> +    maxItems: 1

This is an array?

> +    description: The mediatek apmixedsys controller
> +
> +  infracfg:
> +    maxItems: 1
> +    description: The mediatek infracfg controller
> +
> +  topckgen:
> +    maxItems: 1
> +    description: The mediatek topckgen controller

These all need a type reference and and vendor prefix.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AFE clock
> +      - description: ADDA DAC clock
> +      - description: ADDA DAC pre-distortion clock
> +      - description: audio infra sys clock
> +      - description: audio infra 26M clock
> +
> +  clock-names:
> +    items:
> +      - const: aud_afe_clk
> +      - const: aud_dac_clk
> +      - const: aud_dac_predis_clk
> +      - const: aud_infra_clk
> +      - const: aud_infra_26m_clk
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8192-power.h>
> +
> +    afe: mt8192-afe-pcm {
> +        compatible = "mediatek,mt8192-audio";
> +        interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
> +        reset-names = "audiosys";
> +        apmixedsys = <&apmixedsys>;
> +        infracfg = <&infracfg>;
> +        topckgen = <&topckgen>;
> +        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
> +        clocks = <&audsys CLK_AUD_AFE>,
> +                 <&audsys CLK_AUD_DAC>,
> +                 <&audsys CLK_AUD_DAC_PREDIS>,
> +                 <&infracfg CLK_INFRA_AUDIO>,
> +                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
> +        clock-names = "aud_afe_clk",
> +                      "aud_dac_clk",
> +                      "aud_dac_predis_clk",
> +                      "aud_infra_clk",
> +                      "aud_infra_26m_clk";
> +    };
> +
> +...
> -- 
> 2.18.0
