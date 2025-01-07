Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388DA04499
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2025 16:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1237760383;
	Tue,  7 Jan 2025 16:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1237760383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736263985;
	bh=/0+QS6NTsRX/IygMfwY5jtbYiTI2pYu6dSVDhDfOj74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GXERmh2AZRrTO2o2cUFmlv3xytNF0Woth+1u9y1eKqWHXmkWpiS7cRMmbpQ8Ro0Vk
	 kK0J2ro1WIlYLISSuD5QzrtERkto6w11+/BdvGZKA5DIuEKUobRA2e85vmZhJQD4bO
	 sC3uQr720+hoTV5gQp7gY3ZSiPon4tMoGOOyDiYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB21DF805EA; Tue,  7 Jan 2025 16:32:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A75AF805E5;
	Tue,  7 Jan 2025 16:32:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70303F802DB; Tue,  7 Jan 2025 16:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0D85F800F3
	for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2025 16:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D85F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O1dS/RLG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 592F05C51AB;
	Tue,  7 Jan 2025 15:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56BEC4CED6;
	Tue,  7 Jan 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263924;
	bh=/0+QS6NTsRX/IygMfwY5jtbYiTI2pYu6dSVDhDfOj74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O1dS/RLGi91wgrGohwLo1tvVFRP7zLANTwQkUpBli0Z6Q/Rh7b0gp0dsA+1qXRYen
	 iieB7FCEEIdHfNjG2dxcmtdmWGItosU9sedRvItUY/L0YHNdNxDfnNTStov51lcxf9
	 tHyxIGI66nAbFqOD47Cb2y56rYSlSuuvyl8o9S/yguZs8PCqobWZT9qoBR+bu+f0SN
	 Fnb+sxMdddOf16uIoOfMfvq/PI8imv7qZsXZ3Ww6Bf6Cd/1eQhGZQ8dRKVM5Tfc+RZ
	 Gr51DWg6ypO3E9HfU9yMDrU/AymnY/MaSMFY/MwAFluxm8o8pZPYAiXYRhmFMOHpjM
	 RajZIRMYc14dg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, tiwai@suse.de, baojun.xu@ti.com,
 Baojun.Xu@fpt.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20241227074909.1974-1-shenghao-ding@ti.com>
References: <20241227074909.1974-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Fix occasional calibration failture
Message-Id: <173626392241.92253.9803996324620777407.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 15:32:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: 3ROVY4IJIRPCPZXUEB76TUF5OWRCI5EA
X-Message-ID-Hash: 3ROVY4IJIRPCPZXUEB76TUF5OWRCI5EA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ROVY4IJIRPCPZXUEB76TUF5OWRCI5EA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Dec 2024 15:49:09 +0800, Shenghao Ding wrote:
> The root cause is that TAS2781 internal register is not unlocked
> before writing data into TAS2781_PRM_TEST_57_REG.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix occasional calibration failture
      commit: cf86e0ae60a225e2c7921ced755e922da9012bea

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

