Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041AA3F8812
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 14:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BE2916A8;
	Thu, 26 Aug 2021 14:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BE2916A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629982395;
	bh=VBPfc2RDjlOwkjJSe36MD49TIeYbo9Zp0QSp+FSIjTA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ha92FBac2wYAHYUfcm0JaFL4QA/j2skgVbzDVluXau9dKB+NnabWzPmHj8mqVuTPB
	 QuXSzw1QIVv4L9JakzNqQOwnbeoDBgSRwNj2ZauPcOxbPbFTGa0NqNrXCTp8u5rBFu
	 JT39YCLVH9fkDWEBojAm76YtN4wtEqpsohipLsS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3661F80054;
	Thu, 26 Aug 2021 14:51:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBDA8F801D8; Thu, 26 Aug 2021 14:51:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CFB1F80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 14:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFB1F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bmr+ugHD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5752A60184;
 Thu, 26 Aug 2021 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629982307;
 bh=VBPfc2RDjlOwkjJSe36MD49TIeYbo9Zp0QSp+FSIjTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bmr+ugHDbTZG0ASGgPyRtOStFm5RZWDjXWIsESIPJFXGsK/cNFmIkJyAB4cKXrQT7
 S2KFvEZKP6ZMQYPFW3yjVI2QNXecHzG52TITcMBFFZJ3H90O8aoNoW+Hjh81vvqJjF
 MczwVftp+HpTtoKsDntNgIUpBLPLn2fuq5zVedmOByvwfGUkJuKxChP15RBM2fFg1D
 WTM61UHIgeFFFWsC4CNQ47VJlM8QJDftQoK1Ray+l0ZuJSJK8z+SRBwobewnzGQdvg
 uwQhnjt0YRi39JK1Dw4wUff1soOB+1ZQtBjxxlReWSpdeQN2lqEOTkpofmgI92o87N
 k7NVWGvbdQQ/Q==
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: dwc: Get IRQ optionally
Date: Thu, 26 Aug 2021 13:51:10 +0100
Message-Id: <162998203955.33400.11543058130859225898.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <c857f334e3c9e651e088b675b3938cb5f798b133.1629906123.git.robin.murphy@arm.com>
References: <c857f334e3c9e651e088b675b3938cb5f798b133.1629906123.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Wed, 25 Aug 2021 16:42:03 +0100, Robin Murphy wrote:
> The IRQ is explicitly optional, so use platform_get_irq_optional() and
> avoid platform_get_irq() logging a spurious error when trying to use the
> thing in DMA mode.
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: Get IRQ optionally
      commit: 2fd276c3ee4bd42eb034f8954964a5ae74187c6b

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
