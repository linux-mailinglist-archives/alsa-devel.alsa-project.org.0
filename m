Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E222C3A879A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 19:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E3316B5;
	Tue, 15 Jun 2021 19:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E3316B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623778404;
	bh=SdONMFRJs7Ih+OqCLHPKOjGOo6+vcLRW40A4/iSbxzU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnGzBhExQ4nhFDZGRnIhCtRejb38QJL3PBak8szKYn2uXy/xXNJKETMsXO/coVnca
	 4rfPtGVzTi740I3JILFoawZu3R8Kyvy1qIiMJYnyoswCbgVN/tXmGumb5KGFaAJipY
	 V1cZDXiIsNm5I6ZMBxUfv6IpxhKT384knn2U6mAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEF95F804DF;
	Tue, 15 Jun 2021 19:30:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B40F8025A; Tue, 15 Jun 2021 19:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3714F8025E
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 19:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3714F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="My/AzXud"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B51361403;
 Tue, 15 Jun 2021 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623778198;
 bh=SdONMFRJs7Ih+OqCLHPKOjGOo6+vcLRW40A4/iSbxzU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=My/AzXudtPgjPxNE3pkwlv9Ni3jGESjXpfpUicUM+TTyr6QUmlyQbJMUovaMqjNGo
 NqffrS1qp+WcqS9ooEUfC+2OMFs04OUiSGjQETRx4uV8qRc4nCTiPx8PdYHWImf2ES
 RUhVnweyAUkQjuo8xrTI+vxxQGeLkaqgJpwC034c9fXHSIf1TquswOBWf68BrDKdYh
 Z6mhmujHUCDketUjhexzn9ejGpT0t5RHne9+ejIr6yfsQp1Muzdp5mPZB2s4dXgiBl
 0HAkdvL8CvE7FtJyPB4bZLVHYjq+Ygaz80FkgdCtztu1WYXRrb6LCSfJNa1G2p63uL
 zkti5omBNs7sw==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: jz4740-i2s: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 15 Jun 2021 18:29:22 +0100
Message-Id: <162377763945.21612.3642505677079279664.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615135627.1665168-1-yangyingliang@huawei.com>
References: <20210615135627.1665168-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: paul@crapouillou.net, Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

On Tue, 15 Jun 2021 21:56:27 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: jz4740-i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 50484d14ac3c9d93de0da5b8c546b1cb86df3d31

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
