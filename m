Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6261D7ED4
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A56BC170C;
	Mon, 18 May 2020 18:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A56BC170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820221;
	bh=jRbpGL6pqSTPo5yiSCfss3nZLr8Rmj8NTRgHNTYXRHU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8t18XDD3W6ajzxEzZt95MNxtbK+Uj20nZmsrbkV/tS05tPcD7nWTIHZa277btzLH
	 LIeXjpIPBO71a/KH5tvNV7MwtBxkyelTXwbwsPsaQFkSU+zG4qVQGDUfoNVq/i7KN0
	 CWd7ZhUJnHRPxc7Pz2I2KnnldcoNQei/UXebGEoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6497F80273;
	Mon, 18 May 2020 18:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A58EEF80086; Mon, 18 May 2020 18:41:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59F2BF80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F2BF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2LIzKnkE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F08B4207D8;
 Mon, 18 May 2020 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589820067;
 bh=jRbpGL6pqSTPo5yiSCfss3nZLr8Rmj8NTRgHNTYXRHU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=2LIzKnkEMKZvLrbEbUuIWtqnqk64hhSkpe0BUbMyiZR9SvmbOkGkGnZCAA2hScimr
 o/wDOKDVMRlCbALLIUoVB+3SUnXEc6eAOzKlICpHnx/w0dJ9mADeSA2ESYcg2B3LUM
 Kzt66ANlAtSjIVLQCjr1YycUeDHF+P/CjzGOrMGw=
Date: Mon, 18 May 2020 17:41:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
In-Reply-To: <20200518043913.40646-1-akshu.agrawal@amd.com>
References: <20200518043913.40646-1-akshu.agrawal@amd.com>
Subject: Re: [PATCH] ASoC: amd: raven: Make the driver name consistent across
 files
Message-Id: <158982005877.28736.13490689793680227152.b4-ty@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>
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

On Mon, 18 May 2020 10:09:05 +0530, Akshu Agrawal wrote:
> This fixes the issue of driver not getting auto loaded with
> MODULE_ALIAS.
> 
> With this patch:
> $find /sys/devices -name modalias -print0 | xargs -0 grep -i acp3x
> /sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.2/
> modalias:platform:acp3x_i2s_playcap
> /sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.0/
> modalias:platform:acp3x_i2s_playcap
> /sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_rv_i2s_dma.0/
> modalias:platform:acp3x_rv_i2s_dma
> /sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.1/
> modalias:platform:acp3x_i2s_playcap

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: amd: raven: Make the driver name consistent across files
      commit: f0a77d2b0e1ccad7e4086094f67d138e8c3050a2

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
