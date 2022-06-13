Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09237549995
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 19:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0FB175E;
	Mon, 13 Jun 2022 19:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0FB175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655140479;
	bh=Iavf4KFx8bqx/XdK7Ou3mmwM/3mmQvaTM9KAKq90uYc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2oRZ6MNQLiRrd75LGWBdPraCZaSxl6w5gipa8mbvzDdXFF+HmnDFP/ntvZV4ApqV
	 qhM1M4R87RlNmiV7AkIg1yLgjtEhTRq6n8AGNdW15VGh8XaD6ujMBZxHUiAKKyp09n
	 zl+OCup4arBjWByRRTPeenEs3uFllsp8YBk3pOWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1753F800D8;
	Mon, 13 Jun 2022 19:13:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65B66F800D8; Mon, 13 Jun 2022 19:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5E8EF800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 19:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E8EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JCevrMDS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C22BB81174;
 Mon, 13 Jun 2022 17:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDFEC3411B;
 Mon, 13 Jun 2022 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655140413;
 bh=Iavf4KFx8bqx/XdK7Ou3mmwM/3mmQvaTM9KAKq90uYc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JCevrMDSXAWgirXobGJ78qjp6Lhhzu1Twi/j9GdzJZydhi3AlwaGQbr/00eY7pbS+
 3FKbSzRJudnrTgFCXlp8Vn5oMtUWmjCRnsEAeQeYz8sdbkS/KKJ6K0PqygwoL4vzj2
 Czzq0F0/pAfJessfyjlBUTap1rfdFsk+eDDbhJ2hwCwv65zra0osmps3ukAbaa6Vle
 5TPZfwzkndCgZAgSymYDanHcpgkBc3tkD4NMDQoQF7TLIP33Wb78SyaV2Py6ps5Bjs
 rg2qvHM+REZ7Klu2yF/QQ2RBhEaqAPKz7zj+tc5WYyowNXGNEvn9IPz3/++ri242g9
 jDBeyXY2sS+Uw==
From: Mark Brown <broonie@kernel.org>
To: ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/23] ASoC: SOF: IPC4: Add topology, control and PCM ops
Message-Id: <165514041222.665766.3914388564305919521.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 18:13:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Wed, 8 Jun 2022 20:26:20 -0700, Ranjani Sridharan wrote:
> This set of patches includes changes to add the topology, control and
> PCM ops for IPC4. It also includes a couple of patches to set the IPC4
> BE DAI trigger ops for SSP/DMIC/HDA type DAI's.
> 
> Bard Liao (1):
>   ASoC: SOF: IPC4: add sdw blob
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: SOF: Add topology tokens for IPC4
        commit: bd10cd5ec54616a488d0bda695f78694ad79f779
[02/23] ASoC: SOF: IPC4: Introduce topology ops
        commit: 90e891551fb4949daeb3df20d43e7da838ef89a3
[03/23] ASoC: SOF: ipc4-topology: Add support for parsing AIF_IN/AIF_OUT widgets
        commit: 2cabd02b60901f4ceda4daf8c194905259797702
[04/23] ASoC: SOF: ipc4-topology: Add support for parsing DAI_IN/DAI_OUT widgets
        commit: abfb536bd116d3148e92bf38255fc0989ca9b7d4
[05/23] ASoC: SOF: ipc4-topology: Add prepare op for AIF type widgets
        commit: 904c48c40c66c524df90fb660bdbc514ed802e67
[06/23] ASoC: SOF: ipc4-topology: Add prepare op for DAI type widgets
        commit: acf525942077213e9bc00eee8a73af360ab2fc08
[07/23] ASoC: SOF: ipc4-topology: Add support for parsing and preparing pga widgets
        commit: 4f838ab2081260119677df3ba94dbbd4f8cb7183
[08/23] ASoC: SOF: ipc4-topology: Add support for parsing mixer widgets
        commit: 4d4ba014ac4b3772ed39c15cd2ceacbb071c26f6
[09/23] ASoC: SOF: ipc4-topology: Add control_setup op
        commit: d97964f870786389f4c399a507ffa5d1ebf2a9e4
[10/23] ASoC: SOF: ipc4-topology: Add control IO ops
        commit: 955e84fc0b6df6cfb95ee6f569be809af49d8287
[11/23] ASoC: SOF: IPC4: Add pcm ops
        commit: e75e5db8f8ac5b9d4e8968060822bed4671f22ec
[12/23] ASoC: SOF: ipc4-topology: Add widget_setup/widget_free ops
        commit: 6e9257a13c75b2e4fc33477f9de4912fdfae81e1
[13/23] ASoC: SOF: ipc4-topology: Add route_setup/route_free ops
        commit: 3acd527089463742a3dd95e274d53c2fdd834716
[14/23] ASoC: SOF: ipc4-topology: Add the dai_config op
        commit: acf48a1f76b887f6a63f3c91eedac80b38341c05
[15/23] ASoC: SOF: ipc4-pcm: Expose sof_ipc4_set_pipeline_state()
        commit: d0c0d5bf944b13b4e293746eb655f1c2caf67231
[16/23] ASoC: SOF: IPC4: set the BE DAI ops
        commit: 4c30004a7c6920c66a08c1aa16481c28202eefd0
[17/23] ASoC: SOF: Add ops_free
        commit: bc433fd76faefb8484f5bc653d846043822a2d35
[18/23] ASoC: SOF: Intel: hda: init NHLT for IPC4
        commit: 1da51943725f29000ae4d2be3b3b4bf8309d99a2
[19/23] ASoC: SOF: Add two new structures for topology manifest data
        commit: 4453d24d10fdd9e40c84673e3eda7701055081ea
[20/23] ASoC: SOF: Add a new IPC op for parsing topology manifest
        commit: 323aa1f093e6113f78a8ae808c6c097663d8cb4c
[21/23] ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's
        commit: aa84ffb721587d134702a1932f2c8793e8709df4
[22/23] AsoC: SOF: ipc4-topology: Add dai_get_clk op
        commit: 9e2b5d33fec938ea2518735f2b66313cab89bb61
[23/23] ASoC: SOF: IPC4: add sdw blob
        commit: a45a4d4390b7a562f8edc3518ba6cd2ad17be5bc

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
