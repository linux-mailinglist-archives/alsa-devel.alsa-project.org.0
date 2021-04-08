Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5DD358A6A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 19:00:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C863D1690;
	Thu,  8 Apr 2021 18:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C863D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901220;
	bh=WTipuoMATU6NrlSmPh5KhqY+0RI8kWx8hWcOv257h1c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+PHlpAfXmgzx7i/7DcVs+M1fRKcnALQLN8AO2vRApsTt89T6yAc1R9t3bxERDTdE
	 BKJOOqu9G31UTP59SXIQ1GUCa0qbbKqFVe8r3NiDHg7NaG18b82ggwFagjPgmpaVkM
	 MmQVWYR09uYs1RpCnUAgJtG0dJ1a50ekCzauze8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B96FF804F1;
	Thu,  8 Apr 2021 18:56:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F371AF804E2; Thu,  8 Apr 2021 18:55:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B7C8F804B2
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B7C8F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ml5N2Ih6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B304D6113A;
 Thu,  8 Apr 2021 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900953;
 bh=WTipuoMATU6NrlSmPh5KhqY+0RI8kWx8hWcOv257h1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ml5N2Ih6e3hu4pqS3lIlqIBcMBhX6p2/Rnr6/wJGlakpAHlga+4QjbJTYTA6l2Zqz
 wmJa5OZcid2s+ZYtCEjFJ5sLdabMts+SK6zb3JPaTYB9SL/c3I0CI+SnjtH227PJPx
 Vt6AKCmwWqCm/HpoadBArCk3vEzjxLyxN2/oHVyZCCZ2cS/8S9VJmStSe3ZpwF963/
 ID6JTAaD2k6mcuXfqgb62k5XaUztcq8fruVouEx0vhxZc3cKkpHt3u7Kf5mSOSSqhj
 S69gmdBiqNW8t3APxNv+su+Kz90GU75Vszajam62uTYARPHqekjqsEQAJ71zFSo4xu
 k+EJKWM2x+w6g==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, Ye Bin <yebin10@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: rt1019: constify static struct snd_soc_dai_ops
Date: Thu,  8 Apr 2021 17:54:46 +0100
Message-Id: <161790012552.16915.5460504766785424651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062701.803865-1-yebin10@huawei.com>
References: <20210408062701.803865-1-yebin10@huawei.com>
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

On Thu, 8 Apr 2021 14:27:01 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1019: constify static struct snd_soc_dai_ops
      commit: 5e71e9c14db4e49cca56354c95ce10e0e00214d1

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
