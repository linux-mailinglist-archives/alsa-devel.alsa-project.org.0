Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98233434A15
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3922116E2;
	Wed, 20 Oct 2021 13:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3922116E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634729529;
	bh=SmXeUT3+sC3BTOvbH7MEMIharaH0UWgAjHgq7ur9K6E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SsbaKRHm7DDwKoXgnO48QalDFBti5fcP0J1h/WPHJPtEBzfCyHFXcAF6GH//kQZ39
	 ZSyfUxa2JHxWEVL+YRzM1jTEWm/MlCPNBaew2sLCTgEuODCnL4tOQTS6zrXGznrsH2
	 IO1BaYkpQTPU6lVySPIC1NvxZt0EDO5R7ypb/RhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 108D7F804FD;
	Wed, 20 Oct 2021 13:29:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F933F80229; Wed, 20 Oct 2021 13:29:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3AA5F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3AA5F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TpzGXbuU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D37226137D;
 Wed, 20 Oct 2021 11:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634729343;
 bh=SmXeUT3+sC3BTOvbH7MEMIharaH0UWgAjHgq7ur9K6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TpzGXbuUc8SoHhZprTY9ldpHpi8m3ueu+yK7zVYku91hM4Y04i2XhrHcFPdquj+Iy
 yQpOeeW7UKAOXJwv2fPaR0yc3+WIn5zH+8BopnwPkCZ8hjTgqvOiyg+S1mWjYsU/kd
 KyprVufC461kV05TSyNszl/9146Ikm+24WYKGVl+I50AjydefWmLfjrDiMCLZnPTR/
 ON8bUz6r+ohw1WNME7nzyciaFKCEEEve75qzT/+NX7Qm41OjSHdA1wWZgjLXusKK4L
 5QYckkRTrtXehqM37Orv0UmOFSC5r9fczpN/GdUJzQsG+6rlGaY+TDcj5e17nXE9Ij
 q1ZVQTRNevOxg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: cleanup / tidyup soc-pcm/core/component
Date: Wed, 20 Oct 2021 12:28:40 +0100
Message-Id: <163472931364.2896549.8933437230587611502.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87lf2rt7fg.wl-kuninori.morimoto.gx@renesas.com>
References: <87lf2rt7fg.wl-kuninori.morimoto.gx@renesas.com>
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

On 18 Oct 2021 11:04:19 +0900, Kuninori Morimoto wrote:
> These are not a big deal, but cleanup / tidyup patch for ALSA SoC.
> 
> Kuninori Morimoto (5):
>   ASoC: soc-pcm: tidyup soc_pcm_hw_clean() - step1
>   ASoC: soc-pcm: tidyup soc_pcm_hw_clean() - step2
>   ASoC: soc-component: add snd_soc_component_is_codec()
>   ASoC: soc-core: tidyup empty function
>   ASoC: soc-core: accept zero format at snd_soc_runtime_set_dai_fmt()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-pcm: tidyup soc_pcm_hw_clean() - step1
      commit: 121966d03b320efe77852aaf68aa8af3fb4a72cd
[2/5] ASoC: soc-pcm: tidyup soc_pcm_hw_clean() - step2
      commit: 86e4aef6c9a113374f69c6dc63877e10935926a7
[3/5] ASoC: soc-component: add snd_soc_component_is_codec()
      commit: 01e90ee15e81f57d309d0ce1f0e16869e011b800
[4/5] ASoC: soc-core: tidyup empty function
      commit: 41b1774fb814544d2224bdfd893c060fdfed995b
[5/5] ASoC: soc-core: accept zero format at snd_soc_runtime_set_dai_fmt()
      commit: 7db07e37e13cfd46039d82aed91092185eac6565

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
