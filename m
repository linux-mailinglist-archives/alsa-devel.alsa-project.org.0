Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A84DB984
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:37:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0E617EA;
	Wed, 16 Mar 2022 21:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0E617EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463075;
	bh=m0QW2LwB4/jzfafv1NWtzigJMVUMm53j99mgvQq99yo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAH5qdqho86xBYT4BxjcAB4yrEsRPleJTJQyeqJsvNdV7HzRBtXKrhO1olgETDDNJ
	 BhzsBVDDnp6DiRj8RNE203YmBy856xUeLU+/VG23pjoaif8IkNIFKdvYWeIWWMdMDw
	 Xryf88qj03HDW/oeyLhp2/T32vtPM8ZUQrE0DBuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23A80F8051B;
	Wed, 16 Mar 2022 21:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E098F804E6; Wed, 16 Mar 2022 21:35:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED5EFF80311
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED5EFF80311
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qnhZtqSv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F7886134A;
 Wed, 16 Mar 2022 20:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50E1C340E9;
 Wed, 16 Mar 2022 20:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462948;
 bh=m0QW2LwB4/jzfafv1NWtzigJMVUMm53j99mgvQq99yo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qnhZtqSv/HlPwOxVKrtILSEEUPx4+Gdg7NhaFV/fE6mFi+XmkJ8qgaA0tpqTT4fVK
 5l8BHtamd3WcXUPUbDtwBWqv3fGewQKRPoQHmTjRgsxePTKSPD/eSttH3ENW9nDQzb
 R4xPSm76Sv+9WZF5d11qHyqHC/OlZxz+bowyBOMIuGlIPUNZyaJBnbrr64/BXbma1X
 Yxn6sJ9uXOklTFES08HFsFdRCiYUHSwve+dPARRWKoMaRPItZ3YmemzNNrZ23k2G/9
 z9IwwAGP5QPh33knGCfkV0DSo7A+OvCz6Y6z6g/nlrlyLsdcRpt6iILi0g8tLHe+Ye
 2i2a7qYr/SZLw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20220315164158.19804-1-tiwai@suse.de>
References: <20220315164158.19804-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call
Message-Id: <164746294759.1220201.11282114116056577010.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Daniel Palmer <daniel@0x0f.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

On Tue, 15 Mar 2022 17:41:58 +0100, Takashi Iwai wrote:
> This is essentially a revert of the commit dc865fb9e7c2 ("ASoC: sti:
> Use snd_pcm_stop_xrun() helper"), which converted the manual
> snd_pcm_stop() calls with snd_pcm_stop_xrun().
> 
> The commit above introduced a deadlock as snd_pcm_stop_xrun() itself
> takes the PCM stream lock while the caller already holds it.  Since
> the conversion was done only for consistency reason and the open-call
> with snd_pcm_stop() to the XRUN state is a correct usage, let's revert
> the commit back as the fix.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call
      commit: 455c5653f50e10b4f460ef24e99f0044fbe3401c

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
