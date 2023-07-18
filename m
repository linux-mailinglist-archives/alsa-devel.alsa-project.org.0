Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC515758862
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 00:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A4E1D9;
	Wed, 19 Jul 2023 00:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A4E1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689719113;
	bh=TVSaMHy6xqrGvah1BP5eyrd/c06CocVOjTmlLYNQoU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FtiagoHes+LFsmnycqlu+5gkzpe98vYS+TlfOUh+F4kNSfivhuPNdYUVinyGNppr1
	 kngpd8bA29YM9sLcOXwPGVLojKosQdrOtQBF5jxrvegDWZcux89S6fghmlLvylu8uG
	 YDcmCzzSPtkSeYrO24PrkQq5xVv6A7I7m+9jhkmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59D4CF800D2; Wed, 19 Jul 2023 00:23:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE875F8032D;
	Wed, 19 Jul 2023 00:23:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EDF7F8047D; Wed, 19 Jul 2023 00:23:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E416F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 00:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E416F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MIWWC72R
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 76F5260CE8;
	Tue, 18 Jul 2023 22:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F29C433C8;
	Tue, 18 Jul 2023 22:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689719024;
	bh=TVSaMHy6xqrGvah1BP5eyrd/c06CocVOjTmlLYNQoU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MIWWC72RM+yQhMhQw9zkYVYXzn5160svXESkw6jq4k+WW5F9LL2u/IysPVWlQk6AF
	 V3rI0cngCPbWxhl+/snMBW5QJ2AU+FawiXX6Bvda89jEQG0qm7Ai01Tj8hKAwReOJY
	 vrbE36AblheOnTurtf22nWNrKzqso8GfasUSIvd24ChxAN/fxskjJTeSnZtrZwiwWb
	 qsFhAE6f4nh8UKlvIJiktdan1oxt+4xGNmtYcg09MUVZohlPbiXRECC9I8bmaQokWl
	 iLHcEgUxluwCtt5G4g3ptxDChPRDAwp+P48i7oZHKYF4xFaqhnuKv+NWVV6SFaJqeo
	 ayIYRnffamPRA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230718144625.39634-1-rf@opensource.cirrus.com>
References: <20230718144625.39634-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Patch soft registers to defaults
Message-Id: <168971902372.127447.16837220353075580193.b4-ty@kernel.org>
Date: Tue, 18 Jul 2023 23:23:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: FT7274YWGCU2DDQSK5XIO6MRQVYAGNKY
X-Message-ID-Hash: FT7274YWGCU2DDQSK5XIO6MRQVYAGNKY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FT7274YWGCU2DDQSK5XIO6MRQVYAGNKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 15:46:25 +0100, Richard Fitzgerald wrote:
> The soft (firmware) registers for volume/mute/posture are not reset by
> a chip soft-reset, so use a regmap patch to set them to defaults.
> 
> cs35l56_reread_firmware_registers() has been removed. Its intent was to
> use whatever the firmware set as a default. But the driver now patches the
> defaults to the registers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Patch soft registers to defaults
      commit: df4167d658d45946677f91d84e9d40570c875cb8

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

