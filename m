Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0413798E1BD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 19:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7F91F8;
	Wed,  2 Oct 2024 19:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7F91F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727890749;
	bh=PJvobQ+6pW0tnPhodEWxo0BjiswVOyCa1be3irMLxL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rxBXGNRMneJqC0Ahd2kGS+foMhnduyPYC3a2ZAmbiPGX+hTbNevyUbCodh7Y1NN8P
	 NKULV2niD42rvrRBMHNGKSz316ANaDbu699lJEK8a5siP0+cAdIUX5L0qtklixMXqz
	 EC0L9G4uNTjUR0qM5v210r9hF8zmas+Pjf2VEUZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1800F80601; Wed,  2 Oct 2024 19:38:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF90AF805FE;
	Wed,  2 Oct 2024 19:38:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CFB2F80517; Wed,  2 Oct 2024 19:38:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AE93F80104
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 19:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE93F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pkvuwkyB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 362D5A427A5;
	Wed,  2 Oct 2024 17:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510A4C4CEC2;
	Wed,  2 Oct 2024 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727890680;
	bh=PJvobQ+6pW0tnPhodEWxo0BjiswVOyCa1be3irMLxL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pkvuwkyBuJCFd8uQgXhuDSGlSZeYSm4GGo5umjQNRtfiAg1ZEHX0whAaHOsbGy5SD
	 oXyXhwOGa6yD2y2cY6mujNlr9c8Xyhcm/HjDsIkzjU4zAB3Ck45flLbtBPwrgIhXJk
	 19Wz6Z9sdgm778Zf6jRyn2Br9MXPtgYOMcp5zYs53LnKwib/Nj0KTMkaylpQoyh76U
	 K+eKP/qxW3hLARWchVORnObHdQYYgmbG5OeKLlFf9bG/sr1QyT8vl6DZJtxnY+BdoX
	 vPbCiXstkzYNx8jT1QolStK3bKpmzsIy5+uxgcAqK5ST4KHrNp7nLOC4SUZzR3BuAF
	 RI3vt4WSHqFQA==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, ckeepax@opensource.cirrus.com,
 Charles Han <hanchunchao@inspur.com>
Cc: alsa-devel@alsa-project.org, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20240925080030.11262-1-hanchunchao@inspur.com>
References: <20240925080030.11262-1-hanchunchao@inspur.com>
Subject: Re: [PATCH] ASoC: intel: sof_sdw: Add check devm_kasprintf()
 returned value
Message-Id: <172789067806.163279.17671589406788007022.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 18:37:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
Message-ID-Hash: ET3Z66IHRQB72SYLEZHLJL5UCINIZHRU
X-Message-ID-Hash: ET3Z66IHRQB72SYLEZHLJL5UCINIZHRU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ET3Z66IHRQB72SYLEZHLJL5UCINIZHRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Sep 2024 16:00:30 +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure but this
> returned value is not checked.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: sof_sdw: Add check devm_kasprintf() returned value
      commit: 2c0b2b484b164072ba6cf52af1bde85158fc75d4

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

