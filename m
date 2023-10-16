Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059A7CADAB
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 17:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B787B850;
	Mon, 16 Oct 2023 17:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B787B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697470616;
	bh=7koD95DDkpIwfdyAXZydSj9Rxm4VUC9FMp2ObEU0RgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BEdXWLEEg1KYYTp/PZLPheFoDdiq+Lfs5U6qxW6y9GYiHM9LslC04J2qdrR8fk15/
	 Gv+f/Xg0WtZQ1vArfPubrJrr6x7wUqhFkCNRn3Xpc/NAX91X0I3d6OL+2mDYlx7TQJ
	 ZziQ1xtl/O1WBtCgQPvFkGsNv2XSIaSkc+ZWoBKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85AB7F8019B; Mon, 16 Oct 2023 17:36:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22EE6F8024E;
	Mon, 16 Oct 2023 17:36:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4340F8025F; Mon, 16 Oct 2023 17:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3680DF8027B
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 17:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3680DF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q0k7nQcm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92CF5603E0;
	Mon, 16 Oct 2023 15:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D654C433C7;
	Mon, 16 Oct 2023 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697470407;
	bh=7koD95DDkpIwfdyAXZydSj9Rxm4VUC9FMp2ObEU0RgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q0k7nQcm3gpPbKIneyWPzb718LR97fwJrFTvu2TydtX15evphE4vIDKExSg/wjEep
	 4k2hxKprznoSZtQkdDZWPeyn1Z9XlYIbwi/o8olJUNeKdQFynWareXQWHJymhqlqUX
	 n93DyuubDvd5d0t/DKKgl7TXDIGk2DljhIVIYHcsa+UaPo2gEoplHWSF0uB8IpffQZ
	 muR3VUhOJBbMKulP/0BwtlwvNIMFPCxRpWrF5gWqK6iHTVM8/twPGxPRPCXspvnsvS
	 JxC/tB7tgTjJ1gLQ1AEG9catL8wI7+J7CRTKjcDgJv8Lw7iEUwhmEtHoalYZIrFE08
	 yCszenbKqPCUQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20231012191315.145411-1-pierre-louis.bossart@linux.intel.com>
References: <20231012191315.145411-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: codecs: rt715*: update misleading error log
Message-Id: <169747040590.42352.17528788205782129111.b4-ty@kernel.org>
Date: Mon, 16 Oct 2023 16:33:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: JFJAUIPRRKRIDU6SUAOKJFUINJ7VQ4RX
X-Message-ID-Hash: JFJAUIPRRKRIDU6SUAOKJFUINJ7VQ4RX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFJAUIPRRKRIDU6SUAOKJFUINJ7VQ4RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Oct 2023 15:13:13 -0400, Pierre-Louis Bossart wrote:
> Improve two errors logs which report bad information.
> 
> Bard Liao (2):
>   ASoC: rt715-sdca: reorder the argument in error log
>   ASoC: rt715: reorder the argument in error log
> 
> sound/soc/codecs/rt715-sdca.c | 4 ++--
>  sound/soc/codecs/rt715.c      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt715-sdca: reorder the argument in error log
      commit: cf77250a679556f39bc3247a68bd75ca399f59d6
[2/2] ASoC: rt715: reorder the argument in error log
      commit: 078d3a4b120f82d57778466de62929bb8824b664

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

