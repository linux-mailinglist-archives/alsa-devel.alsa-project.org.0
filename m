Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4EF45FAE3
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 02:32:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326DD1719;
	Sat, 27 Nov 2021 02:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326DD1719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637976739;
	bh=XJhSZlLuBETGQP56bfuntv9zCxe4SskI6kt8Sv9zIz4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=syl4G7s+BTtsnsHI1jWDp+obW8q3i6nbPB9XkUok90vBj7pBxAkXfEmCuSUmQyQpq
	 f40NrOZSE7sUTLbdGlLa6FJBlVesxSABZOeP15OXgb396n/eRgSQtG5umu3m0IIx5T
	 zZLQQpOxnmNkM0Sfqz3IXP9H4l4HYaBjJ2z9MPvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3CBDF804ED;
	Sat, 27 Nov 2021 02:30:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D92F80166; Sat, 27 Nov 2021 02:29:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE6ADF80166;
 Sat, 27 Nov 2021 02:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6ADF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GwxpOKUB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56D59B829B7;
 Sat, 27 Nov 2021 01:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B005C53FC1;
 Sat, 27 Nov 2021 01:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976590;
 bh=XJhSZlLuBETGQP56bfuntv9zCxe4SskI6kt8Sv9zIz4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GwxpOKUBOO74xMaGt/gvl4xWEfi8AEIsd4DBNQ1e2sFoTmFzprNsXZzE9t7+cJGoY
 kyq05Eew08WhVnE33IpSraXD2OjMZPL8YL066elgXldvyV/8x05yIsL1GUj7oCSvnk
 YfwOSl+mqhJPvHeco6gVG1GqK06s5PVAnHMX1HzvI8Fwlpjw+vc9hYBlRooOS22BqX
 LHzd3Jbm95KGZ2FxkCjPRy10uFhzFGa8WUT+eREkIGK2/+qFntpNmPk/6+OxuM8D+1
 xPipAkCNym9G2wHVIguMrNu7yGhZvNrmD5xxDI8mcZjx7w0Lz6mYUMTpWYojngPXpl
 0HwlBoTc9PS4w==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, YC Hung <yc.hung@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20211123103013.73645-1-geert@linux-m68k.org>
References: <20211123103013.73645-1-geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Use %pR/%pa to print
 resources/physical addresses
Message-Id: <163797658773.2987942.13053830278646799334.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Tue, 23 Nov 2021 11:30:13 +0100, Geert Uytterhoeven wrote:
> On 32-bit with CONFIG_ARCH_DMA_ADDR_T_64BIT=n:
> 
>     sound/soc/sof/mediatek/mt8195/mt8195.c: In function ‘platform_parse_resource’:
>     sound/soc/sof/mediatek/mt8195/mt8195.c:51:15: error: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘unsigned int’ [-Werror=format=]
>        51 |  dev_dbg(dev, "DMA pbase=0x%llx, size=0x%llx\n",
> 	  |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Use %pR/%pa to print resources/physical addresses
      commit: 4dcddadf5530a0da00e6b2eb8194297b49d33506

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
