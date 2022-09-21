Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA45BFAD0
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6EE084B;
	Wed, 21 Sep 2022 11:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6EE084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752321;
	bh=rAuxqPx42mAjtQZnFlh+Q21reaXO0ms/6WnRLYM8jx4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enwB70/0g2THmBWBf7r4k2B38Y7M8I7lHI4KQpa1UYx0Ul8fVgGWFMOppMZVkJvq2
	 y4JctzI7N7XuxcjFvJcpbKD7wNienzYUpN7TU9GNeeMCBSVDfg/IRAcGTNNA8+zd9Y
	 em8dbFPbv2o+K4NPK0n52Xr3YulmHYdb12799wss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F928F80425;
	Wed, 21 Sep 2022 11:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16A1DF800C9; Wed, 21 Sep 2022 11:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8438F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8438F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CO+suIzp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29754B82EC6;
 Wed, 21 Sep 2022 09:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CE8C433D6;
 Wed, 21 Sep 2022 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752256;
 bh=rAuxqPx42mAjtQZnFlh+Q21reaXO0ms/6WnRLYM8jx4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CO+suIzp78LCtUdlS9/h0qLZANnIwmpqOIhrGyY1xjGbVaPnpK5obtLvV8LPyXCnm
 0O/YDXg3iR/F98DSJxUIu2ZHw5gnXL+DB+doWZhDL4G1fv1WweQ3JkWaUA04PCMGns
 SbQ9HYvPBxKR+gVp9i6dYACVrWuODDz9ywWFpyRVYmozVEV5SODcr1NHqVsel8mFpN
 vb/X55uy0TSphCVe61HnrGWm0Pr6/lXwiuCmb4cYp/UIDbXFYPyR+jzNh0/Gxum53b
 RbivIgoQyZGcb/DCu3gX9d2iPBc16uCwZKDCBKCJYbk6btJbqHB0VIdERhYQZfpPUr
 fbYJqxvQgE1+Q==
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20220920171320.7776-1-mario.limonciello@amd.com>
References: <20220920171320.7776-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks
 table
Message-Id: <166375219306.526450.5755084616429501425.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 10:23:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Sebastian S <iam@decentr.al>,
 Xiaoyan Li <lxy.lixiaoyan@gmail.com>
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

On Tue, 20 Sep 2022 12:13:20 -0500, Mario Limonciello wrote:
> Lenovo Yoga Slim 7 Pro X has an ACP DMIC that isn't specified in the
> ASL or existing quirk list.  Add it to the quirk table to let DMIC
> work on these systems.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks table
      commit: 2232b2dd8cd4f1e6d554b2c3f6899ce36f791b67

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
