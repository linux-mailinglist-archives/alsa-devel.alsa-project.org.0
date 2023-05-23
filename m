Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA0970E605
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 21:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2434783A;
	Tue, 23 May 2023 21:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2434783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684871530;
	bh=UWa2AeMFPzYhFvGJKx4IJB8Xp9f2d2gLz7s4ekBTywI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tP4wEWZ5gKAp6sswWyhBQwabxrC+qleetaSpqg7H+9vS9enPNGK5C42VWmzgGG0Ju
	 w6sXBDhH77dsDGdxPbS1paHys0zBgEr8LAdO2mxet6XoSWMK+EiZdA1xYWg7PjFTqe
	 Oh6sWkkOJLXolo+DOHxsGDQbZ3EpV13kj00T+SP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DCEBF80578; Tue, 23 May 2023 21:50:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EF1F80567;
	Tue, 23 May 2023 21:50:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CA98F8057C; Tue, 23 May 2023 21:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22C5AF80578;
	Tue, 23 May 2023 21:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C5AF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Od6/0Ezq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89B10629C7;
	Tue, 23 May 2023 19:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24A4C433D2;
	Tue, 23 May 2023 19:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684871422;
	bh=UWa2AeMFPzYhFvGJKx4IJB8Xp9f2d2gLz7s4ekBTywI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Od6/0EzqGQz2cgrAkFnoJfDZhlpLvRvrJXUJirKGy8xvBVAKj2KEqQcuNafYW3kFb
	 m8TrWyjlqKWDkdRogJXBpIHnKB3vmhkyCDEfAYpwUkNrvpZmTrACyZKIMqY/eMP4Ci
	 +KdZ41TiIHjbperNgsTXNCzen8sKMMFSmZJ1deK9TIgwE69Z7w1vjHgC7ef4peeUCz
	 UIin1KghHbDjSqjnZ4CTcY7uEZKspGmvRstEWvq2E5IlPkAemPog9AjbqRN+MMS/sp
	 mjqxHLhHbLPe2ICjJYnzuF4gJ2QX+eo1O5IgW1IYYZq/SL42GtXYF6hYFnGisc3VhP
	 ElFhSqCzyntGw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 oder_chiou@realtek.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, vkoul@kernel.org,
 daniel.baluta@nxp.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jarkko.nikula@bitmer.com, Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org
In-Reply-To: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
References: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 0/2] ASoC: do not include runtime_pm.h if not needed
Message-Id: <168487141457.278276.14403684308927400047.b4-ty@kernel.org>
Date: Tue, 23 May 2023 20:50:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 7BBJ2YL2CR2AC3F2KMMDXCQSBNDPTTTX
X-Message-ID-Hash: 7BBJ2YL2CR2AC3F2KMMDXCQSBNDPTTTX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BBJ2YL2CR2AC3F2KMMDXCQSBNDPTTTX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 12:49:01 +0300, Claudiu Beznea wrote:
> Series removes the pm_runtime.h inclusion in files where
> APIs exported though pm_runtime.h are not used. In case
> of files that make use of pm.h which comes form pm_runtime.h
> added patch 2/2.
> 
> Changes were built with allmodconfig on ARM and x86_64 and checked
> all the changed files were built at least once.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: do not include pm_runtime.h if not used
      commit: 2f3092e77f98fcfc0d653846591401bfe2a5232e
[2/2] ASoC: use pm.h instead of runtime_pm.h
      commit: a9392efae9f5de42673cfc1b81ac6fb88bdb26b2

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

