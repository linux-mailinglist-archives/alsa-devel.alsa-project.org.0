Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E145FABF
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 02:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2E91721;
	Sat, 27 Nov 2021 02:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2E91721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637976667;
	bh=ssrErp6Zv6UFvQZJ2r4rjzBWHowf96TZAds8iOrIckg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBcfscEla1Riv7f/nnuuHpxokKm8e4Xu9bHWwyadGDnEQ5XannKpKtarCQlpoU8zT
	 h9aJQyGB8J8VcMnDQIstD46dQUPCknVZqyjr8SubWudZF44Nu8N3ZeFzgWuNEoWfwf
	 DjdlZw/TnwHK8z4k83QZb+bdtRJyIKGjYcWKctW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9669F80259;
	Sat, 27 Nov 2021 02:29:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBEFAF80212; Sat, 27 Nov 2021 02:29:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5998F80166
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 02:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5998F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VdworWyY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE0DA60B0D;
 Sat, 27 Nov 2021 01:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC725C004E1;
 Sat, 27 Nov 2021 01:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976579;
 bh=ssrErp6Zv6UFvQZJ2r4rjzBWHowf96TZAds8iOrIckg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VdworWyY+nr8ob9c1aZz3+J4h4Q2ZhkpY0ZixlZ8XBB/yBc+oM4U3YpHODB4G8X77
 97oFBGyNLTjigf1VjhSZbqx8RBMmGFabYWlLx8GVYMDdKUZFCwq+w/7ql8XyzClaea
 VV5Fp1qdUg8IUWnl9e8V+GSQKNR5ECbcuxJMm/OEilV85Bah5JAgS/I9kdsnW7BUwo
 AqHS/mJJGwxTSVlMjA7a+hWQNX8BIKQ9W6kL6l4ZrXmNHIouKmWiSUn3K4g30cGR2X
 7d/+qGFucVdZvIpprqzxVLT4zXVeAUcRTIdkNpH8yhuLAiFhCfuhYnbbyfTxfT/Mhi
 5kPH7ahTKW0yA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, Sameer Pujar <spujar@nvidia.com>,
 perex@perex.cz
In-Reply-To: <1637676459-31191-1-git-send-email-spujar@nvidia.com>
References: <1637676459-31191-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH 0/6] Suspend related fixes on Tegra
Message-Id: <163797657754.2987896.15112513397487724007.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On Tue, 23 Nov 2021 19:37:33 +0530, Sameer Pujar wrote:
> This series addresses following problems:
>  * The runtime PM is not balanced in MVC driver, whenever
>    mute or volume mixer controls are set.
>  * Some of the AHUB devices (SFC, MVC, Mixer, AMX and ADX)
>    use late system sleep. Suspend failure is seen on Jetson
>    TX2 platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/6] ASoC: tegra: Balance runtime PM count
      commit: 70408f755f589f67957b9ec6852e6b01f858d0a2
[2/6] ASoC: tegra: Use normal system sleep for SFC
      commit: af120d07bbb0721708b10204beed66ed2cb0cb62
[3/6] ASoC: tegra: Use normal system sleep for MVC
      commit: c83d263a89f30d1c0274827c475f3583cf8e477f
[4/6] ASoC: tegra: Use normal system sleep for Mixer
      commit: b78400e41653b3a752a4cd17d2fcbd4a96bb4bc2
[5/6] ASoC: tegra: Use normal system sleep for AMX
      commit: 638c31d542a576714a52bb6a9a7dedff98e32a1d
[6/6] ASoC: tegra: Use normal system sleep for ADX
      commit: cf36de4fc5ce5502ce5070a793addd9d49df4113

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
