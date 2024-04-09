Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C889E623
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 01:35:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D1E2BB6;
	Wed, 10 Apr 2024 01:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D1E2BB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712705753;
	bh=EHUY8OohkhvETd/zbs6k/hjYDaaHAvq8ARw7exxy4kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SMO9l6z4qyj9TkU4RFui3d/vbhLDCFZR5vqsKYIlu+fYvV1d02kFU2woQoYiz7Hrk
	 EWGmDOhtTirMFSzgX5CCh8xp+AN8zBksi0IYjn1+cs2XnAOTeoSqtR587C2vwZSuXs
	 B13yLds2jYCetzowl7jQsl087CDnBNUCEeuVXOXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E08A5F805AC; Wed, 10 Apr 2024 01:35:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CF2F80579;
	Wed, 10 Apr 2024 01:35:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F393F80423; Wed, 10 Apr 2024 01:34:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33805F800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 01:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33805F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=inKl7M5c
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92BEE619A5;
	Tue,  9 Apr 2024 23:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F9BC433C7;
	Tue,  9 Apr 2024 23:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712705646;
	bh=EHUY8OohkhvETd/zbs6k/hjYDaaHAvq8ARw7exxy4kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=inKl7M5cC/hJXwHuKxuCIq+dO0q0yHjMdFH0yGnAN/XWT8eXHQNt6vbxbzfStqxMV
	 0R01qb7pcoiVLwAoroGjjdK2yGi8JkQp0BpBI3ekqEZJ+Z6Nf6H44QxjU6HNF923bU
	 izYYmenSfqW6b4S07q8lAHmd6t3+pVvI6TtNTXSR3qV9c0iuMupg0QgRCvsed4fvI4
	 lNQfT5kkaok5oCFuVv3k0YgOkmJP9g+a7fLEzQlsZvlIeeZ6bylQD17sVC2p36iqBa
	 JYmZ/vkRc4+808T0U4C+pFf+8t8njndsaxLK48CfNZQCM4yRgwO3VqIB6Q9aHvVMJH
	 UsdRF6NZVAdxA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240408101803.43183-1-rf@opensource.cirrus.com>
References: <20240408101803.43183-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Fixes to handling of ASP1 config
 registers
Message-Id: <171270564469.199334.16192675337091991799.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 00:34:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: SVY4ZNCUCLMLQRAGVG24YZQ7DOLFZAFJ
X-Message-ID-Hash: SVY4ZNCUCLMLQRAGVG24YZQ7DOLFZAFJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVY4ZNCUCLMLQRAGVG24YZQ7DOLFZAFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Apr 2024 11:17:59 +0100, Richard Fitzgerald wrote:
> This chain fixes some problems with some previous patches for handling
> the ASP1 config registers. The root of the problem is that the ownership
> of these registers can be either with the firmware or the driver, and that
> the chip has to be soft-reset after downloading the firmware.
> 
> This chain adds and uses a regmap_read_bypassed() function so that the
> driver can leave the regmap in cache-only until the chip has rebooted,
> but still poll a register to detect when the chip has rebooted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] regmap: Add regmap_read_bypassed()
      commit: 70ee853eec5693fefd8348a2b049d9cb83362e58
[2/4] ALSA: hda: cs35l56: Exit cache-only after cs35l56_wait_for_firmware_boot()
      commit: 73580ec607dfe125b140ed30c7c0a074db78c558
[3/4] ASoC: cs35l56: Fix unintended bus access while resetting amp
      commit: d4884fd48a44f3d7f0d4d7399b663b69c000233d
[4/4] ASoC: cs35l56: Prevent overwriting firmware ASP config
      commit: dfd2ffb373999630a14d7ff614440f1c2fcc704c

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

