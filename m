Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C7A70D8A7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 11:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C294206;
	Tue, 23 May 2023 11:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C294206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684833285;
	bh=7lJpJWoT62DVLB91NwiviEZR5xE52r4Lu7PV5rSVoC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FvOl5ojFRRkFPkqTS5F7FDnd3QILifTMVttpAT3Xw/VOBOdcobZgwwedtBb1ZQ9UU
	 h+cBL1QH7eyl7MEDlTWTbi+10ajJSEMx1Kou6TsR5cyCL14KdEyHTrs7yobmLol99a
	 r/wNyNTAShmz0yis5Gd987dijXArAWbbcO1JFsjI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF71AF80249; Tue, 23 May 2023 11:13:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94302F80086;
	Tue, 23 May 2023 11:13:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B694F8024E; Tue, 23 May 2023 11:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by alsa1.perex.cz (Postfix) with ESMTP id 34AD1F8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 11:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34AD1F8016A
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1q1O5K-0007MY-03; Tue, 23 May 2023 11:13:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B2B70C02E6; Tue, 23 May 2023 11:08:22 +0200 (CEST)
Date: Tue, 23 May 2023 11:08:22 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	paul@crapouillou.net, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v1 3/3] mips: dts: ingenic: x1000: Add AIC device tree
 node
Message-ID: <20230523090822.GD9484@alpha.franken.de>
References: <20230509124238.195191-1-aidanmacdonald.0x0@gmail.com>
 <20230509124238.195191-3-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509124238.195191-3-aidanmacdonald.0x0@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Message-ID-Hash: XTFJEQJW7JTO7KHSRVVGL7APLZSAVVRO
X-Message-ID-Hash: XTFJEQJW7JTO7KHSRVVGL7APLZSAVVRO
X-MailFrom: tsbogend@alpha.franken.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTFJEQJW7JTO7KHSRVVGL7APLZSAVVRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 09, 2023 at 01:42:38PM +0100, Aidan MacDonald wrote:
> Add a node for the on-board I2S audio controller.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  arch/mips/boot/dts/ingenic/x1000.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index 42e69664efd9..cc264cfff826 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -417,4 +417,22 @@ otg: usb@13500000 {
>  
>  		status = "disabled";
>  	};
> +
> +	aic: audio-controller@10020000 {
> +		compatible = "ingenic,x1000-i2s";
> +		reg = <0x10020000 0x38>;
> +
> +		#sound-dai-cells = <0>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <1>;
> +
> +		clocks = <&cgu X1000_CLK_AIC>,
> +			 <&cgu X1000_CLK_I2S>;
> +		clock-names = "aic", "i2s";
> +
> +		dmas = <&pdma X1000_DMA_I2S0_RX 0xffffffff>,
> +			   <&pdma X1000_DMA_I2S0_TX 0xffffffff>;
> +		dma-names = "rx", "tx";
> +	};
>  };
> -- 
> 2.39.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
