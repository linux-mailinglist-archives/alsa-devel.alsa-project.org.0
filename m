Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C063B329547
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:40:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8EFE166B;
	Tue,  2 Mar 2021 00:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8EFE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642007;
	bh=VvLYvJ0aIkonlcmlC5Homj2udF5HvWgNbKU0ABVOuPE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M/ld7QvIC8hJ8zHWF46jVCeupElvcQauvyHt9e1/XRkzGbkqoCtMTA/PWsGrd7Ok7
	 XQlD01L/Fm+ctrViGjoOKNXyjoVmU1YcJ+Bu4VE67E3WXcdBNxK3LHJJBPMXcEpAO8
	 oWOC8uirvH/XHoUmVjO2jmfhinIBQkzR1Jo6DQIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 280F1F804C1;
	Tue,  2 Mar 2021 00:36:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AB05F804BD; Tue,  2 Mar 2021 00:36:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30486F804AB
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30486F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q6kuBlTm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CACBA61481;
 Mon,  1 Mar 2021 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641785;
 bh=VvLYvJ0aIkonlcmlC5Homj2udF5HvWgNbKU0ABVOuPE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q6kuBlTmclg6ZJDHh3R6WSs/uy43Oa/PTlEJEx62NxwJ6Hrg1wlfZYD6aITbK8Lmx
 pkvRlbXq2zRqDqiOYSGzlLOUq+OQKbhlDSPsgS9bycF2EW+92KnzaCytniLiZDsQv1
 IJ8V6ZR56rVb1iXjpBirW86Ts48pR2fRf3oEEFP9wePKKxQFAk0+FGUn5jSwc7XrIF
 Dvyj4DXIDwaT/mrjZQjDbQOb8LZ8BMXwsswpUb9nQ003v5KM9etA5vzNl+PmzjEuxK
 yyzE6hW+liY5NW1Zc8uQt4B+uf4ViIxo+aPFuQd6fQphQTrZT/BWV11SaLVi98mlcO
 ctf8/ua2IXiWw==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com,
 festevam@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1613984990-5534-1-git-send-email-shengjiu.wang@nxp.com>
References: <1613984990-5534-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: move reset assert into runtime_resume
Message-Id: <161464168098.31144.2631005760387940700.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 22 Feb 2021 17:09:50 +0800, Shengjiu Wang wrote:
> Move reset assert into runtime_resume since we
> cannot rely on reset assert state when the device
> is put out from suspend.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: move reset assert into runtime_resume
      commit: 0f780e4bef4587f07060109040955d6b6aa179a2

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
