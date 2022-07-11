Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ECE570968
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 19:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0985A74C;
	Mon, 11 Jul 2022 19:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0985A74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657561706;
	bh=vpUdQLXaJEHyLzgkNj3E7A92D1BB+VPYxNnRqSjIYh0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8fRFlAZWHzLUVX/JWLSYosVI8d0JiP+pLTk0YCvmamP7So0lAJLKZ/Rg5Wsk6Eb/
	 YBiSHj4M2bCALkPesZKtI8lvw33UzTuKaHYbNgI4OYI/OjnJ1aGw2Y8/wV4u2EfCz/
	 N+HzAJcaHtMkIjn7r2cvMlercltrWlaRc8R5sdLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C6F4F80256;
	Mon, 11 Jul 2022 19:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AD95F80163; Mon, 11 Jul 2022 19:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DE45F80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 19:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DE45F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gC4ZCQxF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6532B810CC;
 Mon, 11 Jul 2022 17:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8CEC34115;
 Mon, 11 Jul 2022 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657561637;
 bh=vpUdQLXaJEHyLzgkNj3E7A92D1BB+VPYxNnRqSjIYh0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gC4ZCQxFiJdXLoTc9jPUMAq8xb0ZmixWXa0RAWJSSD8C/OPXIWXH9DjPiphhx/DPE
 7nw7AMLfW6vhDPD2X8aWXd8M3ND20InW38ahfV76YpgDWATlxAdpIkbGm37vrCeBnD
 5HcVtVDZgMUImLZDgJdszw8A6+gHW4/sz/YPfSsIuuC5xdMUG1iikXbL/l3Eq0rrSt
 6EPYRhvXA6B6+2eGM0OCYsdl3Og+Z4ftei7DTqbu9Ei7xVw6UaR2AR80dOBX/h/tjj
 ONDIFH+hzMz0aPJ0x1OjEYM2WG/vbLIrqdgU60cFRuueL+Byyt4vnTf+e2b2lLbrQ3
 pIbTJf/QH+AoQ==
From: Mark Brown <broonie@kernel.org>
To: wtli@nuvoton.com
In-Reply-To: <20220627032959.3442064-1-wtli@nuvoton.com>
References: <20220627032959.3442064-1-wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Add headset button detection
Message-Id: <165756163523.950047.2677646449423611463.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 18:47:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, dardar923@gmail.com, supercraig0719@gmail.com
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

On Mon, 27 Jun 2022 11:29:59 +0800, Seven Lee wrote:
> This patch adds the function of headphone button detection,
> Button detection will be enabled if the device tree
> has a key_enable property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8821: Add headset button detection
      commit: 2551b6e89936f98406bce9c1d50110e3ff443f81

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
