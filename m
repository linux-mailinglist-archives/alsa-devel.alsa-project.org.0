Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644645632E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 20:08:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E4317F6;
	Thu, 18 Nov 2021 20:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E4317F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637262527;
	bh=x/8W7Lu2kSw6qOUXMhXb4en3vbd9NS6PLiCqwX2Q9lg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IeCKBfR9QyDfaga1vLWE1GFCGTN6d3RzRUTMkN4D9fgH0uDJyXjRwazhZlhnws7ay
	 n7cDIZNS/hiCB40z8R5+00jXrvOt5iFzUyHsA/GXYyr9pPuGDh31zi7uKhU4gAzD5s
	 1w/A/yVRKdOHfM1F53fx7Lm2QKWdliUrUdPJrLV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17BBF804EC;
	Thu, 18 Nov 2021 20:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C052F804C3; Thu, 18 Nov 2021 20:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 779A2F800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 20:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 779A2F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GwpYSB7X"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1593061179;
 Thu, 18 Nov 2021 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637262370;
 bh=x/8W7Lu2kSw6qOUXMhXb4en3vbd9NS6PLiCqwX2Q9lg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GwpYSB7Xjn+qX66MvdErOtoL7HF3luTcERkkl9YJFgWm1ZAaa/x13N0smopzX2+dl
 BsQFpKz/gMul0bivrEG3dI8vXcSG7sGkBSPLLAGQv6eXUKvSIS2ZM5vKkzauNhTBum
 UW7mqmmnSPToCQrzWgVDDBuyUll7f/4f92aASGAYPHdUz5c1fL+J+OhDMNusJx60Rc
 aNpLV7qefXTyJwxwWxhLfU61Dhmo6acnGUrdOR2CNMrP1fYsc7pir1vHI91shsH8CQ
 GdFVzH44VJyE9ZgF3kaoGsJosTbfm5OG0wsKuOc8SSA6r/HLmQyU69GBiEGic6HzrG
 mzBEVk7EtD5Pg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: Add support for Mediatek MT8195
Message-Id: <163726236782.96213.13499504169654230804.b4-ty@kernel.org>
Date: Thu, 18 Nov 2021 19:06:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-mediatek@lists.infradead.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

On Mon, 1 Nov 2021 10:00:20 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> 
> This patch series adds initial SOF support on Mediatek mt8195 platform.
> MT8195 has four Cortex A78 cores paired with four Cortex A55 cores.
> It also has Cadence HiFi-4 DSP single core. There are shared DRAM and
> mailbox interrupt between AP and DSP to use for IPC communication.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: mediatek: Add mt8195 hardware support
      commit: 32d7e03d26fd93187c87ed0fbf59ec7023a61404
[2/6] ASoC: SOF: tokens: add token for Mediatek AFE
      commit: e6feefa541f309afed8aa54431681261bc57bcde
[3/6] ASoC: SOF: topology: Add support for Mediatek AFE DAI
      commit: b72bfcffcfc11858a8fc92998733372606db485e
[4/6] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware
      commit: b7f6503830cd8f3f7076635409460861b5ff6310
[5/6] ASoC: SOF: Add mt8195 device descriptor
      commit: 24281bc2bf1884e665dfbcd17aaaabbc5872e501
[6/6] ASoC: SOF: mediatek: Add dai driver dsp ops callback for mt8195
      commit: 24d75049c5ed5193bd12ce0d43c355c4ef74a7fa

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
