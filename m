Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C780957A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:37:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 568E8839;
	Thu,  7 Dec 2023 23:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 568E8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988640;
	bh=NT7BHAqFBOhaRtrY/szkX/r9R8b3Zw9S8V4qsNXM+rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gxY+eLwrLrgc6Mzr/b3pIoHUeMFFT5iNNKgvG0IAK8/FeRG1Sn1OB/ih9byitKL9e
	 G5KZU9/AjYu6xMhZQA8sD/a5ejyQDMki6B1+BTyfADN1rNLOxXWfy8Bl06c16sQOCW
	 gm86JRerGkAi3nqjUdORAhIMU+SYrDZJR6Xc+21k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8912F800E4; Thu,  7 Dec 2023 23:36:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC06CF8057F;
	Thu,  7 Dec 2023 23:36:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 717EDF80166; Thu,  7 Dec 2023 23:36:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3FBAF805EE
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3FBAF805EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fM7G8omP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04321620CD;
	Thu,  7 Dec 2023 22:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8BDC433CA;
	Thu,  7 Dec 2023 22:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701988505;
	bh=NT7BHAqFBOhaRtrY/szkX/r9R8b3Zw9S8V4qsNXM+rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fM7G8omPRZ7ZWXJv3Rg5R2B74Wc7o7Kd0E7svQfW9jKfF2c9SyQMkDDpP2fwOg2PS
	 TKO6qZXBPmoGXWGrJAefouIWYDB8ffo870ddOmQLfgZp38GIQ2vwXuC+0oI7iBOh5A
	 Dmzh3SXRzNyYbWZvBRERx2CaEge5kWXD5un3ta2VoAnw3dOgT54u79sJmF7LZRjAi4
	 wAyE+jsMQiEYPkN4VoQz3jAoz/AqgbXL0XVNVTtIB0JtpatC8cCnYqQ03ZaxLmbyKD
	 a6Mknh/f6Fz9KzrfxlGNr9kf9sZWMTVB1KDV+sBR/xTblGk3eIJE8dITgwEoK8w1zX
	 AsY+ipMKgV9Qw==
From: Mark Brown <broonie@kernel.org>
To: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sbinding@opensource.cirrus.com, lee@kernel.org, james.schulman@cirrus.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
 tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com,
 amitrkcian2002@gmail.com
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
Subject: Re: (subset) [PATCH v11 00/10] spi: Add support for
 stacked/parallel memories
Message-Id: <170198850030.340565.15742297562436442635.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 22:35:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: E2MKHEIWUEIGIQMF3Z7JSZJFRVG6P72N
X-Message-ID-Hash: E2MKHEIWUEIGIQMF3Z7JSZJFRVG6P72N
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2MKHEIWUEIGIQMF3Z7JSZJFRVG6P72N/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 25 Nov 2023 14:51:27 +0530, Amit Kumar Mahapatra wrote:
> This patch series updated the spi-nor, spi core and the AMD-Xilinx GQSPI
> driver to add stacked and parallel memories support.
> 
> The first nine patches
> https://lore.kernel.org/all/20230119185342.2093323-1-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-2-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-3-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-4-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-5-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-6-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-7-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-8-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-9-amit.kumar-mahapatra@amd.com/
> of the previous series got applied to
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
> for-next But the rest of the patches in the series did not get applied as
> failure was reported for spi driver with GPIO CS, so send the remaining
> patches in the series after rebasing it on top of for-next branch and
> fixing the issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[02/10] ALSA: hda/cs35l56: Use set/get APIs to access spi->chip_select
        commit: f05e2f61fe88092e0d341ea27644a84e3386358d
[03/10] spi: Add multi-cs memories support in SPI core
        commit: 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b

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

