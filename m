Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A51E8CD1
	for <lists+alsa-devel@lfdr.de>; Sat, 30 May 2020 03:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF9471770;
	Sat, 30 May 2020 03:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF9471770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590801662;
	bh=Jl+bXnMdegLoXStXN0nD2I8tIoK0J/fWyL927jdsvRo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jKGP4ZLi+Nlozc4WGT+udkfdzZh4BLK0ERBMZSjJf6oizOMMI0GRuVQfcOeDfdKd6
	 YnSxuevgygLqocmGYhqX32QT0GwS3kvnwDw8Xf5gx/8vKC1aKpEVJnutdfnVLUyjQA
	 zYnU2InaReQYlAmPKGbmkKXzjfisV44sihOV09WY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAD4F8016F;
	Sat, 30 May 2020 03:19:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DF98F8014E; Sat, 30 May 2020 03:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE96F80125
 for <alsa-devel@alsa-project.org>; Sat, 30 May 2020 03:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE96F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2Ibk6qmk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A643206C3;
 Sat, 30 May 2020 01:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590801499;
 bh=Jl+bXnMdegLoXStXN0nD2I8tIoK0J/fWyL927jdsvRo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=2Ibk6qmkzzR/A+e9dofejhob/1c0vk19XiRndDM4/gvXEvMgoq/y8xGUP/68A14T2
 VHq1QJGXbhSajSjFJGb9agva6KV84kyl9ndHT8dOoeV9q6a2iP1jp2QC+bmu0omSRp
 fIHB4tTXK0VhiPGZ5gNSDf+ab13C8pD4LlB4QCEo=
Date: Sat, 30 May 2020 02:18:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eer425lw.wl-kuninori.morimoto.gx@renesas.com>
References: <87eer425lw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/19] ASoC: add soc-card
Message-Id: <159080149750.42480.1254696461539698376.b4-ty@kernel.org>
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

On 28 May 2020 10:47:07 +0900, Kuninori Morimoto wrote:
> Current ALSA SoC is handling snd_soc_card related operation,
> but it is implmemented directly without using function/macro,
> and at random place.
> 
> This v2 patch-set creates new snd_soc_card_xxx() functions
> which handles snd_soc_card related operation,
> and implmement these at new soc-card.c.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/19] ASoC: soc.h: convert bool to bit field for snd_soc_card
        commit: 317ec67593100f0ef0d017bcd73d42704d73fdb6
[02/19] ASoC: add soc-card.c
        commit: 1793936bc9081d541da2ecd2af83eded7e6212a7
[03/19] ASoC: soc-card: move snd_soc_card_get_kcontrol() to soc-card
        commit: 209c6cdfd28360f030f88ae9adb69f633e6bcd2d
[04/19] ASoC: soc-card: move snd_soc_card_jack_new() to soc-card
        commit: 3359e9b6fa3eafeeb79d5f0ec8a04f3fe6986db1
[05/19] ASoC: soc-card: move snd_soc_card_set/get_drvdata() to soc-card
        commit: 63efed582cc346c098adf6f5c852e2d5b0753783
[06/19] ASoC: soc-card: move snd_soc_card_get_codec_dai() to soc-card
        commit: 65a75718d68ea338b918328d471eff6f472192fc
[07/19] ASoC: soc-card: move snd_soc_card_subclass to soc-card
        commit: bf5bb8db5bf07b0a82cdcdc44e4494e55aaa4ed7
[08/19] ASoC: soc-card: add snd_soc_card_suspend_pre()
        commit: 130dc08c827db76f4a32fe7867075029fe9071d1
[09/19] ASoC: soc-card: add snd_soc_card_suspend_post()
        commit: d17b60b2c46750ebfb6ea39a2b02d988b97484eb
[10/19] ASoC: soc-card: add snd_soc_card_resume_pre()
        commit: 934c752c38b751663fe3dc18413db13e73b8b2b2
[11/19] ASoC: soc-card: add snd_soc_card_resume_post()
        commit: 739443d1f162ce80eb717c695e58302958b51239
[12/19] ASoC: soc-card: add probed bit field to snd_soc_card
        commit: 27f07cacc9f1ddf955b85e5746f967351ab0b40b
[13/19] ASoC: soc-card: add snd_soc_card_probe()
        commit: 73de4b026850da432b8bcfb73fc4af94674a8102
[14/19] ASoC: soc-card: add snd_soc_card_late_probe()
        commit: 5c0eac036dfd3e20dd09ab86343c3b2fb2a1ac86
[15/19] ASoC: soc-card: add snd_soc_card_remove()
        commit: b0275d956fab05a5088e20244c8d1eb433b7b90f
[16/19] ASoC: soc-card: add snd_soc_card_set_bias_level()
        commit: 39caefda0a30cac8284264e5031a0dd478510ced
[17/19] ASoC: soc-card: add snd_soc_card_set_bias_level_post()
        commit: d41278ea0579a8c1e216c5321e2d207705ab3b54
[18/19] ASoC: soc-card: add snd_soc_card_add_dai_link()
        commit: cbc7a6b5a87a129084c643455d16699ea490fd2f
[19/19] ASoC: soc-card: add snd_soc_card_remove_dai_link()
        commit: fcbbcc325bc2dd90212de19b520c190b6fbeddae

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
