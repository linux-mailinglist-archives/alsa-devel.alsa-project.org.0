Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E44B6D40
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 14:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 336FC180D;
	Tue, 15 Feb 2022 14:19:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 336FC180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644931190;
	bh=6sDK0ccoSzhYNr2YTp0NKTVctS799bzZHwni9VvC+GI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dK48j+g+F4Ty1Wj3igv9zfHmYfnbnXzOpRoQdVu7K/zhlHkJYoy81PQkUSxcFK+to
	 OP/nggyBV3gPeq+JyDEiZFAiCKuTq1c+euQUHOgGUGh1w7uVXa+56mBwP2lwfmcxfQ
	 UPzpFDjS8bLJAevfDhHVZIchc1CXn7Cpruig5gM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE4BF80159;
	Tue, 15 Feb 2022 14:18:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C7E8F800D8; Tue, 15 Feb 2022 14:18:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0709F800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 14:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0709F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CeIMzQji"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8921DB819C4;
 Tue, 15 Feb 2022 13:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3062CC340ED;
 Tue, 15 Feb 2022 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644931113;
 bh=6sDK0ccoSzhYNr2YTp0NKTVctS799bzZHwni9VvC+GI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CeIMzQji6pQPppttKX9ZxoE2OPFrWW9a+9Fu8Coii2iyM02IjSEw+UxvuZ4ouWUt2
 SsJlW8lFWyj2o7mR+xGUnSVGvyeEBjQrMauJS5pY3nxkqFk2U3tuabW1GPt7HKCbMd
 zGUKpP2Uylv5OPTAqCGLkBNVgv920ngnO8CGHQN21B0nqMuamtknG5ra4t/pUjek98
 mwTHb66jaPsTTV1QREPLPJqoB4zVqOQERavSVroCXrbWqNARdgA7gmyMi/6u3OgrlL
 Gxut4aQT4COPorjx2VNFAEL2BAmeh8MIXHLzaxyftpXG7E2FrWkjzwBdMGAMECbUut
 9OBjgEoT7yzqA==
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20220214213223.65780-1-colin.i.king@gmail.com>
References: <20220214213223.65780-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: tegra20: spdif: make const array rates static
Message-Id: <164493111091.974741.18170472602420654568.b4-ty@kernel.org>
Date: Tue, 15 Feb 2022 13:18:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 14 Feb 2022 21:32:23 +0000, Colin Ian King wrote:
> Don't populate the read-only const array rates on the stack but
> instead it static. Also makes the object code a little smaller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra20: spdif: make const array rates static
      commit: 83a1bed1f49869ea0fc7de321d5dcc598d0dfb15

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
