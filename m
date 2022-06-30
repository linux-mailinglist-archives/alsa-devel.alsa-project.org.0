Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08856535A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC981745;
	Mon,  4 Jul 2022 13:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC981745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934080;
	bh=d8qg1/j/5yE/LqU9rt966N4Zs69PLY5vadWgNsDNX3Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGGRVRJatsNuytXjm03tXa58ej3XfXe30M8RSNTgadE1gHqYE8YDepN/j/+xy8cFc
	 8x24JVxVOmXoPuEr3Oi9sYJjPmEGtOG/U+AwwQjuwLY7XS0LyGa+UISr7QFVO3G+aa
	 4/Buna2KwAsyTcglQ8FSnTlK7R34UjMGA8oL4688=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FB7BF805B1;
	Mon,  4 Jul 2022 13:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A7ACF804D8; Thu, 30 Jun 2022 23:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFE52F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 23:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE52F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qNhf+eF3"
Received: by mail-lf1-x12a.google.com with SMTP id y16so587548lfb.9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NrGas5lulMJdCQFvtdHCPkDfHPqr2UrmNuzK4irkMDQ=;
 b=qNhf+eF3ou+OVuBeZcYuSohm7adWxuKi6Yti0wH8bSh+rn6DndIf7DuGYB1f4KK8qt
 DQh7A3jNA52nPGbBERaiWj+hhdug4lHLUcYgbylBVnN1M1rmnL4bHVXl9so2OAk70Kol
 ppPogOM7Yfz5iZIO7ZCRIJrAxmaPYXsarHk0xmmqdn0cMqNbblQh3pyw2vY/FtMgJd5y
 hCQtcbwDeYyKxHz0lXeQPvCW4k5sS7l2OGN6ra/IfS/OBFcMG7EvKJhz4Qi0RLZVnkms
 eTpsxPnvbqwvQr/Y+dzniw6/aIav/3pP1gfyXYwGI+HaXsv6x2RppynNq4a0m+ieGc0n
 IN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NrGas5lulMJdCQFvtdHCPkDfHPqr2UrmNuzK4irkMDQ=;
 b=cc6VZryGicNGmUqpGY2c2CHA/5vbQ5sXk2AZ4RKR4e/hTi4t6adGStCHTKPMWboEN7
 0pNUvRWLXJqrLxeZSw5srzGQNVmpa4uyh3af3HIhZ5qLbssOwqA3nV6UHfkxPYlk5Qvt
 nZGH23wBELEWhA6IER2QYhEbv7A0N3KxlR4XIzQrnEe6hyxaJ3pIv5Hhz9Zhjp01M94E
 rR8WE2Ygp6tQPDJ4hwUCxOsH3HXhp2tbCNR52JReWWEFE5R5pgxdkcv9y77AGzO6AdtZ
 egT35RlbZkomDmd/OON3NesZgvY6RbotgXP+xIVHagHQ6+t8wkPZ1tmY2dX/stGqUF89
 WtEQ==
X-Gm-Message-State: AJIora8/XqEz7uxRPp5H/WBq23HQdaSBJlZ8TWnkkBjmLiXdJaGqf9me
 21KqZlQq5op9bZDvb2HIOcE=
X-Google-Smtp-Source: AGRyM1smx3NRBQNbNVKAperCZ6SfrYZXWBWZAqtLbA5mlnisA9vFR0m9cfl7wPwPzhY7YfaqPG1NNw==
X-Received: by 2002:a05:6512:2292:b0:47f:68b3:3c21 with SMTP id
 f18-20020a056512229200b0047f68b33c21mr7126215lfu.316.1656625918646; 
 Thu, 30 Jun 2022 14:51:58 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056512325000b0047f963bf815sm3293106lfr.93.2022.06.30.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 14:51:58 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:51:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 08/15] riscv: dts: canaan: fix the k210's timer nodes
Message-ID: <20220630215155.xzhtfkolgy2iubqe@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-9-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-9-mail@conchuod.ie>
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
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

On Wed, Jun 29, 2022 at 07:43:37PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The timers on the k210 have non standard interrupt configurations,
> which leads to dtbs_check warnings:
> 
> k210_generic.dtb: timer@502d0000: interrupts: [[14], [15]] is too long
> From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> 
> Split the timer nodes in two, so that the second timer in the IP block
> can actually be accessed & in the process solve the dtbs_check warning.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Just to note. IMO the DW APB Timer driver has been incorrectly
designed in the first place. The dts-node is supposed to describe the
whole IP-core timers set as the original Canaan k210 DT-file expected,
since there are common CSRs in the registers range, which currently
get to be unreachable. But since the DT-bindings has already been
defined that way in the framework of DW APB Timer driver alas there
is nothing we can do to fix it.

-Sergey

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 46 +++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index cd4eae82d8b2..72f70128d751 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -319,28 +319,58 @@ fpioa: pinmux@502b0000 {
>  
>  			timer0: timer@502d0000 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502D0000 0x100>;
> -				interrupts = <14>, <15>;
> +				reg = <0x502D0000 0x14>;
> +				interrupts = <14>;
>  				clocks = <&sysclk K210_CLK_TIMER0>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
>  				resets = <&sysrst K210_RST_TIMER0>;
>  			};
>  
> -			timer1: timer@502e0000 {
> +			timer1: timer@502d0014 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502E0000 0x100>;
> -				interrupts = <16>, <17>;
> +				reg = <0x502D0014 0x14>;
> +				interrupts = <15>;
> +				clocks = <&sysclk K210_CLK_TIMER0>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER0>;
> +			};
> +
> +			timer2: timer@502e0000 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502E0000 0x14>;
> +				interrupts = <16>;
>  				clocks = <&sysclk K210_CLK_TIMER1>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
>  				resets = <&sysrst K210_RST_TIMER1>;
>  			};
>  
> -			timer2: timer@502f0000 {
> +			timer3: timer@502e0014 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502E0014 0x114>;
> +				interrupts = <17>;
> +				clocks = <&sysclk K210_CLK_TIMER1>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER1>;
> +			};
> +
> +			timer4: timer@502f0000 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502F0000 0x14>;
> +				interrupts = <18>;
> +				clocks = <&sysclk K210_CLK_TIMER2>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER2>;
> +			};
> +
> +			timer5: timer@502f0014 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502F0000 0x100>;
> -				interrupts = <18>, <19>;
> +				reg = <0x502F0014 0x14>;
> +				interrupts = <19>;
>  				clocks = <&sysclk K210_CLK_TIMER2>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
> -- 
> 2.36.1
> 
