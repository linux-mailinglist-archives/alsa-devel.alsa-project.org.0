Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C096248D2
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA4A61680;
	Thu, 10 Nov 2022 18:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA4A61680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103140;
	bh=8dI8eY6XRVF/HoJGtbyK+9hJs93DmhjtU6qSrByxC10=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyKUJaYW2vyyWX45tCgMV8M1RmZxe2bmqBSZXLrxNHOxd8HFoftRzdVNFdMqGqNdW
	 BPcihhoqyBLxdzvFD4Cl+xmnoQS5s/kHG+xbEfirTFHHM2lgKZgzwBUE9ffrO71HdO
	 HFvSynpEojMn3DgSN5mjgwNpVybsOiUX2jgX+WoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48755F805AB;
	Thu, 10 Nov 2022 18:55:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C484EF805AA; Thu, 10 Nov 2022 18:55:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD6FF80589
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD6FF80589
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OAtLTp8+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1ED561535;
 Thu, 10 Nov 2022 17:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45E8C433C1;
 Thu, 10 Nov 2022 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102946;
 bh=8dI8eY6XRVF/HoJGtbyK+9hJs93DmhjtU6qSrByxC10=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OAtLTp8+iWJCoGMy0JXHb53wCbSiQExkneRydmZYlVcf9q3F2o8BrmR2el1B7EfzL
 F95JJEQRXuoxx76LYx5QWgYpb4VVg059HP4FenS+qYRzrVSEMO+JEsvUZPfz3u50yQ
 UM4S/BajnMESc9zA03WIDRh19bbUu9VME95+NgICxEn97kfw0zn+ILDvIeQmdcTC3V
 TooEKPoAHsd7mggfNMCiEZ4ogY+Mw3AJZwk7j30+46Gv/WxEU4KlRDQLQucod5zwNL
 XKQP1eExPh2/CPt8MDtjIR2R1LML8y+2Ci46jjxja1RT9qARqOXqKnNHLITUtmEV8e
 SBgWE7kbLxfuQ==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
Subject: Re: [PATCH 0/9] ASoC: mediatek: Register machine drivers to module
 device table
Message-Id: <166810294251.959181.9607215723593812051.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Mon, 7 Nov 2022 11:04:28 -0500, Nícolas F. R. A. Prado wrote:
> Some ASoC machine drivers for MediaTek platforms were not being
> registered to the module device table, preventing them to be
> automatically loaded when built as modules. This series adds the missing
> registration to the drivers.
> 
> 
> Nícolas F. R. A. Prado (9):
>   ASoC: mediatek: mt2701-cs42448: Register to module device table
>   ASoC: mediatek: mt2701-wm8960: Register to module device table
>   ASoC: mediatek: mt6797-mt6351: Register to module device table
>   ASoC: mediatek: mt8183-da7219: Register to module device table
>   ASoC: mediatek: mt8183-mt6358: Register to module device table
>   ASoC: mediatek: mt8186-da7219: Register to module device table
>   ASoC: mediatek: mt8186-rt5682: Register to module device table
>   ASoC: mediatek: mt8192-mt6359: Register to module device table
>   ASoC: mediatek: mt8195-mt6359: Register to module device table
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: mediatek: mt2701-cs42448: Register to module device table
      commit: f0f217ba7dea78872f5001135984159f4def7047
[2/9] ASoC: mediatek: mt2701-wm8960: Register to module device table
      commit: 59429a5ecc3337aaf6bbd878637250c1c878edc2
[3/9] ASoC: mediatek: mt6797-mt6351: Register to module device table
      commit: 083e948082def40d5d801a3e281d637ee3c0f9bf
[4/9] ASoC: mediatek: mt8183-da7219: Register to module device table
      commit: b5e004b0e5b57d14ac7804875878cdfdb31c9288
[5/9] ASoC: mediatek: mt8183-mt6358: Register to module device table
      commit: bc63a806acdcfca201c68c820731d74185118789
[6/9] ASoC: mediatek: mt8186-da7219: Register to module device table
      commit: 7d6d41e5fbf5e96788c88c9e82a3898ad4cf4f3c
[7/9] ASoC: mediatek: mt8186-rt5682: Register to module device table
      commit: 5d7c2ac0eb3e830a5c8e30515805b3a345d9b919
[8/9] ASoC: mediatek: mt8192-mt6359: Register to module device table
      commit: 2d32a3e52b0537638b31b3315ea1feafc5d0bb02
[9/9] ASoC: mediatek: mt8195-mt6359: Register to module device table
      commit: 6bd8ddf05e9a19fb9efebe46bf58f45b9a6af26a

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
