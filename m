Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 818678ADD09
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 07:06:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F33162E;
	Tue, 23 Apr 2024 07:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F33162E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713848803;
	bh=M0Oo2/rDVfDRqkmgxoKkdOS/0wTXJfumeJLtRvmFJgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OLs4IkDkE1fCk2YcCcef2Zz0QrRHLYBQwjfmASei2qWqTg17Ow8e7J4YgGoF73H3k
	 rOaDbP1v4NKlXCI/I397EvIE4BrvTC6uPFCrreC9IctOHH4DWTuZJoAmH0/Q/w9B52
	 Zf8Yo60jSEAbLIJtjg3DnYxjU/bCnck9ITMTCvSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96C98F805AC; Tue, 23 Apr 2024 07:06:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE7CF805A1;
	Tue, 23 Apr 2024 07:06:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE7F9F80423; Tue, 23 Apr 2024 07:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1C25F801C0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 07:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C25F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FbmEcnVF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7DD861069;
	Tue, 23 Apr 2024 05:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FBAC116B1;
	Tue, 23 Apr 2024 05:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713848648;
	bh=M0Oo2/rDVfDRqkmgxoKkdOS/0wTXJfumeJLtRvmFJgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FbmEcnVFYX/wRd+3iJS9w/ncO82zw1Y3QSKTqKcnSYKYkRRwtDnJtXzkdfvPwkwut
	 DWl+78pKKbZ4ORHGucJeyjMRBv4WhsrErs8aRMNmpZvoCEnWDSZqop3lC2evggPicv
	 9yy8i2SBaWT5dg425a9gef4qt4dLrC01knMfrTa+DybCqv9ecwL55HcQMr95yUi0lC
	 ghkVmBlPtipFRD5TlL0eXs1cTlz+OVkcVpL2P7NwtdEb18UWr5yGN7ocitoTyxqYrl
	 fhNEleWsitvFWfM7MJSPDjTm3tTMX3CCtxyszLaH8k3X/w9qZxsG8s4n09hHM2tq02
	 hOSlZauRzN/IQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20240422103211.236063-1-rf@opensource.cirrus.com>
References: <20240422103211.236063-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Avoid static analysis warning of
 uninitialised variable
Message-Id: <171384864615.1769239.12719650496450465908.b4-ty@kernel.org>
Date: Tue, 23 Apr 2024 14:04:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: G3A3SI6S53QHIEAFX5DVTFI742BIHQAP
X-Message-ID-Hash: G3A3SI6S53QHIEAFX5DVTFI742BIHQAP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3A3SI6S53QHIEAFX5DVTFI742BIHQAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Apr 2024 11:32:11 +0100, Richard Fitzgerald wrote:
> Static checkers complain that the silicon_uid variable passed by
> pointer to cs35l56_read_silicon_uid() could later be used
> uninitialised when calling cs_amp_get_efi_calibration_data().
> 
> cs35l56_read_silicon_uid() must have succeeded to call
> cs_amp_get_efi_calibration_data() and that would have populated the
> variable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Avoid static analysis warning of uninitialised variable
      commit: f2602fba4723e408380eb9a56e921d36a1ae21f8

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

