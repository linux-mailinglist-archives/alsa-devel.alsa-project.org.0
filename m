Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA2430297E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 19:04:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 477B017F6;
	Mon, 25 Jan 2021 19:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 477B017F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611597883;
	bh=XauW+yiq9PtiLTCRxGls7vBx60Zpm0LmrZUr+oXBxRo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXSOp10nl+18i9KW9s9mjo8SZ1PPbQA0TEM52LNOKPYIBUvIfo8i18FSksCSZN2rN
	 kicYVv2tnR2GdKLuQXnIxSeNtSbXIa5rre3qUP3rpqadfUO4K3HgGq2n6ad5qI5Hd9
	 jgcoTrajSDq9uoylYjdZ36rra4Gjm+5lDWn3JKik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AA28F80130;
	Mon, 25 Jan 2021 19:03:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51EE7F80259; Mon, 25 Jan 2021 19:03:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91E15F80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 19:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E15F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iyq9f8V8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A997522583;
 Mon, 25 Jan 2021 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611597782;
 bh=XauW+yiq9PtiLTCRxGls7vBx60Zpm0LmrZUr+oXBxRo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iyq9f8V840omIGOnw2ZyP+t+wGGLaWsJi36buJoF3okaMAmncHZjs9AC21hcRAElb
 yqTDVa30Jw162sTNEl3jiFgoyB5JJ9mEXIWfw9eMEENGZpBHz9npyz4RvpoayfKf21
 Teo47zlSRs0sgrFb9dH7lyy1RIbcV0iBG3nHJ0InaCIwAEkuco4dxzgd5VUu9aEJWt
 0gF2YTKOOPQqdQLzvuXd/PDfkbEeaiQTstPPYUsavZQ0pMoQuaDTgCsMI+Blq/a0mq
 Ky9bPMrzekERI75Gc8ep0meyQaGuSw0GlLZlLgAPYmWY+sIvpGn0MUQ7pV8h/PJZ6b
 gzMpXxZM7rWEw==
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Geis <pgwipeout@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] Clock and reset improvements for Tegra
 ALSA drivers
Message-Id: <161159774049.2212.2964424673309683521.b4-ty@kernel.org>
Date: Mon, 25 Jan 2021 18:02:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Wed, 20 Jan 2021 03:31:48 +0300, Dmitry Osipenko wrote:
> This series improves the handling of clock and reset controls of
> NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
> resets properly, which needs to be fixed in order to unblock other patches
> related to fixes of the reset controller driver since HDA/AHUB are bound
> to fail once reset controller driver will be corrected. In particular ALSA
> drivers are relying on implicit de-assertion of resets which is done by the
> tegra-clk driver. It's not the business of the clk driver to touch resets
> and we need to fix this because it breaks reset/clk programming sequences
> of other Tegra drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/6] ASoC: tegra: ahub: Add missing resets
      commit: 24a41a38dd2df065ee942221c2fae5e314770865
[5/6] ASoC: tegra: ahub: Use clk_bulk helpers
      commit: 6d8ac9b1dd2f138f4aa39008994600f561eeede8
[6/6] ASoC: tegra: ahub: Reset hardware properly
      commit: ed9ce1ed2239909c23d48c723c6549417c476246

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
