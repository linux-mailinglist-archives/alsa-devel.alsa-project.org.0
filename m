Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7577C03A4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 20:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E1BE85;
	Tue, 10 Oct 2023 20:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E1BE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696963426;
	bh=ldKKDLNL5IeRM0a07A6s6AJub50EGR8AJO6LTn0Obwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OCIx+kWMOtNnBDHIl2UjA/MzAQ7HYKJvGtHouzUu6B3FKz0u+2/y1xMLkmiW8/iEX
	 RqAhI6n54Jy8puGeW41eeFqksZ4iOdCuakoMTe8xxLPob3AnXqIYOLtYQcnCru7dxr
	 wW8qLlFKe2mEiYHOd96zhd2cZNOE4e1igxK6paRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E07E3F8055B; Tue, 10 Oct 2023 20:42:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47D74F802BE;
	Tue, 10 Oct 2023 20:42:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB4D1F80310; Tue, 10 Oct 2023 20:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1709CF8027B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 20:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1709CF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LqzM4D1M
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C43AECE1DF1;
	Tue, 10 Oct 2023 18:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754C9C433CC;
	Tue, 10 Oct 2023 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696963337;
	bh=ldKKDLNL5IeRM0a07A6s6AJub50EGR8AJO6LTn0Obwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqzM4D1MlLdeXjle0S/VafEl40lMghLhLKm+9gJtf+ozhX1rdh7dMp9TxumYlErj6
	 hfFl58cakIJNbknsQMdeOerVRiHoWTUZimBOIaMG2Er7wDuh+ofNCrIildBOEkgcyF
	 iHst+Szlw1LPgbq0idM4X1NB53u3zx2lyIXz6XM9scQtjG/o0kAoQJz5cALTiLeS4h
	 P6O/43fv9eqa2gfm+cl9uXuK8WPOBWHa+gVOYYWs0n9289SeXGnWrjjm8Uyv2M2J41
	 MyzucIxozLIO/j0LhciFjLR46qrcTuYTics1mybYkX073932KlLSdDEBL0ov4kHqG8
	 2tXMZTrLHMb7w==
Received: (nullmailer pid 1358279 invoked by uid 1000);
	Tue, 10 Oct 2023 18:42:12 -0000
Date: Tue, 10 Oct 2023 13:42:12 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	mchehab@kernel.org, fabrice.gasnier@foss.st.com,
	andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
	lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	arnd@kernel.org, richardcochran@gmail.com,
	Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-p@alsa-project.org,
	hy@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a system bus for
 STM32MP15x boards
Message-ID: <20231010184212.GA1221641-robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010125719.784627-11-gatien.chevallier@foss.st.com>
Message-ID-Hash: QLFH5ZW7UDYLYV4OYFFJ7ONVPNJX7Q7V
X-Message-ID-Hash: QLFH5ZW7UDYLYV4OYFFJ7ONVPNJX7Q7V
X-MailFrom: rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLFH5ZW7UDYLYV4OYFFJ7ONVPNJX7Q7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
> ETZPC is a firewall controller. Put all peripherals filtered by the
> ETZPC as ETZPC subnodes and reference ETZPC as an
> access-control-provider.
> 
> For more information on which peripheral is securable or supports MCU
> isolation, please read the STM32MP15 reference manual.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
>     	- Renamed access-controller to access-controllers
>     	- Removal of access-control-provider property
> 
> Changes in V5:
>     	- Renamed feature-domain* to access-control*
> 
>  arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
>  arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
>  arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
>  3 files changed, 1450 insertions(+), 1377 deletions(-)

This is not reviewable. Change the indentation and any non-functional 
change in one patch and then actual changes in another.

This is also an ABI break. Though I'm not sure it's avoidable. All the 
devices below the ETZPC node won't probe on existing kernel. A 
simple-bus fallback for ETZPC node should solve that. 

Rob
