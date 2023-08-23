Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC25786874
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3952ADF4;
	Thu, 24 Aug 2023 09:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3952ADF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862641;
	bh=aiA/UuMJjd2yZRfzzHWpCWh5B+cUHIcvkXL73XD9+/Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jeX0SW0xjpilscgpmUfqHjFYOladUACs79H7YyhNEwuqS/sqYwLjrEKYt161DZir5
	 OQE/fbcMjjb58FXdHJ/EEhQKMtIlcE02ruD2sLfB2Ite/7EIT42iEKj1UwEYhlQc/E
	 kA82h6fzHtFeiy4rSktY4ot4J7a8d/ToHJDJqrww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF835F80611; Thu, 24 Aug 2023 09:32:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E56C3F80602;
	Thu, 24 Aug 2023 09:32:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1D00F80158; Wed, 23 Aug 2023 04:45:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.8 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CD03F800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 04:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD03F800D1
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 09DC780BE;
	Wed, 23 Aug 2023 10:45:18 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:45:18 +0800
Received: from [192.168.125.113] (113.72.145.205) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:45:16 +0800
Message-ID: <c9ac528a-e1c2-0f64-c50e-30fc1eb6e9ac@starfivetech.com>
Date: Wed, 23 Aug 2023 10:45:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/5] riscv: dts: starfive: pinfunc: Fix the pins name
 of I2STX1
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-5-xingyu.wu@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230821144151.207339-5-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U26JOW3UGIOE5E3MPZ3TUFJTYEL4WLQQ
X-Message-ID-Hash: U26JOW3UGIOE5E3MPZ3TUFJTYEL4WLQQ
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:32:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U26JOW3UGIOE5E3MPZ3TUFJTYEL4WLQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/8/21 22:41, Xingyu Wu wrote:
> These pins are actually I2STX1 clock input, not I2STX0,
> so their names should be changed.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> index fb0139b56723..256de17f5261 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> @@ -240,8 +240,8 @@
>  #define GPI_SYS_MCLK_EXT			30
>  #define GPI_SYS_I2SRX_BCLK			31
>  #define GPI_SYS_I2SRX_LRCK			32
> -#define GPI_SYS_I2STX0_BCLK			33
> -#define GPI_SYS_I2STX0_LRCK			34
> +#define GPI_SYS_I2STX1_BCLK			33
> +#define GPI_SYS_I2STX1_LRCK			34
>  #define GPI_SYS_TDM_CLK				35
>  #define GPI_SYS_TDM_RXD				36
>  #define GPI_SYS_TDM_SYNC			37

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Thanks!
