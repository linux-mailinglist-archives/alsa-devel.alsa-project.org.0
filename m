Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9724D6973
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:25:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E911A98;
	Fri, 11 Mar 2022 21:24:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E911A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030318;
	bh=xJwfXtrmDnk/l4WW8UCx8MYFFktOlAtYVoFB/u0RMZs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KryPiLTD22qblOZ0eAy24GYwPfd6M4e/wageNDXURFP9SW+8zUFgyD09tWbzLj/WV
	 Z+pLxvMKC5a9ijw64fmyPkRzKzopD2PNk3KI2VjUMUQ062viuAkqxy5XtxRG4M4Vuo
	 u38s79YKys8Gk/J/K5ZvQvdGKkEGPBJsiBtyqIoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB38F80525;
	Fri, 11 Mar 2022 21:22:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0832CF802DB; Fri, 11 Mar 2022 21:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85FE0F801D8
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85FE0F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ANMxTiBF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0137E61F74;
 Fri, 11 Mar 2022 20:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1537C340E9;
 Fri, 11 Mar 2022 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030166;
 bh=xJwfXtrmDnk/l4WW8UCx8MYFFktOlAtYVoFB/u0RMZs=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=ANMxTiBF3g3kWtnXUdy08hvSgxuan/qpXmTxAxQYj+/ejXnZo8O38QbMHgXEc5kic
 Ipvks6kpv8hpvySjey0x8yDNlUxFPi2WE7DQmBjJ89kaeXeTez/uOPgcEE/+NQ6UeB
 YGQ3pKwmDW8JaOT8BpsJiyaLXZrF4u06fc29BPkwIc1eu9mUwed8zyC1hj7Ru1nfZ/
 Yo1tDBU4aLW8iQKa9eMH2h9k9Sb4+MNynefc67hEIlhgLiUaCNsnvbJS+IlFvYcXJQ
 ZrlP8uFIjkFrPQqRYdLDV+lCfa4b04xmdDrRszLcFmfp1TCcqaMM+kHt3S9K3Pnf/U
 DO7MFSkICYKBg==
From: Mark Brown <broonie@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220307084523.28687-1-linmq006@gmail.com>
References: <20220307084523.28687-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: msm8916-wcd-digital: Fix missing
 clk_disable_unprepare() in msm8916_wcd_digital_probe
Message-Id: <164703016458.264137.8737239067223778566.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 7 Mar 2022 08:45:22 +0000, Miaoqian Lin wrote:
> Fix the missing clk_disable_unprepare() before return
> from msm8916_wcd_digital_probe in the error handling case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: msm8916-wcd-digital: Fix missing clk_disable_unprepare() in msm8916_wcd_digital_probe
      commit: 375a347da4889f64d86e1ab7f4e6702b6e9bf299

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
