Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2777322CB38
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 18:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86FC6167B;
	Fri, 24 Jul 2020 18:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86FC6167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595608815;
	bh=/dpiFz2l5O+PCf1PxK2zR0IuHD/tsdryFmScoFmGFao=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xzlrm3sbNy1PJS9kJhwrmb9baTP7xTkvuSevoDYC4jhm1j2WDM+7oOLF1npe2sbbV
	 diXZEZzfltUGVc9SMaWICLsRjyd1qgiJYEHhVCOdCPAum2+ZugXo2E7cUKGqAykzSk
	 6BehDqzSvWb/AdLmZ496X+86tlF/B5YiEdfxyDyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB32F8011F;
	Fri, 24 Jul 2020 18:38:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 961A8F8014C; Fri, 24 Jul 2020 18:38:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAFB4F8011F
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 18:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAFB4F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ht6Cxb2w"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20A34206EB;
 Fri, 24 Jul 2020 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595608707;
 bh=/dpiFz2l5O+PCf1PxK2zR0IuHD/tsdryFmScoFmGFao=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Ht6Cxb2wGBnVsR2nT9pbEru6D/EKRg3+CKzmkcb8IdaXMICv6rpYnXRZv4yOOAg5E
 lL2kx25CkZ5rOHzObMamo5G44RN0sTaQ52XA5jF6oVyUQT8ElwHd6VRSPcOPCTYQh/
 k/PUTtjVgVn9JLhvHiKIssIn0l01ZKmcoJbi42Hc=
Date: Fri, 24 Jul 2020 17:38:12 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200724070731.451377-1-tzungbi@google.com>
References: <20200724070731.451377-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: dapm: don't call pm_runtime_* on card device
Message-Id: <159560869258.13885.2587647460945976195.b4-ty@kernel.org>
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

On Fri, 24 Jul 2020 15:07:31 +0800, Tzung-Bi Shih wrote:
> runtime_usage of sound card has been observed to grow without bound.
> For example:
> $ cat /sys/devices/platform/sound/power/runtime_usage
> 46
> $ sox -n -t s16 -r 48000 -c 2 - synth 1 sine 440 vol 0.1 | \
>   aplay -q -D hw:0,0 -f S16_LE -r 48000 -c 2
> $ cat /sys/devices/platform/sound/power/runtime_usage
> 52
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: don't call pm_runtime_* on card device
      commit: 3aecfc72d7ad73330e7a6ebd0005738a8fd417ab

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
