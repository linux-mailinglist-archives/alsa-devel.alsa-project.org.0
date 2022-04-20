Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8F509245
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E72D1B3F;
	Wed, 20 Apr 2022 23:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E72D1B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650491026;
	bh=6jaiM5EEkZokoyNt2f05Dgwu++Zj3+Z8+mfjrNupSEI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CD2roUFm3ufysv9dVV/8aPTcx+0rlE7F3KqtVxrFvpV0H6BpoYp+RKyRT27UWN7jI
	 5S0mctON92V9weKqqzxkj7d3UPzUqeYPEAXc4tvKdQaORwaICwFOKrR0rEUwRHGmPf
	 GKxkmITEo8hR2IViwllfw+nTarW953inwQNjFgQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A5A3F8053B;
	Wed, 20 Apr 2022 23:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A46EF80529; Wed, 20 Apr 2022 23:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E66F804FE
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E66F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OeUkZbOD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 670A2B82194;
 Wed, 20 Apr 2022 21:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D897C385A0;
 Wed, 20 Apr 2022 21:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490858;
 bh=6jaiM5EEkZokoyNt2f05Dgwu++Zj3+Z8+mfjrNupSEI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OeUkZbODgwjPKvS1nHtnuZlnoQvT041gNVtxebkD7ofNZOZnQbM4vvhfET+1DfEHN
 babP+yod5/7sLDCUDQTG9mgtqtoQKpC+/HlA+ytRbPnyUxKkbBdcThRzufTdk8tVfD
 wvZFsJyZg9M8KM+yetLt6cZmYCpmNcoiu2k2vZhV+tTV9hfs3OOrSiNvgb3NNMsXCb
 Gnf0k3QUIY0fOuHSEId6pO/pF55QR9R8B6bO+1pGr91U1lK18XrCBc2oZopUiOK8vS
 Gd1Jt9WRIQ+COAmIrPZjzb5PzWuGmoui0SLUGgVa56wQLkOwZo+ZhH1m4alZI9NOsp
 jvD7uOtrKWkxQ==
From: Mark Brown <broonie@kernel.org>
To: samuel@sholland.org, rf@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, robert.hancock@calian.com, spujar@nvidia.com,
 olivier.moysan@foss.st.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, stephan@gerhold.net,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220412111658.11015-1-olivier.moysan@foss.st.com>
References: <20220412111658.11015-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: fix sysclk shutdown
Message-Id: <165049085609.138067.16736006063801162834.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:56 +0100
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

On Tue, 12 Apr 2022 13:16:58 +0200, Olivier Moysan wrote:
> In asoc_simple_shutdown() the snd_soc_dai_set_sysclk() function
> is called twice with input direction SND_SOC_CLOCK_IN.
> Restore one call with output direction SND_SOC_CLOCK_OUT.
> 
> Fixes: 5ca2ab459817 ("ASoC: simple-card-utils: Add new system-clock-fixed flag")
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: fix sysclk shutdown
      commit: 3756aa16fadaef2873cfbd2659dfa1978a7e1859

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
