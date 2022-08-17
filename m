Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A25974BA
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 19:06:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547CB163D;
	Wed, 17 Aug 2022 19:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547CB163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660756014;
	bh=Xg5LiDPzkPQzU8ExdTp8O5VM1GoQ2K7H+Z2oHuhkWD0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AoplMgxQlI9zFthKibbH6pDluiujVa0ahjwAulx63Af8WTRV4AeL2KlCMkaqwFvjG
	 /FBLahm5unYzwRjPOBoSlrSAdX2AindbiGRj4YxdIr0fje98PQA3oHOih4TMDMG3KF
	 BLnvwz0QoOWBXb9QMbI9j4FfyfrbBzCq0Wx1lDq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7CEAF8021D;
	Wed, 17 Aug 2022 19:05:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81160F8021D; Wed, 17 Aug 2022 19:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B239F800EE
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 19:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B239F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IshtAORF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DBCA6121D;
 Wed, 17 Aug 2022 17:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0DDC433D6;
 Wed, 17 Aug 2022 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660755948;
 bh=Xg5LiDPzkPQzU8ExdTp8O5VM1GoQ2K7H+Z2oHuhkWD0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IshtAORFEenqWgi/fygyaLiAXU1G80EdkzNJm8s7dH6Q9hYeay2N+lCl5JZt7grlr
 eMIS1yEUieQL2xQ/p08CXsU2eF9j1lCVIuaKROKeEyg18zYkAemyVMLF3/+5jwqlR2
 qLVw+nAZPl7eFwI3It3JZDED7WM0CECUKxD8CvBk6tCHtwtR5hi5h0fjjqllGR8xQU
 EcrgdJ86kYdeSV+kk44v/hdlJPxrjFWzYM68Hhmk/+qFOpYGDKlmAbVnGh7RlpuMn/
 7nGAvy+ZQsGdKV5RPYjwwN04IHRqMep3U2GFPahCgPPKfqTHY92uOdnDiJiRF7Ef6+
 2UtyAB1pkvyqQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220817122347.1356773-1-rf@opensource.cirrus.com>
References: <20220817122347.1356773-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ASoC: cs42l42: Some small code improvements
Message-Id: <166075594756.566556.10171156201538682053.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 18:05:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 17 Aug 2022 13:23:42 +0100, Richard Fitzgerald wrote:
> This is a collection of minor improvements to the code or comments.
> 
> Richard Fitzgerald (5):
>   ASoC: cs42l42: Don't include kernel.h
>   ASoC: cs42l42: Add include dependencies to cs42l42.h
>   ASoC: cs42l42: Move cs42l42_supply_names to .c file
>   ASoC: cs42l42: Fix comment typo in cs42l42_slow_start_put()
>   ASoC: cs42l42: Use snd_soc_tdm_params_to_bclk()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs42l42: Don't include kernel.h
      commit: 8ccaa7eb76742579864ddf834a8ea9c036c2cc5a
[2/5] ASoC: cs42l42: Add include dependencies to cs42l42.h
      commit: b48d1da00fc8f32f7f75b8a34eb484f08b39ffaa
[3/5] ASoC: cs42l42: Move cs42l42_supply_names to .c file
      commit: dbd231732c99e336c2ece4a70896139e7f5a51a7
[4/5] ASoC: cs42l42: Fix comment typo in cs42l42_slow_start_put()
      commit: db568aab37c1af80057c12c97e6af049495c3e4a
[5/5] ASoC: cs42l42: Use snd_soc_tdm_params_to_bclk()
      commit: c2683ecfd1850cc99829691b2e1d90f1a6d75b8b

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
