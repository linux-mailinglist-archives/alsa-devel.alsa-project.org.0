Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7D742919
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FDFD822;
	Thu, 29 Jun 2023 17:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FDFD822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688051197;
	bh=9fsRsIEQ18uNk3JF4lkac3WVQA7v7zMGQNnMpaj3QDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aiWuSxWIfBfAUFY1LaY2eZmaqLtgujL0MaMVQUYsJ96apVVUrSQhFqtsGhXesWNWi
	 LY/KHs0fYfvK3a9eF86IaHb0peuIu0TnBLfXyyYW5CNXOYLOwuKLQJvTNiNLZ4mZkI
	 6oennhIB783XH1NzllE4CI0Z/+T2kfXTaAYPUmAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1F47F80534; Thu, 29 Jun 2023 17:05:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E40F80212;
	Thu, 29 Jun 2023 17:05:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 505A4F80246; Thu, 29 Jun 2023 17:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C97CF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C97CF80169
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7836272f36eso32625439f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 08:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688051135; x=1690643135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhcKZLjWrDNttxGmNBxY3JBPC1dw1l/gq6LRekbNzq8=;
        b=jfk1Txvhrs4/DOaZnxqzS5Xl5RNZwlxrXfq61DNbrIFMGqx7BWmBw7boaNXJ+qapGA
         NVMulTRYMJ5kyql+tPLOGbAPPsj9JaLb+KJUYQ0OW9JVYD3CmEYLNYA4UJcaDMxRIQR8
         XM0clhSfxoHmS115EFXBDd1JEWdw5SYGkzNl+Woi+Lwe0gtO2G2ect1jj9ORCB5ACM6H
         OXxyO6OkAgc6mGMdWE0jPYlPMlQbbBf8Y2JcFe14GDbX5ikVOTh0NWar9q+5gAwHUNtL
         rh+x1lc0DgwTE8KForDIw4EwJcNsGXEQgecwY2qYYafSWR9B6EgYMOOgiczDJtcM1Rex
         DDlQ==
X-Gm-Message-State: AC+VfDxYaFw9JwQRLOohSwpF8fp25Q9D8n0sccmqZCWvABpL1Dzse1by
	H0vqeigu+Z5wEdjTT1/Uew==
X-Google-Smtp-Source: 
 ACHHUZ5/ubSHnOOsJs8hFdVdPR5AB9dDU59w9AQGzatEGCNhG/K02sYj6XVgHiA3uc2Ij1YRTnGiCw==
X-Received: by 2002:a92:d08a:0:b0:345:8373:4ca8 with SMTP id
 h10-20020a92d08a000000b0034583734ca8mr15786460ilh.27.1688051135318;
        Thu, 29 Jun 2023 08:05:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a056638060600b0042b144abf71sm53204jar.179.2023.06.29.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:05:31 -0700 (PDT)
Received: (nullmailer pid 2973007 invoked by uid 1000);
	Thu, 29 Jun 2023 15:05:28 -0000
Date: Thu, 29 Jun 2023 09:05:28 -0600
From: Rob Herring <robh@kernel.org>
To: Maso Huang <maso.huang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Ren Zhijie <renzhijie2@huawei.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Message-ID: <20230629150528.GA2961718-robh@kernel.org>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-8-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626023501.11120-8-maso.huang@mediatek.com>
Message-ID-Hash: PWSPXRN7MZLVUADVKNX7WNXKJH5MDTUD
X-Message-ID-Hash: PWSPXRN7MZLVUADVKNX7WNXKJH5MDTUD
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWSPXRN7MZLVUADVKNX7WNXKJH5MDTUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 26, 2023 at 10:35:01AM +0800, Maso Huang wrote:
> Add mt7986 audio afe document.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt7986-afe.yaml   | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> new file mode 100644
> index 000000000000..257327a33ea1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt7986-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek AFE PCM controller for MT7986
> +
> +maintainers:
> +  - Maso Huang <maso.huang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt7986-afe
> +      - items:
> +          - enum:
> +              - mediatek,mt7981-afe
> +              - mediatek,mt7988-afe
> +          - const: mediatek,mt7986-afe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    items:
> +      - description: audio bus clock
> +      - description: audio 26M clock
> +      - description: audio intbus clock
> +      - description: audio hopping clock
> +      - description: audio pll clock
> +      - description: mux for pcm_mck
> +      - description: audio i2s/pcm mck
> +
> +  clock-names:
> +    minItems: 5
> +    items:
> +      - const: aud_bus_ck
> +      - const: aud_26m_ck
> +      - const: aud_l_ck
> +      - const: aud_aud_ck
> +      - const: aud_eg2_ck
> +      - const: aud_sel
> +      - const: aud_i2s_m

'aud_' is redundant.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt7986-clk.h>
> +
> +    afe@11210000 {
> +        compatible = "mediatek,mt7986-afe";
> +        reg = <0x11210000 0x9000>;
> +        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&infracfg_ao CLK_INFRA_AUD_BUS_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_26M_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_L_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_AUD_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_EG2_CK>;
> +        clock-names = "aud_bus_ck",
> +                      "aud_26m_ck",
> +                      "aud_l_ck",
> +                      "aud_aud_ck",
> +                      "aud_eg2_ck";
> +        assigned-clocks = <&topckgen CLK_TOP_A1SYS_SEL>,
> +                          <&topckgen CLK_TOP_AUD_L_SEL>,
> +                          <&topckgen CLK_TOP_A_TUNER_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_APLL2_D4>,
> +                                 <&apmixedsys CLK_APMIXED_APLL2>,
> +                                 <&topckgen CLK_TOP_APLL2_D4>;
> +    };
> +
> +...
> -- 
> 2.18.0
> 
