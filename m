Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991052C67AA
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 15:17:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28FBD1848;
	Fri, 27 Nov 2020 15:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28FBD1848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606486675;
	bh=bkbFyeM58cDKtXt1bZzG9/PbVtjy9GS0NVObrwlzItI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uGlNYL5p4uIfQ0XbxDbPBb3dUfULjIXTfLNCY6fYM0HRbd9oxtDsAUAk34B7/EkW7
	 8GCpyTuq2+k6l+cT43Jt9QjkSGaxeZh5nYKsKwNc2wOHFnzbl4SbV5x+GnCjUu0jLN
	 9kdGJVHcK46bXfajeVlQcekkbE85UvWi/yNNtWPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88AC8F8015A;
	Fri, 27 Nov 2020 15:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE0F0F8019D; Fri, 27 Nov 2020 15:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78737F8015A
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 15:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78737F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FSNzh5Q3"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8FAB21D7A;
 Fri, 27 Nov 2020 14:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606486567;
 bh=bkbFyeM58cDKtXt1bZzG9/PbVtjy9GS0NVObrwlzItI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FSNzh5Q3j6BaId9f4WtEI8gx15sS6UtsYmx70dYpnvl4JLc331aqmj9R66zBPYOMN
 Q7/k4VwZRgiUfCo4B3NoGLM43P06VdK4RtY95HZ8mNc5cAa4IvaNn8OH4bIHc/xuVY
 VCtjvYZQXjSx5mGevKCCLRv1QplZRqomcMTI4Dvg=
Date: Fri, 27 Nov 2020 14:15:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfenekgg.wl-kuninori.morimoto.gx@renesas.com>
References: <87lfenekgg.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: soc-core: share same logic code
Message-Id: <160648654191.46436.3125299146764686434.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 27 Nov 2020 09:07:14 +0900, Kuninori Morimoto wrote:
> soc-core is using almost same code at some point.
> The difference is only used parameter.
> It is just duplicate code, and we can share it.
> This patch-set sharing code for mute and for suspend/resume.
> 
> Kuninori Morimoto (2):
>   ASoC: soc-core: add soc_playback_digital_mute()
>   ASoC: soc-core: add soc_dapm_suspend_resume()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core: add soc_playback_digital_mute()
      commit: d4c1d9eb6611fee6cd3623e810282342757b57f6
[2/2] ASoC: soc-core: add soc_dapm_suspend_resume()
      commit: baed393e8550fa075512772fad27e98ba9dcb527

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
