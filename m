Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52435A348
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9D91661;
	Fri,  9 Apr 2021 18:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9D91661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985666;
	bh=5zOvE47fmEDQV2SXKU3sAafuQqU0Z49Z3t5ZBvY9pJI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3Bb8FzsdKFrpLD6pPBID+z6Jswyt5NAbOc7CJBrJdn4B0VNP/uPfBEQq3c9frLwF
	 TjxfFRPq37MnHn2cog4vQFH+Or4ZXg3Hj0uHy8Lwfig8nAkMAk7+pOZ/Mx8TvsGwho
	 2pS2YJM4cF1NITCJhSFbnFLVvyLGXOeNsIWHp2FA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 553AAF804E1;
	Fri,  9 Apr 2021 18:24:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95396F804A9; Fri,  9 Apr 2021 18:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4C01F80430
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4C01F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q1+bBMgc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 570BC61186;
 Fri,  9 Apr 2021 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617985442;
 bh=5zOvE47fmEDQV2SXKU3sAafuQqU0Z49Z3t5ZBvY9pJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q1+bBMgcEGmc/4xKUqCMjVMrl8UvobP0H81N11HFk561sMzJBOatszls5ueI04WqP
 HQtsurZT7P+kxeJ1ZBPB81p63zb8lrh0qZIni+lYrWrApiCOrpTMD6DSU1xatZQUgg
 u0mvlRw0c2Xo+kiKmjhywtiCUbgz5d86Xmt+V7V6B+hdlmoBLlFhqUqNfTXF6xom2s
 Yf/jhRHaw3wvjpqVOaQPPgSHNNBLs5FlEJfdE1E+jIODbgiPGfw0HSLq2c46pM1zfQ
 yQYS7FdDWPdVXuh+K240whB6A4yBO16hEEC5ikamndrAqLBqmZiZcMhX2lIMaLa06S
 S5ZjmUF64UvAg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ye Bin <yebin10@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: codecs: lpass-wsa-macro: constify static
 struct snd_soc_dai_ops
Date: Fri,  9 Apr 2021 17:22:55 +0100
Message-Id: <161798344182.47643.13407660780241104204.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062642.802846-1-yebin10@huawei.com>
References: <20210408062642.802846-1-yebin10@huawei.com>
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

On Thu, 8 Apr 2021 14:26:42 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-wsa-macro: constify static struct snd_soc_dai_ops
      commit: a893a666b5b9a8c9d331df4afa72f23f4d4f83fd

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
