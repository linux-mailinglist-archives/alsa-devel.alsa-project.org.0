Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5F7DD101
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 16:55:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAA27822;
	Tue, 31 Oct 2023 16:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAA27822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698767725;
	bh=/lctCLKc4DQ+pUaCuoCLSmifjhDY+R96496ghjfnq+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=llGDtwKjs2fYynmBluHiDGZ2JiYkso2MtJlhTwkYiUd2a7oZIPLjT/3awI8/KSk0U
	 Jh/p3IxIACNoTQb+aa7EbWUOEKkuUFTx+lOsjUGxWj8yF+no1TQz1JDciiWVeSmfn+
	 tjFeV6Y9dzWwl2ISF0quCd0yaZgvkVxdaOtGslmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35C56F80152; Tue, 31 Oct 2023 16:54:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECB4F80152;
	Tue, 31 Oct 2023 16:54:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D185F8016D; Tue, 31 Oct 2023 16:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60075F800FA
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 16:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60075F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aCtap0du
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BD6660F63;
	Tue, 31 Oct 2023 15:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0DCC433C7;
	Tue, 31 Oct 2023 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698767650;
	bh=/lctCLKc4DQ+pUaCuoCLSmifjhDY+R96496ghjfnq+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aCtap0du9KvlyNYTaeV80O7JNpWwAnWpkpHwVtamFuuLZ/ZWEvF8sLtU1LJIrGOgx
	 B2gXWaUsmFFFfQPqLfQ4Ei6D1ZlBIxyZBMgSanKDYFSvugnlZTmOQ/kmb4sTRCrq9B
	 1ST+5ydlPtKs/Y9xtKd0ZnnyO05tEeFufgxe2P4vlb/qWOx2T5Ldx8q/OcPkGtx5/k
	 jf9tV8G/knFFs1sKLOrcYytmEizvmhqRCN4JDKZW6DSI1nFFp+naizr4M1p/e457j+
	 drnyXhjqjpJF0PhX3/1A/v1uBKtK3LXfReydvtxu5XBpsXi4Jp9Q1zfRX7CllvCmxR
	 4oJ8u4iFmpacQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
 mastan.katragadda@amd.com, juan.martinez@amd.com,
 amadeuszx.slawinski@linux.intel.com, dan.carpenter@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231031135949.1064581-1-Syed.SabaKareem@amd.com>
References: <20231031135949.1064581-1-Syed.SabaKareem@amd.com>
Subject: Re: (subset) [PATCH 1/3] ASoC: amd: acp: Fix for indentation issue
Message-Id: <169876764626.58334.5840856999729215089.b4-ty@kernel.org>
Date: Tue, 31 Oct 2023 15:54:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 45IYUBWAEJPBITF2N7KITH56XD6UXR6H
X-Message-ID-Hash: 45IYUBWAEJPBITF2N7KITH56XD6UXR6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45IYUBWAEJPBITF2N7KITH56XD6UXR6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 31 Oct 2023 19:29:32 +0530, Syed Saba Kareem wrote:
> Fix indentation issue reported in acp70_pcm_resume() function.
> 
> Fixes: e84db124cb21 (ASoC: amd: acp: Add pci legacy driver support
> 	for acp7.0 platform")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: amd: acp: fix for i2s mode register field update
      commit: ed2232d49187cebc007ecf4e6374069b11ab3219

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

