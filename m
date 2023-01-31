Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEC68392F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 23:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C08C9F6;
	Tue, 31 Jan 2023 23:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C08C9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675203595;
	bh=LM+Q1L66VNrohk2KsCb097ycRFTc55Zp5fivS41VsiU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bsupspIdq24mTfaIfh/aq2L8KNwBuDkMK1jlqQYNQ8Z1m02tAXHNTdp9UPW5QT84X
	 Nmdu4HHdlDG5g1+Q+eBR42G4nWzviz5nDlKFujIeLgRRQ4pEhGBDKVLfODyozlDHIs
	 qQ+U6iLv3+4SYQvLy99ikWmTth0GRE7zIHe7BmI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E758AF8053D;
	Tue, 31 Jan 2023 23:18:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B0A3F804E2; Tue, 31 Jan 2023 23:18:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9087F80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 23:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9087F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FQWtluPt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7963C61736;
 Tue, 31 Jan 2023 22:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66694C433D2;
 Tue, 31 Jan 2023 22:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675203479;
 bh=LM+Q1L66VNrohk2KsCb097ycRFTc55Zp5fivS41VsiU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FQWtluPtEFrxtp5goJezeECWbLdi5vo6TKrMsrAGZJPIG9T6Pvh+4YGKjUs+VZkXY
 2LK74xKt3wfsExnCfRjDZjgn25l3Suv2ZYooMY4GQczfYEzIwpNfpMy0LFcBOuGPC6
 bJnrscbl8SVhgcV6pZBT7uUovaTuM/A8fh3UftqHGLbdLSi44OSuvt48RcKPWkqDAf
 xb2Mwtw70NUenw77cFaxvRDBO9VhpH+XqtQCQBkQC7FOqzOuHQJVKS97Pj2W0Uocoz
 S7ZG7gP4+OqDA9nBNmdskRYV+l3OQfKgz55iXVjAHvnIYkGsdOl0x/AK2ZY6LNNJhy
 phqjfCJ5YWZKA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/25] ASoC: use helper function and cleanup
Message-Id: <167520347913.1362284.16856323521695657016.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 22:17:59 +0000
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

On Tue, 24 Jan 2023 02:07:19 +0000, Kuninori Morimoto wrote:
> These are v2 patch-set to use helper function on ASoC.
> 
> I'm posting about DT schema fixup, but it seems take longer time.
> This patch-set is 100% independent from it, so I will post it.
> 
> struct snd_soc_dai need to have info for playback/capture,
> but it is using "playback/capture_xxx" or "tx/tx_xxx" or array.
> This kind of random definition is very difficult to read.
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

