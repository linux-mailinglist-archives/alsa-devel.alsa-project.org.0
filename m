Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 588B0561ABE
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 14:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E3B16A3;
	Thu, 30 Jun 2022 14:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E3B16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656593392;
	bh=joKbTELu6hfvzcnfhQbg80CH7lGuvl4e0eRNBxTN5D4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snrr8MaBzsL7KURCEZW2ciCU3jDt5nAS5yg4OfC2ET9oth2QLR/zHkB/hcaFw0YFU
	 i5g29klyDBYcSdh9h9t6zuCix/diFhUbHtUVKojcAVGtFrP13gLgLyV3cTj7NqfHuD
	 I4V44WLX0LvQbj4+bbOU+O5BFlF1zjWCIzHgUBXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23880F804D2;
	Thu, 30 Jun 2022 14:48:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 440ECF804DA; Thu, 30 Jun 2022 14:48:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8C5AF800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C5AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z2BeB0mv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27FB361EA2;
 Thu, 30 Jun 2022 12:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C6BC341CC;
 Thu, 30 Jun 2022 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656593328;
 bh=joKbTELu6hfvzcnfhQbg80CH7lGuvl4e0eRNBxTN5D4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z2BeB0mv23BtGIANeiFMGog6uCqxPx/6Tldn1Tb6BIRFblDI7i9qTfx5CfhQNtRGQ
 lH6m5okdm6VwhrGa/8W3/Gb6+UpGlrcnTLogtRL6ogRMoXfOMERo7ZN13UU5Vwdn9u
 TS7YKBq95KNRvnmTFzvfABmLMe/AhqYSOdfHqguw1hmdmXlhaMtC+iPilFGtxOPby9
 JUsHJUuhcmpRCrFZXtdHLk92j0oUmiPCvF+Bn2Zbs67hZlniVoaKgDecplprN1QyDN
 n55/qMbov26pOpx1a7jDWSQwDinFgCqQGKgZg/8yv1bwnT5AUkoSeN2nvsVz656Z3+
 2BacziQhH7rng==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, povik+lin@cutebit.org
In-Reply-To: <20220630075135.2221-1-povik+lin@cutebit.org>
References: <20220630075135.2221-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 1/4] ASoC: tas2764: Add post reset delays
Message-Id: <165659332651.455663.13893837473957568987.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 13:48:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 marcan@marcan.st, linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 steve@sk2.org, dmurphy@ti.com
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

On Thu, 30 Jun 2022 09:51:32 +0200, Martin Povišer wrote:
> Make sure there is at least 1 ms delay from reset to first command as
> is specified in the datasheet. This is a fix similar to commit
> 307f31452078 ("ASoC: tas2770: Insert post reset delay").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tas2764: Add post reset delays
      commit: 4aeb04227eb4d5de83343cfbad00433019ccfdf5
[2/4] ASoC: tas2764: Fix and extend FSYNC polarity handling
      commit: a1b2cfda5616ddccd54fa10b9e72932b3f3bce8b
[3/4] ASoC: tas2764: Correct playback volume range
      commit: aea21dbec799d63393b615b73e4708a5d036df99
[4/4] ASoC: tas2764: Fix amp gain register offset & default
      commit: cabcd219cee142a0f55516d2e257c8833cbd14f6

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
