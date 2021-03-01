Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA3329552
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:44:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E4F516A6;
	Tue,  2 Mar 2021 00:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E4F516A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642244;
	bh=8Rt9By5yk81xkplmKzP5gmktliyz7gcdIurrfSoX2Yc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGyzt3RHDo7q8TQG3ashe5R+qNHoQ0R3wMuU6tWVqYs7X+OCiAGQKN2K5WspqeUqr
	 IKGWQCMX1gKNaauFHJ00V5tinYVritkokwiqIcIoqsMXc6qFJpEoVxOBgu2ZYdBigR
	 /mAEiCe2MZ2wLzpGouGEW1TD46l43Udf+Futu0LY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00062F8051F;
	Tue,  2 Mar 2021 00:37:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8284AF8051E; Tue,  2 Mar 2021 00:37:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04925F8051B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04925F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sr6RnvZc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC2F761490;
 Mon,  1 Mar 2021 23:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641840;
 bh=8Rt9By5yk81xkplmKzP5gmktliyz7gcdIurrfSoX2Yc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sr6RnvZchNPmoTC4BFfFhYrNNjV+2RM9KaQ0Xj3S3Flm723sQDY8wq7jbEgsifvFw
 SOamm9O60xcSty6odxy+W4zuvpYG41FdCANA93GWe/khe0o1OHXqvYobKlPpurN47D
 LyevGj+c8ErLkTDGDiOaKHVgRBhHJkJANzrqta9oiKUesABomIU9++Jt9ucjvHKNcP
 9Iq+x4jtlpQbqhNLqgu8+kX9h7xedRxQOTUi7TRg5DL9kPoneHag2e63WMeaA+ubJQ
 3OPJJMhP9bq4NMd5FoiLrgWus+sBwsh2q461C2gvB3F5796dK1kmR5duWpovf7FJOw
 nR0eqsJOuo0dg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87mtvtro3h.wl-kuninori.morimoto.gx@renesas.com>
References: <87mtvtro3h.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: rsnd: cleanup ppcheck warning for Renesas sound
 driver
Message-Id: <161464168097.31144.6662495111295269219.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 25 Feb 2021 09:24:34 +0900, Kuninori Morimoto wrote:
> These patches are based on below patch-set which from Pierre-Louis,
> and cleanup cppcheck warnings for Rensas sound driver.
> [3/5] has Reported-by Pierre-Louis tag.
> 
> 	Subject: [PATCH 0/8] ASoC: sh: remove cppcheck warnings
> 	Date: Fri, 19 Feb 2021 17:16:27 -0600
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rsnd: cleanup ppcheck warning for ssiu.c
      commit: 5c8f0b2a8d9ce20f7c3e0065cd8936995bd5ed63
[2/5] ASoC: rsnd: cleanup ppcheck warning for ssi.c
      commit: 8f5412423337ee61ffa6fa7bd20b0c78dae0b9ce
[3/5] ASoC: rsnd: cleanup ppcheck warning for core.c
      commit: d1031c8c058aee7f12dbdff7f4ea4521ee911ae8
[4/5] ASoC: rsnd: cleanup ppcheck warning for cmd.c
      commit: 783c09cbd1b5dc6fcf14947097f4d767e564acc5
[5/5] ASoC: rsnd: cleanup ppcheck warning for adg.c
      commit: ba55cb110dc326da8fa33401bf54727937e5a619

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
