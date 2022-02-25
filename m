Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472584C4C96
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 18:37:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55441E80;
	Fri, 25 Feb 2022 18:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55441E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645810653;
	bh=yVQLKQLnoKnhVc4ezrGEfHpRFSFDPimf5rhD3F4nZw8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4eL3lxNj+B+X1VccZVMO7b3pjaJ4TJij7Loi8lNLCGMVsLSofcd/1hwZkBzQdwgo
	 PmzqMYfICNNcz0gZiIFScbcUQQQbN3Ofac1Xt4f9gcrsxnoljBZFaaRhj9a0VilvWb
	 UImlNPZgO6gfFaqx4a1lGTCweo7YYfvttG2td92A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD1CF804FC;
	Fri, 25 Feb 2022 18:35:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B52F80132; Fri, 25 Feb 2022 18:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 268D6F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 18:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 268D6F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iA1a7oFH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08D1461DC3;
 Fri, 25 Feb 2022 17:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C96FC340E7;
 Fri, 25 Feb 2022 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645810545;
 bh=yVQLKQLnoKnhVc4ezrGEfHpRFSFDPimf5rhD3F4nZw8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iA1a7oFHNe1g/rggWA/IKrr/hJBYi+it46e25chVfX6ikO1VSGULZcBHUU1HI2TPO
 4Dup8FiEO6u/SX9Yy+U1ptGyX8l4QangLxDU41IIv1g8xvdOqcW0Sff8nG+1LZ+qTD
 7wjA5sG9Ytfj/2mqZSUkTRuRfosLou6sG0vYrdLK0TQMNT5NUgduUiB2ZOUMg90FnA
 DYkdI+VmkVqDUEugCttyglZM9/VnODVkxMed3wHJURXZgamIQfLaePAzSslwvFN2ft
 OjIh5EGqMeJMntsFFfuQxKFLP+Gke9u9dKpXVvd7VnktWo6K6IdXJMvnoIuHqVf6Cf
 ECJbvABM8RV9A==
From: Mark Brown <broonie@kernel.org>
To: Meng Tang <tangmeng@uniontech.com>, perex@perex.cz, tiwai@suse.com
In-Reply-To: <20220225112358.19403-1-tangmeng@uniontech.com>
References: <20220225112358.19403-1-tangmeng@uniontech.com>
Subject: Re: [PATCH] sound/soc/amd: Use platform_get_irq_byname() to get the
 interrupt
Message-Id: <164581054397.2548431.5315227430767175484.b4-ty@kernel.org>
Date: Fri, 25 Feb 2022 17:35:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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

On Fri, 25 Feb 2022 19:23:58 +0800, Meng Tang wrote:
> platform_get_resource_byname(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_byname().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound/soc/amd: Use platform_get_irq_byname() to get the interrupt
      commit: 3304a242f45a501a5de69492e421a45c468c89ea

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
