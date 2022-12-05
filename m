Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F413B642EC6
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 18:30:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EBC717E2;
	Mon,  5 Dec 2022 18:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EBC717E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670261407;
	bh=YE/c8SUtkWFd5cfG4AxPEAOfpuHxTatAphnKRUo2hoY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SG8IpCvTQc/FjczIlafsjcRtvUvadZ0f+lAs/GY+kGdMiC6HbZ/esJkIGJTsvz0O8
	 6P+eswmfbtwyXeZH0yEn7R31Vnn7LkGB3J+dQGcn898uuY5585wHRik/Xontvl3Voy
	 VLEQuQhYNOO9xnWQTfI5a9fsQSLczl/yq8Gowf48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF03FF800BD;
	Mon,  5 Dec 2022 18:29:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2317F80236; Mon,  5 Dec 2022 18:29:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B12F4F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 18:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B12F4F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AYeFAUhq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0013BB81193;
 Mon,  5 Dec 2022 17:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC42C433B5;
 Mon,  5 Dec 2022 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670261341;
 bh=YE/c8SUtkWFd5cfG4AxPEAOfpuHxTatAphnKRUo2hoY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AYeFAUhqgwKcTKFncGSJXk1ySZ1bUuiP1qIM1BeltXMbpSJl6UM9wPO+XbFKnRLKX
 REZrCrJy/6DKdmPeApH3b0cOmklvir4vJCVLCaZ82JaGs3tAIXCjbvlid9rbVSYa/P
 QYtvJVdD2FJmREHO5QsyBnD9mRyR9TSs2Edc8Vj55LanKNGggrsQSZEna3vsJG9Hbj
 RAWOdLT2pMBqpElHbcQKKJG9oUCXC1bFWpBTwa1PUtLjKYdtv7H1tcblEe4M+nTeD/
 VLvd9+sF4ej2IXh4tWhZCAg5a8qYg4A256kHl9lddsNI9n+pmdUblJuolR16MJp4bm
 rZaaOW0R+foaw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Colin Ian King <colin.i.king@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20221202170644.1814720-1-colin.i.king@gmail.com>
References: <20221202170644.1814720-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: wcd938x: Make read-only array minCode_param
 static const
Message-Id: <167026133998.536379.6995048485113628098.b4-ty@kernel.org>
Date: Mon, 05 Dec 2022 17:28:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Fri, 2 Dec 2022 17:06:44 +0000, Colin Ian King wrote:
> Don't populate the read-only array minCode_param on the stack but
> instead make it static const. Also makes the object code a little
> smaller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd938x: Make read-only array minCode_param static const
      commit: e110ede8c31da90caae375deeac12e553a0aeaf5

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
