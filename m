Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C016A4D089F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:41:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9A217BF;
	Mon,  7 Mar 2022 21:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9A217BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685696;
	bh=2AJXQfaXAVGMfsXh7g2oy6EAKDefCtmzA26vSc+eQ2E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbqtcIUtFOGQChrmX+pAqk3hM9p4k1UABQTe+HqjK2xfO9CIjp6+KWtM12Sdhunq4
	 1HUK/noUkIu5BkS7vA8XFgcbst87M4EF9pAAiRhhOf12gQ7HRdUWgPkr1ncj/2uBHt
	 /husHCz8cLHkx48zRnvVmXdHOQ0YMVCs3MeGdvYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E6BF80525;
	Mon,  7 Mar 2022 21:39:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5FACF80525; Mon,  7 Mar 2022 21:39:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D563F8051D
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D563F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dpuYYw1i"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77F85B8170E;
 Mon,  7 Mar 2022 20:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B852C340FF;
 Mon,  7 Mar 2022 20:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685548;
 bh=2AJXQfaXAVGMfsXh7g2oy6EAKDefCtmzA26vSc+eQ2E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dpuYYw1i4ooZDW0rFRlF7JnE6b/MvLRIK6HG6LsUQ1FvxFdwzOXmCi8mB4FRhZd/b
 44CiaGrvcl273QzJilYHOJPErc+iWys3knkYpuoXZ4JaMqMyJyM8twGOQtgm+He+dx
 EeU57aROywzhEu2YrOiWMOnGHQjQs+g2rDYPiAfKG0RawHqUI2mpu9cqxMlSbANswh
 81ebZrZ4OYNOyMvbIVwzcPDtpveoPaJ985h9NGgUtYQM9eLDgnIGM43r9KdTd2kp+m
 fmbtOgqdwejdVpsSXM2onxr2j+lYppHU+JOB1WKD0yrsiUHNMiwnV+5tqQ5xL2qp6U
 Ec5CewIrT2hFg==
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, kuninori.morimoto.gx@renesas.com
In-Reply-To: <20220302062844.46869-1-jiasheng@iscas.ac.cn>
References: <20220302062844.46869-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v3] ASoC: fsi: Add check for clk_enable
Message-Id: <164668554489.3137316.16865303001337424021.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: songliubraving@fb.com, daniel@iogearbox.net, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, john.fastabend@gmail.com,
 lgirdwood@gmail.com, ast@kernel.org, andrii@kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, kpsingh@kernel.org, yhs@fb.com, f.suligoi@asem.it,
 kafai@fb.com
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

On Wed, 2 Mar 2022 14:28:44 +0800, Jiasheng Jiang wrote:
> As the potential failure of the clk_enable(),
> it should be better to check it and return error
> if fails.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsi: Add check for clk_enable
      commit: 405afed8a728f23cfaa02f75bbc8bdd6b7322123

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
