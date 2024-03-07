Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3C87527F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 15:56:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E580FB60;
	Thu,  7 Mar 2024 15:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E580FB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709823415;
	bh=yvWbqsd/c+r0lbhGPO4lqFdi7lTy3J5AN6rJtoM7+iQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ce4Wy3GEyXEOLynHW38y8vekcgpGMf+cBx+VuPc2Rl5li6VE5Naul/m1L5vOYtgNo
	 afJSTBboxHyn6RpJTdfG65d2MUIX2IPbwOYrH/H1HqxIUpfcnPgWSxKc2r5f2l/c48
	 YGuwFSZrrzq7us8/+TL7O4kRcalImNIiYSPZeDn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A25FF805C0; Thu,  7 Mar 2024 15:56:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE5A8F805C4;
	Thu,  7 Mar 2024 15:56:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA528F8024E; Thu,  7 Mar 2024 15:56:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 510BBF80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 15:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510BBF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ttJeT32c
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C34E0CE0B4B;
	Thu,  7 Mar 2024 14:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADBDC433C7;
	Thu,  7 Mar 2024 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709823355;
	bh=yvWbqsd/c+r0lbhGPO4lqFdi7lTy3J5AN6rJtoM7+iQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ttJeT32c3lIc134VYxIOjcK8MhEEqbVKwiDgEsM2Pdaqx3typMN2W1KAhZqRlFiJp
	 Lz8fgI+EqclmMZ5xA+o50omWpXLT0Vt+Qvfjq6DhCeOKXaFbKQY6WFreY7oqchxZo3
	 AfwMs8MnHHI8/bFbrhR5ut2Kv7UOhev/xVysDqaKB2Q7vuAtqnEWRDT4MRUHyP9EPP
	 WkfQqS5MQJQ+GmaBdKflAsy5ad7e0Nwcqzsbt8tyKQUBm5EHgsjZojK9KoR4tUYzmS
	 HpjZCcR3lFw76siSnnbRGxHdjIIIWUQ0qxZS053FXnUbt2XSTvlnIVoFetAZvqyxKx
	 NOLlfxKr2yD0g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240307105353.40067-1-rf@opensource.cirrus.com>
References: <20240307105353.40067-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cirrus: cs_dsp: Initialize debugfs_root to
 invalid
Message-Id: <170982335375.46708.557228863521307529.b4-ty@kernel.org>
Date: Thu, 07 Mar 2024 14:55:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: 3NFRUWPZ5X52BD22CQSTRP7BNYSTO2KH
X-Message-ID-Hash: 3NFRUWPZ5X52BD22CQSTRP7BNYSTO2KH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NFRUWPZ5X52BD22CQSTRP7BNYSTO2KH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Mar 2024 10:53:53 +0000, Richard Fitzgerald wrote:
> Initialize debugfs_root to -ENODEV so that if the client never sets a
> valid debugfs root the debugfs files will not be created.
> 
> A NULL pointer passed to any of the debugfs_create_*() functions means
> "create in the root of debugfs". It doesn't mean "ignore".
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cirrus: cs_dsp: Initialize debugfs_root to invalid
      commit: 66626b15636b5f5cf3d7f6104799f77462748974

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

