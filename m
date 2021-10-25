Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461B439BE4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE0416D4;
	Mon, 25 Oct 2021 18:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE0416D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635180130;
	bh=n5jXr5DbnDX7GorTe71SFdt+WecgsSmfJCkOC7hSvO4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqs1W6RMi0BfyuzHwR9RajXfOXsDm1cNazNwV2GnfFNTv426y2V4v02IHXBgPG+QG
	 XubGWP+aqqyg7bHjVQDWGOm+kVznNYAtkwaa0YCQpmMC8udT8rlYHp/JiZvssE+yHf
	 ixIFPhJ5tpQ5lXlrFYrg6OTyFqwZZOPJN2YE0uys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF0BF8025E;
	Mon, 25 Oct 2021 18:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A3A9F8025E; Mon, 25 Oct 2021 18:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 808D0F80431
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 808D0F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IlU/NnkL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 792B460EB9;
 Mon, 25 Oct 2021 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635179983;
 bh=n5jXr5DbnDX7GorTe71SFdt+WecgsSmfJCkOC7hSvO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IlU/NnkLpjf3aJuwcvFtFhzJASA9jYZiovR5qFNPWI8oP/XdwIuHKayzi2xREU8Ec
 Rd9Fq0F6uHy1XK/ZjdSV32+lZzDPyVnMbjcstGjAOeGmjtWDKqtLGYKnJUX/92DAaC
 SPneeckGvnQiQDdvcnqvCswzimdDFW+axqpT033XJkrLuVd7Vcxa/57J5tVjwNGXvr
 HgJHApzEyLeDUeGmrZk7JFTQLwVmk/hwWTwwmT25WgiCGEv6g5WeBG5GyKb0LRImus
 kzbZl6jT30A4Qrb5cmIO27tD5Tdp5CSOudbISM+sOEcAcqbuLhBqYjJYJumqFj2C3u
 34tLvzZvh8uQw==
From: Mark Brown <broonie@kernel.org>
To: Adam Ford <aford173@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: wm8962: Convert to devm_clk_get_optional()
Date: Mon, 25 Oct 2021 17:39:23 +0100
Message-Id: <163517996156.3558038.2022301808170066410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
References: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

On Mon, 18 Oct 2021 16:01:11 +0200, Geert Uytterhoeven wrote:
> Use the existing devm_clk_get_optional() helper instead of building a
> similar construct on top of devm_clk_get() that fails to handle all
> errors but -EPROBE_DEFER.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Convert to devm_clk_get_optional()
      commit: 044c114014435fa723e2a0540cb7ef55d2c812da

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
