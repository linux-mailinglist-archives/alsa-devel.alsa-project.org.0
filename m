Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C771C35A34C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618A516A4;
	Fri,  9 Apr 2021 18:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618A516A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985706;
	bh=v3Zqc/3dsZP8D8F+VP4VtmHrJNK58dXKx2K3a3/TSzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H72nqtsztYDAtVr3pldmlu0EIalKcfd/jtFGkQs3J/jHD1p2Z2wTgvPlRa014o0Jj
	 exWbieAMOD87cnAIZDFelUFYYcOK6siN7oheBetnzrX7XRXfmeQB+S6V4PQdYWVryG
	 IjIOenvVb6qRr5uhf1E0gdGw5RlII8SH81Gof54o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF94F804DF;
	Fri,  9 Apr 2021 18:24:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F43F804E0; Fri,  9 Apr 2021 18:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21F6EF804B2
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F6EF804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oYueY1PD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1F78610A8;
 Fri,  9 Apr 2021 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617985448;
 bh=v3Zqc/3dsZP8D8F+VP4VtmHrJNK58dXKx2K3a3/TSzM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYueY1PD40MhKLT5JZec4XfAUfEgLY5xLGXOKcbIjGVUnxuCaw1vJWIZwiQnXxDS8
 W4qI9U9lKrnBXgnHLRwfwz8ElzPwmNbF2P/X7GFQsOSQrwi/7m3IQcgud52hyMahpH
 jhPMgwLVIWa4OePL3raO5EUZwze9ZufeIkyL97RTi2DiDJ4qcG3HtBpb94Uzde2rX8
 E/aG8s/zbhqqGOIZ4nRnHjwBmxbuTeHsSzNQ0SK9WMlpfLUpksSVOM/Tg9sDvv/A+m
 REhH9jrfb5mvgfOxwaM8d9QEPznMi8q/UAOszOc6vqW9wi3mq33N/4kbTKRAawgql8
 c0Gn8JrilnhXw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Akshu Agrawal <akshu.agrawal@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ye Bin <yebin10@huawei.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: amd: raven: acp3x-i2s: Constify static struct
 snd_soc_dai_ops
Date: Fri,  9 Apr 2021 17:22:57 +0100
Message-Id: <161798344183.47643.9676736315193814010.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062651.803413-1-yebin10@huawei.com>
References: <20210408062651.803413-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Thu, 8 Apr 2021 14:26:51 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: raven: acp3x-i2s: Constify static struct snd_soc_dai_ops
      commit: 3e075e842899779bd321520a3524a278442467d0

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
