Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56556866F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09AC716D7;
	Wed,  6 Jul 2022 13:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09AC716D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105787;
	bh=4zHuh7F5byl2nEPHnYTUbXvbtKodYNHadkpLFgUS4D8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DlkXLR/CAOGDqb/uDPB4DNK4QskxjIFR0EbC9Q6bkflYWpR6XnsZvRytaI0zOo7uJ
	 a/zYxE9RuCkULHVVMgCKBfaPqqIrXb+8XTDL9CfLKq3SkRpMWwMR/CS4kv71p1XDPO
	 ypkBN09+oJ/UoZ1HUG37NQOQ4UH7NxwHs5sQYCYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D07C0F8053E;
	Wed,  6 Jul 2022 13:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17279F8023A; Wed,  6 Jul 2022 13:08:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A4CF80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A4CF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hYxx8Teh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1E48B81BE6;
 Wed,  6 Jul 2022 11:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461D8C341CA;
 Wed,  6 Jul 2022 11:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105676;
 bh=4zHuh7F5byl2nEPHnYTUbXvbtKodYNHadkpLFgUS4D8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hYxx8Tehs7AmPsTysQ6czl9Kxyix/jOttDeKm8zJyZGMw/nRLfXlG4CexEZYiMTpl
 spfMy1sybYG6UUHOETIJBE2RiqHuSk5p5YTSqpKwUIH7+dni69ipqZCVpE3bUf60aG
 GNIyTtdTFW7tSwSsfeBnApKSCGc7I6iJh0rKk5rApl6PujvQ89TLY8a4ERnvccQPzp
 hIHZhdeTniLkDq3NW9uTUPwWtsMm0QAMqvMOCiYkqDsK8rBRwl6kO3GQkRrlyvGge9
 qMsW101toZmR9EfuR/l/IoNMTGTBYdArbWSXcmgQDqNaS6piqBBhzToh4DG3m/tFll
 zKXIeNGLD5z8Q==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, judyhsiao@chromium.org
In-Reply-To: <20220701021427.3120549-1-judyhsiao@chromium.org>
References: <20220701021427.3120549-1-judyhsiao@chromium.org>
Subject: Re: [PATCH v1] FROMGIT: ASoC: rockchip: i2s: Fix error code when fail
 to read I2S_CLR
Message-Id: <165710567400.237380.4691352154008052318.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:07:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 briannorris@chromium.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 1 Jul 2022 02:14:27 +0000, Judy Hsiao wrote:
> Add the error code '-EBUSY' when fail to read I2S_CLR
> in rockchip_snd_rxctrl() and rockchip_snd_txctrl()
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] FROMGIT: ASoC: rockchip: i2s: Fix error code when fail to read I2S_CLR
      commit: 0ff9f8b9f59208332c6707e37d5739c57c7f7bce

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
