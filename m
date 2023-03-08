Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C774C6B10CD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 19:13:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C24511866;
	Wed,  8 Mar 2023 19:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C24511866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678299213;
	bh=Xg5D61xRXu0eeErVVrlZFPqxJqH7iduaPm5jcM1E7RA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vqqfoOTgXu2qXTZwfvk77Eq8ZBaKZkZuB7wROs+f/mGDiYlOPomimC6J9IXannJ7N
	 QTlZlli1aOT99EngLrOLaUWeLek8tdYKArSrZdUpDdk51z5NZyfGjsm2vFpUbvzC8j
	 EqSyLcRsL4QJmnaPfBRwR2Dwo4faqhhKeiKgIgSQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3034F804B1;
	Wed,  8 Mar 2023 19:12:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D30F804FE; Wed,  8 Mar 2023 19:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 280B4F800DF
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 19:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280B4F800DF
Received: by mail-ot1-f48.google.com with SMTP id
 g6-20020a056830308600b0068d4b30536aso9441664ots.9
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Mar 2023 10:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678299114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIxmU/QtppDrzLwRQM4/EQwwRkPiWGOq6+7u8fs1B9E=;
        b=f0geRaCGBh3DxySsShC7BGxftTosf/oH3Efsd7s2+mKnI8XbxhGKaYZCuLit1njfmp
         A593rNuHMNUf9RI/NyROQbWPdVFgvjefTSH1E6ovrPSlraUOzWjTZEILJZdp301qfXWi
         TyPT6vX5obqaJ1dVYHiv9eYfZRvoevRevzMiADEF5ARndHjZQYxsAin3H23IGMH7M03N
         Jy62g9MUSEmS65NDG6ntUe6hjgVre+T0iQJ+kovM8H++mK1f/FCCvPNNBBcyaRs1PLt9
         Is5qa1nvxhc/4jWl+rRVUVKfmCBeREqFxiGTiGh+3LQ5RLSGHNvvZkHw3th2eMXHykFz
         bWYg==
X-Gm-Message-State: AO0yUKWNLcDVjG5PRPtBbriUOHXv2/xp1KJVqdGPVoEuQPAFa7Fax266
	sChAeaEZm41U3kd0JqsLjQ==
X-Google-Smtp-Source: 
 AK7set9H8k0goZQjGPEgNkkixy3gs3vd/sHKzFTM0Gx4xSIKWRHwsc1ffnNsJ1R+prua9m2CbtMAgg==
X-Received: by 2002:a9d:7103:0:b0:690:d498:56d2 with SMTP id
 n3-20020a9d7103000000b00690d49856d2mr7763163otj.4.1678299114187;
        Wed, 08 Mar 2023 10:11:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 d1-20020a056830138100b0068bb73bd95esm6636451otq.58.2023.03.08.10.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 10:11:53 -0800 (PST)
Received: (nullmailer pid 3526245 invoked by uid 1000);
	Wed, 08 Mar 2023 18:11:52 -0000
Date: Wed, 8 Mar 2023 12:11:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment
 '#'
Message-ID: <167828471597.2730705.13533520056770041535.robh@kernel.org>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
Message-ID-Hash: 756VTYF2SEPXEDI673B3FIY7SPVNMTW7
X-Message-ID-Hash: 756VTYF2SEPXEDI673B3FIY7SPVNMTW7
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-crypto@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 linux-riscv@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Eric Dumazet <edumazet@google.com>, freedreno@lists.freedesktop.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-gpio@vger.kernel.org,
 linux-media@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <sean@poorly.run>, netdev@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-spi@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-clk@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/756VTYF2SEPXEDI673B3FIY7SPVNMTW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 03 Mar 2023 15:42:23 -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/.yamllint   |  2 +-
>  .../bindings/clock/qcom,a53pll.yaml           |  4 ++--
>  .../devicetree/bindings/crypto/ti,sa2ul.yaml  |  4 ++--
>  .../bindings/display/msm/qcom,mdp5.yaml       |  2 +-
>  .../interrupt-controller/arm,gic.yaml         |  4 ++--
>  .../loongson,pch-msi.yaml                     |  2 +-
>  .../bindings/media/renesas,vin.yaml           |  4 ++--
>  .../devicetree/bindings/media/ti,cal.yaml     |  4 ++--
>  .../bindings/net/brcm,bcmgenet.yaml           |  2 --
>  .../bindings/net/cortina,gemini-ethernet.yaml |  6 ++---
>  .../devicetree/bindings/net/mdio-gpio.yaml    |  4 ++--
>  .../phy/marvell,armada-cp110-utmi-phy.yaml    |  2 +-
>  .../bindings/phy/phy-stm32-usbphyc.yaml       |  2 +-
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  2 +-
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      |  2 +-
>  .../regulator/nxp,pca9450-regulator.yaml      |  8 +++----
>  .../regulator/rohm,bd71828-regulator.yaml     | 20 ++++++++--------
>  .../regulator/rohm,bd71837-regulator.yaml     |  6 ++---
>  .../regulator/rohm,bd71847-regulator.yaml     |  6 ++---
>  .../bindings/soc/renesas/renesas.yaml         |  2 +-
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |  2 +-
>  .../bindings/sound/amlogic,axg-tdm-iface.yaml |  2 +-
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   |  4 ++--
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   |  4 ++--
>  .../bindings/sound/qcom,lpass-va-macro.yaml   |  4 ++--
>  .../sound/qcom,q6dsp-lpass-ports.yaml         |  2 +-
>  .../bindings/sound/simple-card.yaml           | 24 +++++++++----------
>  .../bindings/spi/microchip,mpfs-spi.yaml      |  2 +-
>  28 files changed, 65 insertions(+), 67 deletions(-)
> 

Applied, thanks!

