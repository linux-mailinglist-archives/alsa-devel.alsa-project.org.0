Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B02D1D7ED9
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9AB71716;
	Mon, 18 May 2020 18:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9AB71716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820237;
	bh=SUgC84uW341oQgc7k8sLr4G0dzMsv9UdayVXTVrbsrQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RYbSMOUwS+YKYfIJt4vj9u0MiOOeWuOQx/Aodh57F6Dc/ClAQmRrNdBcEGx5kA2hW
	 mvcMuXblLZrT98RnpsVQU+kB9W/drY+CJ15gX/ujIOUxXG8eijSltl0HFXUC4qkVDT
	 1qodFwI0MHQr4GytthsMd4/whW9zIfLff0Psxof4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD17F8028E;
	Mon, 18 May 2020 18:41:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCEF2F8027D; Mon, 18 May 2020 18:41:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, SPF_HELO_NONE, SPF_PASS,
 TRACKER_ID autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27601F8026F
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27601F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Lr9yEstb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F22F020758;
 Mon, 18 May 2020 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589820073;
 bh=SUgC84uW341oQgc7k8sLr4G0dzMsv9UdayVXTVrbsrQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Lr9yEstb/zcAkZxi0n/OobCJdjcmbnMz7tLg2gPA7T7dz6A6HwMi/sTODa/N2hhWe
 vtPyt6RRwLGSNw/RQGtbXcgyTMPsTr4FRefse1XGc7u2agW0cfLNv1UfNFw6DDoZnM
 y0MscD+/eXWzF84iU9vt72NHqE61/nnC4s5nKO30=
Date: Mon, 18 May 2020 17:41:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0766n64.wl-kuninori.morimoto.gx@renesas.com>
References: <87d0766n64.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/21] ASoC: cleanup DAI/Component activity
Message-Id: <158982005876.28736.15658099741784566498.b4-ty@kernel.org>
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

On 15 May 2020 09:45:39 +0900, Kuninori Morimoto wrote:
> These are v3 of DAI/Component activity cleanup.
> 
> This patch-set exchanges soc-dapm.c :: snd_soc_dai_link_event_xxx()
> behavior which updates dai->active but not cares other actives.
> But I think original code was wrong.
> So, I believe these works correctly, but maybe need some tests or deep review.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[01/21] ASoC: soc-pcm: replace snd_soc_runtime_activate()/deactivate() to macro
        commit: d9051d86ad30ca1ef1fc99e29854daeeb3944f8f
[02/21] ASoC: soc-dai: add snd_soc_dai_action()
        commit: dc82910682ef06d5e5a81b4b359945b6f669ee3b
[03/21] ASoC: soc-dapm: use snd_soc_dai_activate()/deactivate()
        commit: 45eb8666e52d2d1733fda7353e48906d34a71e5d
[04/21] ASoC: soc-dai: add snd_soc_dai_active()
        commit: efffd9b344adbf813e3ae6f6136df80000bf2833
[05/21] ASoC: soc-component: add snd_soc_component_active()
        commit: 488b2ca599f96d46d4a4d730845a247328cb6a28
[06/21] ASoC: soc-dai: add snd_soc_dai_stream_active()
        commit: 5552f8d72893cea29a0074a3ea0a1a5766858fcd
[07/21] ASoC: use snd_soc_xxx_active()
        commit: b3dea624b52e8b18cd49f804ce70fe50374aa5db
[08/21] ASoC: atomel: use snd_soc_xxx_active()
        commit: e1c7e1faa404df564e64785c0b5cb7f1ee2d785d
[09/21] ASoC: bcm: use snd_soc_xxx_active()
        commit: 8ca4602d38c5140ae2cbeec9f1dd7803b0c4d61d
[10/21] ASoC: cirrus: use snd_soc_xxx_active()
        commit: 90a61a549df10082463c1ec37bc378799febe8a9
[11/21] ASoC: codecs: use snd_soc_xxx_active()
        commit: 5e518eddd11e8f71aaffc954dc7ee9572fc59808
[12/21] ASoC: fsl: use snd_soc_xxx_active()
        commit: 1d9fb19d8f644bfa17c79660b823b7ad07b0b046
[13/21] ASoC: intel: use snd_soc_xxx_active()
        commit: 846d0a17a8042ea753387b7571731d8265b87868
[14/21] ASoC: jz4740: use snd_soc_xxx_active()
        commit: 48afb287853effb07253bb2ccad2123f37770a8f
[15/21] ASoC: mediatek: use snd_soc_xxx_active()
        commit: 7995981bcfbc150902395af4191a77c9f4b842cd
[16/21] ASoC: meson: use snd_soc_xxx_active()
        commit: 1f79aab5a44871286d414eb2a289aaeea4236fd1
[17/21] ASoC: pxa: use snd_soc_xxx_active()
        commit: aaeb5fb59965217789258486080105337483a9e7
[18/21] ASoC: ti: use snd_soc_xxx_active()
        commit: 36ad1a87104e4a54f6acaffbe2d9533f80179e74
[19/21] ASoC: uniphier: use snd_soc_xxx_active()
        commit: 25d6755213f42ecf0c89f8619747be45e71382ac
[20/21] ASoC: dwc: use snd_soc_xxx_active()
        commit: 8db4f94fb3088528a8a64e2c39c8bf764a9433b0
[21/21] ASoC: cleanup dai / component active code
        commit: 0812a08ac8d054efc6cf2895d3b0e82c8731f8e9

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
