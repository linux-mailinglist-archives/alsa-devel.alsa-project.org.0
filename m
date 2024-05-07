Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A18BE65C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 16:47:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC58B845;
	Tue,  7 May 2024 16:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC58B845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715093245;
	bh=N0nCKnQCByT3IK3m7wyeGknqiLgIC3cuB/Cu7ARwNXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lF79t+UzRYoyqci0l+IfXXkJaQwCydJq4UhWdCHhAsiiHjNXD4w+U3CWTRBbFrXso
	 rn8QXUk5WAdwfTMitQItlwj7EgKgydm1x7ZD9hLtxUGJVL8KA3k51injuWXW8sAgMU
	 NIG6nIcjgLRldZd+dZG7/4Omg/3YixWkbLM2n+cM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B597CF805A8; Tue,  7 May 2024 16:46:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43675F8059F;
	Tue,  7 May 2024 16:46:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5E58F80423; Tue,  7 May 2024 16:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56ADCF80423
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 16:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56ADCF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aPqSizRO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66CDE6179D;
	Tue,  7 May 2024 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C8DC4DDE2;
	Tue,  7 May 2024 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092505;
	bh=N0nCKnQCByT3IK3m7wyeGknqiLgIC3cuB/Cu7ARwNXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aPqSizROc6nkC1M30JjjYa4TqcuN2LVFmDCEX1yiBaD4A67donhVsuOX9Ts5WoG3v
	 W7M1GDOTWsOl0Bufm3yPAxx/uyA+mDq9vY5n37fGNLecNUa6gaXx4VBEN7YCBbahCG
	 Njp9f9QREQYHjfJmdBJw16zMIroiBGhcw7e8bg8ysTCzgsgqnILvLaAi9LnOvR6e+x
	 5aC0qnj4STAmYHg+/nHDJKCeOfrAvZNJCIfBluGe6zFo1PqLTpQliUBvK3T308ncrg
	 wqERY3tSpi/Q5NktzUyTtltwJYK8JrQac3n8CNEbTXAtzWS9nd7i9Q3jVJxFImCOyL
	 7QpsuHopMIsDw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
References: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 0/4] ASoC: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-Id: <171509250290.1985791.3642675927789530835.b4-ty@kernel.org>
Date: Tue, 07 May 2024 23:35:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: RYZZKPYF37GJ6QN7G4VYUJAHLFIBUEYZ
X-Message-ID-Hash: RYZZKPYF37GJ6QN7G4VYUJAHLFIBUEYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYZZKPYF37GJ6QN7G4VYUJAHLFIBUEYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 13:54:33 +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: wm8962: use 'time_left' variable with wait_for_completion_timeout()
      commit: cfcd957e63506273dc54f34b320172c8709244c7
[2/4] ASoC: codecs: wm8993: use 'time_left' variable with wait_for_completion_timeout()
      commit: 0800660d8c59539b628f5a6646bb63091d58152f
[3/4] ASoC: codecs: wm8994: use 'time_left' variable with wait_for_completion_timeout()
      commit: 19c70b4668306632d3cbbecdf5fea98b528e873e
[4/4] ASoC: codecs: wm8996: use 'time_left' variable with wait_for_completion_timeout()
      commit: 4e1f953a4a447b5e001655b453505c4c15904c61

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

