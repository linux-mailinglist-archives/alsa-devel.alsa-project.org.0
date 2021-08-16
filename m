Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1543EDC04
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 19:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2BD16BE;
	Mon, 16 Aug 2021 19:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2BD16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629133618;
	bh=HWHMqyb9p8a+GVX+Bg/1H1OW1JY3Ch7vjU0hoyVgMJs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3SzA6WWaIDmMXzSSKub4mgir7ErcccO1v03UnmTmzx7wdBjhPT6aBNkDUD9dLrYh
	 Y6kL4x3FvAVDKtH9lSaPBR7acBqnTnJ4FGQBpMUqWq31hJSzIPR8y0b96FBaF6MuQe
	 YNfW/CYNf5wxsEwGUmy9cm9Q6DgAWoUzs43neYXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BF4F80134;
	Mon, 16 Aug 2021 19:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393EAF80425; Mon, 16 Aug 2021 19:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E32A1F80134
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 19:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E32A1F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g3G3zmx9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B681760F36;
 Mon, 16 Aug 2021 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629133511;
 bh=HWHMqyb9p8a+GVX+Bg/1H1OW1JY3Ch7vjU0hoyVgMJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g3G3zmx9ePnrs6ccLN/NswmTF/qaGnph23JbwcKDnrbm6jCSXw3ONgPgNXXkNKfN7
 nd3mS0CjqU90LwjDr8/outvFs7RjUqfPp0cQN710pkEdlAUZuJUL2eJ79Otu8AVndW
 jDwZ0JanvGpDFYIj4aeaYUkpwgfJFZLP0//48vKw/BfIZPvoNfuCBysXMcbcZ3LISB
 PS/iV0wOGfk/caMiA7G0OGhFetJsnS+HjwaMzTL1CvX9CFX90XYyY52JfG2akrO9mI
 cM1MG7SeFGMaS5z/e/a8IwU9QJF5Seo5nK1xP6IuvTeIolGoxgqJea+SpbrrmzHgeW
 4Srbn/b0Tenog==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/9] ASoC: soc-xxx: cleanup cppcheck warning
Date: Mon, 16 Aug 2021 18:04:41 +0100
Message-Id: <162913223313.13582.4677317494415350798.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <874kbq0z0p.wl-kuninori.morimoto.gx@renesas.com>
References: <874kbq0z0p.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 16 Aug 2021 13:55:18 +0900, Kuninori Morimoto wrote:
> Now I'm posting audio-graph-card2 patch-set, but it seems it needs longer
> discussion. Thus I want to post more easy patch first, and reduce my
> local patches.
> 
> These are cppcheck warning cleanup patches for soc-xxx.
> 
> Kuninori Morimoto (9):
>   ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_pcm_hw_params()
>   ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_pcm_new()
>   ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_copy_user()
>   ASoC: soc-dai: cleanup cppcheck warning at snd_soc_dai_link_set_capabilities()
>   ASoC: soc-dai: cleanup cppcheck warning at snd_soc_pcm_dai_new()
>   ASoC: soc-jack: cleanup cppcheck warning at snd_soc_jack_report()
>   ASoC: soc-jack: cleanup cppcheck warning for CONFIG_GPIOLIB
>   ASoC: soc-component: cleanup cppcheck warning at snd_soc_pcm_component_pm_runtime_get()
>   ASoC: soc-ac97: cleanup cppcheck warning
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_pcm_hw_params()
      commit: 0a1e5ac50de2185d6e50b0d09fbed3ef06950d90
[2/9] ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_pcm_new()
      commit: 9cec66fa702646b83ed970a91edd712d156c380f
[3/9] ASoC: soc-generic-dmaengine-pcm: cleanup cppcheck warning at dmaengine_copy_user()
      commit: a2659768893bd90be4a243472e8bd2ef614c9de7
[4/9] ASoC: soc-dai: cleanup cppcheck warning at snd_soc_dai_link_set_capabilities()
      commit: d490f4e73e3c0b217242d92a8f679e62dc657001
[5/9] ASoC: soc-dai: cleanup cppcheck warning at snd_soc_pcm_dai_new()
      commit: 454a7422fa287d38fbc433260932383ed70b8af0
[6/9] ASoC: soc-jack: cleanup cppcheck warning at snd_soc_jack_report()
      commit: c2dea1fba206b6e16940fb2bbf5209b30018833c
[7/9] ASoC: soc-jack: cleanup cppcheck warning for CONFIG_GPIOLIB
      commit: c7577906865c5da232c1eeabaa80129f4702290d
[8/9] ASoC: soc-component: cleanup cppcheck warning at snd_soc_pcm_component_pm_runtime_get()
      commit: 500b39da62499721ffd287994322a36440d1bb9c
[9/9] ASoC: soc-ac97: cleanup cppcheck warning
      commit: 834a36ddc6d276fce177fde6c994751aa40d498f

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
