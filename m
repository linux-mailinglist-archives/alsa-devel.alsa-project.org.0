Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7E3D2AD9
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 19:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C296C1708;
	Thu, 22 Jul 2021 19:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C296C1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626973971;
	bh=wDaHHscThEWC8K6B4wuYHQc+xyB2BVkHsjvEDq1D9Tw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ujX9zR27x7VDNhHAm3kJWj/XKB+z2i3SBW3iWIMC5T2dr9NOkZPtU5ctlv/Aw3zl/
	 OpcVIYcYjQhKQctimeH+gwbNsK5y/hJVL5w3EXi9/ZmnUnd33uwgq7lRhb3286Dplr
	 HVIpZ2PXKXRzXUEnVp2amDDLZQ0vtaBlg4zOyFQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F211FF804E0;
	Thu, 22 Jul 2021 19:10:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74E91F80423; Thu, 22 Jul 2021 19:10:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE66BF800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 19:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE66BF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gtoSRNBy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADE5E61183;
 Thu, 22 Jul 2021 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626973825;
 bh=wDaHHscThEWC8K6B4wuYHQc+xyB2BVkHsjvEDq1D9Tw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gtoSRNBycnMVb53UygZh9kdS3XgLjzPdNq81190IZm7uHKV5aO1vCJw8LFfhBpKr7
 08atPhc/pOCDxc7u8RP1QEDHr6pIdRCLZlsZV2IVL85vmH81T8wi/YM8XEZwE7IPvg
 3pY+PjLRsvTLq7O/G008WIRNVQCYGPE1tELa+oz1s2fhyD7U08ETICMtkD4KZNfEgs
 OOrx/rsocWbef+StyIuPG6pDoD0E7HYJIwLeYyymzQI0w0v85uDjvD0TzokOKq5cUC
 1faSxW3of9pGMl1yt1Xr319cGKZvqCK7GNVGPDXbG/6raERY3AH13QzO4kWROvuU/1
 8V9wrRlaoQz8A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v5 00/12] Add Vangogh ACP ASoC driver
Date: Thu, 22 Jul 2021 18:10:00 +0100
Message-Id: <162697068327.1747.6728778450187644611.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
References: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexander.Deucher@amd.com, Mark Brown <broonie@kernel.org>,
 krisman@collabora.com, pierre-louis.bossart@linux.intel.com,
 Sunil-kumar.Dommati@amd.com
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

On Wed, 21 Jul 2021 23:34:16 +0530, Vijendar Mukunda wrote:
> This adds an ASoC driver for the ACP (Audio CoProcessor)
> block on AMD Vangogh APU.
> 
> Changes since v4:
>          - Fixed indentaion issue
>          - Fixed error handling
>          - reverted hex notation for macros
>          - Fixed typo error in Kconfig file
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: amd: add Vangogh ACP5x IP register header
        commit: 7bf060d0d579129e5f405d2300fbaa5222e3d1cb
[02/12] ASoC: amd: add Vangogh ACP PCI driver
        commit: 4a7151c9688cc166ff6bf5a1a00e3cee429a2f11
[03/12] ASoc: amd: add acp5x init/de-init functions
        commit: 5d9ee88a10e854c5c43e0ae6b1bb0ff454cd45d1
[04/12] ASoC: amd: create acp5x platform devices
        commit: 603f2dedccac1ae2d201dfb10df74f3cae3c7832
[05/12] ASoC: amd: add ACP5x PCM platform driver
        commit: 77f61444e48b79e991b15da6399cf24685a042c9
[06/12] ASoC: amd: irq handler changes for ACP5x PCM dma driver
        commit: fc2c8067c76b3f322447491efb9837f051e86c69
[07/12] ASoC: amd: add ACP5x pcm dma driver ops
        commit: cab396d8b22c13b424d9ba66f626f036f802658c
[08/12] ASoC: amd: add vangogh i2s controller driver
        commit: e550339ee65226b059b4647f12c16710181e36b2
[09/12] ASoC: amd: add vangogh i2s dai driver ops
        commit: b80556addd1a0db551a0c82fb9651e502ac0119b
[10/12] ASoC: amd: add vangogh pci driver pm ops
        commit: b0a37ac6782fa0a62cf90e40e81e01728b07922a
[11/12] ASoC: amd: add vangogh i2s dma driver pm ops
        commit: 361414dc1f07b72f2f6942fca60f2f158c022a6d
[12/12] ASoC: amd: enable vangogh acp5x driver build
        commit: 08413fca62c63ccd245d20985460759c84499ebc

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
