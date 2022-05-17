Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C44DE52A78E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 18:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62A3B15CA;
	Tue, 17 May 2022 18:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62A3B15CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652803308;
	bh=b+oHipmTddyUCEfLTe547iUSxup2tDJx6tkGs3EkcXY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovow+mbHpl/kpFtCCwcNzWyw3BaNWH1tO3Y9LmM7Uk9fstINbcYm9ImMkDarzlamy
	 8tiDrbuNcjrb1k5vE2HU3n+xq+Jc64AnVEW79bFe2G80c+ujm4gC0bVkxyCLxykqsx
	 zQXF1EMU8hk7NeBgHbC4vOquZjWWuJfwt8i9EcJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5848FF8052E;
	Tue, 17 May 2022 17:59:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BAD5F80524; Tue, 17 May 2022 17:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1438F8051C
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 17:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1438F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kb6Fevdu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40010B81AB1;
 Tue, 17 May 2022 15:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CB5C34116;
 Tue, 17 May 2022 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803175;
 bh=b+oHipmTddyUCEfLTe547iUSxup2tDJx6tkGs3EkcXY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Kb6FevduQQnc1BDygTI2jCYW67vnYL3xn6yXj2HsklomkzAxOo3vLaCowVAMKt/wG
 coVoWx/1r5nCedFjxgHUgmQ+w27+RQx8ed4EOPQZaxUedoEe9kYDBqBpmP/PnYz2SP
 6vH+vb/hzz3Rd/i23twIenU/wFnKwrXnn7tC+jQo2YswCSZ35mlf5WWsg98k40yGiE
 RHjrbg1PZ25E6GxWOnFT+G5r4nIdBalCCQ51E/GO7CA6ZTe6TuZmRb/EPrgGKIYwTt
 GsyS0shiFBoU4BR2XZKokD2gNfIK+9qc07I7osDz5XnEa3IY1auUCWFj8e/4XNqV3Y
 xR9v48lqFyRyw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Vijendar.Mukunda@amd.com, lgirdwood@gmail.com,
 perex@perex.cz, yuehaibing@huawei.com
In-Reply-To: <20220514023806.34768-1-yuehaibing@huawei.com>
References: <20220514023806.34768-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: amd: vangogh: Remove duplicate include files
Message-Id: <165280317326.1635268.6024055141505339683.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sat, 14 May 2022 10:38:06 +0800, YueHaibing wrote:
> Remove duplicated includes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: vangogh: Remove duplicate include files
      commit: d91835655cc9047f8b5c40530791bd3bc020f1bd

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
