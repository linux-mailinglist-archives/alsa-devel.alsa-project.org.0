Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C783DBEB6
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 21:06:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D25020AB;
	Fri, 30 Jul 2021 21:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D25020AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627671995;
	bh=zOGnjhKkN2kboqIf15L8awEjWTGdECV9Wk8eV4CT0iI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2LUvFr2wRL1NzJeyeVOgH4CzJ+wudgm4/hwGutMow92rHRWUdW2ljkdbddSQ8YVW
	 3QkUDgKjn8uqC1oHyRzl04k6IZDL052342ncd189A8uH27okToV3gQGPpvasVfrqDp
	 GZrRV5fZcaPTOsG4vHofjjZo3NIMRj0IcI/apQmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D23F804EB;
	Fri, 30 Jul 2021 21:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91572F800E9; Fri, 30 Jul 2021 21:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06446F800E9
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 21:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06446F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BWbMtYdr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2917660F4B;
 Fri, 30 Jul 2021 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627671842;
 bh=zOGnjhKkN2kboqIf15L8awEjWTGdECV9Wk8eV4CT0iI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BWbMtYdr1e4orAi0AhIfLxTzTikGp6jegSZuSDY79Ug88WoJbJTgXZOgFD75pqzen
 KeI/xW62UgsaqAtaUcE7wWClivboGItXaLcb+aSBDA5/DRqOEGpf5Hf2rfKj2xRQQd
 M28VsvlYzTrqJFMOQ0wOIwUQj9cq6DSdC0+TcPTdVZgG3wsABDFACT2s8yAJRsL87C
 V0xTa08UQkpW3UhsZ0XaybeBiOeT+Ai7P06twznG13PwvCcmr9RqHnoELnlA0BuM5t
 8FGK5ymWlDXldBf8AVjdy8duPyxwF6UtWhK3LxzuaX+m+WjHdrQdgo2GNtFl0QlBhh
 BKL+F2SUREVfQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
Date: Fri, 30 Jul 2021 20:03:38 +0100
Message-Id: <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
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

On Mon, 19 Jul 2021 14:40:32 +0100, Biju Das wrote:
> This patch series aims to add ASoC support on RZ/G2L SoC's.
> 
> It is based on the work done by Chris Brandt for RZ/A ASoC driver.
> 
> Biju Das (8):
>   ASoC: dt-bindings: Document RZ/G2L bindings
>   sound: soc: sh: Add RZ/G2L SSIF-2 driver
>   arm64: dts: renesas: r9a07g044: Add external audio clock nodes
>   arm64: dts: renesas: r9a07g044: Add SSI support
>   arm64: defconfig: Enable ASoC sound support for RZ/G2L SoC
>   ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
>   sound: sh: rz-ssi: Add SSI DMAC support
>   arm64: dts: renesas: r9a07g044: Add SSI DMA support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: dt-bindings: Document RZ/G2L bindings
      commit: 2b761f476f3a6e0a212c8c88e7855f66edb177e0
[6/8] ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
      commit: 5df6dfbb6de815ba3a75c788a916865212fd5221

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
