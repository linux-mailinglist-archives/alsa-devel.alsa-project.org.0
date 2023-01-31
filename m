Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42E68392B
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 23:19:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95761826;
	Tue, 31 Jan 2023 23:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95761826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675203550;
	bh=LLcNxSE4SLlifZTzUQTA5PD8kN1CvgpUaTvEsKPhn88=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=szGVQbdI9bkiiO/0HBg8ikQYwdJrG6+LmQykPCKfrHPLjNuaDH1vcFEWsEQ7YmTl0
	 JdPgQ7dsInf9cI9pax7c0SpGKerGXy6TfOXPKAWOnwChNtwrRO4VftGLqTwM6b5+WJ
	 jgMKt05yMbhzNTMSK1LlT/KINYPdTUqUsJr+NzLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CABEDF80245;
	Tue, 31 Jan 2023 23:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B72B4F804E0; Tue, 31 Jan 2023 23:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 370A4F80245
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 23:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 370A4F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ptqcFF3t
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E3B1B81EB5;
 Tue, 31 Jan 2023 22:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573C7C4339B;
 Tue, 31 Jan 2023 22:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675203480;
 bh=LLcNxSE4SLlifZTzUQTA5PD8kN1CvgpUaTvEsKPhn88=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ptqcFF3tuRDobhjycPewhTpx0ENnwTvwxhvlCZrRJWehWIm37C/QrrjFRuIv112kA
 VrzIUfleRrpjw42W6lHmaSxXGZ7nt3w3rHxImO4W8CQL5eitomMsT601rgw255xUNH
 BTEC5IybHVhX8Gv4nqfN17PCUNOGzEw1q0SeQZj09YtAu7Itz98wb+yUmpYBF7QM1c
 cD79u1mCLts34dW27CEcLak5bRfgEvahsCUovc+tW7QinGWkDgEvqv0gsoJEN2I0/B
 W76QPQBd3uTMN2YqQSi09PEO5vmTlFS69xu5tsm3J0vxcioVhphnPiqRkm8ImRlDuT
 XajYIb8zmdmNw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/25] ASoC: use helper function and cleanup
Message-Id: <167520348008.1362284.8508782621531012931.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 22:18:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 31 Jan 2023 01:58:27 +0000, Kuninori Morimoto wrote:
> These are v3 patch-set to use helper function on ASoC.
> 
> struct snd_soc_dai need to have info for playback/capture,
> but it is using "playback/capture_xxx" or "tx/tx_xxx" or array.
> This kind of random definition is very difficult to read.
> 
> This patch-set add helper functions and each driver use it.
> And cleanup the definition.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/25] ASoC: soc-dai.h: add missing snd_soc_dai_set_widget()
        commit: 37ed123689968fa7f733598d9a6966e8a2db66fb
[02/25] ASoC: soc-dai.h: add snd_soc_dai_dma_data_set/get() for low level
        commit: 60df5935c27e19cc6595bd1740479a60f1880a32
[03/25] ASoC: soc-dai.h: add snd_soc_dai_tdm_mask_set/get() helper
        commit: d4c0326e6ea038cf99fde6f22296e4e68de4f2b5
[04/25] ASoC: soc-dai.h: add snd_soc_dai_get/set_widget_playback/capture() helper
        commit: 944d721ee5defb376410c7054a7db0a0ef5ff584
[05/25] ASoC: soc.h: add snd_soc_card_is_instantiated() helper
        commit: 2e5f86174e31cc1eda92b308f23f3b29684b339e
[06/25] ASoC: hdmi-codec: use helper function
        commit: c59331b39045fcc9ed3c66cb5c80a8ef3ade820f
[07/25] ASoC: hda: use helper function
        commit: 5bf13408fd06068aeef751597748c9d0569c3708
[08/25] ASoC: max: use helper function
        commit: 812c2852c59f1f532ea9b53d9bbe86231dd83fea
[09/25] ASoC: rt: use helper function
        commit: 8ec352362848d8cc9500ccfb051810597c0abf8a
[10/25] ASoC: cirrus: use helper function
        commit: 0e478b88b257049e1e22077b880419a431595645
[11/25] ASoC: spear: use helper function
        commit: c4d78c4127f9371dcfc77e71417addddcc5a9533
[12/25] ASoC: sdw-mockup: use helper function
        commit: e87abb83fc24a481ba490d8596969e1de3a16384
[13/25] ASoC: intel: use helper function
        commit: ec4b2099c6e01342e5c3289a906615c3abef85b8
[14/25] ASoC: mediatek: use helper function
        commit: 0df2ec8e4706a6adc36d12cc5cf8e1fa7485fbf5
[15/25] ASoC: meson: use helper function
        commit: c765ceda78f0bd9df1217f9beaefea58ecf3865c
[16/25] ASoC: rockchip: use helper function
        commit: 67cc242679b106909be52f8476e372dbb03c0a88
[17/25] ASoC: sof: use helper function
        commit: 323f09a61d43da2aff9b71e8a4764f4c9a88a5e0
[18/25] ASoC: tegra: use helper function
        commit: 1c1a778401b8ad04ae618eb8baa9a34a8b7e3d50
[19/25] ASoC: ti: use helper function
        commit: 2abde57fb82b4259b790212135b2194f2fd4dc7c
[20/25] ASoC: soc-core.c: use helper function
        commit: 9024bae4bb229c38522bb8c5dc45b82f9c27e0fc
[21/25] ASoC: soc-dapm.c: use helper function
        commit: 6855ec72102921814aaa43eab305b541af3e9757
[22/25] ASoC: soc-dai.c: use helper function
        commit: 8ede4b7109f618b3267a9577083b38984857a267
[23/25] ASoC: soc-pcm.c: use helper function
        commit: e15ff262e212387a05316dc465d754c0a62d9691
[24/25] ASoC: soc-topology.c: use helper function
        commit: 2b34c1359cca4812d7c8253ff70c394871c22590
[25/25] ASoC: soc-dai.h: cleanup Playback/Capture data for snd_soc_dai
        commit: 3653480c68120dc16ebfeb80e529200dbbd98f92

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

