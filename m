Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0E248CA0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:12:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00B81740;
	Tue, 18 Aug 2020 19:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00B81740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770728;
	bh=C7CLmTRDuo1Am8syaTB05mD0CZGXECeviyZKIGQlC74=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nqI1T7C/IBaJRqC/uuy+c1ORJaiZwStmz/aCHC+PToTDnGrFY5L8zexGHDZ+r0IGd
	 /iwmXXKplgjwSPziC6YHMCqLRpF6phVh0lO6z2WRi/DDZFwoch0wEHytQHUp6MOe8Y
	 PjS7RohyH5SGpgSvWVu+5rBta2DxZFl7jnSJEcf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4302F803CB;
	Tue, 18 Aug 2020 18:56:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F43CF803CD; Tue, 18 Aug 2020 18:56:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951C0F803BD
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951C0F803BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h18P64vx"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68DD320866;
 Tue, 18 Aug 2020 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769792;
 bh=C7CLmTRDuo1Am8syaTB05mD0CZGXECeviyZKIGQlC74=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=h18P64vx+aVCi4pv8eAKhyxO1PkGkHFKn5RNVAac/fhL7R/GKtWYVATBX34ba5zo7
 renVjb9DJSvESmFX4JBjVeaGOOm3HfqCHeGi0/df0EE8Vfddf9pUkJoF80zunS7RFf
 emsK3u1UEJR6WRSvIOEhy6N57I72ojLbx80eXIpE=
Date: Tue, 18 Aug 2020 17:56:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20200804000531.920688-1-swboyd@chromium.org>
References: <20200804000531.920688-1-swboyd@chromium.org>
Subject: Re: [PATCH 0/3] ASoC: rt5682: Use clk APIs better
Message-Id: <159776961931.56094.13706014566883693653.b4-ty@kernel.org>
Cc: Shuming Fan <shumingf@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Mon, 3 Aug 2020 17:05:28 -0700, Stephen Boyd wrote:
> This patch series drops a printk message down to dev_dbg() because it
> was noisy and then migrates this driver to use clk_hw based APIs instead
> of clk based APIs because this device is a clk provider, not a clk
> consumer. I've only lightly tested the last two patches but I don't have
> all combinations of clks for this device.
> 
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Shuming Fan <shumingf@realtek.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rt5682: Use dev_dbg() in rt5682_clk_check()
      commit: 0b95aa8e8afa4bcd49c8fa36404e2deb02a947ed
[2/3] ASoC: rt5682: Drop usage of __clk_get_name()
      commit: edbd24ea1e5c72980b37ae2d271696b05274d509
[3/3] ASoC: rt5682: Use clk_hw based APIs for registration
      commit: 653bdab267bd8dbce9cbd16bec843ca9d20a8450

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
