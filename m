Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9F4C78B3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A5018F3;
	Mon, 28 Feb 2022 20:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A5018F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076060;
	bh=lyt0TYhPSG3ZWBgb19xSinI5InhB/+u8YPB8bebsdKQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=or58tElGvDpEsrscxeuqxI7eYiUsksz50DT9IMGeKurSz9o9vk1nLxVdjCn43QNbI
	 BzlPqZozvpakyX7i0/nm8anun2ng8SuFfLhQzu819S9sID6o3m3UeSeGh9ZfOYJOit
	 RXYJhi5XtC1p84B9tilTq3Mu04PbIbF9pTG1Ve2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 307AAF8057C;
	Mon, 28 Feb 2022 20:15:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8108FF80526; Mon, 28 Feb 2022 20:15:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C995F80526
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C995F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PB6ngbSp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1413061580;
 Mon, 28 Feb 2022 19:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73C5C340F5;
 Mon, 28 Feb 2022 19:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075732;
 bh=lyt0TYhPSG3ZWBgb19xSinI5InhB/+u8YPB8bebsdKQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PB6ngbSp+7J8gA4wPfwWk3oJ+gQvLENsKI/1y+hWVBHIAhvJN1CNz410DB4SNZE1B
 ZKQxn8UEWDzhC9pFLWcirNLugVDiNtl1bTy+MrNx5W8EN+BmdkVx9sL/ehKT90EAwI
 0OFsYPQNsM6RKAlWt0UBy6iF6RhmqAQV8qVUcTfbv+0GLY44JsMX98WO+gv8IobDZ4
 27Qyr6KHbLhWiwhuCtppsRby1fB0Y9mN+9yk2A/Y43pj08ZFBg0uJNGCvzLgTyGZn/
 GPmphfRzSqoFtjkoJ0uXLvy3Yp78SodLwh0Y/FOk6BON3ObaIO1cNnoHLD/WgBrAnZ
 wYh7Wp8VznF9w==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220223003810.1947495-1-broonie@kernel.org>
References: <20220223003810.1947495-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wl1273: Use modern ASoC DAI format terminology
Message-Id: <164607573153.3538791.11254049820709391377.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 23 Feb 2022 00:38:10 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the wl1273 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wl1273: Use modern ASoC DAI format terminology
      commit: c9fa2165c0b410f195ed2bd15c07a4baa3bca482

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
