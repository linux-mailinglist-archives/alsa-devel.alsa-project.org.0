Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F02CB7B1626
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 10:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112AFDEF;
	Thu, 28 Sep 2023 10:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112AFDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695890206;
	bh=FgZxXfPfyj1K8RRAJj0ZMzaJYR0HOOqlp8GRmy2xQT4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=df0L2kAVVX4+Yh2YpEtm6Yw2uMkbUtBwP7g4e+iurfLK29Tv8xT5XDx2HYHoM9Eeg
	 raUcNcxpL6KaL19SUuZCPpced5x6M+ComEuPkiQIPUmtCsdLkggGAU0xBKLym1zKQB
	 sXJ/ya8/8BGS0UxxyU3lFsVTfcfh9T6Eofou/09U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 988DFF80290; Thu, 28 Sep 2023 10:35:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E266EF8016A;
	Thu, 28 Sep 2023 10:35:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB48F80290; Thu, 28 Sep 2023 10:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99CE2F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 10:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99CE2F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CEsnPddt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9653EB81863;
	Thu, 28 Sep 2023 08:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB85C433C8;
	Thu, 28 Sep 2023 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695890122;
	bh=FgZxXfPfyj1K8RRAJj0ZMzaJYR0HOOqlp8GRmy2xQT4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CEsnPddtanxIZnCQ8nfB2ejYlQskavisMzmV84O/5C8e5WrCC0F0D5w8PzslZIyad
	 KgZE9IeFzvCjaosAMjQjIw4i+6oT2LyusGIis7lPDsw84t/eF2F+jI+xBDtG9C5XDM
	 jJ5qLlWjn0Z+uwOG/C308Kwli+8F3L5q0ASCIs5lA7e5FRI9S5TMt00gJRZ0D80TGO
	 wnGuek+GM1igKooKx/yhJJ6RT64SEpkh1IxjRiQJcb34Cwh1qnDZTx5HYYRcRrXpyQ
	 NwQ3N4vXDRnQ99JvrDPYaJzqIvtIa8cEPF2Ba9GobJjgSb1R7l1yHy9a7K+IV0kFTs
	 albymVdGQ1wJw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230920153621.711373-1-chancel.liu@nxp.com>
References: <20230920153621.711373-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/1] ASoC: soc-pcm.c: Make sure DAI parameters
 cleared if the DAI becomes inactive
Message-Id: <169589012063.2716296.14624171490779605949.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 10:35:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: XWRESK737L65MYZUR4HBNP4NPB4JGC7V
X-Message-ID-Hash: XWRESK737L65MYZUR4HBNP4NPB4JGC7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWRESK737L65MYZUR4HBNP4NPB4JGC7V/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Sep 2023 23:36:20 +0800, Chancel Liu wrote:
> It's reasonable that DAI parameters should be cleared if current DAI becomes
> inactive.
> 
> Only check DAI active status in soc_pcm_hw_free() is not enough since there's
> the risk that DAI parameters never be cleared if there're more than one stream
> [see A]. Only check DAI active status in soc_pcm_close() is also not enough
> since it will cause the cleanup just happening in soc_pcm_close() [see B].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm.c: Make sure DAI parameters cleared if the DAI becomes inactive
      commit: 3efcb471f871cc095841d411f98c593228ecbac6

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

