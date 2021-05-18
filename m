Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03425387DAA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:34:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4B3173D;
	Tue, 18 May 2021 18:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4B3173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621355660;
	bh=wY55NAYe5MkIZJCvMDNA5zES2hne44anMPpiK/g6bWk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kx3DNV6Z4kIvvF5UNv3agQDaJ4BmJqv3/fQA/DqYKaVJVo/npjb1bMolmEcSbMEjz
	 xEAkun5PFtHbF46Xyk1OId5IdHeu6DFvfKluU48Cfqm5DhK6NyxWoXm5PHEobbUuR3
	 c+77ASGFtJkMf8H1vKE/U/gXqXX0yuvlkYFtBkhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0497F80272;
	Tue, 18 May 2021 18:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 076CDF80217; Tue, 18 May 2021 18:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4720F8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4720F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OEiZoQ69"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DF00611AD;
 Tue, 18 May 2021 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621355555;
 bh=wY55NAYe5MkIZJCvMDNA5zES2hne44anMPpiK/g6bWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OEiZoQ69e2NBS5/So98B8TA4eKdWZImfLSJ7nCEXYCTmJdy1G9/AN0jWBifCHqEe5
 FI2o+1wRoAL6bM/sUTql50FH9oqOaS7xw4igEUBh2pAm4X/ggemHGH64Onfg61G1FH
 SGRSYvUQErJ0eKLupR6GO/NpnJJ+OGxHmha723i9gIPCUi91MjfeMGgDOsquzD5ahh
 GZLVwlbgC9kXsHhuDe509vYgH5uLCu5oJA/mjLUIAsuIbAMgGQzM36ujw7wugcxIC2
 bZVGc8Vp6vceM4DCoBbSvWB/i+0BmooiSNXqAktBtnUE3VvHjCnQOTT/l4duZZcM5w
 9kRWbsKcf0/pQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rk3328: fix missing clk_disable_unprepare() on
 error in rk3328_platform_probe()
Date: Tue, 18 May 2021 17:31:31 +0100
Message-Id: <162135531446.37831.5863010309474559267.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518075847.1116983-1-yangyingliang@huawei.com>
References: <20210518075847.1116983-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Tue, 18 May 2021 15:58:47 +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from rk3328_platform_probe() in the error handling case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rk3328: fix missing clk_disable_unprepare() on error in rk3328_platform_probe()
      commit: d14eece945a8068a017995f7512ea2beac21e34b

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
