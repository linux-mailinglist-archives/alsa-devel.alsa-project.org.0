Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672411E61AD
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 15:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133E617D4;
	Thu, 28 May 2020 15:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133E617D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590671180;
	bh=nXbWr2Tw9L1UbIy+5d+wXv012jFCyTCD/5cTKR5sVDw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRoFqEA2XDwTDh6ksptfxccZG4L5ar1Uby9NICd9+ZzAjknsWxS6oPHy1Ao8M5NSf
	 pWfNzBYb+P5lGV1ooIq9810BkzkwOfa5EDJ3zPoF8eyGDNUROJpF76qd+nkqIGcN6J
	 fsiPcRpYb8Ae8SVGqCUZySj8pYkIZvCsuycvaRkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FC7F802A7;
	Thu, 28 May 2020 15:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32670F802BD; Thu, 28 May 2020 15:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC086F802A7
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 15:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC086F802A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZLmVI24e"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1C7C207F5;
 Thu, 28 May 2020 13:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590670950;
 bh=nXbWr2Tw9L1UbIy+5d+wXv012jFCyTCD/5cTKR5sVDw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZLmVI24eKu4IK+8K9qtk08xenvbQAsBvJ33auFYY8bBHhbOY265RGfMxdqcXyrEbC
 mewHqKA4qkt2YxW0PQLD5e0EsfOvS+CHoRQAuBsk5yXHQw0BZgbe5B/E+wTpjS+utS
 68hBgoVlk/TSaPS/qrCHcF13FxY3jrJfT0by7WM8=
Date: Thu, 28 May 2020 14:02:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
In-Reply-To: <20200528070510.29959-1-wtli@nuvoton.com>
References: <20200528070510.29959-1-wtli@nuvoton.com>
Subject: Re: [PATCH] add I2C device and compatible ID
Message-Id: <159067091850.53762.2822362951156783187.b4-ty@kernel.org>
Cc: YHCHuang@nuvoton.com, alsa-devel@alsa-project.org, KCHSU0@nuvoton.comgit,
 CTLIN0@nuvoton.com, lgirdwood@gmail.com
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

On Thu, 28 May 2020 15:05:10 +0800, Seven Lee wrote:
> The nau8810 driver can also compatible with nau8812 and nau8814.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8810: add I2C device and compatible ID
      commit: 2b1878afc8fb778a881e9a1d7d17b14e13f579dc

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
