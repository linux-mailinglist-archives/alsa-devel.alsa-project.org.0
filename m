Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C33EE333A11
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 11:32:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E55C1772;
	Wed, 10 Mar 2021 11:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E55C1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615372362;
	bh=lGJeD26PZuxOOlwyHBPKrYiSn/6kl1E9MTXOQ/Hz44U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pA1CMx8BqcEhpkQ9iTHteK6d95OhRluywlu98Bi9a4m6KzFFC+DVbFISgZ77o+FEo
	 1VLgDuMW72HBQnaFyxTrAFJaRiItbaZbMrHPsSL0Srv1ctdYh1vjPaBlzYLVpWsZUc
	 LiqY8+ocxcH9rHbm1keVP1AZ9XrmKCx91c/zC6Bc=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D48F8032B;
	Wed, 10 Mar 2021 11:30:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 959A0F80227; Tue,  9 Mar 2021 15:42:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50471F800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50471F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="s6iNLsfr"
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3F2AB2223A;
 Tue,  9 Mar 2021 15:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615300922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G77sUYs1EAeHVxP/hlKiAiqXQYIKCpapQrEwbpPNVXg=;
 b=s6iNLsfrWa87KzmdWW3KpGsdd9SzT0AD36yQr0f8FQy9+zO1LtxAk2bg0nRM12wqfp99L6
 YJ9gFMvAv7v/0lwzsukNxRLWOVQX100QsgNbePJ/M2etAOD0/nbTMSAOxXILihMwG31xwt
 mjhup/PqHo5iS4Gd6O1Dfk9XKtUddec=
From: Michael Walle <michael@walle.cc>
To: spujar@nvidia.com
Subject: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Date: Tue,  9 Mar 2021 15:41:56 +0100
Message-Id: <20210309144156.18887-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Mailman-Approved-At: Wed, 10 Mar 2021 11:30:10 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

Hi,

> If "clocks = <&xxx>" is specified from the CPU or Codec component
> device node, the clock is not getting enabled. Thus audio playback
> or capture fails.
> 
> Fix this by populating "simple_dai->clk" field when clocks property
> is specified from device node as well. Also tidy up by re-organising
> conditional statements of parsing logic.
> 
> Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add asoc_simple_card_parse_clk()")
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>

This actually breaks sound on my board
(arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
The codec on this board (wm8904) has a fixed clock input (only distinct
frequencies are supported) and uses the FLL of the codec to generate the
desired sample rate.

It seems that after this patch the clock rate of the codecs clock (rather
than the FLL) is tried to be changed. Which fails, because it doesn't
support arbitrary frequencies.

-michael

> ---
>  sound/soc/generic/simple-card-utils.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index bc0b62e..0754d70 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -173,16 +173,15 @@ int asoc_simple_parse_clk(struct device *dev,
>  	 *  or device's module clock.
>  	 */
>  	clk = devm_get_clk_from_child(dev, node, NULL);
> -	if (!IS_ERR(clk)) {
> -		simple_dai->sysclk = clk_get_rate(clk);
> +	if (IS_ERR(clk))
> +		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
>  
> +	if (!IS_ERR(clk)) {
>  		simple_dai->clk = clk;
> -	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
> +		simple_dai->sysclk = clk_get_rate(clk);
> +	} else if (!of_property_read_u32(node, "system-clock-frequency",
> +					 &val)) {
>  		simple_dai->sysclk = val;
> -	} else {
> -		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
> -		if (!IS_ERR(clk))
> -			simple_dai->sysclk = clk_get_rate(clk);
>  	}
>  
>  	if (of_property_read_bool(node, "system-clock-direction-out"))
> -- 
> 2.7.4
> 
> 
