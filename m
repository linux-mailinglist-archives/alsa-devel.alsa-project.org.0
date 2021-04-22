Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAC368539
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 18:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF03442;
	Thu, 22 Apr 2021 18:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF03442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619110269;
	bh=ymvNTAzPs1hJfdICUfxeM0TUkETJ86MqJiCa/fX97No=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ke4AQffpk4mBeNzYTwz55JL4S5SwVAiPeHiSuf3zAWSVe6lZhjOIP0lZ+Lq0yfe0a
	 9pM0zbfGYcV5oh4SLypcxvpF7LZfd7cvtVivmlGxrHslC/OYd5U6GGyOpRzZm5lV5f
	 1GDPQL2vB0qNWw93KkWqaSkNnoI3MkpSjZY3yRV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 431ACF80273;
	Thu, 22 Apr 2021 18:49:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41B12F80059; Thu, 22 Apr 2021 18:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE716F80059
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 18:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE716F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JcVRN0HO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6AA961421;
 Thu, 22 Apr 2021 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619110169;
 bh=ymvNTAzPs1hJfdICUfxeM0TUkETJ86MqJiCa/fX97No=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JcVRN0HOh/N7pfhQKYAfWAuDuB+A3C1DkW+QraKzS+7yuOVOghfzbwdEnsSKfsVA/
 CJPKRdO25ZGIS5UMnTMTNq5x3aMJzvZII4QDrGubi05uD9VxmDAJaN2Xtqfnuyj8KB
 sXI9ZW/xw6Z8rp26qkxcEpUAA3WHBNuqbelNuYE2GAyUH+CfXKfe53qUdo+wdLGwqr
 DK3TtI/fJF9Dal0Hi2Q0fsKLPsVChd/A+kdgryHFCvLbzrd8hDmJNKO9xUcRo0CnWk
 6tlg/qAlf3J3XrpY3her/Ny13MAA7M9iUe5spvvn7RrKdWSZpLOk1M1o2tNJNuae2P
 FSRKgEP+I2mNg==
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: mark runtime-pm functions as __maybe_unused
Date: Thu, 22 Apr 2021 17:48:48 +0100
Message-Id: <161910991989.37460.309965109490904776.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210422133418.1757893-1-arnd@kernel.org>
References: <20210422133418.1757893-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Qiushi Wu <wu000273@umn.edu>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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

On Thu, 22 Apr 2021 15:34:00 +0200, Arnd Bergmann wrote:
> A reorganization of the driver source led to two of them causing
> a compile time warning in some configurations:
> 
> tegra/tegra20_spdif.c:36:12: error: 'tegra20_spdif_runtime_resume' defined but not used [-Werror=unused-function]
>    36 | static int tegra20_spdif_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tegra/tegra20_spdif.c:27:12: error: 'tegra20_spdif_runtime_suspend' defined but not used [-Werror=unused-function]
>    27 | static int tegra20_spdif_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tegra/tegra30_ahub.c:64:12: error: 'tegra30_ahub_runtime_resume' defined but not used [-Werror=unused-function]
>    64 | static int tegra30_ahub_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> tegra/tegra30_ahub.c:43:12: error: 'tegra30_ahub_runtime_suspend' defined but not used [-Werror=unused-function]
>    43 | static int tegra30_ahub_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: mark runtime-pm functions as __maybe_unused
      commit: ccd4cc3ed0692aef8a3b4566391c37eb168d8d32

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
