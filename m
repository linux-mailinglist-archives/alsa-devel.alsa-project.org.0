Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FCC772E1D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 20:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852AF823;
	Mon,  7 Aug 2023 20:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852AF823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691433957;
	bh=hmUDDMPneWyGPqzX8N2O3Gbisx+EhLJaoG/DxdAw8J4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IKPPPFNVELkboco/7g8WafotLVsZIKUJ5fjMRl4wWoSBsQ9zOSaz+xiMAQEU+5Gw3
	 RMhntLebAEBFD+43AYvxp+SjfILoUyuG+RlOuS7Kp61O2U6TWzxDZOWU5F4ZRkfRNr
	 coC3ek0tlfhiCV6AsmJF0PuNZp3h70TSIUiVVNTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA850F8016A; Mon,  7 Aug 2023 20:45:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69246F8016B;
	Mon,  7 Aug 2023 20:45:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A3A0F8016D; Mon,  7 Aug 2023 20:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3A11F8016A
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 20:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A11F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YXtooxKz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D7F4620F8;
	Mon,  7 Aug 2023 18:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71530C433C7;
	Mon,  7 Aug 2023 18:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691433889;
	bh=hmUDDMPneWyGPqzX8N2O3Gbisx+EhLJaoG/DxdAw8J4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YXtooxKzd5RLFXZdEXL+f2Fj73s2mNQTfK4ARGqPteThz5xW8f/2OqfIDbo8X/PnI
	 9FXyN2vABkChGtTUSqDXuLvS3cp48kkNmen5gA6f0I9jFi7Gcq6ToBaTQLThcrunFE
	 5ZBoJTzhd6LEWqgqU/cLhoeTBrWTDf6blG9QTv402tVJ8R7JvPkj/dIyKRSDBd9inu
	 oj3YcVv+88ggWdEvN+uzwlM2TurAoKuG/SXG7QAeZJ6GKrHoJXuimOk7HA+YP1e+S0
	 r684ts5CUjEmczd7copzVkVqlCubnL3C4R/kThe1Tco1LTSkWwLQ64GYm1Mw/wEhCd
	 QzwbGc0FWJasQ==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, Zhang Shurong <zhang_shurong@foxmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_A560D01E3E0A00A85A12F137E4B5205B3508@qq.com>
References: <tencent_A560D01E3E0A00A85A12F137E4B5205B3508@qq.com>
Subject: Re: [PATCH v2] ASoC: rt5665: add missed regulator_bulk_disable
Message-Id: <169143388818.204874.3565118222220844695.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 19:44:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: VVUQUYVZ7YNQWT6YMTS644GBXECWNEHM
X-Message-ID-Hash: VVUQUYVZ7YNQWT6YMTS644GBXECWNEHM
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 01 Aug 2023 23:59:11 +0800, Zhang Shurong wrote:
> The driver forgets to call regulator_bulk_disable()
> 
> Add the missed call to fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5665: add missed regulator_bulk_disable
      commit: c163108e706909570f8aa9aa5bcf6806e2b4c98c

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

