Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD20F35A327
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E641684;
	Fri,  9 Apr 2021 18:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E641684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985513;
	bh=7iRrAEPNgrTfj1x4u9c9nUYjf3WD+FYlX1nj7nYuuHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vq0lapkuiIzhwxgLfeN4Jc27wPHbD0yxoDIJkPvYE92cXScXT5BJ8TCMjojbJVrDr
	 4vHS+hAlmY6Rw5fsQ2yw6G2WV8pgOTUgnC6Yi1I9J27GJjXMxFPXC0hJifMm9svNvb
	 0ebI6jawUlB3Guvmm1YyHKQfELYdlJFUZIx3S4CY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14677F802C9;
	Fri,  9 Apr 2021 18:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85AA2F80260; Fri,  9 Apr 2021 18:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA1EF80113
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA1EF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BOggGnc7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA58661074;
 Fri,  9 Apr 2021 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617985426;
 bh=7iRrAEPNgrTfj1x4u9c9nUYjf3WD+FYlX1nj7nYuuHI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BOggGnc7K5JgxbfkHbkPtwewYUtZjaDEPSJNzTGhTr4i8T1P75busXhkA0/gv1cyc
 Fbp6783ZfDKvxvaYNEpb/v62RNTZSnfqBcfXKNbXMBZ2fYDMCx+uLz5d13XSqcchQ3
 wacH6JoOfRjaJMrBHP2uzVshG5ujW6iPjaoo+LgbeTTJ77JjW2l1eReTQUmN8DcEQq
 i2yojpJ/XkuebVdgG/TvB8EBNJ05sKsfgKr6Q4KVLPgx5+G0PkNLhQU6bGB1ULZXTF
 Oh7/RygOfz+00D0REEXoLuJaGNiHio/Ll113j8WXk0uaREmOFKekRD4tKdAdPZUNoJ
 Yw5UKKdX/7tQw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Ye Bin <yebin10@huawei.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: rt711-sdca: Constify static struct
 snd_soc_dai_ops
Date: Fri,  9 Apr 2021 17:22:49 +0100
Message-Id: <161798344183.47643.10123249955725724471.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062647.803141-1-yebin10@huawei.com>
References: <20210408062647.803141-1-yebin10@huawei.com>
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

On Thu, 8 Apr 2021 14:26:47 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: Constify static struct snd_soc_dai_ops
      commit: 3cab801e8b94280264ba23ab0683cd3a9c13ca9f

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
