Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CECD73C4B3
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jun 2023 01:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE0C1E8;
	Sat, 24 Jun 2023 01:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE0C1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687561904;
	bh=AhTyVrezEb7xISciSylu0n0Qyim1F111XYrBxnV80IQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YTtXxZVhdQ8MBC0HrGc8pQN8OOBlRdror2tmlbi4mn43AFyuUKakQ+sTx/QozFQ4z
	 A1Cr4MiswAgslMoMwM7p6H8FdQT9fZ1IJGeGN5zG5PhqxQ/BQ/qFzyaPS6h85Y26Cr
	 X60HFLk5uPWTs7XpnJ6gUQVdb9/LmTmhTZtALDW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE631F80169; Sat, 24 Jun 2023 01:10:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC8EF80132;
	Sat, 24 Jun 2023 01:10:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E090AF80163; Sat, 24 Jun 2023 01:10:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E18B8F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 01:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E18B8F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QLXdp79y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4EB7611F6;
	Fri, 23 Jun 2023 23:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EF6C433C0;
	Fri, 23 Jun 2023 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687561814;
	bh=AhTyVrezEb7xISciSylu0n0Qyim1F111XYrBxnV80IQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QLXdp79yFL2jHUj+smoXBvOn1yR18rfo/ld1dHN57UKTiMPYrDHJDdXYd0YVm2E+K
	 2dXgFn2t/HVRyeH9YbmupgVZ12hBvOE82/4ldtrCzsS5ZfF4iFAxFzuzfdm69csJwo
	 IzgGRoF/Jf3XLv2iM/6H6Vne5CRVa1U6v8OTDoEHiIO3iib/sxjXJ405LmbQMhat41
	 yJUho2EIjpK1bSho1a0YjWYKKQthH87tpoK8ER9LhjHMf51MMg15L1s1HcmGpQQ5fE
	 f/6E9UKs1eZfgToQLrI350rEEkBlm0Noz6QAnPq2NsDzlv0Z/Nu7jctO1VlV+CBXNB
	 Im90/cjyeDWww==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <13916275206@139.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <729bb6b3-bc1d-4b3d-8b65-077a492c753c@moroto.mountain>
References: <729bb6b3-bc1d-4b3d-8b65-077a492c753c@moroto.mountain>
Subject: Re: [PATCH] ASoC: tas2781: Fix error code in
 tas2781_load_calibration()
Message-Id: <168756181136.1144026.12966447947961318975.b4-ty@kernel.org>
Date: Sat, 24 Jun 2023 00:10:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: VFX4Z4BZ2DSI3UX2Q3XTEAAUMBRLLUJP
X-Message-ID-Hash: VFX4Z4BZ2DSI3UX2Q3XTEAAUMBRLLUJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFX4Z4BZ2DSI3UX2Q3XTEAAUMBRLLUJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Jun 2023 15:09:48 +0300, Dan Carpenter wrote:
> Return -EINVAL instead of success on this error path.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix error code in tas2781_load_calibration()
      commit: ed959833db7bdb4e57fa8f4076babf3810296f5b

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

