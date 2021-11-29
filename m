Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695F461C17
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047191F49;
	Mon, 29 Nov 2021 17:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047191F49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638204467;
	bh=zE2eO9hN6S5kiKpgpPcHP10hKnIhl4wII/NNdCyTefM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7mHfKtivl/jPy1rPKhQwZL7aegpocFjvPH6D2MfWqsQTPqPgaS9pGwem/68u0r2O
	 TeYYlr/amMP6spZ/S2kxdTJ6aWMR3f4o0fWGIBgVN8oAxftyS/To+FWQbB2Jahky7z
	 2DgQGSHIT6vLM3My9NuOQAn4r0ZJBBAt2wWbXWs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6304F80217;
	Mon, 29 Nov 2021 17:45:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C4BF80256; Mon, 29 Nov 2021 17:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30695F80217
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30695F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="daLB3ZKw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C10A4B81217;
 Mon, 29 Nov 2021 16:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA606C53FCF;
 Mon, 29 Nov 2021 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638204346;
 bh=zE2eO9hN6S5kiKpgpPcHP10hKnIhl4wII/NNdCyTefM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=daLB3ZKw28zH7ZfbXP0vdHGa7dW6Dk+YhvLOUhPDDFZ/j1+eIHJIibFfk34kDTq9v
 XHwIvueuS1fZNxk/d+NLfy8xUL/6vKMtMXjhjqcqLBS0sup1WW7TU/OmGcsc2NY9Ck
 giLA//6Umyds2onOsvWKdAaQWqhPPyUb20LbegKqqwlB7rlD3+b0PdVjIIjWUqOD4v
 5BJkGkOy7XEcJRfAK53Nf5TxnQ309P2hP02Nf59+KyhmzkJjLARZqAquyzyNn2cv0F
 +sNuEz7iRz61SGYFVUUzX1GLiclwl/DNpn6cW0iVVWEnblD2DbfXvvXtIE2YOMcUQr
 BPSnO1du8Rb2w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
References: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: soc-pcm: tidyup soc_pcm_pointer()'s delay
 update method
Message-Id: <163820434447.1716750.13320796159497643171.b4-ty@kernel.org>
Date: Mon, 29 Nov 2021 16:45:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Gu Shengxian <gushengxian@yulong.com>
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

On 16 Nov 2021 16:44:50 +0900, Kuninori Morimoto wrote:
> Current soc_pcm_pointer() is checking runtime->delay,
> but it might be updated silently by component's .point callback.
> It is strange and difficult to find/know the issue.
> 
> This patch adds .delay callback for component, and solve the issue.
> 
> Kuninori Morimoto (5):
>   ASoC: soc-dai: update snd_soc_dai_delay() to snd_soc_pcm_dai_delay()
>   ASoC: soc-component: add snd_soc_pcm_component_delay()
>   ASoC: amd: acp-pcm-dma: add .delay support
>   ASoC: intel: sst-mfld-platform-pcm: add .delay support
>   ASoC: soc-pcm: tidyup soc_pcm_pointer()'s delay update method
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-dai: update snd_soc_dai_delay() to snd_soc_pcm_dai_delay()
      commit: 8544f08c816292c2219f28c6eaa69236b978bfb9
[2/5] ASoC: soc-component: add snd_soc_pcm_component_delay()
      commit: 403f830e7a0be5a9e33c7a9d208574f79887ec57
[3/5] ASoC: amd: acp-pcm-dma: add .delay support
      commit: feea640aaf1a5ae9dff6e33931e680542432e8dd
[4/5] ASoC: intel: sst-mfld-platform-pcm: add .delay support
      commit: 796b64a72db0b416f0aa1815e87aa28388b4715d
[5/5] ASoC: soc-pcm: tidyup soc_pcm_pointer()'s delay update method
      commit: 7be10cef0fbe91f83c55faea7e8b70c0529dde5f

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
