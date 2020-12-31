Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC42E8037
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 14:31:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3E21716;
	Thu, 31 Dec 2020 14:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3E21716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609421489;
	bh=MYRNbntVJginmU88481ZnK9WY000sUr8xpYm+ULduOk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kagYDfqXip7tPmB0V++Jx8t3PST6g+xPh7FxS8ZZ07eoF/jZ0eRMK8WVRx7aXel8f
	 xOaHBLVHGUCpNrfMKiykfM98BOxdT6pQkmmLFBmU+SeU4QA6vqLQpj72EidXb28Cut
	 w/MSeovxNAgB7EvEXG1PK24hh5WXhe1mcbg9iW0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBE9F804C1;
	Thu, 31 Dec 2020 14:29:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B8C6F8015F; Thu, 31 Dec 2020 14:29:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC6FEF8022D
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 14:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC6FEF8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G/kutitp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82B852242A;
 Thu, 31 Dec 2020 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609421338;
 bh=MYRNbntVJginmU88481ZnK9WY000sUr8xpYm+ULduOk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=G/kutitpiFgt+iYFWGv7CGXIpzHcw6Ok0H2FyjTllnmN8H9GQNNpEJF174vy3YrB4
 B7e1GJ3XF3f0ru/w/hDc17pXyAlVDbEMtJuKI6fi5zMU4proRADbx94d0fHaFoGE0p
 Sw7W7UH+4BCoKM3xbDPpbaTuw3PvklJvrFSTICyYKxp+/uJcXRn3IeFlpEEdjUW3Gn
 JHTefYVvnFbifWAhbeGHz8O4Ck/UfHl59fQVYqJLkgG3O7RC65knjppV7oGUfKGHVr
 we9ZyxZaYDlLoFYBGiqU0yGfSuBHaO+IfSJ39QkipWaUWzYl+rW1703lMH4rGTKHFJ
 eupoLa5Yo4DYQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20201230080235.12698-1-oder_chiou@realtek.com>
References: <20201230080235.12698-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5645: Remove the redundant delay time
Message-Id: <160942130383.56416.1343945010128840654.b4-ty@kernel.org>
Date: Thu, 31 Dec 2020 13:28:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, judyhsiao@google.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Wed, 30 Dec 2020 16:02:35 +0800, Oder Chiou wrote:
> This patch removes the redundant delay time to speed up from the cold start
> of headphone playback.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5645: Remove the redundant delay time
      commit: e9141c1aaa72782b9de7b224cd184a809aa4a87f

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
