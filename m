Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3247E22BF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 14:04:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFBB81F3;
	Mon,  6 Nov 2023 14:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFBB81F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699275897;
	bh=tvuETolrhSYwQGmU50Kms37nVGRMVAfF+sc+bKCkR5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N7YapeWQJki13Kx5BMOldqrXAdi4HjBaso81M0ggPfU2lXHrUnjFNVHxRbmm4XQTA
	 +en0wPColkDn85GyTfwKoXQMomZhX9Y8Jl78sH1Z+bFtoGXj/tb45slvSIzOOpTE5H
	 clgDP+99g5erxfWfo10HClyzf31hiEOrRkT4eonA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77346F80549; Mon,  6 Nov 2023 14:03:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAEEDF8016D;
	Mon,  6 Nov 2023 14:03:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52FE6F801F5; Mon,  6 Nov 2023 14:03:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C41DCF800ED
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 14:03:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C41DCF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fGSmUVsZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0068BCE0B24;
	Mon,  6 Nov 2023 13:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8481C433C8;
	Mon,  6 Nov 2023 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699275811;
	bh=tvuETolrhSYwQGmU50Kms37nVGRMVAfF+sc+bKCkR5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fGSmUVsZj3YqNPEPJ6n5tf0SkZoxwAJRvId189ljL97gzh8LlaaCB8wlw7BSZGxJX
	 4Wmjzm3pcT7odjTzds59ex/i+/NdKNC4ZRKpbynMf9GL5svnjJUD4865kHdo9bv1Ud
	 mNtSnA7zLw66ig+A/K7R5qje2BmbjuGcCjPmoeiE9JPRGxMFJnL4sfKNEjzdKGN/1o
	 ptVsbOEYbOa/ikOL9zLw8TPYppejcYt6mR2gr6YAQtZxEPhAqqB9UshoEDDFNw+sXi
	 iIgj4T7hrpe0i0uEWnwUk9zpVZpN6tSDNahgwy0TK4psWicVqbLHN3FLOery8e1X8t
	 JLfzH+McJFmrg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
 mastan.katragadda@amd.com, juan.martinez@amd.com,
 amadeuszx.slawinski@linux.intel.com, dan.carpenter@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231031135949.1064581-1-Syed.SabaKareem@amd.com>
References: <20231031135949.1064581-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix for indentation issue
Message-Id: <169927580618.3037292.18150963657719003157.b4-ty@kernel.org>
Date: Mon, 06 Nov 2023 13:03:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: LR4FC3KYYLOUN7LVUUN5LCQAVWMBOWXL
X-Message-ID-Hash: LR4FC3KYYLOUN7LVUUN5LCQAVWMBOWXL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LR4FC3KYYLOUN7LVUUN5LCQAVWMBOWXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 31 Oct 2023 19:29:32 +0530, Syed Saba Kareem wrote:
> Fix indentation issue reported in acp70_pcm_resume() function.
> 
> Fixes: e84db124cb21 (ASoC: amd: acp: Add pci legacy driver support
> 	for acp7.0 platform")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Fix for indentation issue
      (no commit info)
[2/3] ASoC: amd: acp: correct the format order
      (no commit info)
[3/3] ASoC: amd: acp: fix for i2s mode register field update
      commit: ed2232d49187cebc007ecf4e6374069b11ab3219

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

