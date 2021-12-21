Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22347B89C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:54:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5971795;
	Tue, 21 Dec 2021 03:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5971795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055257;
	bh=qdD3IlBLcb1CCrc6ryPjrgcuHWvblXz5Qe4tDjAsWtw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFcdG7qPjaqeQMsIdYZGtcPhgR/enhetNyY8JkKzW9AmQ7PFm2CEO29b26nMZaC5K
	 hvv3pR7AxshdhGvzKLzJzZoWuytcsR4STzkVxyAYLTXaVM5CzGNEWHh3VPPgeTszog
	 blVcvOnZr0t3MbOLql5nlRLUncngLMqb2RPT2D2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB40AF8052E;
	Tue, 21 Dec 2021 03:51:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A307FF8051A; Tue, 21 Dec 2021 03:50:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61F4CF80518
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F4CF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fg+OGFBP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08781B8111A;
 Tue, 21 Dec 2021 02:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27462C36AE8;
 Tue, 21 Dec 2021 02:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055049;
 bh=qdD3IlBLcb1CCrc6ryPjrgcuHWvblXz5Qe4tDjAsWtw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Fg+OGFBPKXG2ANEnS4eOCr0jhnl41sdAIuROHNPh/dQmDY+sAVIIKv8W5usHNwdR/
 vATmSDCAJ8FBGojgQqtHJbqqE37D3EDP8VBYziYkj49Kki7daG/IXOurrosCXjKX/t
 hPeYlazbcEbwskAA0I7UEjdHXL7CKhrXmNFoOElq9vAn9DRRX9ZsiWOr6CGPufAVw+
 oaphnyZvbylwVfXPROo8rrgHN+bCqGJ5TjJvejOq6kdGySSzu2jqrVZHsSZ5Q/ctGy
 xiL32gGKfozvaDh/WwMH9XxMbKVgTH9duXhH0eyXTGGyfRV5lYvi18s42N5N4oU6LL
 j2k6QB+nLYRSA==
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Agneli <poczt@protonmail.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
Subject: Re: (subset) [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
Message-Id: <164005504688.2647792.15486992358595152806.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

On Sat, 4 Dec 2021 17:37:03 +0300, Dmitry Osipenko wrote:
> This series revives Tegra20 S/PDIF driver which was upstreamed long time
> ago, but never was used. It also turns Tegra DRM HDMI driver into HDMI
> audio CODEC provider. Finally, HDMI audio is enabled in device-trees.
> For now the audio is enable only for Acer A500 tablet and Toshiba AC100
> netbook because they're already supported by upstream, later on ASUS TF101
> tablet will join them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/22] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
        commit: 46f016119e2ac38d9efd32e4957bc888dc71fffe
[02/22] ASoC: dt-bindings: tegra20-i2s: Convert to schema
        commit: 80c3d0a97abfd2a678b6077236a77ccb8c4747fa
[03/22] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate property
        commit: 549818e5c85a6d806cdef146d0203df2689d4e2f
[05/22] ASoC: tegra20: spdif: Set FIFO trigger level
        commit: 16736a0221db6d6f3fe130750c6dc5bbf5417da4
[06/22] ASoC: tegra20-spdif: stop setting slave_id
        (no commit info)
[07/22] ASoC: tegra20: spdif: Support device-tree
        commit: c0000fc618cdbe190274cf37040033dfa23c159d
[08/22] ASoC: tegra20: spdif: Improve driver's code
        commit: 117aeed43974e500dcbd106e51218a83ae2c9977
[09/22] ASoC: tegra20: spdif: Use more resource-managed helpers
        commit: 150f4d573fe19a77864f6dec31aa444332f9fc9e
[10/22] ASoC: tegra20: spdif: Reset hardware
        commit: ec1b4545d75575118e01a5e95699cff5010b4e19
[11/22] ASoC: tegra20: spdif: Support system suspend
        commit: d51693092ecc732fca3f49549cde1c5206331b09
[12/22] ASoC: tegra20: spdif: Filter out unsupported rates
        commit: 9d8f51cd1fa993939db02a014d4f4b6e252c2a18
[13/22] ASoC: tegra20: i2s: Filter out unsupported rates
        commit: bfa4671db1effe315cade5bddd6cf025e1c403d0

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
