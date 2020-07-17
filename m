Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA4223FD2
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 17:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D196F15DC;
	Fri, 17 Jul 2020 17:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D196F15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595000595;
	bh=oUWXy3XEEdACj4VXB3S0A8gloCT8UAGtaaANZlTOhcY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=en2IQmbirweJaTxz+YCwXS95nKRwzO03A+Vc8JlN2ZnQbijhfi3pYJUEKIz2nXZNj
	 3eBrgQtEOUQHnK8pTK4DNvfaXoE6NrlohI8MtVERBMHyHxN0XmILo61ilH+X0LbxvB
	 1ILEG/ZeNEhZu7iDK7Jdjq4ZJaISLg8A9UGX3cs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F36EEF802C3;
	Fri, 17 Jul 2020 17:40:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59F28F80229; Fri, 17 Jul 2020 17:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0632CF80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 17:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0632CF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="egmxPzhC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D94742076A;
 Fri, 17 Jul 2020 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595000401;
 bh=oUWXy3XEEdACj4VXB3S0A8gloCT8UAGtaaANZlTOhcY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=egmxPzhCJaO5Pklo2wFUgCisrdBaL7j2ncVrgoys66Ov9LXhgVzxXGFqIlODz/BYm
 SBeDYsmknwq4gkwP74D2/j5goaQrPlJbtdJY2ErVv8nPqEDRjP6D+aAJZpnM8njnoZ
 FRAkq9i/JLIztXRgN6hLt6p5JYwLKxyZ+Mt0PWp4=
Date: Fri, 17 Jul 2020 16:39:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jens Axboe <axboe@kernel.dk>, Liam Girdwood <lgirdwood@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Niklas <niklas.soderlund@ragnatech.se>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>
In-Reply-To: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 00/20] Add support for SATA/PCIe/USB2[3]/VIN/CSI on
 R8A774E1
Message-Id: <159500037996.27597.9512992990495217445.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-ide@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-i2c@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
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

On Thu, 16 Jul 2020 18:18:15 +0100, Lad Prabhakar wrote:
> This patch series adds support for the following peripherals on RZ/G2H SoC
>  * PCIe
>  * SATA
>  * USB2
>  * USB3
>  * Audio
>  * VIN
>  * CSI
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: renesas, rsnd: Document r8a774e1 bindings
      commit: 92e37407811b98a7eb54eb6a6b3d65847a46e0e6

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
