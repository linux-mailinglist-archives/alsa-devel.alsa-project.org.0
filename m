Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5A60455F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C5988AB3;
	Wed, 19 Oct 2022 14:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C5988AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666182856;
	bh=oOnhVUIHiH0yGL9fC3+A+0Ub20Zf3b/FKt4v93Wr/rc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PUFBadZoNV610H/G8NDq5olHIgr1QjFC4UGH7jhgvI1t7AzPpuVbrEG28jGssHymi
	 ynqgSUDtO3kfReSyqaXca+qaA12Z7ZluTn5eau+rpQ8e6f2/3PZA51Skfoe3LdB4rF
	 77nUFztpxdCqrgqRBJCmFGNpr4b9S+IgO0v2oS0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7ACF80557;
	Wed, 19 Oct 2022 14:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66BCAF80517; Wed, 19 Oct 2022 14:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24292F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24292F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bn9zlEos"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E70CB822C8;
 Wed, 19 Oct 2022 12:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12C0C433D6;
 Wed, 19 Oct 2022 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666182746;
 bh=oOnhVUIHiH0yGL9fC3+A+0Ub20Zf3b/FKt4v93Wr/rc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bn9zlEosaPgLlPqzyuLR9XmkCfO495g8zzJrlgVqpJFiEhsDWASolHyY1ypN/c4+R
 L8sakCrWTyJHLKHTKawjwbE1wdtF80D63b+1kkAeSUEscVFytGy3HTejlvJMdYtsYA
 ATRt/mUuZs+1KlAYSvgTHXWmYlwB33FjMWWLOmn8DMf6aU5kdt3C78QoMvHmauKK+N
 IUkslxVqMZm3/nCMBNt/1JZGvUMh3S8aLDWU13ZBktSgxLtWdi3IESgmxPSf7QIWaz
 fe738yS2rzUgLkTWAkJYnISYd1GbRLSaGJHZgAypzFCBpsshzP7gcJNT+ievtSiXgL
 2kLWf5qk6n1ow==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20221018121332.20802-1-peter.ujfalusi@linux.intel.com>
References: <20221018121332.20802-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-mtrace: protect per-core nodes against
 multiple open
Message-Id: <166618274472.118898.3768056072670907786.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 13:32:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Tue, 18 Oct 2022 15:13:32 +0300, Peter Ujfalusi wrote:
> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> Add protection against multiple open of the mtrace/coreN debugfs
> nodes. This is not supported in the implementation, and this will
> show up as unexpected behaviour of the interface, and potential
> use of already freed memory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-mtrace: protect per-core nodes against multiple open
      commit: af6514f2f3828dc39c96cd4686ef5c9d8368626f

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
