Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2FF4BDA87
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 16:25:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4DC81734;
	Mon, 21 Feb 2022 16:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4DC81734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645457133;
	bh=61j2DG9XsjT6XMPvA8okjWZ5trrMT2Q8ZLz9fkWalkI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kM6eODZcoGPJre4h8WoDTG0/uY/932VzeFKVT5ePxLIHoVWJFhoSmabOtRghsf87f
	 5h+V3GNE0JkHzWRoM4VHWvBI9vBsJ8n75LQxkyT3EjhNZwW+8HWXwbhZik6TWb/iCD
	 FZWaBzKcn9uhRTsI3+hCQoIGwtHubApvAyCH98gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F583F80425;
	Mon, 21 Feb 2022 16:24:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C17A0F8013D; Mon, 21 Feb 2022 16:24:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86791F800FA;
 Mon, 21 Feb 2022 16:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86791F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rPXIGliS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3740B811F9;
 Mon, 21 Feb 2022 15:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEDEC340E9;
 Mon, 21 Feb 2022 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645457058;
 bh=61j2DG9XsjT6XMPvA8okjWZ5trrMT2Q8ZLz9fkWalkI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rPXIGliSXsd2BgfOyQQQhlXqEN46OgFAjIs5HNM3FQl44c+7IB5PJdBOX2+a1rF51
 547imM4xzdjobpmrsTtqnaDe5Hrm0OPoKbQWjFqTfED9FRnLSVPaHzYEw9vH4f6hsr
 enFX7ObBCDsUdKY9OwEnsyl57Tdsp/iOmX7UlpCNaZYnhPgP9jGn97TVIfrKxtyEe3
 9w2IV1AdL8dL/7C5nfSjyTJaajh+6J5jznpUTT39IjOE03MmrscguWA6fH/HVRML9S
 HPlszUDLDPADY6PSOEz4K5gRcWRJf/NjQVQhPKBi8TwMM+yln/6K1pqY00wqMKc8kP
 gGXJgfPSjazjg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <20220218082741.1707209-1-brent.lu@intel.com>
References: <20220218082741.1707209-1-brent.lu@intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Add topology overwrite for Felwinter
Message-Id: <164545705583.730905.504549990237487794.b4-ty@kernel.org>
Date: Mon, 21 Feb 2022 15:24:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

On Fri, 18 Feb 2022 16:27:41 +0800, Brent Lu wrote:
> From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> 
> The Felwinter uses four max98360a amplifiers on corresponding CH0~CH3.
> There are four amps on the board connecting to headphone to SSP0 port,
> amp to SSP1,and the DAI format would be DSP_A,8-slots, 32 bit slot-width.
> 
> CH0: L(Woofer), CH1:R(Woofer), CH2:L(Tweeter), CH3:R(Tweeter)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Add topology overwrite for Felwinter
      commit: b9afe038b1fba24e815000606d5877de97f9f154

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
