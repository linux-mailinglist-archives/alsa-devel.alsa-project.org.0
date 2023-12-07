Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB38089B5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 15:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7B1DE5;
	Thu,  7 Dec 2023 15:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7B1DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701957636;
	bh=xRjuwAzrqlcjnOGRq1pqq7Lp1FZjkiM2NMq1l7NLBm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W6cfH6qTmtQKCUtGrm+iIM1N9rf4Y2pxEhju8BZ6icK3IBeBopZIKBdSBiQU6DgOf
	 /m+PmANbL9098NNvqfWiAnrg2Gr3qbAASqZYfZ9GKIOEvdGDcEsVYkIXPMAj/TUN13
	 uPqJ8xGEw1WjV9ba+rZQf/Isle3/ksLZeosCUmbc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B175FF8057D; Thu,  7 Dec 2023 14:59:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A30F80568;
	Thu,  7 Dec 2023 14:59:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C6CF80557; Thu,  7 Dec 2023 14:59:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ACCB2F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 14:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACCB2F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XltynE0Y
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14C8A62104;
	Thu,  7 Dec 2023 13:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E126C433C7;
	Thu,  7 Dec 2023 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701957587;
	bh=xRjuwAzrqlcjnOGRq1pqq7Lp1FZjkiM2NMq1l7NLBm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XltynE0Yrz8pP2zYajfeEZwz3kHRMBES4I4yU8u67sXIEaHd6B94aLUYmaDDdrscG
	 7hLXQULlN5te4xsCqnggyiqqwcaoWAIah+OH1iDq7pqMJADbocujtq70fHZQwUwVDi
	 XdBGBfg0JTs9KX/p0Y9rBLhRZOKxdXnENHNAFua9vnohq8T/2UfTtdF74U1QcY4ZfB
	 1TbMIOyONzJxOGG2iiEJAsWKjfRSIfBYZviyjkTk8OxnwV/6yfdvYlwwjp4tCouODE
	 2YF4mmVnkZJlgc3OJLrd5gGG2GWS9ly/jYabJgrG/CNLTiYxMqS0zypZzwrizvdNe1
	 gASijK/MTBhmw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20231206160318.1255034-2-rriveram@opensource.cirrus.com>
References: <20231206160318.1255034-1-rriveram@opensource.cirrus.com>
 <20231206160318.1255034-2-rriveram@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: cs35l45: Use modern pm_ops
Message-Id: <170195758517.40629.8262800996139784314.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 13:59:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: YC2Y5IXUIQYCUTFR2HT4QK5TRTPNXDRC
X-Message-ID-Hash: YC2Y5IXUIQYCUTFR2HT4QK5TRTPNXDRC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YC2Y5IXUIQYCUTFR2HT4QK5TRTPNXDRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Dec 2023 10:03:16 -0600, Ricardo Rivera-Matos wrote:
> Make use of the recently introduced EXPORT_GPL_DEV_PM_OPS() macro, to
> conditionally export the runtime/system PM functions.
> 
> Replace the old SET_{RUNTIME,SYSTEM_SLEEP,NOIRQ_SYSTEM_SLEEP}_PM_OPS()
> helpers with their modern alternatives and get rid of the now
> unnecessary '__maybe_unused' annotations on all PM functions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs35l45: Use modern pm_ops
      commit: 12e102b1bd22ee00361559d57a5876445bcb2407
[2/3] ASoC: cs35l45: Prevent IRQ handling when suspending/resuming
      commit: c3c8b088949b9ccb88da2f84d3c3cc06580a6a43
[3/3] ASoC: cs35l45: Prevents spinning during runtime suspend
      commit: a0ffa8115e1ea9786b03edc3f431d2f4ef3e7a2e

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

