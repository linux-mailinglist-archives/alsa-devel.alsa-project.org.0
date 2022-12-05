Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EED643015
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 19:26:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A86F5186C;
	Mon,  5 Dec 2022 19:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A86F5186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670264772;
	bh=6w7FDTppWR3Fgt5KLZkvfYjb6aPLshEEurfT5IJst20=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ntD1I7rd+VZlgfbBrw/0D/mAPweF8Xf0Z3eNb3SqGUwfFpPXpCGcyp2bPBTsyZaPq
	 4VpY4Z14MXLBDkFpM/AV9r41Z/wMenX4AOvshaXuEecp9r5Te9Seh6uO6nKe/1h2dn
	 1TyNfyZ2dq5ll/dukVFrFTzvlS5z8E+8AA2IUk14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B160F8014C;
	Mon,  5 Dec 2022 19:25:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A285AF80236; Mon,  5 Dec 2022 19:25:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 616A7F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 19:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 616A7F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o9IMi6xe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89A0F60025;
 Mon,  5 Dec 2022 18:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FE9C433D6;
 Mon,  5 Dec 2022 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670264706;
 bh=6w7FDTppWR3Fgt5KLZkvfYjb6aPLshEEurfT5IJst20=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o9IMi6xehY0YnvfCRQbWfBItIhv4Q6TUA6r01DdHlLpoArvnCNTq1T0Z0qwEj+mL3
 DtkAHNQw4TgXV4QhQopTHYElNpPMORJyYnZp9ToOsCeA+lT3V4OgCWkU/sgNnsTz99
 ibSoRxEQ/Hy1Yk2hK9cEFCljy20XEgi1I9y3M8r3LJWKAJhby+ZEHHPQW53sIoCNf6
 zbO7hx2l8xv49nY8HvsPLllHfk2Hyd2uUzDf4/h/jaPW66wqwaPo+bNnuedbVPIiRB
 R3aMOzZjVlyMj73t54Gr9BzcUo3PyzR0oQr8t5TGbWcZo/pfHsOkSGk8MC+k4eJodm
 ovAr7v8RtZWJw==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221205143721.3988988-1-yangyingliang@huawei.com>
References: <20221205143721.3988988-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] ASoC: sof_es8336: fix possible use-after-free in
 sof_es8336_remove()
Message-Id: <167026470446.620769.2205130465966077199.b4-ty@kernel.org>
Date: Mon, 05 Dec 2022 18:25:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, zhuning0077@gmail.com
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

On Mon, 5 Dec 2022 22:37:21 +0800, Yang Yingliang wrote:
> sof_es8336_remove() calls cancel_delayed_work(). However, that
> function does not wait until the work function finishes. This
> means that the callback function may still be running after
> the driver's remove function has finished, which would result
> in a use-after-free.
> 
> Fix by calling cancel_delayed_work_sync(), which ensures that
> the work is properly cancelled, no longer running, and unable
> to re-schedule itself.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sof_es8336: fix possible use-after-free in sof_es8336_remove()
      commit: 1b41beaa7a58467505ec3023af8aad74f878b888

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
