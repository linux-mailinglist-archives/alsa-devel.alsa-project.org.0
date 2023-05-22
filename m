Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617B70C1E4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D057D852;
	Mon, 22 May 2023 17:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D057D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767856;
	bh=IqFoE1vzW8OD6q9MnkhBNHhAcZ3K1ijd/6xeXtNZXU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UsyQBnntCDFe39E3T8FqggD11i4MViDVWzOa2zEl80QY/ZLEisqpRXWnmJ+7pb9Mw
	 4iUcqn/ztc6H4UP8Qku9k67LGYycv/OcShQ6KG9CC5ZDly5m32gNbK1yW5vLYuOSSe
	 AXeCuZfgwobauNjnaPa7vhkAvV/l3XIHuGy7b/CU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B277F805AC; Mon, 22 May 2023 17:01:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA156F8057D;
	Mon, 22 May 2023 17:01:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81782F80567; Mon, 22 May 2023 17:01:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAADAF80549
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAADAF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J225SecD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4535623C2;
	Mon, 22 May 2023 15:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FBCC433EF;
	Mon, 22 May 2023 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767708;
	bh=IqFoE1vzW8OD6q9MnkhBNHhAcZ3K1ijd/6xeXtNZXU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J225SecD6uHN7q5v/a9RgarwV4dcBwa3SSt6XO17uqsDUzgcddJP5PPq2DQrlqDJC
	 uwn+5M5RaKQgPHxeOWQL+p2KDiv6lzgtARLguGtj1R3cagaWajC5o/U51WfjJ9ialS
	 KJf4IG7HdVqSy8JewgJeORMzkq7fmdiIygyomez21uvX4jkdEGVrYZy9NB0d2OLwpg
	 FPZZtSiKmmofQeaA7N606pXkdWzSEapz59c+E5XLCUy4w1WwX+mY7sg6Ikk0vWw3bd
	 eYeq5vPd0NZSY3M6l+8gmqmPWdLryrF2p8iMUc4FbjDe4AB42MtoB5/NC7vQBj5KCe
	 5uoFWiceMXw8g==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: 
 <3219effee5c7f190530bdb1ef8ec35cb142e3611.1684594433.git.christophe.jaillet@wanadoo.fr>
References: 
 <3219effee5c7f190530bdb1ef8ec35cb142e3611.1684594433.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: cs53l30: Use the devm_clk_get_optional() helper
Message-Id: <168476770565.849172.13295031739089654350.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YPXVWTPB3HKB6XOBCI6V5N3VWJGV3HFY
X-Message-ID-Hash: YPXVWTPB3HKB6XOBCI6V5N3VWJGV3HFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPXVWTPB3HKB6XOBCI6V5N3VWJGV3HFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 16:54:06 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs53l30: Use the devm_clk_get_optional() helper
      commit: 0b855cbbd769940fcaf49b2371a05235d8499d5d

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

