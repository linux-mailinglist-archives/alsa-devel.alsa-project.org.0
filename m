Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9974F9B0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 23:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC96F00;
	Tue, 11 Jul 2023 23:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC96F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689110569;
	bh=pb2syncfua/cIuxL9FTXoABIuiYWz1vV+RpCpqcOOgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uEJDNqZ/1kddIJWzIJYKyaR79ZazZXBf9W5mzg1guBe1DS3sU6SKnNgEBv3BPUIGl
	 pBuPlZHkO54xXV1PstSECbsav3Mmt7+DC0qg+2EEnI1riHMcEDEkid+6II4yKQMaFD
	 tOoLmQahYlcmH3tLTG6qLNiWAg8pHrZ/uAbs7oRQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67F08F800E4; Tue, 11 Jul 2023 23:21:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A154BF800E4;
	Tue, 11 Jul 2023 23:21:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7337FF8027B; Tue, 11 Jul 2023 23:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F8B1F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 23:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F8B1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B4FYs6ds
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53E5261602;
	Tue, 11 Jul 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CE0C433CA;
	Tue, 11 Jul 2023 21:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689110479;
	bh=pb2syncfua/cIuxL9FTXoABIuiYWz1vV+RpCpqcOOgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B4FYs6dsSs4yyI5USmLDNke/bT3rMz4d2mrxpoaBtLSWvKmTzFRsTt4c0USDMa1HW
	 AI+6eRUtz4HPUMeeU6aKR4WwpvTbXFR8aY6RJ0mzcwIMPsRljSG9oUtkvfxu7RgDDl
	 x7dN00JQ8ZweRd/8wTfK/W4QAyjfLl7faiC/vcGwRvfWukBJCH0snI8r02BszumQsE
	 CIfN5cmHzuM9CV5r+KmlduJ+bqGtbBTtg6j5oZZCyjFwUWY9viIih2ZerY2cIuUzul
	 wCOn3IQQTjM0craVQ6ui18wWKMvJVYCeVCawetfIPGFM9s7RD2gWnlkQIRBH6wrFnn
	 NdFZd0+Pau3wA==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, andreas@fatal.se,
 hans.soderlund@realbit.se, Fabio Estevam <festevam@denx.de>,
 stable@vger.kernel.org
In-Reply-To: <20230706221827.1938990-1-festevam@gmail.com>
References: <20230706221827.1938990-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable
 MCTL_MCLK_EN bit for master mode"
Message-Id: <168911047807.530041.5127278576693925983.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 22:21:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: O6W4IOR5OMEAKBJJZBPJ2RTEMT3AH4GD
X-Message-ID-Hash: O6W4IOR5OMEAKBJJZBPJ2RTEMT3AH4GD
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6W4IOR5OMEAKBJJZBPJ2RTEMT3AH4GD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jul 2023 19:18:27 -0300, Fabio Estevam wrote:
> This reverts commit ff87d619ac180444db297f043962a5c325ded47b.
> 
> Andreas reports that on an i.MX8MP-based system where MCLK needs to be
> used as an input, the MCLK pin is actually an output, despite not having
> the 'fsl,sai-mclk-direction-output' property present in the devicetree.
> 
> This is caused by commit ff87d619ac18 ("ASoC: fsl_sai: Enable
> MCTL_MCLK_EN bit for master mode") that sets FSL_SAI_MCTL_MCLK_EN
> unconditionally for imx8mm/8mn/8mp/93, causing the MCLK to always
> be configured as output.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode"
      commit: 86867aca7330e4fbcfa2a117e20b48bbb6c758a9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

