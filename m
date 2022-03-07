Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DD04D089D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FDFD17A5;
	Mon,  7 Mar 2022 21:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FDFD17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685669;
	bh=1tPC7Vjo747OpXcH2m5vzgTDvgtK+G4DbkC9Mgxsp8Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UW/vhkB1W2x60G5oaDxaRvnOnxteQSPyvD4oY3BYc8rGS8+UMgFUh3foFQ4h7MS5G
	 36LLadPo3GBY6m8lTXhUMwi9o3S8cbFKUnQdFutVo9uXlBS50CcMP1rfOGxJDU3lGe
	 eRZzsnZxFsaHzIie01OGedH/NzBWL6cZ9zqYLcnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A02F80271;
	Mon,  7 Mar 2022 21:39:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9F7F80519; Mon,  7 Mar 2022 21:39:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35378F80431
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35378F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vts6hToD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61AB76151F;
 Mon,  7 Mar 2022 20:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49B9C340EF;
 Mon,  7 Mar 2022 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685543;
 bh=1tPC7Vjo747OpXcH2m5vzgTDvgtK+G4DbkC9Mgxsp8Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Vts6hToDphdrAOTX3rEMyPPPiFWDKk10FZNzS70wvL7IMup0nQMPAhHSKHR20XPLO
 pCzTnRiZsNan8RiU+KMsm4a22qaDZHNPJA9uKESneezSIozRjDV4T03PnbcFx8fh1A
 H+wlnPYgGWfCWauVVrHKYG/gq0HdbTKw/RUyB9yVS+F7LGg4/5dMHcvZCS+GmCgePO
 JZ+/ZZO5bPWu3UrmMPq4TIrvsy++9PaPfulkc3vIMUKloqtjLQTxaZqE/DAMfa4jUM
 h9R5cVvm11hEdZIqozyqltdnMg6BlL2HYXAw2IQN2vWcYVTQ4G3AbKUSqo/VqrkRXd
 9f6MLQvI/oKJw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 kuninori.morimoto.gx@renesas.com, robh+dt@kernel.org
In-Reply-To: <20220228172754.453783-1-rf@opensource.cirrus.com>
References: <20220228172754.453783-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH V3 0/2] ASoC: audio_graph_card2: Support variable slot
 widths
Message-Id: <164668554153.3137316.2454343353845940191.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Mon, 28 Feb 2022 17:27:52 +0000, Richard Fitzgerald wrote:
> This adds support for I2S/TDM links where the slot width varies
> depending on the sample width, in a way that cannot be guessed by
> component hw_params().
> 
> A typical example is:
> 
> - 16-bit samples use 16-bit slots
> - 24-bit samples use 32-bit slots
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: audio-graph-port: Add dai-tdm-slot-width-map
      commit: 26e5366dd30569a469e1a87998b866b814deccf8
[2/2] ASoC: audio_graph_card2: Add support for variable slot widths
      commit: 1e974e5b82b3d75069b50445cd248cee0199654e

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
