Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3F16E271D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 17:34:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C60DE76;
	Fri, 14 Apr 2023 17:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C60DE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681486474;
	bh=e+Wy9ti15jRc0cbaveWkdvrWp6kJ9Go/XAYuu5eqn7s=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dihJ6z9L3epMw5fyb7rJgdR+RPeHdTvnrYYDCGxpbMSetuX86Pqog5CCjd5R4W35t
	 5NPNPcqtYuhBpKtXmNFrC1J6rOVmc2qvgApMXXdR+rgUvDhaVCsRk1SpTssEkHuhff
	 f6hmGwoQPJE62lev34wTdzJL/cYw/Fb371GH6S84=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6496EF8025E;
	Fri, 14 Apr 2023 17:33:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90AE8F8032B; Fri, 14 Apr 2023 17:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14FF0F8023A
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 17:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14FF0F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IsWm1Lgh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7A576023E;
	Fri, 14 Apr 2023 15:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C45C433EF;
	Fri, 14 Apr 2023 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681486413;
	bh=e+Wy9ti15jRc0cbaveWkdvrWp6kJ9Go/XAYuu5eqn7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IsWm1LghhF33CdqQJRCRtirPieDHjl+yoiRJ5DiEPejt9nY/ZAcMmwKDKtBis/H9f
	 N1tqJY8JhK6dHk2DCBOrRzRJk3EBy3QLiuvxy2uRjZtRub5hkijsvLS+Umc788iqMv
	 BqITgCNWt6rhYQ1T2SCklRj61Js+wTFmtewD4OfQUBMA3dNvgFktbrhPFn7h6LZPD/
	 +bOfwi5332Kax82O28snhXkasnAaZ+AX8bfYjDQfrNO+2EGzKJfuzUIFq6BuzFdZxV
	 N4HSoGGtfnkSDFgCYgXh9T4+KHl3bNleM2/LzDmrWcmkOj5F/UhdyyW5+GeMF3v1Ap
	 hkh4yMRAiZbEA==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20230414103941.39566-1-CTLIN0@nuvoton.com>
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for
 input path
Message-Id: <168148641127.2185284.12632656259594714453.b4-ty@kernel.org>
Date: Fri, 14 Apr 2023 16:33:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: PK25GKG3R5ZEFTZS6HH7CZREC6O7ASPF
X-Message-ID-Hash: PK25GKG3R5ZEFTZS6HH7CZREC6O7ASPF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, SJLIN0@nuvoton.com, WTLI@nuvoton.com,
 ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PK25GKG3R5ZEFTZS6HH7CZREC6O7ASPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Apr 2023 18:39:42 +0800, David Lin wrote:
> Change the original fixed delay to the assignment from property. It will make
> more flexible to different platforms for avoiding pop noise at the beginning
> of recording.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: nau8825: Add delay control for input path
      commit: c26c5921e1a770e6c092c4d25dea19052bdfddab
[2/2] ASoC: nau8825: Add delay control for input path
      commit: fc0b096c92918c2ba4d76411ea763fdeb2ef6b0d

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

