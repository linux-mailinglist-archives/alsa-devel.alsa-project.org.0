Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8395A160
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 17:29:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8926A82A;
	Wed, 21 Aug 2024 17:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8926A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724254140;
	bh=W6Dm+pw4jKVI1NoMBaeLuQYMNAlSSIuKPuzkfQBk0wU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LeTaa5IkjqA1MjJfTHkNYbrfAeykVAU/frr0Uymc4ppI1nR0KxQ6MF+dsghITw/3L
	 30IW+sZiyALuSTmygxz+gmN2ReRDvMjPH7siMKHj0/oNjFabSw6RPiJ4GDat6Sm7bf
	 JnM4N9aii2+1xByIpSkVi6oJx3ZwGy8MizRG8jSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A8B5F805E9; Wed, 21 Aug 2024 17:28:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4A16F805AE;
	Wed, 21 Aug 2024 17:28:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF4AFF80579; Wed, 21 Aug 2024 17:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD9DCF800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 17:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD9DCF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YVXmxd1e
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DD0B60FF0;
	Wed, 21 Aug 2024 15:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D56EC32781;
	Wed, 21 Aug 2024 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724253890;
	bh=W6Dm+pw4jKVI1NoMBaeLuQYMNAlSSIuKPuzkfQBk0wU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YVXmxd1eK1rsVkqeL1K3kB85wpV5tsEhKpBR7XuGnOPqUwBOqNEcxhL0cvCXR9l2J
	 QkixuXmAmzleeGVMTlAAaW4PUhlGy2Ik+eP7EMqc5LQEaJL70m+kAlousN44o2lNoN
	 6YLvZyb2iBqgwccb0ckkq5bCwef5FpwNqbLZGqyEnAFWYZOAV4VI72XWiJY7seFnnc
	 pLW1Yzr5Mbcn85sx9TVhsaEzBlYue48aXHMyBEeuqd8d2nMH6lBN7R8JC2M93an0HO
	 ur93a+PHoXdbrVZ+3jNjYoDtSO7myjqO7NHoug1uxh8uWcUswhgwZNbdAYSZPRs5t7
	 kc0HkwI38pC4Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240821114927.520193-1-colin.i.king@gmail.com>
References: <20240821114927.520193-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: make read-only array
 minCode_param static const
Message-Id: <172425388817.1704682.13476563163594836442.b4-ty@kernel.org>
Date: Wed, 21 Aug 2024 16:24:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: SG6GBAN3FDD3CBBB4TGDEBDIGEWW2BJN
X-Message-ID-Hash: SG6GBAN3FDD3CBBB4TGDEBDIGEWW2BJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SG6GBAN3FDD3CBBB4TGDEBDIGEWW2BJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Aug 2024 12:49:27 +0100, Colin Ian King wrote:
> Don't populate the read-only array minCode_param on the stack at
> run time, instead make it static const.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: make read-only array minCode_param static const
      commit: 6f6d8b2d49299492e704030632ab79257685e5d3

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

