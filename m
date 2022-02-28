Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835BF4C78B6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:21:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1319D18F6;
	Mon, 28 Feb 2022 20:20:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1319D18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076079;
	bh=GO+EbrUjC8Q5+QvjhIZMCjcjfdXS0D5yJFqSw56tdZE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anET9J9ZX0mEPT//GwfqIMFGWo7jV8dHGohTzXE2+87YhlYegy7Ltl6isF65ndvTT
	 zH0qcLcWzpo4colTHs2El57rIRq6h0+zjFjENXiaqIrNXrm4rLqPMYb7LdcbXbjOlb
	 yEqI9utt/HFNJEcl4RnSDQQEVQqv+0F4g6cnBBV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6F2CF80589;
	Mon, 28 Feb 2022 20:15:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5C20F8052F; Mon, 28 Feb 2022 20:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AE7DF80519
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE7DF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KV5Q0Hqt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2DBB4B8162A;
 Mon, 28 Feb 2022 19:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F3BC340F1;
 Mon, 28 Feb 2022 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075733;
 bh=GO+EbrUjC8Q5+QvjhIZMCjcjfdXS0D5yJFqSw56tdZE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KV5Q0HqtGrDnPioyM2wrpnSG7+oICo1N9z4aCMCK+rN1Bh/Ui5vjo3RgZEvXeYM8T
 RGulDE81Jg+wTkhqB17n2tJpjXZJRoY3H2nMwclLkEppAaFErEisrYdh+zRZc9tnas
 UQhf3s9Wh3vnmH1f7Q2+Z0gtMl3GJO/eC7ao20PEC8MT5xfOr3GXENcvFrz75gLyZ1
 sSdwkUJnZ0UKkB0UU+85jv9nWAcpNnwq4TJ7PfjyGMHJdEvKzSGZMiarEjEHrPBHbX
 IPw4cZmKQGKV6ApeAZOYJAWu9BKdzB0VfvTHVy2L5MVgAV/fRmB3i4dnZsvvYSITvq
 wf6FZrPAxLbUA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>
In-Reply-To: <20220223014731.2765283-1-broonie@kernel.org>
References: <20220223014731.2765283-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: pcm3060: Use modern ASoC DAI format terminology
Message-Id: <164607573267.3538791.7179470902502763129.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 23 Feb 2022 01:47:31 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the pcm3060 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm3060: Use modern ASoC DAI format terminology
      commit: 3c7d8a35179eed0fe75e142028b599268657091d

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
