Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71F52A789
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 18:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9CEB84B;
	Tue, 17 May 2022 18:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9CEB84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652803265;
	bh=08NTWlKTLL/ySrOLD30F5ebihc/QzFElhJVbO/68nUI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=audcUH240tyf6fXCr/6u8Wj4GwYWxKnT/0Ux7DE4bnjpObzsqvVJPGS7lTuueZwef
	 O9NHwk3e/r6ZQS5XVNBTJYMCoHz6u6ez0KO9DztvD2XmnfHEdsuD3VKPgghxPQ0OWg
	 SyMpni1VeE+UgGlplVAkfcAq3oGiJ5ZJgP/rrlNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71B9AF80519;
	Tue, 17 May 2022 17:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E81CF804BC; Tue, 17 May 2022 17:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A615FF802DB
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 17:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A615FF802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U85CSE5G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 29D9161222;
 Tue, 17 May 2022 15:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87413C385B8;
 Tue, 17 May 2022 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803168;
 bh=08NTWlKTLL/ySrOLD30F5ebihc/QzFElhJVbO/68nUI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=U85CSE5G7zDMakU3IRQ3iuEtM/ry+bqa7pCk1+EkOXsXVY/AVxRo93FuHiXc0xOf+
 bEfkQ/9PHujR7RzQ4Ohm9W+xNqFvQ5E9+MXCCZFZxh6iJ0VLyHjQnxg4deuH6OHdz7
 s8ZE1uByg41KVGEaZIZZvmKcrPSwsVVVKSp6gMveWL6DK5lWFoYNxk3EQQYcfGSywf
 +o1sqelQMRxZfuLoM/EJkrlbeHTtMk+ig74/d5kUIm1sKFgPwK0Cx2U2FTs7dpojzx
 B58yhL+GOgeqDPkfQ6jl7OFWO32porS/O67259v/mx4Vcujrle+OkPhfpUpcVtj3dG
 8kFOiwIr9et5w==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
References: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: core: Correct spelling fliped -> flipped
Message-Id: <165280316727.1635268.6228020122879142845.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Fri, 13 May 2022 10:05:30 +0100, Charles Keepax wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: core: Correct spelling fliped -> flipped
      commit: 64c917d1cfd70ff827c9ea37277a97762ea372d4
[2/3] ASoC: core: Pass legacy_dai_naming flag directly
      commit: 8c8a0f01c7c52f9037b6859ff5234ea5acf572d6
[3/3] ASoC: soc-component: Update handling to component delays
      commit: 232213bd73bbb381b05b729829fdb5d00e0a8fdf

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
