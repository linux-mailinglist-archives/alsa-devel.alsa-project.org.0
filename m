Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F578A2228
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 01:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D97542C0C;
	Fri, 12 Apr 2024 01:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D97542C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712877408;
	bh=3PvQYrDxu5lunns0NauurjuD19jwN9atvmFEz3SB8N0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jomGwqesp2XYQJ47I6jHJ+dMWHzWypoyZtxaV8tyJO9Opf1Ow4pGVayguKaNiP2dm
	 YtwzK3lR8tDCM9X3OU8/K49bjF4HbyObnF2bydbsz/80xa/W36WrUFtJuQhfcZWfxu
	 7Jj7+7VN0d91ysgKZdwO4dFguJivobZev4cmlH9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CCABF805A8; Fri, 12 Apr 2024 01:16:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F83F8058C;
	Fri, 12 Apr 2024 01:16:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3264F800C9; Fri, 12 Apr 2024 01:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADC74F800C9
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC74F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iGRR/YtR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9696462178;
	Thu, 11 Apr 2024 22:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8852C072AA;
	Thu, 11 Apr 2024 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712876269;
	bh=3PvQYrDxu5lunns0NauurjuD19jwN9atvmFEz3SB8N0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iGRR/YtR1dsmPrG/414PoViHG8v9hGs7N/dQSej+xwSMIDqJ1Cfu2xJDxMJY6VeEq
	 NVA2qyRbOWg/0tkLmjM4J+6HP0tOijXs+KsHD9/J2UXiEOnQ8dx2gb4KMIRrPEm8Wu
	 5ub1HMvsd3KwD28RblmHBfSmMygicNQGpM0UkKJLONQ5cXVqz4TbhR0yHd0DFboTxd
	 4KH2nwZRockj2MLgKqF1LIcYtc3UM9rSb6tnDIyZCnx1gjJpdM5dSCd3gk2TIFbROI
	 PJZwsB1PiZ9u1f15pjNcH6Pr791qMKEwmMmWDoYyGxIryztZ+/uQ002PZL7dlotePX
	 SMLxCJuVC4EFQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240411083332.304887-1-colin.i.king@gmail.com>
References: <20240411083332.304887-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: codecs: tas2780: remove redundant
 assignments to variable ret
Message-Id: <171287626663.99929.5680912373005541173.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 23:57:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: FHI2LK3N4YEAG7TT3VRFRJOYJAKFSTVP
X-Message-ID-Hash: FHI2LK3N4YEAG7TT3VRFRJOYJAKFSTVP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHI2LK3N4YEAG7TT3VRFRJOYJAKFSTVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Apr 2024 09:33:32 +0100, Colin Ian King wrote:
> Variable ret is being assigned a value that is never read in a couple
> of places. The variable is being re-assigned later on. The assignments
> are redundant and can be removed.
> 
> Cleans up clang scan build warning:
> sound/soc/codecs/tas2780.c:84:2: warning: Value stored to 'ret' is
> never read [deadcode.DeadStores]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tas2780: remove redundant assignments to variable ret
      commit: 1d165c5a1c85747bf48f37a80636a4a73e1576a1

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

