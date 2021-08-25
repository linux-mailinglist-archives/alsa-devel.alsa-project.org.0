Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B933F785F
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 17:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40EEC1689;
	Wed, 25 Aug 2021 17:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40EEC1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629905404;
	bh=ZlLQ2rNAFM5JfZGXLEck7tFHfMAbQvECPZqlGrmWsJY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uI8wZwku5HTTG2y5d7yrNfzzzvQlcvTkUauORl4b3zQtc5Y3y+So/1qaSMHAWt41m
	 I+BH3MwwHUQiZPsU87HKDRwgfcC2+HKyYUXWOOiC815kYROib0vwmZLV7QmgUZAOoi
	 AUlsfhWtUOuRYACOq94VXr9b92ib6M/N/s8YfgzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB09F804EC;
	Wed, 25 Aug 2021 17:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D283F804D0; Wed, 25 Aug 2021 17:27:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A80F8020D
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 17:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A80F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q8+lVqwf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C06AC61027;
 Wed, 25 Aug 2021 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629905249;
 bh=ZlLQ2rNAFM5JfZGXLEck7tFHfMAbQvECPZqlGrmWsJY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q8+lVqwfQwAlYidEczh9LNURnTcIKk1VvrA5FR70mDZ16vvYy+a4XDj86CpfnDFJv
 6UGf0AXEYPXX67tuxXlwj6wDKE25+RQvKTut4oKC8suAzp9K9YXDFpLSAel+lB+BLv
 BCvKmQamMtLmkXQQASymsZ3eb1XqcAetWavJAx+4tHnXhq33527QNdRxCXWHLN561K
 sGaFSG3mKqvnGDmL7GbCsLGo0nFBP2u3C4yfthVQTAoxGD5hdDQAFWH3sDKioP10M0
 8nmlwMRLrIf+jajB0qVbQ4RIP+8K3+eiQjULbNMur9W5fTkIXegzP8ngxLPnrgoA+V
 5PwZTVfWU/NBQ==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20210825040346.28346-1-derek.fang@realtek.com>
References: <20210825040346.28346-1-derek.fang@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt5682: Fix the vol+ button detection issue
Message-Id: <162990401497.56501.13651116295284237595.b4-ty@kernel.org>
Date: Wed, 25 Aug 2021 16:06:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Wed, 25 Aug 2021 12:03:46 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Fix the wrong button vol+ detection issue with some brand headsets
> by fine tuning the threshold of button vol+ and SAR ADC button accuracy.
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Fix the vol+ button detection issue
      commit: 8d3019b63b3d92c9b5f1548f600485d39262bbe1

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
