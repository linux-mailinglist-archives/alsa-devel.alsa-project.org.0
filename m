Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3A521637
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 15:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A046B1908;
	Tue, 10 May 2022 15:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A046B1908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652187749;
	bh=MRzdmtS5LCRMgbir7hYUGrUcVpNYu8k5kS6pyDZ6p9s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oTxefKP6C+uC9/wQHIwuNrNnSJFpqG/HFiAthHsD26wFmNHCtChWPCNtHhT32mvM4
	 DDO1OZDyFotjpjvfrH+mZ5RKtNinWnDuczCl00PDHGz2N0RI2JLwtzX8RkZedFPWSo
	 MpCCTvb/uAJil2Jz0URM537WUmXLP4WV/MbQoHN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C398F80515;
	Tue, 10 May 2022 15:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B01F80508; Tue, 10 May 2022 15:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7854BF8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 15:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7854BF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e0mtljzZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87215614C2;
 Tue, 10 May 2022 13:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1ADC385C2;
 Tue, 10 May 2022 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652187643;
 bh=MRzdmtS5LCRMgbir7hYUGrUcVpNYu8k5kS6pyDZ6p9s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=e0mtljzZPiygJ/KTfcA4y40qffVBaorrpMXFZFutIYWO6QPq/1+70K+ac54SJecaM
 z3iBmOZG7sAA0yUhEND9FSSdEWjaaJR5fMOUjYFBAQmIFzDyUW98CZMWL/bjdG3WLh
 2WXhLIEwMXD/BkbvLIk5kwVuggt6xqpY+qKQE6mxUREGbgSBo3nUqQOB6sOHhCNe9q
 ndvxMBZ/qdvEKiLM+q3yVkXfGjbCpv/QoWozvv4u5hE3w56i2AHNlkZcUitZ/O4g/R
 83s55zpo1WBILCvy+/DX6OkhcjRnjRNHiHVTZM8ZXz9Jz+uf53T+uaVefm3IaWD6Nw
 gCrbcL4OmJpiA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, zheyuma97@gmail.com, lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20220510053031.1685337-1-zheyuma97@gmail.com>
References: <20220510053031.1685337-1-zheyuma97@gmail.com>
Subject: Re: [PATCH v2] ASoC: tlv320adcx140: Register a callback to disable
 the regulator_disable
Message-Id: <165218764249.65921.16308072156284883779.b4-ty@kernel.org>
Date: Tue, 10 May 2022 14:00:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 10 May 2022 13:30:31 +0800, Zheyu Ma wrote:
> The driver should register a callback that will deal with the disabling
> when it fails to probe.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Register a callback to disable the regulator_disable
      commit: e1c9f68aa23a8bf98e956e92e61293ef51bd6282

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
