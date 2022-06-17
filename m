Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E254FB19
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 18:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C9B1E80;
	Fri, 17 Jun 2022 18:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C9B1E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655483492;
	bh=8lIyfl6cLa0jSZ4rrQjgGG9QXNu4BOP9MO1nbLqDdLo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEeISw5EgGRIP82R8BsU4hI5Le9AE8CV5NH/a1Q4eHyWyxI3d9T/fJ6IuQtal/nQ+
	 QENdF4YqYP5DXdFKVPETkU4CUQ7fpPew5EXMj1RYaTUUHXdv23Yogqv4V0xDhnDS7q
	 5TUlDTwasJTlPz7GV1Mgrnrj1jS6xDLsqbj4ojAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61658F8052F;
	Fri, 17 Jun 2022 18:30:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6FE8F80529; Fri, 17 Jun 2022 18:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0D51F804BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 18:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D51F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hYtqErNI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C415761DB0;
 Fri, 17 Jun 2022 16:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D154DC3411B;
 Fri, 17 Jun 2022 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655483391;
 bh=8lIyfl6cLa0jSZ4rrQjgGG9QXNu4BOP9MO1nbLqDdLo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hYtqErNIDh/G1tDlX/Gzd3hNB+flGgum09vIYQJuYIFxJjvLZRa/tscQu9LOaPW/6
 alWYxfOJ0rIouFHSzLzI+DmX7MblakbKEAiWwh8PDIIdnom1XEl0n4yJa8xtbPh4Se
 s3YbkjaxHtitZk9Qv17eolMl/qhubOExjXGYrHHYJjgTp1S2ljLtYDytN9cBbA2dkJ
 N9JphuDvQGzriMAS6F2s1VuijRkycdwwWsyicPIFZMjaISr4HNVfhOPvkAWf6iKymA
 ojjjTeb+fwH5KHOZYWJD2R4uPkUiyMYuxx0dWt7gv9MMHI+vOjMYRsnc02wcCJqCEp
 rzDhqaD8ewH1Q==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20220616153521.29701-1-peter.ujfalusi@gmail.com>
References: <20220616153521.29701-1-peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: twl4030: Drop legacy, non DT boot support
Message-Id: <165548338955.901499.17638246583616685807.b4-ty@kernel.org>
Date: Fri, 17 Jun 2022 17:29:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tony@atomide.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 jarkko.nikula@bitmer.com, aaro.koskinen@iki.fi
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

On Thu, 16 Jun 2022 18:35:21 +0300, Peter Ujfalusi wrote:
> Legacy or non DT boot is no longer possible on systems where the
> tw4030/5030 is used.
> 
> Drop the support for handling legacy pdata and replace it with a local
> board_params struct to allow further cleanups on the mfd side.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: twl4030: Drop legacy, non DT boot support
      commit: 7adadfb06b9839fa7d9de0cde7ad57a3be3665f0

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
