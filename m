Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C04621EE656
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 16:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600031663;
	Thu,  4 Jun 2020 16:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600031663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591279690;
	bh=puRP5BmHybku3S6uqSnFGQ4cJaKeECmJKij/ujNAxQY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hzSZNBiZ5fkfc0sHQMvDWhaJ2gdHhEGUsbvYbt0aDQwBEmTp8ZV+ndoNXRlo7AVp8
	 ianB+yvvHFGya3rswZ0cooYfag+Cxoh2oFkiQ+B5lpNCPL1ZU/djmA7v67JvZwAB8C
	 w4UusscqKhYbqJDl2O4Isx2CMc6r9LgUTzlVjkrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC24F80292;
	Thu,  4 Jun 2020 16:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5528EF800BC; Thu,  4 Jun 2020 16:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31060F800BC
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 16:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31060F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wLMQLIkj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3413F20772;
 Thu,  4 Jun 2020 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591279526;
 bh=puRP5BmHybku3S6uqSnFGQ4cJaKeECmJKij/ujNAxQY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=wLMQLIkjJMbFT1zlo1Jy8DZU6PmmZS+cMO8DG4VrDuPyqfNe3DwaKUSTQeHlRMItz
 pqDY8ORRWyKY+2RACCHgrP3CG8jr+/fU2qNPMA35SZFmoFpGd5876fOgopi4n2FwmG
 Qm5aI8iGSomjw/G1eGl8im511lsAungElS87HrfM=
Date: Thu, 04 Jun 2020 15:05:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, lgirdwood@gmail.com
In-Reply-To: <20200604071016.3981-1-oder_chiou@realtek.com>
References: <20200604071016.3981-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rl6231: Modify the target DMIC clock rate
Message-Id: <159127951452.54171.4011264535234053661.b4-ty@kernel.org>
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, cychiang@google.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Thu, 4 Jun 2020 15:10:16 +0800, Oder Chiou wrote:
> Some DMIC components will not work correctly in the clock rate 3.072MHz.
> We recommend the clock rate 1.536MHz in the gerenal case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rl6231: Modify the target DMIC clock rate
      commit: d605cbb64252071d6a74b4fbb626e1473d91838d

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
