Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96565411851
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 17:34:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E19166E;
	Mon, 20 Sep 2021 17:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E19166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632152043;
	bh=WuJaW14p30CONeviIi8PVh2hp7lvuyYTd8An3xHCrc0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfvuuwt6qia/F2DWNUtxiNm9/7nbC4A+Q1+/8g4W3/2aG+7QvZGdn+jQmPG2t5rOo
	 36dGcoFPnbfygqi/dpaHvaeVIwyUqqVxrKz7H+UNN3pIhP4v9whhhm/GOqzSyywBqV
	 mOZwWxsOMSyJy6IiXLkgPj0ehdKHqwoAz/y9fDcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1386F804E6;
	Mon, 20 Sep 2021 17:32:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C1B3F804E3; Mon, 20 Sep 2021 17:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30F7BF80124
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 17:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30F7BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lrTJiQ9I"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FD9C60F58;
 Mon, 20 Sep 2021 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632151910;
 bh=WuJaW14p30CONeviIi8PVh2hp7lvuyYTd8An3xHCrc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lrTJiQ9IsLIexvDtk4XoAIlGqX/6GEqAFb2y81bpFrM8MAMzj4XnaEYtp7sm5MMBh
 KwBJcX019F6NODhE6hUZNt/WXCnVrLoiNuGidO9qbQuL6seDtkUldotb4kU2fBud8I
 fg20Jz6uDiS959RTKQxwcjdontSmHoQWU94wN7uG0fgyp7lNLTjWSPbctROM1khiNC
 aDpqAIscgdGY+WqOtDS0spF2ZZNQMIupLk1MpLsMPpYw7NXXSPo/9eqqbIX6DX5jVZ
 NGN+GdL9QgMbHHjnM+pex2UI57y2qCW//Zc4HINmrFut/zzhSkthfdU3VPub6KfCLP
 b3ladC51bLKkA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com,
 will@kernel.org, kuninori.morimoto.gx@renesas.com, catalin.marinas@arm.com,
 jonathanh@nvidia.com, thierry.reding@gmail.com, perex@perex.cz,
 robh+dt@kernel.org
Subject: Re: (subset) [PATCH v2 00/13] Extend AHUB audio support for Tegra210
 and later
Date: Mon, 20 Sep 2021 16:30:48 +0100
Message-Id: <163215150719.38322.16495204170646582113.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sharadg@nvidia.com,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 13 Sep 2021 22:12:08 +0530, Sameer Pujar wrote:
> Earlier as part of series [0], support for ADMAIF and I/O modules (such
> as I2S, DMIC and DSPK) was added. This series aims at exposing some of
> the AHUB internal modules (listed below), which can be used for audio
> pre or post processing.
> 
>   * SFC (Sampling Frequency Converter)
>   * MVC (Master Volume Control)
>   * AMX (Audio Multiplexer)
>   * ADX (Audio Demultiplexer)
>   * Mixer
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: soc-pcm: Don't reconnect an already active BE
        commit: 0c25db3f7621ce39e959e95b8fea240ea2bfff6a
[02/13] ASoC: simple-card-utils: Increase maximum DAI links limit to 512
        commit: 7a226f2eabdc2e839d8f07c5ce087136f9c0f35c
[03/13] ASoC: audio-graph: Fixup CPU endpoint hw_params in a BE<->BE link
        commit: 30b428d02cbc9888d84407306d54dce8c2b8bfbf
[04/13] ASoC: dt-bindings: tegra: Few more Tegra210 AHUB modules
        commit: aa56a9dedf9940a85fcfcc09d838334b2f219424
[05/13] ASoC: tegra: Add routes for few AHUB modules
        commit: 94d486c2e5e72f62b4320288c0e69393326e14a9
[06/13] ASoC: tegra: Add Tegra210 based MVC driver
        commit: e539891f968722d632234ac942c4749ad8ca189a
[07/13] ASoC: tegra: Add Tegra210 based SFC driver
        commit: b2f74ec53a6cc0f2bb6cdb61d430828337d0e069
[08/13] ASoC: tegra: Add Tegra210 based AMX driver
        commit: 77f7df346c4533b91d0dcc2b549eb7c98abd198b
[09/13] ASoC: tegra: Add Tegra210 based ADX driver
        commit: a99ab6f395a9e45ca3f9047e9b88d6e02737419f
[10/13] ASoC: tegra: Add Tegra210 based Mixer driver
        commit: 05bb3d5ec64a632acebdb62779dd4c9d7dc495d2

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
