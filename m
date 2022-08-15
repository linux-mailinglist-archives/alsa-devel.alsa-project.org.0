Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A55933E1
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 19:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2359F1634;
	Mon, 15 Aug 2022 19:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2359F1634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660583499;
	bh=Z1peZpsOzne+2xZ2cYemgCfk0P/mLViWM3YSQUJEJ5k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LeZp6Ig43xNZJdmWblPyHUX7eQLEEG9oydObHSb7p2Thn39/oJIvE8SneQv1bPBqT
	 4s1WJlrbdus4Swbm3der6m1oTmMK2bFOvE5Mv15iRWZWBmGSqHcgThM0DbLQt1p655
	 EgKHES2TSR3kzzRHOq0llLlQ/pyzrZCRyPKl/nXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79482F8027C;
	Mon, 15 Aug 2022 19:10:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFFE6F80095; Mon, 15 Aug 2022 19:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78DE3F80095
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 19:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DE3F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YEyzmZ/r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 804B9B80EF0;
 Mon, 15 Aug 2022 17:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5183EC433C1;
 Mon, 15 Aug 2022 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660583434;
 bh=Z1peZpsOzne+2xZ2cYemgCfk0P/mLViWM3YSQUJEJ5k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YEyzmZ/rnZ0jopHL7ArzPEu/O+lP9imn53xTDBTvRAZbT1mnVna4JxeGaHhht9Gah
 sDoipyabGe4xZO9OQrZJP5tsL6+kKrDfQFIkTxcJvP+8xrGRD64nHGR8Dlz+78hQal
 vGp+kKHZr9eXNsBuG2Nq0PsuswRLQYFe6Nkh8EPngsac/Kh/lFF/WMn2ClLMOSaPWa
 b1sp8mbQwgN69Dkxcfmba6lDsOf5bJ12qx872NsUgucSzAcSoojBkY5ldBhHEo/a8+
 sEbjuUeMeEunPv4JvMEO7cNzbh2dQabKo7SMig27vsz7fsddDJsk1Wr4RwK8XfbUvM
 /P3Au9iqhakAA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220815123138.3810249-1-rf@opensource.cirrus.com>
References: <20220815123138.3810249-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Only report button state if there was a
 button interrupt
Message-Id: <166058343304.814219.14233923632228992383.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 18:10:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
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

On Mon, 15 Aug 2022 13:31:38 +0100, Richard Fitzgerald wrote:
> Only report a button state change if the interrupt status shows that
> there was a button event.
> 
> Previously the code would always drop into the button reporting at the
> end of interrupt handling if the jack was present. If neither of the
> button report interrupts were pending it would report all buttons
> released. This could then lead to a button being reported as released
> while it is still pressed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Only report button state if there was a button interrupt
      commit: ea75deef1a738d25502cfbb2caa564270b271525

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
