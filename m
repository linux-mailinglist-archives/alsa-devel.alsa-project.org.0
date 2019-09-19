Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FDB7516
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 10:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F62167D;
	Thu, 19 Sep 2019 10:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F62167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568881689;
	bh=5OgGlO+PuEzUqnp+AxN2zXYsLn0ngjVSFEfMUpOIj+0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0fuKuCKSN4sIfRPd6gh9qTCfGZJtQ4YfiqtlySyxVSu7As0RMS8gTS5s/hGOGYjV
	 2hab/S0ch8BpS7Abb1b3kPjgpcu1vSQdi8sJ3/XTxVsQjElJFx2VREIPwkvp0XYs0r
	 3LNvv0Z2iPNGtSPDOk4uxXNtwIjJu2bmem6VrpUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A44A9F80307;
	Thu, 19 Sep 2019 10:26:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DC24F80361; Thu, 19 Sep 2019 10:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FAFBF805F7
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 10:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FAFBF805F7
Received: by mail-wm1-f68.google.com with SMTP id p7so3278495wmp.4
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 01:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5Kix1vWVqgxCmDUQkxBHf8UbEBayBPaxaHrzjCVpKWE=;
 b=g2G5uvnAWoPReMqXVredzD5SMm4RMK2hJs4e/Jd4SD1qBDdxk10HCXuSrFLEPFHQPV
 vvlyIU8wuR8JY4d25H98p3aBjHw3fgVuRHct/zLgLsnw4cAImsy1c48xQLvgt+JAuRp7
 2nq1UGQKDPOtbWWD4jSBTI9p/kcCm/dSTPhn84aJNogra+YUdnc4PPRMfcid057C5/2y
 sKDSt7X+qAkY8Z79xnl5HciaC/F/39h10+qgYCi7M2/rcRoplZyfflWKL+Aliz+dh4T0
 WCvgD08al91WUWDHJjTDiUWRLwR7m6zDIwDlm1ZkQfLqnLtvOHmJ7R6OVELPXvc1KqBD
 LssA==
X-Gm-Message-State: APjAAAUOicB1bn3znXcxaotH6iWCVHvQYyZOjUezhrjmnNmgCWMbcwOq
 JKiVPsFNL/rcbv9qyqh6xMA=
X-Google-Smtp-Source: APXvYqzzWYQAyNSPK0OicTAv83TGfnT3qvETBNRtC/3D58bfQtSXgxXkEDBhiDTK0t/7qWUw8Q38HA==
X-Received: by 2002:a1c:d188:: with SMTP id i130mr1738494wmg.101.1568881585095; 
 Thu, 19 Sep 2019 01:26:25 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id n7sm2737843wrt.59.2019.09.19.01.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:26:24 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:26:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190919082621.GG13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705@eucas1p2.samsung.com>
 <20190918104634.15216-10-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-10-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 9/9] ARM: dts: arndale: Add audio
 support (WM1811 CODEC boards)
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

On Wed, Sep 18, 2019 at 12:46:34PM +0200, Sylwester Nawrocki wrote:
> Add sound node and the clock configurations for the I2S controller
> for audio support on the Exynos5250 SoC Arndale boards with
> WM1811 based audio daugther board.
> 
> We need to increase drive strength of the I2S bus, otherwise
> the audio CODEC doesn't work. Likely the CODEC's master clock
> is the main issue here.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index dc6fa6fe83f1..62aa6720aa88 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/clock/samsung,s2mps11.h>
> +#include <dt-bindings/sound/samsung-i2s.h>
>  #include "exynos5250.dtsi"
>  
>  / {
> @@ -135,6 +136,12 @@
>  		};
>  	};
>  
> +	sound {
> +		compatible = "samsung,arndale-wm1811";
> +		samsung,audio-cpu = <&i2s0>;
> +		samsung,audio-codec = <&wm1811>;
> +	};
> +
>  	fixed-rate-clocks {
>  		xxti {
>  			compatible = "samsung,clock-xxti";
> @@ -499,12 +506,24 @@
>  	};
>  };
>  
> +&clock {
> +	assigned-clocks = <&clock CLK_FOUT_EPLL>;
> +	assigned-clock-rates = <49152000>;
> +};
> +
> +&clock_audss {
> +	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>;
> +	assigned-clock-parents = <&clock CLK_FOUT_EPLL>;
> +};

Put them before "cpu" so alphabetical order is preserved.

Best regards,
Krzysztof

> +
>  &i2c_3 {
>  	status = "okay";
>  
> -	wm1811a@1a {
> +	wm1811: codec@1a {
>  		compatible = "wlf,wm1811";
>  		reg = <0x1a>;
> +		clocks = <&i2s0 CLK_I2S_CDCLK>;
> +		clock-names = "MCLK1";
>  
>  		AVDD2-supply = <&main_dc_reg>;
>  		CPVDD-supply = <&main_dc_reg>;
> @@ -540,9 +559,15 @@
>  };
>  
>  &i2s0 {
> +	assigned-clocks = <&i2s0 CLK_I2S_RCLK_SRC>;
> +	assigned-clock-parents = <&clock_audss EXYNOS_I2S_BUS>;
>  	status = "okay";
>  };
>  
> +&i2s0_bus {
> +	samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
> +};
> +
>  &mixer {
>  	status = "okay";
>  };
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
