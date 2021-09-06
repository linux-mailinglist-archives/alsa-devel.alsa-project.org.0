Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03A401DA9
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 17:33:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2301A1740;
	Mon,  6 Sep 2021 17:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2301A1740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630942383;
	bh=KzUcWNoTA4s5NMKmDAQdBrCrShPNzJCE7EDPpyLFQc8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e85XZ4NG4CGmfeMZKIGYGVC681OQ05R51uzeK3Ud5SlNnnliN/l5MN+uLpcvXHhbl
	 H1SVUTAEoa9BuUUe4YOZkEH861Gz7+UjjpLzn6nGrDTFK3yt4kucw5KkH8AT+7EYmg
	 TEPliGybN1m1qmnfev9QXiPimzL+k+KdDeqY4Dp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E5BAF804A9;
	Mon,  6 Sep 2021 17:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 556E1F8026C; Mon,  6 Sep 2021 17:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8692AF804A9
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 17:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8692AF804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UXRljDfh"
Received: by mail-wm1-x32e.google.com with SMTP id m2so4893541wmm.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PQ0Sz3nSdC4M1Li6PaTkmdjXBaQB3/I9C/9VyXKR078=;
 b=UXRljDfh9pslkpfpiZW87xjIeGBWGwIaAMRlhWJCKG7426frC0Kf3IPd4Y1I1la0VX
 yR+sttTvRZyIIqXtqEvMNgsD46eYnTi/cTMP9nhkOXv4qZJ2YwpO6rzL+Ad9sxuj2FUM
 6W6/m+rhws4O7vtCY4Xiva5VZ95hBKwVmVRc5gCM+RrOnt67C1wg/drGrneMfWvU+jG5
 l7O1qd0bsLRgpjxFf8Bd6t5jthk5fKIaMSBNPrDlWhhP0XLPqT4MFYj+oA0vYzozk3X2
 bZpg5O3sTif4O/ZWaOrDw3jH9S/DBp5s9fEn++665aVy0K0x/CMSqlpEfnUx6laQG736
 0S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PQ0Sz3nSdC4M1Li6PaTkmdjXBaQB3/I9C/9VyXKR078=;
 b=G878x1Xhk5dcIOLshuS5U/e3E+s3mS4XleMpn/59L3X42kKxQJlO60hz6NFHUCZbnS
 tFQVoNAVNOMn0tFsfORERld6kD1bqYxxw9gIFVagRGH+u6vR9Jt5svp0DoNKhFZnbUuF
 Hhef3+QealHffWWbsQVhyb0hRr6WCK5laociLEu1X+EKpq3vP0tUCPRCZXt95EbtzmLQ
 tAgJp1G+9MbESHPmUsijx9Q9p+NO/s2IFFa1aV/fkDesH3u3a/z7i+8mXAtjgywXPouz
 1mM2ust369a99r2mnUHnpEDCFJ2AdWmJYHyKWV4wA+XehwsBew+yShxbqqspdlqJjaie
 /ceQ==
X-Gm-Message-State: AOAM531F7zB4lksdfCLOEP3WcmRcFH7Fx8MPY+zc1MPsanO+XyjWchQN
 hEzovlX+PQDdxQVJr3HDvK7+GQ==
X-Google-Smtp-Source: ABdhPJw1GKspi6vCehDcEOXPQ+NCWmQvHbO1FyzGfSYpe1CVz0Iflaaie8Hoz/ZDPTqau9R2oirf6Q==
X-Received: by 2002:a1c:1f49:: with SMTP id f70mr12167723wmf.13.1630942279756; 
 Mon, 06 Sep 2021 08:31:19 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id f20sm7471638wmb.32.2021.09.06.08.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 08:31:19 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: Use 'enum' instead of 'oneOf' plus 'const'
 entries
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210824202014.978922-1-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b2e70818-521d-eff8-d7d5-be5a8d95df19@linaro.org>
Date: Mon, 6 Sep 2021 16:31:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824202014.978922-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Vignesh R <vigneshr@ti.com>,
 linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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



On 24/08/2021 21:20, Rob Herring wrote:
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Vignesh R <vigneshr@ti.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/display/msm/dsi-phy-10nm.yaml           |  6 +++---
>   .../bindings/display/msm/dsi-phy-14nm.yaml           |  6 +++---
>   .../bindings/display/msm/dsi-phy-28nm.yaml           |  8 ++++----
>   .../bindings/dma/allwinner,sun6i-a31-dma.yaml        | 12 ++++++------
>   .../devicetree/bindings/firmware/arm,scpi.yaml       |  6 +++---
>   .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 10 +++++-----
>   .../interrupt-controller/loongson,liointc.yaml       |  8 ++++----
>   .../devicetree/bindings/media/i2c/mipi-ccs.yaml      |  8 ++++----
>   .../devicetree/bindings/mfd/ti,lp87565-q1.yaml       |  6 +++---
>   .../devicetree/bindings/net/realtek-bluetooth.yaml   |  8 ++++----
>   .../bindings/net/ti,k3-am654-cpsw-nuss.yaml          |  8 ++++----
>   .../devicetree/bindings/net/ti,k3-am654-cpts.yaml    |  6 +++---
>   Documentation/devicetree/bindings/pci/loongson.yaml  |  8 ++++----
>   .../devicetree/bindings/phy/intel,lgm-emmc-phy.yaml  |  6 +++---
>   .../devicetree/bindings/serial/8250_omap.yaml        |  9 +++++----

>   .../devicetree/bindings/sound/qcom,sm8250.yaml       |  6 +++---

for sm8250 sound card,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   .../devicetree/bindings/sound/tlv320adcx140.yaml     |  8 ++++----
>   .../devicetree/bindings/spi/realtek,rtl-spi.yaml     | 12 ++++++------
>   .../devicetree/bindings/timer/arm,sp804.yaml         |  6 +++---
>   19 files changed, 74 insertions(+), 73 deletions(-)
> 
