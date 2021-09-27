Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA0419DA1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4064916D5;
	Mon, 27 Sep 2021 19:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4064916D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765274;
	bh=aUc+zyFHvKotL7XMRR0gR+GFJscCWTFpWDXIZLrv3a0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lkj7k8q8nKmtMWN6xeOyWsKim5OKbLvCYI9tdjQwTrTLcAE+mnydYrLMWbCSIpmHO
	 PKwVGkSgTILP2VmkBNXLeSt0j1PwMoZjhoFi5wAXwRXWEz3trubvZFgVBTBm/sMItj
	 sRDqXHW83Yks8CR//G5GE6vbpaKwAWldgf0TRCEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A798F80568;
	Mon, 27 Sep 2021 19:48:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833D3F80552; Mon, 27 Sep 2021 19:47:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E2FF80548
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E2FF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f8oPtOrB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8833460F44;
 Mon, 27 Sep 2021 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764872;
 bh=aUc+zyFHvKotL7XMRR0gR+GFJscCWTFpWDXIZLrv3a0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f8oPtOrBuUZl6crgegUvEW7e51EtYo81dUIPAabgcNbMpWjcCPetO2Q7TKk3l7AMp
 nWsdGmuY7JajTsRm0D4cGzN0BMf7tTYesV2lqr5wPJWzNohQeMB8MvwHBg4jOgxWsh
 MmxBC+GtRVsHG2WbekVdmkg8ObcgG8uCTmpshrUBYiD0StXmoiUQwAKKRO+ud2Poia
 BvlNknz/pVE9zoR8T+N5F0UsKIbCOvOsRa9Ci4pmSxuVfz9+7U1SCDXofO6JcTbdvL
 8FAjLMlzyBMkpoXNVwqbtcEL5VQw5N9hucmBe2xqt9ni0vuKQVsZCz2gcQ509KQkV9
 jMq1y3I9mznTQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: cs4341: Add SPI device ID table
Date: Mon, 27 Sep 2021 18:45:42 +0100
Message-Id: <163276442024.18200.9528961029806627172.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924194844.45974-1-broonie@kernel.org>
References: <20210924194844.45974-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

On Fri, 24 Sep 2021 20:48:44 +0100, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding SPI IDs for parts that
> only have a compatible listed.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs4341: Add SPI device ID table
      commit: 0cc3687eadd0971d5d38ff90d14819d88f854960

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
