Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE663F18B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:25:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFE22168D;
	Thu,  1 Dec 2022 14:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFE22168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669901124;
	bh=amVP+1P0dNrlbJaDPRNEsD4wfnCL+4/BW2bhTC4Kicg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMa8z9dMk0V1G64NDj5lQo17Otg2b6KeYrHedQw6pGWboJYxqyc4QHilXdt9p39lZ
	 hHQcv4hgJbwv5EHMM5BryrZg87FDmaPdXkClL83LLHsgA+Ex1WYteAYOHER1esUM3/
	 7j1CoIKYv9u/0YUetDD62jH6mgpFPCCmY3iyE01U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FC08F80166;
	Thu,  1 Dec 2022 14:24:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 835D5F8028D; Thu,  1 Dec 2022 14:24:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F0CAF80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 14:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F0CAF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UU/En7Ro"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9B0861FEA;
 Thu,  1 Dec 2022 13:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B53C433D6;
 Thu,  1 Dec 2022 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669901061;
 bh=amVP+1P0dNrlbJaDPRNEsD4wfnCL+4/BW2bhTC4Kicg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UU/En7RogwdtofVGswPptV6smospR4VEfq2JflWcFFeeL+nFISH8/5wc+2h5nmczU
 lcmuJGPyW7MFSi9jE1csIdlpYgy9T0wZuFG4Ee63qCBtRTXXvNvcQQznP9MHznFX0+
 qjsGvCQLSk5Tth35g++TM6W/9VEBTJas3r3kjfQkoyNoNyDwAk9MBb8GJxGeLcu/8C
 zQbwzE11vEU7K6l7VhywLLPpRlujstLmrsOAj+gS75xlZFzBeebHQbRwfYCG8y6i1G
 brb0q4O6vNlDEC7xXt12DM+mAEi3OknNtYB+CGAMru8esNc8i7SQaWI3yNlgT5Srs6
 n/i4Kxl0SYgjQ==
From: Mark Brown <broonie@kernel.org>
To: David Rau <we730128@gmail.com>, perex@perex.cz
In-Reply-To: <20221121050744.2278-1-david.rau.zg@renesas.com>
References: <20221121050744.2278-1-david.rau.zg@renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
Message-Id: <166990105936.78632.9195345334708461451.b4-ty@kernel.org>
Date: Thu, 01 Dec 2022 13:24:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, support.opensource@diasemi.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 David Rau <david.rau.zg@renesas.com>
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

On Mon, 21 Nov 2022 05:07:44 +0000, David Rau wrote:
> The OMTP pin define headsets can be mis-detected as line out
> instead of OMTP, causing obvious issues with audio quality.
> This patch is to put increased resistances within
> the device at a suitable point.
> 
> To solve this issue better, the new mechanism setup
> ground switches with conditional delay control
> and these allow for more stabile detection process
> to operate as intended. This conditional delay control
> will not impact the hardware process
> but use extra system resource.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Fix pole orientation detection on OMTP headsets when playing music
      commit: 969357ec94e670571d6593f2a93aba25e4577d4f

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
