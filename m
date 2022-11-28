Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC963ADFC
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64DF16F5;
	Mon, 28 Nov 2022 17:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64DF16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669653668;
	bh=BrllwnabEwsZUNpypiQCDCSmWMr90y9cZ/QwMZvkEiQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ot/9ctOmz5NkNrcmeGPCb/ypIVGoRd9oEcBfodi+ymkpoLj2fXwtqlKUGXPQ1/AUH
	 rvXXLQCPny14ppaIlEV4j3o6/+N0RfIBWwgREjqPrwsZ0vsa/riyLci6POX9zUmMrP
	 yiI97XTEGfJG61gRTrNtE5dULeSH0sKtlPx6ur9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 434EFF8055C;
	Mon, 28 Nov 2022 17:39:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0794F80558; Mon, 28 Nov 2022 17:39:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE23F8028B
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 17:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE23F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BJrVTZcA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8884E61053;
 Mon, 28 Nov 2022 16:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE36C43152;
 Mon, 28 Nov 2022 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669653555;
 bh=BrllwnabEwsZUNpypiQCDCSmWMr90y9cZ/QwMZvkEiQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BJrVTZcAMo7xjasf/8m8SJEZvo2bCxQN82BT06gMyLuoM0vkULbYByyQ9WBiirVEZ
 17U0K1FwG2QPTZHM0XMPKa0x7It3vIcBAH6MHVVI73VoyeMSR9p1RcjeCkcCXiopQZ
 pbLtu12vAoHQwROLxLJnSTzpfDRgumPD1agmqJeI9K/F26VQWQFB/iZPVUD/w9Lbkl
 qGrIr19JUOx79fgdPfFHotklxIXP3yeKDl527rI6sNHgPJR1AJXEDlnB998ks+1yXS
 AUPsabhgTU9IlxqcfZsQ05lg47Gtozj57nnewrd8bHk3PSaonYTljoIIi1nm2OxOqO
 DdRtkvTettvUQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20221128070825.91215-1-oder_chiou@realtek.com>
References: <20221128070825.91215-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5640: Fix Jack work after system suspend
Message-Id: <166965355314.629583.8138927105597197358.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:39:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, jacal_tseng@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com,
 Mohan Kumar D <mkumard@nvidia.com>, flove@realtek.com
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

On Mon, 28 Nov 2022 15:08:25 +0800, Oder Chiou wrote:
> We found an corner case in RT5640 codec driver which schedules jack work
> after system suspend as IRQ was enabled. Due to this, hitting the error
> as register access happening after suspend as jack worker thread getting
> scheduled in irq handler. The patch disables the irq during the suspend
> to prevent the corner case happening.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5640: Fix Jack work after system suspend
      commit: 5fabcc90e79b460d72df582b31854f6018695965

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
