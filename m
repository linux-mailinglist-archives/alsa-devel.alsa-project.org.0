Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DA7B44A1
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Oct 2023 01:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6439EDF3;
	Sun,  1 Oct 2023 01:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6439EDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696117353;
	bh=V+O6eQuM5B0HdTm47CD/9waTIHMwPF1LS6QbLhwkCfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DnEYkPMctkqGmMRVuGukjY/iNR/os7seqygHOHWHE/5y/2RbbJJ++EpQBuyW+6kE/
	 z8ef71nZj7IWH68NSRinpYxrrcam34NP2t/U/0LGnibEQ6uKfdDoywa1FCcY2JtS2v
	 94UtylfzlzGopg09kpIaWjALS+SiXK0TpRfVoV7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9F0FF80130; Sun,  1 Oct 2023 01:41:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B088BF802E8;
	Sun,  1 Oct 2023 01:41:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6FDAF80310; Sun,  1 Oct 2023 01:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54047F80130
	for <alsa-devel@alsa-project.org>; Sun,  1 Oct 2023 01:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54047F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X1Oej8zV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 63C90B80815;
	Sat, 30 Sep 2023 23:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5EAC433C7;
	Sat, 30 Sep 2023 23:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696117258;
	bh=V+O6eQuM5B0HdTm47CD/9waTIHMwPF1LS6QbLhwkCfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X1Oej8zVNwS/Rt/ZdLXtCo5GuQMb5zZU0WYV9RJZcWxa5l1A1oQuDpUlyqv7yQL4m
	 2qTNpJvDEpXhCQtiwomyB1GX2ZIH+FMBwjJGO21l79Q1y2NV6JIUbijmS9d/a2Uu2B
	 YrA4IdJMq5YQuxkM7h0pfSfVbtkTpvccr7zmv6WScuW8vWXcnAEqVP0s8EXWoyDuGq
	 J9LuJi2nRTbRuZyc2opdrS6adISVap6Uj8M29+wxobzM+3faw+CQ8mjSQ4siHugV/z
	 kP02wTp2jw1Oex9PoC+hQH2IBsVDuKlzrPzPOic+64EdmKdi0ULuMq8c0zepVv7t3f
	 /CRSAMBvz+kAA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230929103243.705433-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929103243.705433-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: core: Print component name when printing log
Message-Id: <169611725680.2917199.9476174586360220671.b4-ty@kernel.org>
Date: Sun, 01 Oct 2023 01:40:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: Q332UOM5QTAFM7NZS35FSOGZJ6FWMC35
X-Message-ID-Hash: Q332UOM5QTAFM7NZS35FSOGZJ6FWMC35
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q332UOM5QTAFM7NZS35FSOGZJ6FWMC35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Sep 2023 12:32:42 +0200, Amadeusz Sławiński wrote:
> When printing log related to component it is useful to know, to which
> component it applies to.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: core: Print component name when printing log
      commit: e80f238d2bc0c0f27dc52ac824ca80b938a43ace
[2/2] ASoC: core: Do not call link_exit() on uninitialized rtd objects
      commit: dd9f9cc1e6b9391140afa5cf27bb47c9e2a08d02

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

