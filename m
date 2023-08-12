Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3A779C77
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 04:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8471E839;
	Sat, 12 Aug 2023 04:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8471E839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691805769;
	bh=Y7lfIglGpHMORL+CytKKzL5JgDIO00z7yfwPmN9EYtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LEIBnmEbo8nuo9Q5jBn2it3InDekoshUMcZriUKJ8Qo3UIyO+gP36SavSdQ9vxaS6
	 aYzy598jH+71ROEBiExn+A2pH1EcM2ZgYK3Y+QPRJRVc09BwIecZ8tcclZ4u8JEhvu
	 Xy0YFLhR8H4rYubAIXacqt/Jf6BkcrLr0GQiSwgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56018F80166; Sat, 12 Aug 2023 04:01:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE111F80553;
	Sat, 12 Aug 2023 04:01:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E201BF80557; Sat, 12 Aug 2023 04:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C095CF80166
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 04:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C095CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oOqvcunb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 078A764B5C;
	Sat, 12 Aug 2023 02:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F8CC433C7;
	Sat, 12 Aug 2023 02:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691805684;
	bh=Y7lfIglGpHMORL+CytKKzL5JgDIO00z7yfwPmN9EYtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOqvcunbx7UPFNwxjzmJIbDCpvRf2Blf/JEGbJlSVgGF0eqGutzO/Np09zGl985/s
	 A1Vi80oi7dZhRbvbFi7PHv8PefhLb0x8QPKVacfxpENKmrKwrYcoMYkQzv1Jor0xCc
	 Z3JoYHupKuA8okM4dYdU8OGeNCgSlsQprty2Ul/VldziACWdcobWcoxdXWv9MOXiUf
	 ZNA9ZQ3QXH2ab8pktBNDSKiGnutXOlaF8MNpISEB2rERxQgIt5ASE0sgPsc8Ub7bYZ
	 8K3dDJ5CYluQI2cahYKOqXDiiK0ZNax2uTs3SOPsTbzzJutj1YkjjdAVcubuwNQls0
	 S10cYnSzmR+7g==
Date: Sat, 12 Aug 2023 10:01:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, kernel@puri.sm,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	David Heidelberg <david@ixit.cz>, Sherry Sun <sherry.sun@nxp.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: imx8mq-librem5-devkit: Drop
 power-supply
Message-ID: <20230812020107.GI151430@dragon>
References: <cover.1691684726.git.agx@sigxcpu.org>
 <c1ed057f5cf27dd8ea649ddf5c67e4f73efd4120.1691684726.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <c1ed057f5cf27dd8ea649ddf5c67e4f73efd4120.1691684726.git.agx@sigxcpu.org>
Message-ID-Hash: ICDET3VPEQ6AUD2QX4KH5543SMQ5D2JQ
X-Message-ID-Hash: ICDET3VPEQ6AUD2QX4KH5543SMQ5D2JQ
X-MailFrom: shawnguo@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICDET3VPEQ6AUD2QX4KH5543SMQ5D2JQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 10, 2023 at 07:59:51PM +0200, Guido G�nther wrote:
> It's not a valid binding. Instead move the sdio_rst line to the power
> sequence and use w_disable1 as the vmmc-supply bringing it more in line
> with other SDIO M2 cards.
> 
> Resolves following warning:
> 
> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: mmc@30b50000: Unevaluated properties are not allowed ('power-supply' was unexpected)
>         from schema $id: http://devicetree.org/schemas/mmc/fsl-imx-esdhc.yaml#
> 
> Reported-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Guido G�nther <agx@sigxcpu.org>

Applied, thanks!
