Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A2559BBE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:37:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 606EE1861;
	Fri, 24 Jun 2022 16:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 606EE1861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656081440;
	bh=YLOYNbTCSohGH/+DsIqSDrc5jnYVINgv/JKlqhF3jys=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHiwTUbMsRhWktH00Bbv/yByh5heek2/ma/GqHRcIkeauZ+YTADmXA+ys1FMWT3E2
	 xQXtKNEbael/9G9CbE3Csojld/nFHXCHHkJWr+pYs3A+tcPaEtLcr+98RjvLB5AFER
	 2mls2cGVToBuZIdfFnocHom5H6PULtaOjfdhPUt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 620C6F80137;
	Fri, 24 Jun 2022 16:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A15CBF80139; Fri, 24 Jun 2022 16:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42FD8F80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42FD8F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jAEiTwOm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA5D862072;
 Fri, 24 Jun 2022 14:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81462C3411C;
 Fri, 24 Jun 2022 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656081343;
 bh=YLOYNbTCSohGH/+DsIqSDrc5jnYVINgv/JKlqhF3jys=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jAEiTwOmqVmDx/uUmKUQGo7PPCoeKHT8ewH9a3F1d7A07rPABtsAjd1RqmuiGZONh
 J0A+99w0db7KlubgJQkvXdsNZv77nBfAXGiH7HUVf89EaaUbcnX/BHWZOh82D5hylv
 VGJf4NA0FvWlDrzAiCc5jTcU+Xm9oM/BjB2x+tyGHHCYkTnaYWnJwKI9TXX3gyfobV
 eO3nhDAzQmCE4L15qutDxs3xHHrVFk2kKBvq3bjkfq8U2SnM0L04u+xGXm2QpkVSLS
 kh/m/j8tGqziM3WMHl9IbSAV6p2W5zjR6NRZpQDBTUH4lPBlfTZmHI5tElT4R3qcRa
 L/dOUby1OUleA==
From: Mark Brown <broonie@kernel.org>
To: francesco.dolcini@toradex.com, festevam@gmail.com
In-Reply-To: <20220624101301.441314-1-francesco.dolcini@toradex.com>
References: <20220624101301.441314-1-francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] ASoC: sgtl5000: Fix noise on shutdown/remove
Message-Id: <165608134224.445804.6652358254691834854.b4-ty@kernel.org>
Date: Fri, 24 Jun 2022 15:35:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: zhaoming.zeng@freescale.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

On Fri, 24 Jun 2022 12:13:01 +0200, Francesco Dolcini wrote:
> Put the SGTL5000 in a silent/safe state on shutdown/remove, this is
> required since the SGTL5000 produces a constant noise on its output
> after it is configured and its clock is removed. Without this change
> this is happening every time the module is unbound/removed or from
> reboot till the clock is enabled again.
> 
> The issue was experienced on both a Toradex Colibri/Apalis iMX6, but can
> be easily reproduced everywhere just playing something on the codec and
> after that removing/unbinding the driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sgtl5000: Fix noise on shutdown/remove
      commit: 8070e590dd66b1af68b031da2edf5791fbda7b62

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
