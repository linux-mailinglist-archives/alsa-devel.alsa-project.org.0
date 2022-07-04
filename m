Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0281F565A82
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 17:59:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87C551730;
	Mon,  4 Jul 2022 17:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87C551730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656950351;
	bh=a6RKJQCid/UVv8Ya1NMJAoisbLIXHGq7RKNAj6q9jqY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJysXTc5Xa/AmhBFHzltY+DCyPm05/xvM/8OOcWKs3dk+iO65ZJh7m+VfPuVltZB3
	 G9+77thdlq1DnRlsKVDmPPdItH3noqRsGaRJMsZg9OrmEp65AlZ0rb81wDbHTO9+Ca
	 3FcrfiXuMqb2gbpA2i5CWMJmZj3xmwgX6lg23Q4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1768EF80537;
	Mon,  4 Jul 2022 17:57:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89C9AF8014E; Mon,  4 Jul 2022 17:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12523F80141
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 17:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12523F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="liVaWde7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C888B8114B;
 Mon,  4 Jul 2022 15:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E96EC341C7;
 Mon,  4 Jul 2022 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656950261;
 bh=a6RKJQCid/UVv8Ya1NMJAoisbLIXHGq7RKNAj6q9jqY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=liVaWde7+wohy/TzijN+e9VpNx+o7oVFjqX6YuhohjCaFOqnFvVH6MAAQhFQKcd5m
 dHcBDnEsWyrp6Y6Ecqaj30o9zJ13g+RdVWV7KI10m8Xq51yUJ2FEd8BduThGsdBCHV
 LRcTXM1AZ2Rtnc7/g/zgrEFVFpS2SFXVDZKoj7v0TeNF3WHXCHUkD3AknhNRZy+aDj
 zdx8tbGMLhrigom1OxQbLik2Lw8k7WezQ9ACXFiJcv0VbpgTPtWF0GzzoLkpuJ3AEn
 dGvEOJCUkjKUYyciE5eCVBtFgHmz3OXqp6ab6dUjVGTHzzZhqRH5yOy4lM5cPsqbk6
 fuo87rNqLQMyA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, jiapeng.chong@linux.alibaba.com
In-Reply-To: <20220701072850.62408-1-jiapeng.chong@linux.alibaba.com>
References: <20220701072850.62408-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: tegra20_ac97: Fix missing error code in
 tegra20_ac97_platform_probe()
Message-Id: <165695025874.481068.18415928227093341712.b4-ty@kernel.org>
Date: Mon, 04 Jul 2022 16:57:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 thierry.reding@gmail.com, p.zabel@pengutronix.de, linux-tegra@vger.kernel.org,
 jonathanh@nvidia.com
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

On Fri, 1 Jul 2022 15:28:50 +0800, Jiapeng Chong wrote:
> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'ret'.
> 
> This was found by coccicheck:
> 
> sound/soc/tegra/tegra20_ac97.c:357 tegra20_ac97_platform_probe() warn: missing error code 'ret'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra20_ac97: Fix missing error code in tegra20_ac97_platform_probe()
      commit: acf981f94edca13c85fa24dd8511cdc6bd4c98ed

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
