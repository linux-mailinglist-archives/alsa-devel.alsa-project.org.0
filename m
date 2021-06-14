Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CF3A6FC0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 22:01:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB89916AC;
	Mon, 14 Jun 2021 22:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB89916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700871;
	bh=VFwmZhq0lZfRxin6Ubjaz1ZtsF0TofX7e3Stt+Ib3wE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AuPE2DiquNcSfx9H4lhropFknyw4BhragYlCA1QrLbD7EPH77BugpHNMZwhSr4wmJ
	 49EI2A97ypFsrlvxc/ewZaWVbADh5bv2esBgmWbXINLSANvC6fkBJVaqVdKtxULOjl
	 HlDGiEDsW+ZEXSx/JqyHxVOYFT1QaoCLZwi0QEu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 824B2F80534;
	Mon, 14 Jun 2021 21:55:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15498F80529; Mon, 14 Jun 2021 21:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E908F80527
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E908F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qPYLWT5E"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9EDE6128B;
 Mon, 14 Jun 2021 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700519;
 bh=VFwmZhq0lZfRxin6Ubjaz1ZtsF0TofX7e3Stt+Ib3wE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qPYLWT5ELsVLTgso2Ru/fbR6hb5F/o+gG1pd1fv6hBdq9cLJp3OAsMHKH2Jjxmqj7
 EukoRcTUu7yHy4bIGQCxW8lDIml5bItQVHbHWGqW/SxyO5gbPrTfuOngSxqwqR0YOF
 l1ATGyJwT5WrI/4u7BOnuH3ImcOTTCnElZeBpjI6J+FevbelqxN6zqA6s5ZkDsBahY
 nhQ/9o5G2ZmeQjYyJRgguWhy9bFsnzF0v7Chy+dV/jIP2U98GKHJb1tYxXAHOmqcrz
 1Mq1ExqM/iKjtJ2qorltH1MJbKzYUJ184njPHHL+GhnUq16e+6H/KtzWHHu9+UVpPn
 FWJRI2S3ecQ2Q==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: soc-pcm: fix the return value in
 dpcm_apply_symmetry()
Date: Mon, 14 Jun 2021 20:53:52 +0100
Message-Id: <162369994008.34524.2678232708120312519.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614071746.1787072-1-perex@perex.cz>
References: <20210614071746.1787072-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Mon, 14 Jun 2021 09:17:46 +0200, Jaroslav Kysela wrote:
> In case, where the loops are not executed for a reason, the uninitialized
> variable 'err' is returned to the caller. Make code fully predictible
> and assign zero in the declaration.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: fix the return value in dpcm_apply_symmetry()
      commit: 12ffd726824a2f52486f72338b6fd3244b512959

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
