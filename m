Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90416805903
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 16:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E96E80;
	Tue,  5 Dec 2023 16:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E96E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701790910;
	bh=vjrlfMihEwbG4vZyrXSqd2uLeidXw1bqUTeh6X6XMdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=of1r7OAVTYtyEtl2V4muWa/4sSl5vcycXJ+yVY7EgAVmI6GqKvYSrAFggwFnAKG+L
	 2DY6VR5hjQJRtOv+/hUzCvMWaDTwNyTPSpSK/NtzZLVyIhAjoHeV7hVdpuHYEKJ0SQ
	 BvY+VmIog7eTQI0Q7ZD7szkh65mEXnl8orcgR8Mg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3D49F8057B; Tue,  5 Dec 2023 16:41:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ABA3F80571;
	Tue,  5 Dec 2023 16:41:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 153A4F8024E; Tue,  5 Dec 2023 16:41:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 545C0F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 16:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 545C0F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gk4Blx2p
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9AAC617EB;
	Tue,  5 Dec 2023 15:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24464C433C7;
	Tue,  5 Dec 2023 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701790876;
	bh=vjrlfMihEwbG4vZyrXSqd2uLeidXw1bqUTeh6X6XMdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gk4Blx2pzponzHlpb6XMYi385hWWRglOstEEcWEC7P5Vy9bkm+E0bb8MbxMv7EkgY
	 UvZW7nRXYh7/ELJlu5aFBKhXv8HQ8lad7Rh/YHSCUGEb5lnAZpa7lePSvlLSy0Nts7
	 M6v6ONHiwr5ZK86lP+oAr4mfBMZAJxBHGmBVfWyHd3JMj7/9PizhkvPKCTuSOmFYCh
	 h04zydOhe7OAfpbG4sO57yml8m6wuK60lkzht9dZr414oSArn3IGoMfWN0HsR6FUDO
	 hGpKXGk5qOCycNn0dXTC69W0fnXtk6bLtDG7/AuaEKuTgLg9x9bmpIrvDN7ilZe9CC
	 0gy/oaJy+2LIQ==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231205101740.2820813-1-colin.i.king@gmail.com>
References: <20231205101740.2820813-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: cs4271: Fix spelling mistake "retrieveing"
 -> "retrieving"
Message-Id: <170179087386.845405.2039286765455444557.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 15:41:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: UEAWXRRNAL6NVPA4XODWLBAUZOHWKRXA
X-Message-ID-Hash: UEAWXRRNAL6NVPA4XODWLBAUZOHWKRXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEAWXRRNAL6NVPA4XODWLBAUZOHWKRXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Dec 2023 10:17:40 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe error message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs4271: Fix spelling mistake "retrieveing" -> "retrieving"
      commit: 0be9595d8a1170474867b8ee2caf14394db45d8b

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

