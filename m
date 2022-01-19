Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D114947F0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1715287E;
	Thu, 20 Jan 2022 08:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1715287E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662725;
	bh=lh3e6vV0ucsbxWPl5G8Web/KQhxNpREIwURVXvqQlRQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zk53Rh956nnJDcx41fGjaAsbfU/bRlSyspF55jKF2jucyHr8fb1Hn1Ldn4zRk5WJt
	 lVI15WFFTTeLNttf2OAhq2pk15f0TdN76pxtPqP4Hkgqp45k+NNpyTi7iSsKdE+Cse
	 mPdCRVcE+IDBxRI5fntFF64UB6DmGOvmDFTDvl0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C853EF805C4;
	Thu, 20 Jan 2022 08:03:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EE66F801F7; Wed, 19 Jan 2022 11:35:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0857CF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 11:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0857CF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YzN3hIDi"
Received: by mail-ed1-x52e.google.com with SMTP id j23so3948828edp.5
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 02:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OSDFZdcVmsxc9n5bq5153WrX2NPdR5H36ptL4DF/Ld8=;
 b=YzN3hIDiV3bsIYsBRldtIUseIA+Xg7yiUwxhkQBN4CpuDkGRGuFL7tAwCFTPYxhsRL
 HPHBSnHmlPJjpHnwXFn3XLaO3n9wa1rhK6vn59VsHIzMFUB6Jaq/3jsmguiQSKRchg1F
 Rt8vJSiYrulpQPWwPqPi3M8d7DsPrMLpe1PuuNpPMpczmmAtVSklZu+pQaTuoZw/CFJz
 zmTnBvK6MUoD+sXbx5PZpdbapVrA4zutuPKb+I0hcI1WoSE1tZMwas+pgK6nHJrD6hKt
 eeU6QEdcKx7a9glyGv2v53ut+S9OpX/JqVokRLDZ4YgZwe4DtxLJ2DYjxyR/R4KjvJPB
 tM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OSDFZdcVmsxc9n5bq5153WrX2NPdR5H36ptL4DF/Ld8=;
 b=MyKkCQ5lBFAo9+D4lcfDdeHaGxGNgHAZHmJUqKfvVRwrwLgvPvrTtbc+BNcBTzjFHc
 M2Xd8cngLbPvaDLUyxW+ILMbUzyIa9U6h3P9QFKmqUvIDaGewfqbyeVW59KM+qF/ltvs
 gH9sV8fAAbbb5yW0d45DUmCLupCq7bK7p0Clso+fYuDUVFtGMhpIHoCxiqv1D5PQ1ZUw
 oLGG0xgO1bB5+1Uc9E9x4TDrD6xcp2UvO1eMJ3QZUn1q5CLLcR0y10RzfNhs+zORCSN6
 a9j+VX+h4p7krIsKfatpBpMMUgYcpy9D4ti8+izjLCrDgnqqbZEcEVKpe3Rt2ZRJZ4y6
 OlmA==
X-Gm-Message-State: AOAM533Xo8/botE8vxkuIxz3lG0pLzZ+qojZOOXrCNVCwvtC2zQnZ9Xc
 /wqC/cgSt6Ho17M9wrVag8A=
X-Google-Smtp-Source: ABdhPJxftTapCLkxAI0MUlBNg1QEZq+09+lN2uAiNmyiN4LnLKb1WAquBvnPN+ndGN2eyHqbgIspAw==
X-Received: by 2002:a05:6402:4310:: with SMTP id
 m16mr13576339edc.344.1642588546591; 
 Wed, 19 Jan 2022 02:35:46 -0800 (PST)
Received: from skbuf ([188.25.255.2])
 by smtp.gmail.com with ESMTPSA id go41sm6349344ejc.200.2022.01.19.02.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 02:35:46 -0800 (PST)
Date: Wed, 19 Jan 2022 12:35:42 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Message-ID: <20220119103542.el3yuqds6ihpkthn@skbuf>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:35 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-usb@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
 Georgi Djakov <djakov@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
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

On Tue, Jan 18, 2022 at 07:50:38PM -0600, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
> 
> The array of phandles case boils down to needing:
> 
> items:
>   maxItems: 1
> 
> The phandle plus args cases should typically take this form:
> 
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
> 
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
> ---
(...)
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 702df848a71d..c504feeec6db 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -34,6 +34,8 @@ properties:
>        full routing information must be given, not just the one hop
>        routes to neighbouring switches
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      maxItems: 1
>  
>    ethernet:
>      description:

For better or worse, the mainline cases of this property all take the
form of:

arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
				link = <&switch1port9 &switch2port9>;
				link = <&switch1port10 &switch0port10>;
arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
						link = <&switch1port6
							&switch2port9>;
						link = <&switch1port5
							&switch0port5>;
arch/arm/boot/dts/vf610-zii-scu4-aib.dts
						link = <&switch1port10
							&switch3port10
							&switch2port10>;
						link = <&switch3port10
							&switch2port10>;
						link = <&switch1port9
							&switch0port10>;

So not really an array of phandles.
