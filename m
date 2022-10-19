Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A5604909
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 16:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D611AA457;
	Wed, 19 Oct 2022 16:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D611AA457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666189186;
	bh=WH5i70XeKGAeEgrCwJA3ifnlvEUj3TNJXjLWKNsHxU0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRdZCgN3HjmOFj07cRBkoKH7MgosC1Zun9rFLJBGl7fSs7pvjrRIEoR1CXqzPEenj
	 QOfJuyeWXy+CaaIXMmN0rW5JnRPTz4CpuquVf8HvW1dtoYgTN93/c1EcLP6YNNwHk/
	 LTwcTjEUMWXRLMOPw1UXP8MyS3wwPw+Jj11YoI8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD40F80166;
	Wed, 19 Oct 2022 16:18:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0E5AF804E0; Wed, 19 Oct 2022 16:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D6AFF80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 16:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D6AFF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GtXztwl3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C1E39B8249C;
 Wed, 19 Oct 2022 14:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FA7C433D6;
 Wed, 19 Oct 2022 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666189099;
 bh=WH5i70XeKGAeEgrCwJA3ifnlvEUj3TNJXjLWKNsHxU0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GtXztwl3pK1dkAUTlLkzrIn/dfewmkJ/l6M/JjakMUh/pRwn6BxUDu+J0NaY2M5Ft
 4kM68ziPyq1Hyy7dWo+g/evNZA3EHhk1uDfbP1Ubk6e0TgCR9zKgNfbb586n2unR3R
 hFbV5NygsCNtk/5hY2G2SF0Ha9DOEhwIMr8Yg6WYAwKN3YiS+sEwuRpa6KDNijeHzu
 ukLwkO2T2DUW/0boZwddBld1TIMIos8cNEZOk3bg6S3bzpWtbIMvRaqL2bJTyqyxxz
 AUUJkiYLGC+rFWExrg9vxFgywkp72iaDlU6HNb2Lrnfy08Y1afqa+eA706IUo+4F98
 BRryfKh3jJmqw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 00/11] ASoC: soc-dapm.c random cleanups
Message-Id: <166618909828.493922.4186411413795898303.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 15:18:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Mon, 17 Oct 2022 23:36:04 +0000, Kuninori Morimoto wrote:
> These are random cleanup for soc-dpam.c/h.
> Basically, these are just cleanup, nothing changed.
> 
> Kuninori Morimoto (11):
>   ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to snd_soc_dapm_widget
>   ASoC: soc-dapm.c: tidyup error handling on snd_soc_dapm_add_route()
>   ASoC: soc-dapm.c: remove no meaning variable from snd_soc_dapm_add_path()
>   ASoC: soc-dapm.c: ignore parameter NULL at snd_soc_dapm_free_widget()
>   ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
>   ASoC: soc-dapm.c: merge dapm_power_one_widget() and dapm_widget_set_power()
>   ASoC: soc-dapm.c: cleanup snd_soc_dapm_new_dai()
>   ASoC: soc-dapm.c: numerical order for dapm_up_seq
>   ASoC: soc-dapm.h: cleanup white space
>   ASoC: soc-dapm.h: fixup comment for snd_soc_dapm_widget_for_each_path()
>   ASoC: soc-dpcm.h: remove snd_soc_dpcm::hw_param
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to snd_soc_dapm_widget
        commit: 03e13efbb2113412ae7879258a82bdae86fc72e2
[02/11] ASoC: soc-dapm.c: tidyup error handling on snd_soc_dapm_add_route()
        commit: b913e9f4b313469dac7ae3083356baee3db4454f
[03/11] ASoC: soc-dapm.c: remove no meaning variable from snd_soc_dapm_add_path()
        commit: c1329a0f3bde6a655b9e6ce54b1ce47f46fa49f2
[04/11] ASoC: soc-dapm.c: ignore parameter NULL at snd_soc_dapm_free_widget()
        commit: 1c9096f32ad23f5867e752f238fd25e4fec55ecd
[05/11] ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
        commit: 0135ae74b4f16fd08c9bad3b965234961d377fa7

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
