Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0666D4C78A0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:18:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89D801866;
	Mon, 28 Feb 2022 20:17:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89D801866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075880;
	bh=5ST5V0Vj2q2elE0qMzBaA4FYo+7O1CZO2nFkEFeLsJQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQFONw9jWMShqJ/iXC3aAxv4pxfsueY5f20785dl6lLA1zY0S2WQ1vUoT4KWwz59d
	 BwxiFztvV7foEqGwEYC/IOxfQcDZNixAC8j5VA3N8aWOq6G2ZDaSZzxKIa7hC+xbqG
	 DOuLprLU4MrjMpVQ+YKXTmziXV+E9sdgw7i3uv8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF28F80525;
	Mon, 28 Feb 2022 20:15:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 361F9F80128; Mon, 28 Feb 2022 20:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7DA5F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DA5F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pBF0/JuW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1492DB8162A;
 Mon, 28 Feb 2022 19:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A888BC340FB;
 Mon, 28 Feb 2022 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075720;
 bh=5ST5V0Vj2q2elE0qMzBaA4FYo+7O1CZO2nFkEFeLsJQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pBF0/JuWVbX2yUdsuqNKgbbdp+tZkq3TqmDmAgEwvRPxjft4L1ajj6eWNNY9kGarW
 P1+DiCFTd7QUdaBtEMWC8Qe+l5CF7LN22k/prH5iH4VP8ujb4laEYogM1x929kbn5H
 fVk1NltHo9RWEv2nRhA1yZX5myZcaqNWbBMt8txNUuzXAaCQWGHB4Y3DEn1xuar7Mw
 bUi0IVlenDet777ggVTemtOaXqQV2ZlfFUh9wPxLtwk/TT6Pyp44QNWdJhJv0EOhT8
 6wd0tZE4tjS1v9vXTRZbFJdXh75xxpEW/ERG/HUbN8ogPaD4c0GfR9xT/enit07PKi
 P7rlMoGH/Vfqw==
From: Mark Brown <broonie@kernel.org>
To: M R Swami Reddy <mr.swami.reddy@ti.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
In-Reply-To: <20220222225135.3726158-1-broonie@kernel.org>
References: <20220222225135.3726158-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: lm49453: Use modern ASoC DAI format terminology
Message-Id: <164607571940.3538791.16737725052279725916.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 22 Feb 2022 22:51:35 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the lm49453 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: lm49453: Use modern ASoC DAI format terminology
      commit: 8e08a0c9225f15c7561938e700ae89612ed78afb

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
