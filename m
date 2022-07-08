Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98156C161
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:49:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B4A1621;
	Fri,  8 Jul 2022 22:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B4A1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657313388;
	bh=Bamh/X/oCw/wmbXnI+hOkWH86iXLJYCl0JfXsxQ4oP0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GHEwZ2tiHBZ/NVh/ahZaWumJ9q/1jGtRn3G8SFyzjDqYTraeEm0dUNbLbf6VyDrzi
	 sMrQ1x6kMmvMa/VZa3O0Zi/A2eJY5PMFHBmNMipqsc3AiKvkqVpjTb53rC0bfFLYTU
	 tBBeDuiy4HbLaG8qOR72Ov4+UOD5yDtUgThXbtdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FDB7F80166;
	Fri,  8 Jul 2022 22:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AA72F80542; Fri,  8 Jul 2022 22:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFD0F8053E
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFD0F8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ogPyOete"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37562B8297A;
 Fri,  8 Jul 2022 20:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B444BC341C7;
 Fri,  8 Jul 2022 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657313252;
 bh=Bamh/X/oCw/wmbXnI+hOkWH86iXLJYCl0JfXsxQ4oP0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ogPyOete0HFn+dWK7TL5r7rIstCyDkz/6TMaJattCB7aLb8f/pw11h23O3QclGuaQ
 apMnYdDyx4OiPu71kS9Z6Ym/4eLhi4FqLvGUCWlPO9WUQsU/aVKakJW1xLI80E12pp
 r0k8vcD6VKWreZYZ2oJvqfZicuCN+2gspSCMcjr3JRAi5TjJDtjcTWsTm615HFfuiC
 JBGLyrDlSMEzRBa8ci1mDasoDSB+yPwc4MkBF46ylyOKl4NEDll4VpPcKATECfD/JL
 VYY/mfttpypCFb4gJKnWOiKPZ+DoWJzUYSN+h7+TcrjZS82E6vw7MbS1PyUP7AZjJu
 5V1eVzDk5H8aQ==
From: Mark Brown <broonie@kernel.org>
To: yang.lee@linux.alibaba.com, tiwai@suse.com
In-Reply-To: <20220707232540.22589-1-yang.lee@linux.alibaba.com>
References: <20220707232540.22589-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: amd: Remove duplicated include in acp-es8336.c
Message-Id: <165731325045.2467307.11786300034305445651.b4-ty@kernel.org>
Date: Fri, 08 Jul 2022 21:47:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Fri, 8 Jul 2022 07:25:40 +0800, Yang Li wrote:
> Fix following includecheck warning:
> ./sound/soc/amd/acp-es8336.c: linux/module.h is included more than once.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Remove duplicated include in acp-es8336.c
      commit: 657efd9c985255960cdd90bafc382a39dc303277

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
