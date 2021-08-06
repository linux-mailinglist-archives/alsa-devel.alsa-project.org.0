Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E83E2043
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 02:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8773E171A;
	Fri,  6 Aug 2021 02:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8773E171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211001;
	bh=nY6Ap5stlXE7US4mkmA7NkZZWLmZkL9rXHZVjTtCrF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HuZpu1Gwcti33KLGR/3DdJgXE/GZ61r8Di+hrfa1ilZf6DMomJCHrr6boc6cg3vKQ
	 fSxZEIk5azVqrGjUJlFKW6K+Pjmo2QtbR1V+Ih6YWxtJrQ499jB6YmTVoKi8zwaMui
	 y3yKwEeAwpQe1Fr+LbY8aIl7EfHnlufpVzLTA+pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D28F8027C;
	Fri,  6 Aug 2021 02:48:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8E7BF8032C; Fri,  6 Aug 2021 02:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEAE6F8014D
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 02:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEAE6F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XASCAcVN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66FAD60F14;
 Fri,  6 Aug 2021 00:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210901;
 bh=nY6Ap5stlXE7US4mkmA7NkZZWLmZkL9rXHZVjTtCrF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XASCAcVNVqc1HUICtN71eEc0munM3JvTGWg3SmNRPZxN9Pe3RXLUQ9auImBcH50Bl
 PAfJQo407GDKTdzW7sZ1/720Bxi8oXlwNrATKjj0ooHeC9AKfA+RLzl6mEKdR3IZqE
 B0+dj6LUY1JRRJxu3CCimFjhkOGHg/+pnxrwVXpJgZA5KDPlhdNtScSYrMRV+xSJwZ
 uAjsjdpwVl6zbjd/QmxjjzsdJh6V6kXobFwMAsxUq+izuSk3LR9h0R38q4IlAHd26F
 eU/xPXNteFKi6QK0l4LCxqU3iDP5Rm0UJarqa+wvBOYS9ldLjg+GnP3Falw2DQvePS
 BPoUgSUdky2Sg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/8] ASoC: cs42l42: PLL must be running when changing
 MCLK_SRC_SEL
Date: Fri,  6 Aug 2021 01:47:48 +0100
Message-Id: <162821054283.18754.5945284038472459595.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805161111.10410-1-rf@opensource.cirrus.com>
References: <20210805161111.10410-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, 5 Aug 2021 17:11:04 +0100, Richard Fitzgerald wrote:
> Both SCLK and PLL clocks must be running to drive the glitch-free mux
> behind MCLK_SRC_SEL and complete the switchover.
> 
> This patch moves the writing of MCLK_SRC_SEL to when the PLL is started
> and stopped, so that it only transitions while the PLL is running.
> The unconditional write MCLK_SRC_SEL=0 in cs42l42_mute_stream() is safe
> because if the PLL is not running MCLK_SRC_SEL is already 0.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: cs42l42: PLL must be running when changing MCLK_SRC_SEL
      commit: f1040e86f83b0f7d5f45724500a6a441731ff4b7
[2/8] ASoC: cs42l42: Fix LRCLK frame start edge
      commit: 0c2f2ad4f16a58879463d0979a54293f8f296d6f
[3/8] ASoC: cs42l42: Constrain sample rate to prevent illegal SCLK
      commit: 3a5d89a9c6fe306d35dce4496abbb464c1454da0
[4/8] ASoC: cs42l42: Fix mono playback
      commit: e5ada3f6787a4d6234adc6f2f3ae35c6d5b71ba0
[5/8] ASoC: cs42l42: Add PLL configuration for 44.1kHz/16-bit
      (no commit info)
[6/8] ASoC: cs42l42: Validate dai_set_sysclk() frequency
      (no commit info)
[7/8] ASoC: cs42l42: Assume 24-bit samples are in 32-bit slots
      (no commit info)
[8/8] ASoC: cs42l42: Update module authors
      (no commit info)

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
