Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65622339869
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 21:28:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014F418AF;
	Fri, 12 Mar 2021 21:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014F418AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615580913;
	bh=8Gvew1VRLJtbfdxLNpixdZDdHBUTU6ECBvir/9ENd9U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gXar5rOv/lGjwCNKIezE0HF8DSy23pWyNlWObyR+mw2CwcgIFzpDjS2A3Lebyc5rg
	 IHmLcl8GXKuBe8IQr4XLRaXL6vN6xcC3GD3r03mm7/Rb6gcbtENUUbTG8WgCqTRX22
	 oc5Z5sH2tASHeIG1ty8XWmXTWYsddrE9E8N9Wu6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD2EF804AF;
	Fri, 12 Mar 2021 21:25:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C75E1F804AE; Fri, 12 Mar 2021 21:25:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCA98F804AA
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 21:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA98F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q1A/9kax"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B281C64F77;
 Fri, 12 Mar 2021 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615580734;
 bh=8Gvew1VRLJtbfdxLNpixdZDdHBUTU6ECBvir/9ENd9U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q1A/9kaxZFZfr7y+Bgz9Ha7coXAuntdaoI1FGav2KW3cRMagTvNf3zsULlGUh0hmi
 5BEKLLLpBj7E+dqflccr3MohLYqco2FFQcIgVvGINQTObzEeSJrx4rKWpN8hjSo+yJ
 f7WuJV6gos4F8aUFeBfLIWz6IbyrvvoMxCqalH0Jop7JXbDraYO7a54Q5n44mhBWc5
 ohdCP7/+Q9EApsVe45qfUCeFNF8jqWBWcIZAGEI/9PtYZ978hj8QGyxMbVHUOvA2wj
 u9bl2G0JW0hY/wwxKkW0e5D0noQEhd7Gvp9lrnO4ivQxfB6d6kzYzBRyGpxsM0+cyM
 zw2eNB4Kay2wQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfaxuoc3.wl-kuninori.morimoto.gx@renesas.com>
References: <87lfaxuoc3.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 0/8] ASoC: soc-pcm: cleanup each functions
Message-Id: <161558062956.11113.3431520512018768133.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:23:49 +0000
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

On 09 Mar 2021 10:07:24 +0900, Kuninori Morimoto wrote:
> These are v2 of soc-pcm cleanup patches.
> These has no relationship to each other.
> 
> My 1 concern is [3/8] patch. I think it is no problem,
> but I'm not 100% sure why current code was such code.
> Pierre-Louis / Liam might about something.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: soc-pcm: check DAI activity under soc_pcm_apply_symmetry()
      commit: f8fc9ec56f341c2a7aa263049340b11c9956962f
[2/8] ASoC: soc-pcm: add soc_cpu/codec_dai_name() macro
      commit: 6fb8944cd2892e018d13955c2d51579a30744904
[3/8] ASoC: soc-pcm: direct copy at snd_soc_set_runtime_hwparams()
      commit: 56e749ba756fdc2eff332b8eadda8fca231ad782
[4/8] ASoC: soc-pcm: add soc_pcm_update_symmetry()
      commit: 68cbc557375e22e921c9fd007dfcb35faeff4908
[5/8] ASoC: soc-pcm: add soc_hw_sanity_check()
      commit: c393281a3c1cb252735c46efbf8501a3782f9afa
[6/8] ASoC: soc-pcm: fixup dpcm_be_dai_startup() user count
      commit: 1db19c151819dea7a0dc4d888250d25abaf229ca
[7/8] ASoC: soc-pcm: remove unneeded !rtd->dai_link check
      commit: 20048a9a4070d046a868c3be3b4f7bdc139cc203
[8/8] ASoC: soc-pcm: share DPCM BE DAI stop operation
      commit: 531590bb40f827fb3c4398148af0797f95bbaee2

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
