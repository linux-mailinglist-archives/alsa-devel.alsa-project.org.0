Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1D602A2A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26E89C05;
	Tue, 18 Oct 2022 13:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26E89C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092632;
	bh=t7x/A8HbCw3ENFEa0NBFmoMvgPlcglz9IsJ2LAmequw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TRkxEc5O7gpblaTNjOQp0O2U7g8Iwx6T+eKq3AIlwCwNU2wCjLSxMH95ya4a9Ude5
	 1ZROr37akC1BiVTNiSA2WYsOMUqsSd1ivpzPP8lA+973+9a0jExdQlqLtiTV61xNPG
	 sWpGnc/uIejLGoADCEiJ2czJutmXjpfIUp7hqnwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EFF9F80549;
	Tue, 18 Oct 2022 13:28:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 848AEF8054A; Tue, 18 Oct 2022 13:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12AB0F80543
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12AB0F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ozVGQfH0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C77BEB81EA9;
 Tue, 18 Oct 2022 11:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706DCC433B5;
 Tue, 18 Oct 2022 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092503;
 bh=t7x/A8HbCw3ENFEa0NBFmoMvgPlcglz9IsJ2LAmequw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ozVGQfH0HK6rhGMYDfgkvZ7uDwIlPojVdg/p4xZ88I8W+do/H21R2wJAEFCQdBmYl
 zGLhNAWispSleNoCgX4JpVq/95Igt4iaxVg2o76xaBTPcYGQ7gfxgPVW8xoZ6DKfEZ
 663qNLqrKCTr1+Dv6nviBSf6nlm2PyRBXPRjAKxKkAl3jI2gGCkVaWNBPpcRzL1zi8
 kIi7dTe//g7Pf5n40tCRdWDfIbPUs07wmbNCcWFGl7gOHv5PUdTQNRwbxtsj2bXIAY
 vG1Lb19RpFPIlfgSagsfXJiunqgcB0MGGT1J1QzoRaho1MtY/jO6VKSt8kLhgvFBqd
 w+bQSKsm+Feug==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, tiwai@suse.com,
 shengjiu.wang@gmail.com, 
 nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 festevam@gmail.com, perex@perex.cz
In-Reply-To: <1663925494-9941-1-git-send-email-shengjiu.wang@nxp.com>
References: <1663925494-9941-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add Hardware Voice Activity Detector
 support
Message-Id: <166609250118.155136.1014438138123181100.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Fri, 23 Sep 2022 17:31:34 +0800, Shengjiu Wang wrote:
> The Hardware Voice Activity Detector (HWVAD) is a block
> responsible for detect voice activity in a channel selected
> by the user. It can be configured in Envelope-based or
> Energy-based mode.
> 
> There are additional two interrupts for HWVAD, one is event
> interrupt, another is error interrupt.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Add Hardware Voice Activity Detector support
      commit: 29dbfeecab85fc998d8c5c29473da33d272d0c85

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
