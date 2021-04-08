Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F39D8358A64
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDF11661;
	Thu,  8 Apr 2021 18:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDF11661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901145;
	bh=X2WX2rqMp54q3uV8HKSEG4rJybPBHqwMj67KHKa5gIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvhn8FOjRUR/WU1jYOx5uicuLKmRU9eEtsYoiiISj0gMOOq3Nj5ACXxlDGdf5HM7v
	 B8uFJ7rPnvPFTDoFCKxtUjKAxUivW8SdBl0lURHpg2nFOP8Eiddt030N25QRmu7/IS
	 0YU4uOKG3gorn6L95Hk3ecs+GzLFDraE4Z4zcdzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF12F804C1;
	Thu,  8 Apr 2021 18:55:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98E91F804A9; Thu,  8 Apr 2021 18:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13887F8020B
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13887F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oom6Ms/6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 216D2610A7;
 Thu,  8 Apr 2021 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900947;
 bh=X2WX2rqMp54q3uV8HKSEG4rJybPBHqwMj67KHKa5gIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oom6Ms/6L80z+2U9D4BHFI44lHaTAQCKGiLZfbrUFK09iylAs1nz+rJ7y2w5AXcVm
 QE7FWn3/YQ8trUHpHdqKK+S6oG6TP2gq38C5p4FLeYYX6V7ImTpdp2OP6sdeY7YAEy
 2Sv0SUlChkU6c3wgUKJCUHnMhPDunHlrSEva164mscpwaXu0g4mtuGxFS0tklWQ7Kq
 1kXK/iZcXbj77ZYFumwydNeo8EKiHMFLr1x6XgIEdlZR8YPACLDMrv727Pa2AJGjlZ
 jrSc/m4W8IivMpBr6mq58k8ckODq9ib3gt//wj+2xt/oNzJPDkpTUyBx0MzBtkCKIP
 I63LJIrT5AMRw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Ye Bin <yebin10@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: codecs: wsa881x: constify static struct
 snd_soc_dai_ops
Date: Thu,  8 Apr 2021 17:54:44 +0100
Message-Id: <161790012551.16915.13044898778864145563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062700.803792-1-yebin10@huawei.com>
References: <20210408062700.803792-1-yebin10@huawei.com>
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

On Thu, 8 Apr 2021 14:27:00 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa881x: constify static struct snd_soc_dai_ops
      commit: f985838003ee618daba7a38da3efe27c639575e2

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
