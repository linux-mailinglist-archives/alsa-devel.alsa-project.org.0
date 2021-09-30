Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3CF41DCEE
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C14B716E6;
	Thu, 30 Sep 2021 17:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C14B716E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014187;
	bh=P3IGvvfLtkYj4sQhVrqizbpeSgN1EKz8MdB6rfmt6VQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WuhQ5/jCJP4j+5OAB8sfPgHkA7t/UIRcqZjmcK5P+xT2cUjENBPElf9wqFoynURJS
	 NmyKih6hn3nG95NzaqedDbD/QleKwtuBcn6u/gWsPAI162Re1pPxUqVzRK5b+UB0MC
	 wMaKejN+6LC3cT+vm2joEOouwsJqfZCmdCy2R3Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 319B7F804FB;
	Thu, 30 Sep 2021 17:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F164F804E4; Thu, 30 Sep 2021 17:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 238E9F804E3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 17:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238E9F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uGEBZQcP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70CA761A0D;
 Thu, 30 Sep 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633014011;
 bh=P3IGvvfLtkYj4sQhVrqizbpeSgN1EKz8MdB6rfmt6VQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uGEBZQcPA1PNmoM+56SzDE1q3OpwENvSX5Q/9eIZu2S7AMG6XA40Srrg5gID6QiTt
 OynBfCZgpxIoUDTxgbMTxnNo0rEqGJjPedWnkMx8jRhTuOYRxgjK+zMMAVqpxPVsZ3
 Y+A3N1PPfBDPzw9unYytOBSLaovrigbowEjugEiG5zLGoMIK12EN7S1t51pfY8Hqkc
 9PFx0qNK9jJavWUD8oG04fthopLSSvPGQFYfhEj8aX3nnogqiiO1zLs41zizFs+C8W
 cKx5dhLOGhJT68/5/xawMntFVV39kZfXapwLJQnaRqv0Qc5Ns6NWoNlzOBDxcaFVq3
 jdeqW5kDR9SzQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH regression fix] ASoC: nau8824: Fix headphone vs headset,
 button-press detection no longer working
Date: Thu, 30 Sep 2021 15:58:57 +0100
Message-Id: <163301248178.43045.235876482448408566.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210929201512.460360-1-hdegoede@redhat.com>
References: <20210929201512.460360-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
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

On Wed, 29 Sep 2021 22:15:12 +0200, Hans de Goede wrote:
> Commit 1d25684e2251 ("ASoC: nau8824: Fix open coded prefix handling")
> replaced the nau8824_dapm_enable_pin() helper with direct calls to
> snd_soc_dapm_enable_pin(), but the helper was using
> snd_soc_dapm_force_enable_pin() and not forcing the MICBIAS + SAR
> supplies on breaks headphone vs headset and button-press detection.
> 
> Replace the snd_soc_dapm_enable_pin() calls with
> snd_soc_dapm_force_enable_pin() to fix this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8824: Fix headphone vs headset, button-press detection no longer working
      commit: 42871e95a3afea8956d8cc567ea725b33a837775

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
