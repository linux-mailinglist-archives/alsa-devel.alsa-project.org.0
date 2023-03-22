Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C2D6C4F66
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 16:28:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6FAE97;
	Wed, 22 Mar 2023 16:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6FAE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679498883;
	bh=zwonRpO/jtxiqUlH9toLzBW9ukR3Kw3dVD9+S37LNxA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MSzpmWx3iyts+pombaElQEeJ4B4pOgG/BsaWb0MsU8suLjwqwWLTZSdoRs44cpJ9u
	 Sz347uV9diNRXfRGf1XW+Brz3werHnJO3AF6U6LAIgvr/P1tTpyzzWugGBq9caYWkM
	 gPcVsFMlL1RPt5e3xx3blC1Yo1EiQAzVLJG7KK6Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B27F80254;
	Wed, 22 Mar 2023 16:27:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34FADF8027B; Wed, 22 Mar 2023 16:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B620F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 16:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B620F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ock0o7vu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59EBE621A2;
	Wed, 22 Mar 2023 15:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CA1C433D2;
	Wed, 22 Mar 2023 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679498820;
	bh=zwonRpO/jtxiqUlH9toLzBW9ukR3Kw3dVD9+S37LNxA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ock0o7vuu6KpsUoh3iKnHoCYqthTeaMXvzGtnuPT3rCfkx0GhKNFSCsIfo45g5S1D
	 W2WKK7VPSPEclP3kR2CYOS1tx/lZqEZCaXExFK3MBF21ORq5w7O5mi88MLsZzAAQOw
	 cSTpA7hn9E3Qc/k+Px757ReimVgddfeNTSdIFIt4HVBSHbwQewjEvuDxBbAvw8UvUx
	 AWYTtcJD/xqEk3ZrviDP44/Pox1SwOztiwasgFU6ZhTmyByC9Wh4jOBTXU+y1733TN
	 K1WiVTQy5JkHtRronP/M6WwQC9Vk8xLFLYEzpFk/GSCSEfJdQQVyD/kFE6il7rUTwg
	 hp8wFAn0X5oTA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
References: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Message-Id: <167949881866.1073499.8192433624844938877.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 15:26:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: UEW4WS6DSEZ3N7YUTTUYGYEBJBNFTBBD
X-Message-ID-Hash: UEW4WS6DSEZ3N7YUTTUYGYEBJBNFTBBD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEW4WS6DSEZ3N7YUTTUYGYEBJBNFTBBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 Mar 2023 11:26:51 +0200, Peter Ujfalusi wrote:
> On a platform when the DSP is in use, we cannot select individual links to use
> or not use the DSP, it is either all or none.
> On some audio endpoint, like HDMI/DP, it is preferred to not use any processing
> in DSP to reduce the latency and to allow bytestream pass-through (DTS, DD, etc)
> 
> IPC4 introduces a new type of end-to-end connection within the DSP which is using
> the host DMA and link DMA in a single buffer, working back-to-back, passing the
> received data without looking at it or trying to understand the format, content.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: topology: Set pipeline widget before updating IPC structures
      commit: 3d3e223f09ed59f7a47d27cf4301b4d0d5c7fc3d
[2/3] ASoC: SOF: ipc4: Add macros for chain-dma message bits
      commit: cb3cdef33136baceada86ba2a21ba30cd53a9087
[3/3] ASoC: SOF: ipc4/intel: Add support for chained DMA
      commit: ca5ce0caa67fa9eeecaa29d895c2e4c3151c159e

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

