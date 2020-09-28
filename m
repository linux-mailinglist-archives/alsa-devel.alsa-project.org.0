Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2171A27B572
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51AF01863;
	Mon, 28 Sep 2020 21:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51AF01863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601321896;
	bh=LcJtUPXXoFuJEAfj8VdKX+yxcZ/jCnpuAAfZ0654HPI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0/PabT+hgXJ01/fDXkHQd6EYE33VRa65dUsnQF1ImorxK8CYhrnMdQea1ZnQSay9
	 nnxPdCbQ7NE+dg8kjVS81s0fJ5KqT2gwgg7QkCiqOZ3MLn7HSWSyJWmrtSGTX4yMn8
	 EQ+cbr25Bcg8cd2H0YtgFB9mlA9txfYrR8f1gUWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05179F80292;
	Mon, 28 Sep 2020 21:35:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2660F8029A; Mon, 28 Sep 2020 21:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C83EF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C83EF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eP75wg19"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D085620773;
 Mon, 28 Sep 2020 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321744;
 bh=LcJtUPXXoFuJEAfj8VdKX+yxcZ/jCnpuAAfZ0654HPI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eP75wg19co7MEAqNHnZInfqCu0eZgAKr5jzAVdgXxEqnh9AKLnIiJfq0JWN5OiMhS
 fOKJfPUw3MvrpmKkrILKRfKhLPlGZ1fNZ31ByA4p1uFlgmsIOETYINZ88c1Z/pCd40
 XPa1xEfTLWQPiRfbA20NBiBFHCicLFTxFKi43eJs=
Date: Mon, 28 Sep 2020 20:34:47 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20200928074330.13029-1-peter.ujfalusi@ti.com>
References: <20200928074330.13029-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: ti: j721e-evm: Fix compiler warning when CONFIG_OF=n
Message-Id: <160132168198.55254.17359569253979567286.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org
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

On Mon, 28 Sep 2020 10:43:30 +0300, Peter Ujfalusi wrote:
> Remove the use of of_match_ptr() macro for of_match_table to fix compiler
> warning when CONFIG_OF=n:
> 
> sound/soc/ti/j721e-evm.c:528:34: warning: unused variable 'j721e_audio_of_match' [-Wunused-const-variable]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: j721e-evm: Fix compiler warning when CONFIG_OF=n
      commit: 5ec3c854d1a7edb95b20999d480b0c16c717254a

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
