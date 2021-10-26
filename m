Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F443BA67
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 21:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE5F1724;
	Tue, 26 Oct 2021 21:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE5F1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635275388;
	bh=Gk/E5pK7kTnAy9ngQOvmnvKRnxHL1Xj2ImsmZMQXr68=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n4QhlhTNefi46xwHX6Jx2bsFsyvyORvZ3lbVtEf04AyGA0xhRRVKZZgQEipBI62PM
	 +KCCEp7DiEwCs4OG5oSV57hJCuE4jOZjV4MX2O6sRJ4xJ0UoCEDJJLyQ3OOm2wPCpG
	 FJ27CiBTeFhek8toQOWExLEFO6d/18DzSvApcs5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF977F80515;
	Tue, 26 Oct 2021 21:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95DCAF80507; Tue, 26 Oct 2021 21:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 135F4F804FF
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 21:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 135F4F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e54RXcWY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84351610A4;
 Tue, 26 Oct 2021 19:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635275216;
 bh=Gk/E5pK7kTnAy9ngQOvmnvKRnxHL1Xj2ImsmZMQXr68=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=e54RXcWYoR6i1K/7TOTYwCjIjFo7TIBtXnUsM4ATboPpJBNNnr+VaBVYoJECPnkwg
 epNzwH5IMIVq9F/zSv620iGNRuqZ89TSbDYSG28IrO8OaDKU0F8IpzBVhny4OinQnP
 aAIv09q4WVDYMwGH39Rxhy+keJ0sSGB3hETkn8sIdKKTi1YGPp7kzAYIPNY+gKFL4a
 Pb0DR3Us5GfrofDfkFYS47sYzJEU8n92XqDH5wIkNIasXuXYafD7kmqHUfZcEO2ay9
 XS/Ics2mjOq06Ur0WJbCEgNtsIxdGAJCR/kuvEegpe+Uf43vSYhhP8JTKdxuVRCpz5
 n17A8c4KVzF9g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20211026125722.10220-1-rf@opensource.cirrus.com>
References: <20211026125722.10220-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs42l42: Fixes to power-down
Message-Id: <163527521527.2033755.16584543049697234503.b4-ty@kernel.org>
Date: Tue, 26 Oct 2021 20:06:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Tue, 26 Oct 2021 13:57:20 +0100, Richard Fitzgerald wrote:
> Driver probe and remove were inconsistent in what they did to power-down
> and neither did all steps. In addition to that, neither function
> prevented the interrupt handler from running during and after power-down.
> 
> Richard Fitzgerald (2):
>   ASoC: cs42l42: Reset and power-down on remove() and failed probe()
>   ASoC: cs42l42: free_irq() before powering-down on probe() fail
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs42l42: Reset and power-down on remove() and failed probe()
      commit: 6cb725b8a5cc7b9106d5d6dd5d2ca78c76913775
[2/2] ASoC: cs42l42: free_irq() before powering-down on probe() fail
      commit: a10148a8cf561d728c0f57994330b2da1df35577

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
