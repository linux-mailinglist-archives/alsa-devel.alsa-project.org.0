Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D69C5B8550
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4200F1866;
	Wed, 14 Sep 2022 11:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4200F1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663148509;
	bh=km5Bk53XmyjVKhe3BN3q3R+ZJqLirZyw93oGnlUg00M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6IFI2yT5+gWj0gcsNdb2clAp35smLnJ6XCwzIeXL6LEHVxN0oZvFcuPGpvDChp3V
	 f6aLxlDg3h7x2e1ARukTLZ+OUpBKuoQEK4tmR1wBVUDyDpF6p/CAhfvwEXghyjcMJ+
	 wkx9Ml0/17Z+bpI6bMSGr03YeG4xuQasZ0Gu6Wdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F33FAF804E6;
	Wed, 14 Sep 2022 11:40:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D13EDF8014B; Wed, 14 Sep 2022 11:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56368F8014E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56368F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t24P1jIb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D427361AC7;
 Wed, 14 Sep 2022 09:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89067C433C1;
 Wed, 14 Sep 2022 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663148417;
 bh=km5Bk53XmyjVKhe3BN3q3R+ZJqLirZyw93oGnlUg00M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=t24P1jIbpfLNIBgAYfkJOmZWbIBr5Epxt/wZRkXxZLamJE1SGk7KAcs8ZV1MSR3HC
 uhx/B+NaevtfRE2zgPQ1dasEZ6k2vdaFYPSDfWzB7DwS/MKLnLMonTsud7ZXLQW28G
 8oyoq/4TwNHabpgixNY5Bi92YxeYRiaqgNx8rnKWo33huCVOybEM6ZQzmcFNFzyi19
 +9Q7vlinWmWA3viLUA3m6FB/Ll4PjaAIbak5wzNQA3DeIZUF35lItat2RER93irrh5
 g4A2Vb47Ea7gxgLV7S9tQUclpY8KEEmegtY+Wb9rfLgg9tG3XEi1kXrgvMhmABhO8Z
 TGragVYhsothg==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20220913120641.792502-1-CTLIN0@nuvoton.com>
References: <20220913120641.792502-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: nau8825: Add ADCOUT IO drive strength control
Message-Id: <166314841529.314266.13299542848016745362.b4-ty@kernel.org>
Date: Wed, 14 Sep 2022 10:40:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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

On Tue, 13 Sep 2022 20:06:41 +0800, David Lin wrote:
> Add a property to control the driving of ADCOUT.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: nau8825: Add ADCOUT IO drive strength control
      commit: ed8570726ab005da0aa62cc24046ef83fa342e89
[2/2] ASoC: dt-bindings: nau8825: Add ADCOUT IO drive strength control
      commit: 40a57d4b2d82fe4a10bc41aa79532ee33ffdb051

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
