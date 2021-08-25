Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E356A3F7854
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 17:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77ADE1678;
	Wed, 25 Aug 2021 17:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77ADE1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629905372;
	bh=m7p6daCSPgaKes4En6UWW7yVDDqC2Pu4GbLK9AYNzPA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GySuDxdBS1h4qzKSkRorSdz0pc9qjSFDdpUsTYSEMV2Hue6E+r4T2XXah/q7pQh7H
	 lfiSC8IWj8G7AdDuwnkcE5VI/OO8tQVUPK8VO6s+me8P2ddWg7CWOHPzNimdkmIvjM
	 9uTc9nztbcYdBQ0qLn1Y4YzxQ78XJOXjtVS4wHoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24396F804E7;
	Wed, 25 Aug 2021 17:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 574ABF804D0; Wed, 25 Aug 2021 17:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC349F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 17:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC349F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pwqs1G+F"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07C24610FD;
 Wed, 25 Aug 2021 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629905252;
 bh=m7p6daCSPgaKes4En6UWW7yVDDqC2Pu4GbLK9AYNzPA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pwqs1G+F8QgIMdzNMMHzE0kJbxkJNt+b1ROTl740x1V4KaRL8HKLsoRgtYHCuOq8B
 NSMyx+YhZ4l1jYSxxc2S3/u8PWayvsRd9sr9AsTZOEbk0oJ6qrTJZRXEFA/G+a1+XZ
 A1bUiridukYUIdmppaUUNtYamjRmRwJVZlp+Zdb6VO4nWeikhSJKSEjZzJJd0wG4ty
 HloV2VjYfH8l8063pC3RT7AEB4QYNxMIYYYnlk5PrkQRE1GkZzTT6lGB35Ov+I1C2M
 5/967vfvf2+L2ReL6C8bXjyOqX/1NacOO4v6+4FiB/94v4GXQ9n5yoeiH0kb9Xh4hA
 CXg394utPd6Ng==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, festevam@gmail.com, tiwai@suse.com,
 Xiubo.Lee@gmail.com, timur@kernel.org, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz
In-Reply-To: <1629875681-16373-1-git-send-email-shengjiu.wang@nxp.com>
References: <1629875681-16373-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: change dev_err to dev_err_probe for
 -EPROBE_DEFER
Message-Id: <162990401497.56501.6446443015923932557.b4-ty@kernel.org>
Date: Wed, 25 Aug 2021 16:06:54 +0100
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

On Wed, 25 Aug 2021 15:14:41 +0800, Shengjiu Wang wrote:
> Change dev_err to dev_err_probe for no need print error message
> when defer probe happens.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-rpmsg: change dev_err to dev_err_probe for -EPROBE_DEFER
      commit: a8946f032eeace6eeb4e51e518275010e5528660

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
