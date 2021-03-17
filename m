Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE23401CD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:20:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ACA616B6;
	Thu, 18 Mar 2021 10:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ACA616B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059200;
	bh=tOgFJ4o5PgryrZSo/91PbTtI3nbI+1J8paf/6XTa9WM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ln+CDoJBBgXd4GDXAxFvm0MswLRJu5JkMVbN5sIlzLt2W1s7ktsRpqpzoY2rM7cZg
	 n6OoseEA2l/wwR07lylSwQlYBkJVhpaiOM51yWXehfRhkVmlowdsvaHJy2Wk68uQrg
	 9xl+wkOYgu4+jExYe0XwjUyQ5/O9nMugGdQ2nNxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 159A4F804AB;
	Thu, 18 Mar 2021 10:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C16EEF8021C; Wed, 17 Mar 2021 06:52:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B63AF80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 06:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B63AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="HJ9lKY4h"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9BAE64F8C;
 Wed, 17 Mar 2021 05:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615960367;
 bh=tOgFJ4o5PgryrZSo/91PbTtI3nbI+1J8paf/6XTa9WM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HJ9lKY4hGhS1co2uTb9cICsaNrZmtCRDTA55GJgvzxAPdZEb1OjpPKZIOfBwYDu7+
 xn+uL5wP9w8GPZvQZijePGNwKkZHL+c8obT2jisoZudWe1R+gYYnEZfI1GJ87WqKsw
 VWZICVxNTlWraAgPFUH1RTY+mog6FAfryPhI102k=
Date: Wed, 17 Mar 2021 06:52:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop type references on common properties
Message-ID: <YFGZLM7MbypuE15L@kroah.com>
References: <20210316194858.3527845-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316194858.3527845-1-robh@kernel.org>
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Suman Anna <s-anna@ti.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Benson Leung <bleung@chromium.org>,
 Alex Elder <elder@kernel.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stefan Wahren <wahrenst@gmx.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

On Tue, Mar 16, 2021 at 01:48:58PM -0600, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. Drop all the unnecessary type
> references in the tree.
> 
> A meta-schema update to catch these is pending.
> 
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Stefan Wahren <wahrenst@gmx.net>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml       | 5 +----
>  Documentation/devicetree/bindings/arm/cpus.yaml              | 2 --
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml           | 1 -
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 3 +--
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 1 -
>  .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
>  .../bindings/memory-controllers/nvidia,tegra210-emc.yaml     | 2 +-
>  Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml   | 1 -
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml          | 1 -
>  Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml  | 2 --
>  .../devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml   | 2 +-
>  Documentation/devicetree/bindings/sound/ak4642.yaml          | 2 --
>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml      | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml    | 1 -
>  .../devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml       | 1 -
>  Documentation/devicetree/bindings/usb/usb.yaml               | 1 -
>  16 files changed, 5 insertions(+), 23 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
