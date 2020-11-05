Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FDF2A83DF
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:47:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA2D169C;
	Thu,  5 Nov 2020 17:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA2D169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604594843;
	bh=3UHLZIzEW15TXpSpqNOpAH3xDTStmcO1nGcJdcK67lA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QOiqskpw+K0kNPJoHeFRqSwkvfP8wzEkvJqx4CLvahTZOiJUPhgcSKqBHWbM/a0ox
	 5CRNSNBHZtA1Ci6In9ByCtRDwr8Xuj6nPW7AcFzqwXoRLXQUGxU9nwwQeByx+8JcU5
	 7Enb9aB38+aBWbNhJCnjm7ZoJUTKXmKLEkTLab30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BA24F80171;
	Thu,  5 Nov 2020 17:45:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AF2CF800EC; Thu,  5 Nov 2020 17:45:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C134F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C134F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lD/pSl9x"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8489621D46;
 Thu,  5 Nov 2020 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604594733;
 bh=3UHLZIzEW15TXpSpqNOpAH3xDTStmcO1nGcJdcK67lA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lD/pSl9xhcFNC8P/62zcEQ8v8OvnDY2dqfrgPVRrGQpnEV4vfZcH/EKzbwj3M4g0S
 kTJoGKJjzG56bhW9Ex0TRTu4XbpT0GSsemFtG6cNEa0RhoeoXnc639oX9lmfTsqnGW
 CPRDqwDlS9h78bhK0HK9jOSFbKk3YyaJZAspGDyQ=
Date: Thu, 05 Nov 2020 16:45:22 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, perex@perex.cz,
 haojian.zhuang@gmail.com, Xu Wang <vulab@iscas.ac.cn>,
 alsa-devel@alsa-project.org, tiwai@suse.com, daniel@zonque.org,
 robert.jarzmik@free.fr, lgirdwood@gmail.com
In-Reply-To: <20201029090104.29552-1-vulab@iscas.ac.cn>
References: <20201029090104.29552-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: pxa: pxa-ssp: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Message-Id: <160459472200.54851.11789751712463576471.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org
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

On Thu, 29 Oct 2020 09:01:04 +0000, Xu Wang wrote:
> ecause clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter, so the additional checks are unnecessary, just
> remove them.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: pxa-ssp: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare
      commit: b8f94957765629e6a0d89abb4ff7e06e6565f61f

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
