Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1D3A6FBE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 22:00:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BDA11678;
	Mon, 14 Jun 2021 21:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BDA11678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700848;
	bh=JVtF7puJ1shUATjeFrsP6yt4dbeRT4TfQ9U1qhmr9XI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jbs0UAERncVRE+gZ6VIMEG3OgPKPg/DjOFofyqVnc79hVzHrJNpQ0MrBAl7TRT5Ly
	 qhE0DdXUjRBbTrn8lHEtVcqNZp77t98mgjZuMFSe4rTd7OiZio+TBSx6bWmd1Ix/aO
	 03JZa0IX4qAusvdHr6o0Bg0CWaLqY3yPh8RDCpEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35CCFF8052E;
	Mon, 14 Jun 2021 21:55:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC8D8F80529; Mon, 14 Jun 2021 21:55:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60550F80525
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60550F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QYOp/m5n"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3273E6128A;
 Mon, 14 Jun 2021 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700516;
 bh=JVtF7puJ1shUATjeFrsP6yt4dbeRT4TfQ9U1qhmr9XI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QYOp/m5nxHRC4+bYA1QhNmN6LilNQyXoZGj0ljlVLpHAOlIFcJ5CY9m8kAnquMeRC
 M/L9VxR8gq85iwomsDoO3IAbWt0/max/UCMgls/JrD/A/61JQfAiQ9HYGxCMvWa6Du
 XC0awlcK5lceUwBxOEAdv64W6rmRXsB5RaqG6YkcN8hwpYyA9dMYAeseMIpueKGuH5
 B9KSBKX2arje8GCXfUjfuKyTTMSy1H106mYMJN7AYpRGBDDHOEZjnGthAseXWAfGeJ
 Dty8OynM3u6yf73tAVQzOOt29gRZ6pUnB33rpYPmY038/ldId8m5OhrfHGxe0/8WO1
 tbyc8JGOeu2Lg==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, tiwai@suse.com, Zhongjun Tan <hbut_tan@163.com>,
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, lgirdwood@gmail.com,
 festevam@gmail.com, perex@perex.cz, Xiubo.Lee@gmail.com
Subject: Re: [PATCH] ASoC:fsl_easrc:Remove superfluous error message around
 platform_get_irq()
Date: Mon, 14 Jun 2021 20:53:51 +0100
Message-Id: <162369994009.34524.4963839891327399167.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210610125052.1280-1-hbut_tan@163.com>
References: <20210610125052.1280-1-hbut_tan@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Tan Zhongjun <tanzhongjun@yulong.com>,
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

On Thu, 10 Jun 2021 20:50:52 +0800, Zhongjun Tan wrote:
> Clean up the check for irq.dev_err is superfluous as platform_get_irq()
> already prints an error.Remove curly braces to confirm to styling
> requirements.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC:fsl_easrc:Remove superfluous error message around platform_get_irq()
      commit: 4d5f3a096f3d9e7067c7c2e730d989668e06d552

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
