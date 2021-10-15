Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89442FC62
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 21:44:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51AF41893;
	Fri, 15 Oct 2021 21:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51AF41893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634327060;
	bh=nVzXQkZBYKWiFaY5dIif/rYIgKFlM3GSbal80h2WHSE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WVZ8tdmaVyk6Yz5zsYdCVVVp8jxDALnVICejCTY68YJCivr/titbgkbQrKHlIMt6P
	 YueNpxPtgEqAx3bVVBGVwS6NY0Ze4+vJSS6xXGIzraqy+eRZqzr0oULLlhEsH0bN77
	 BjHRxlXG3ql0sD1OStyEs8Gm6fpdGT9N7J8k5RDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C81F804EB;
	Fri, 15 Oct 2021 21:42:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C119F80269; Fri, 15 Oct 2021 21:42:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39E32F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39E32F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P6K/6Yrq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 338CC604DC;
 Fri, 15 Oct 2021 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634326933;
 bh=nVzXQkZBYKWiFaY5dIif/rYIgKFlM3GSbal80h2WHSE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P6K/6YrqdDKjqnkgL84oU+t/mI1z2PxTzKqAoP/7qwy7EMj31MD7FyXGUsJ7olKS+
 h7RQFRea3OLX8SbiNf+mIQwVSwysnRnCka5QXL3wdJWRnUYLo2EYpfiK5t8CGi6HdH
 hGCcMgBS3dwRx2EJukYvGOtnGn2flLFmUeJfybcp4YoQPsdB5rMIWuI7ULNxRf9BjQ
 WRi1JZl6KZ8bc8ohKzEcAIaWS9kXNb9mRBXLAa9sV6N875Nbjr0iJEL/Jdk+5FHEDW
 mXkSggjp6mcHyZHZcCez7SSEaElQcdMwmv8cIU2kIcbVDfye4IiPlgGINgEkemO0tp
 q2ptNvY+3pPbA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 00/16] ASoC: cs42l42: Collection of bugfixes
Date: Fri, 15 Oct 2021 20:42:01 +0100
Message-Id: <163432688461.1314975.13627167617327802715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
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

On Fri, 15 Oct 2021 14:36:03 +0100, Richard Fitzgerald wrote:
> This patch set contains various bugfixes for the cs42l42 codec
> driver.
> 
> Patches marked "Fixes" will apply cleanly to the patch that first
> introduced the bug.
> 
> Patches NOT marked "Fixes" will not apply cleanly to the point
> the bug was first introduced and/or the bug is not having
> sufficient impact to risk churning older code versions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: cs42l42: Don't reconfigure the PLL while it is running
        commit: 06441c82f0cd836402ca5fa4162d28ed07cfb0ed
[02/16] ASoC: cs42l42: Always configure both ASP TX channels
        commit: 6e6825801ab926360f7f4f2dbcfd107d5ab8f025
[03/16] ASoC: cs42l42: Correct some register default values
        commit: d591d4b32aa9552af14a0c7c586a2d3fe9ecc6e0
[04/16] ASoC: cs42l42: Don't set defaults for volatile registers
        commit: 917d5758014b37cf97b946dd130aad9353c354dc
[05/16] ASoC: cs42l42: Defer probe if request_threaded_irq() returns EPROBE_DEFER
        commit: 0306988789d9d91a18ff70bd2bf165d3ae0ef1dd
[10/16] ASoC: cs42l42: Don't claim to support 192k
        commit: 2a031a99428bafba089437e9044b8fd5dc6e7551
[11/16] ASoC: cs42l42: Use PLL for SCLK > 12.288MHz
        commit: 3c211cb7db2905221f9f006aa66b8af17bfcd480
[12/16] ASoC: cs42l42: Allow time for HP/ADC to power-up after enable
        commit: 4ae1d8f911d6fc20baefd5eb061bf6964fa22a32
[13/16] ASoC: cs42l42: Set correct SRC MCLK
        commit: fdbd256175a1e11c1ba827112d56b9a3952e1219
[14/16] ASoC: cs42l42: Mark OSC_SWITCH_STATUS register volatile
        commit: 0c3d6c6ff75aa6b21cd4ac872dd3050b6525c75c
[15/16] ASoC: cs42l42: Fix WARN in remove() if running without an interrupt
        commit: 4c8d49bc476c7cf1fb7377b469ced43ced470027
[16/16] ASoC: cs42l42: Always enable TS_PLUG and TS_UNPLUG interrupts
        commit: 4ca239f33737198827c7f4ac68a1f6fc8a9d79ba

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
