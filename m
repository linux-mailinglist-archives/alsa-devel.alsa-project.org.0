Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6817ABA18
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 21:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53747DE5;
	Fri, 22 Sep 2023 21:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53747DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695411024;
	bh=X7hpCNfum/sw2vBHbw5JFQELggtlO8rmjHqZ1cfeO0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vrg9oEbaNiMb1JMV0PuUJzGJYOXUWJyJK0p6veAiSr4jOiq3d1tVvEofVHWfSKtFx
	 nCYVoQY5Z0m1oIwN4FkH6+MvDcbO+CRsPx+NHs9S8qXgfGRsEp6ABFy1JZpE3wVC65
	 XNiWfhl6UDHjINXRyo5mwSfUUb0Ur6ErnEl7xkeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AC90F80124; Fri, 22 Sep 2023 21:28:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39620F80558;
	Fri, 22 Sep 2023 21:28:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49289F80125; Fri, 22 Sep 2023 21:28:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECACEF80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 21:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECACEF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bkHjFrwQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9C4A6234A;
	Fri, 22 Sep 2023 19:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B90AC433C8;
	Fri, 22 Sep 2023 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695410907;
	bh=X7hpCNfum/sw2vBHbw5JFQELggtlO8rmjHqZ1cfeO0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bkHjFrwQ7lCHsDev3iFANJ/YCjD1lVEiec9885ebj0g0NPnCCv0JpkPuZJ464XJPE
	 F2pqoFccLkFK8xOfyzhQueg6mZEPhwYhy1mYU/cfyfHZZQ7WF3AjSd/IXleyh0LY75
	 e8OC1Cpb4wFCEDOmsd/MAINfvVrw3S0c3Sy4m5AOSEMFXXmTHEulQSQFaZZ2kMtEkn
	 rLu5JUJWY3etn7HR02PrLM/mO6ANEmZ1VKxaKex27b3rKAks+bwJDxYr1GkC94o0/b
	 2a4Yh4ZsU5xJTVGuRCCBzWfs+GXZGzPYV0INJQMC4xcPEEnMJ0SCaK8/GSc3RQSSU1
	 JVvjQocW3GrAg==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230922161547.594484-1-miquel.raynal@bootlin.com>
References: <20230922161547.594484-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine-pcm: Fix function name in
 comment
Message-Id: <169541090588.56212.1377003381865139554.b4-ty@kernel.org>
Date: Fri, 22 Sep 2023 20:28:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: H7AMIUX4S2BJEWLVPNUXZ26K4TGDJIEV
X-Message-ID-Hash: H7AMIUX4S2BJEWLVPNUXZ26K4TGDJIEV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7AMIUX4S2BJEWLVPNUXZ26K4TGDJIEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023 18:15:47 +0200, Miquel Raynal wrote:
> While browsing/grepping in the sound core, I found that
> snd_dmaengine_set_config_from_dai_data() did not exist, in favor of
> snd_dmaengine_pcm_set_config_from_dai_data(). Fix the typo.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-generic-dmaengine-pcm: Fix function name in comment
      commit: e52dca7216cfeae76a99908a2eea6e850d3f918f

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

