Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1863B1E68
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 18:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995911677;
	Wed, 23 Jun 2021 18:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995911677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624464731;
	bh=jsOJ4tViYkaDX1h4CbGlivmMmyPzx1/JuUZmlGIyyZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFiO/NiN7SOcb7RsdQAS4fs7dXkLdDMFcYqez+53vd4DuFIy1KkQJm0RHQ1kEAwdQ
	 gW2M3cIg5A1Wo6GKPqDG3S3j5SfEYVrimq4IYszu/eIR8ReqRX4GdiN2vZXml7w4FM
	 x9oV6uyBvUekQUtBZUnswBhjnQ8rc+Gvmsv0sb+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F54F804D8;
	Wed, 23 Jun 2021 18:09:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A20DF8016B; Wed, 23 Jun 2021 18:09:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0BBDF8016D
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 18:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0BBDF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b374ARq/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D47F26102A;
 Wed, 23 Jun 2021 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464587;
 bh=jsOJ4tViYkaDX1h4CbGlivmMmyPzx1/JuUZmlGIyyZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b374ARq/X2aHJ6HY7X6iSCTeVVqfe5TeNpF+lEEN4T3YFAeGiHHBVJ0bKT1Fmvp/v
 k6SbB+VwtRym4euz3YYCbvuaP8eMG0SctDh+OYyLv8k1OBzhKUi9bGH0PpmOwYOu83
 +zJVtWRNsWX933HbkKw1Sw70OLcQtTL/693M9AmSnN+YdaXmTdCtt86k0IfPC2YZ3q
 QxWMlLqjYExZMXO845a/jWapyLPQcWuTbJFJoT6N5Ce/LHNhKiRInjh6j2W2KOWyyr
 /isdVS2CjsrAFI92cM56GtS0tl0oHHp0DFAFTWL0QIWl/Go3HbPVtMtZHXT5ncOemE
 gtNCktRaRGEcQ==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next 0/4] ASoC: tegra: Use
 devm_platform_get_and_ioremap_resource()
Date: Wed, 23 Jun 2021 17:08:58 +0100
Message-Id: <162446397757.55213.13647791401168219427.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618024722.2618842-1-yangyingliang@huawei.com>
References: <20210618024722.2618842-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

On Fri, 18 Jun 2021 10:47:18 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Yang Yingliang (4):
>   ASoC: tegra20: i2s: Use devm_platform_get_and_ioremap_resource()
>   ASoC: tegra20: spdif: Use devm_platform_get_and_ioremap_resource()
>   ASoC: tegra: tegra210_admaif: Use
>     devm_platform_get_and_ioremap_resource()
>   ASoC: tegra30: ahub: Use devm_platform_get_and_ioremap_resource()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tegra20: i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 8ad9e5baa90f76c5125b23419fc458e206371bce
[2/4] ASoC: tegra20: spdif: Use devm_platform_get_and_ioremap_resource()
      commit: 8d81f0da47bbea7f4eb6cdae5210c8c3bd8ce50f
[3/4] ASoC: tegra: tegra210_admaif: Use devm_platform_get_and_ioremap_resource()
      commit: c29b6382d23c8bea604033f98604b7b1e543b1e7
[4/4] ASoC: tegra30: ahub: Use devm_platform_get_and_ioremap_resource()
      commit: fc8344e63e595fa1f2e783aaae0253570cd8eea8

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
