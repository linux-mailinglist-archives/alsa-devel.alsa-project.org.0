Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18EE46A3B9
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:03:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 806BC2307;
	Mon,  6 Dec 2021 19:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 806BC2307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813783;
	bh=rm4lpoorN4GW0idvvHmReqqBpZmjcTOc1YuUVO0Ac2g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Doid+/80rpl3dJwnYl6sXoKdJTqazPE6ApDjgl8K2dywGyNb8X09EWNbHmZsh1+ji
	 qA06io5FTbY/PS3tL5xbnLdUAvlLQ3X8YFe3nho0N8F2WUNLAG/F+uSossYjnYve6R
	 tSRn4zl/ikpfE+IogrH/3Lou/acnCaHntCRvk/B4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84603F80507;
	Mon,  6 Dec 2021 19:00:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07568F804FE; Mon,  6 Dec 2021 19:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7251F804F3
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7251F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jjRc2MYZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7F565CE16E1;
 Mon,  6 Dec 2021 18:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2940AC341C6;
 Mon,  6 Dec 2021 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813631;
 bh=rm4lpoorN4GW0idvvHmReqqBpZmjcTOc1YuUVO0Ac2g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jjRc2MYZzQIjUrOw+DzK8UGJnqGKL0Ip5yQ3sGBlCfirVCbHtuH2LDwOooZQOO/u8
 GwYLoxXv33XLoRjiDt7tGJuoFH7JLJOjFT+q7SAbN5EN79RK6lIlN6SmI2jY5MGi/f
 Qz5WKSO+j3PTvt7rYLfEqGD2cBVau4VGy3IxObW7ZKs5naIGxpXb6NGHSrmsKr35zA
 phvlGHIzdQl9LGUXf/sAUQsGpwdzkjpJn8o5IwXJ8CdD0R1WiYK0z2ZHkD9tClBVZn
 Ob2piYABpjZbSjuUNNaByxEtaXgO4cazAIEAfShSH7rjPpkbIgstdMVLKr1JHcPGx/
 Y8BhLRBOd3IMg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, matthias.bgg@gmail.com, tiwai@suse.com,
 Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20211130053905.28470-1-trevor.wu@mediatek.com>
References: <20211130053905.28470-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: support memory-region assignment
Message-Id: <163881362873.2769299.4647182629013116105.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, linux-arm-kernel@lists.infradead.org
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

On Tue, 30 Nov 2021 13:39:03 +0800, Trevor Wu wrote:
> This series of patches adds support for memory-region assignment, so the
> access region of DMA engine could be restricted.
> Patches are based on broonie tree "for-next" branch.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8195: support reserved memory assignment
>   dt-bindings: mediatek: mt8195: add memory-region property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8195: support reserved memory assignment
      commit: 4d408ea0282c374a304ce402866cb7b8a56c6b05
[2/2] dt-bindings: mediatek: mt8195: add memory-region property
      commit: 2da636247bb6f4fc3a9842ade04757790753fd2c

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
