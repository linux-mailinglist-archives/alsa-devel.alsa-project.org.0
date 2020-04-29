Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A501BE3E8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 18:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C233C1676;
	Wed, 29 Apr 2020 18:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C233C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588177927;
	bh=e+vGf8fOgSiTXDPv4LlL9JQztgVFR1SrtsmA0HlGrmg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnB3qB/S6BU5h3dWlyYl/UMJPwIfYJzqaLINeywHdugtjERGY1TwV18jOHYRD69SJ
	 zTI6vp92JjaBvX1PlWLXYYBNJJipLc9HDh1wriGh7P4ORKn6d2YAwnCki53UWj8WK/
	 N27NJq/pZ2G/vuOf2GJ/bg/Es0GvDu80dt6Qp0Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39FDFF802DC;
	Wed, 29 Apr 2020 18:27:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF20F802E0; Wed, 29 Apr 2020 18:26:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E604AF802C3
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 18:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E604AF802C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WNZXzwGL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CECA2208FE;
 Wed, 29 Apr 2020 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588177610;
 bh=e+vGf8fOgSiTXDPv4LlL9JQztgVFR1SrtsmA0HlGrmg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WNZXzwGLOeSkhR5PkN4AQPuFIZMQeku7ELWx90B2Jhqx3HZ5X9UEwLAkjnkkLMbUE
 R8q+Cs9B23KPJepcsSfeSPIlZFhACS1nPthaFU0ZcRrlw8zjhOuHqmr90nezn4Imks
 hjJRfVWFIk3RPIeU+U12pspn5z/Q/22tdHBhQS2w=
Date: Wed, 29 Apr 2020 17:26:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87368tu75n.wl-kuninori.morimoto.gx@renesas.com>
References: <87368tu75n.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/17] ASoC: soc-dai: add snd_soc_dai_xxx()
Message-Id: <158817756637.27768.1318055090266306816.b4-ty@kernel.org>
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

On 24 Apr 2020 08:14:12 +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have soc-dai.c today. DAI related functions
> should be implemented in it.
> These patches are v2 of doing it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[01/17] ASoC: soc-dai: add soc_dai_err()
        commit: aa7b8230d4c3d0e691604dc908887904f52f2ab8
[02/17] ASoC: soc-dai: don't overwide dai->driver->ops
        commit: 479914ed779d408273fb3cac4c061dbe695f17cb
[03/17] ASoC: soc-dai: add snd_soc_pcm_dai_new()
        commit: 0b73ba550cdd95b0fdca5da0040c29ae5d25ae5d
[04/17] ASoC: soc-dai: add snd_soc_pcm_dai_prepare()
        commit: d108c7fd0b776d5b48acd15f6f52b1bb8255a69e
[05/17] ASoC: soc-dai: add snd_soc_pcm_dai_trigger()
        commit: 42f2472d4689c00d742b6690aa6579966f0b2f83
[06/17] ASoC: soc-dai: add snd_soc_pcm_dai_bespoke_trigger()
        commit: 30819358ae73326269ba61597be47d5036e05b08
[07/17] ASoC: soc-dai: add snd_soc_pcm_dai_probe()
        commit: 51801aeafdc9c1d55e5e71e58a1bbbd2583328fa
[08/17] ASoC: soc-dai: add snd_soc_pcm_dai_remove()
        commit: 7eaa313bdec3f2326c9cdacec88fd484a36c423b
[09/17] ASoC: soc-dai: add snd_soc_dai_compr_start()
        commit: b5ae4ccea5ab15adcde64f4474b36e4a630434ec
[10/17] ASoC: soc-dai: add snd_soc_dai_compr_shutdown()
        commit: 2b25f81d43b764142699a430da0ca57ffcb33cc2
[11/17] ASoC: soc-dai: add snd_soc_dai_compr_trigger()
        commit: eb08411bdf48cff69f7226c86a97fba1ef5045e6
[12/17] ASoC: soc-dai: add snd_soc_dai_compr_set_params()
        commit: 8dfedafb5c711b5a13c938e06e8143540f773ecf
[13/17] ASoC: soc-dai: add snd_soc_dai_compr_get_params()
        commit: adbef5432666e20616263792d13cab80d57d9d5f
[14/17] ASoC: soc-dai: add snd_soc_dai_compr_ack()
        commit: 53294353a05ceaa6a107e8c1c300af63c89c8e50
[15/17] ASoC: soc-dai: add snd_soc_dai_compr_pointer()
        commit: ed38cc5909e72e30815f72e73cba34a3dbbb5494
[16/17] ASoC: soc-dai: add snd_soc_dai_compr_set_metadata()
        commit: 88b3a7dfe999b3e28f65be69787a1fd97b742b4f
[17/17] ASoC: soc-dai: add snd_soc_dai_compr_get_metadata()
        commit: 94d7281993a7933bf60ea733eeb8a8bad429bf1c

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
