Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 039963ACAA0
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 14:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9F2172D;
	Fri, 18 Jun 2021 14:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9F2172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624018193;
	bh=W1o+CtHQ3nflhXuylff+5ooBPcB3nszbMcr8gK1ECAY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rJ6qVrt7+L2NmaXzW7oCZVgk2EA7QxqI3ESgkFnXQ7pYPLcfG7Qc9+uEiO+SxXUrj
	 8QuHS8YIInKSvuhWANU8SYqAoR5cGuMeh3FujiigkKcoBb33svNStNAuNmNdWkPM+t
	 /VgxG97iZgswkix5qBXTiCa5OfUaokRHoRhcfUNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5C0F80424;
	Fri, 18 Jun 2021 14:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB94EF80423; Fri, 18 Jun 2021 14:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F107F80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 14:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F107F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U9iObKIw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F075613D5;
 Fri, 18 Jun 2021 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624018097;
 bh=W1o+CtHQ3nflhXuylff+5ooBPcB3nszbMcr8gK1ECAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U9iObKIw/Y3iPA306gh7V3nqI+vPDwJ/Ehrti6IOl+5YqSETUEe0V1uzCG2FJC8ZO
 iGLQanQpsvwCxcYdZFjJsF9LxwCmuSOLQLmVCQwXJz8eG0jk1Og0jqA4s2+1wX1Q8l
 w3GlU+3fZmx9cxLccxxHTyliM4KTEZ9FV2YTTFanX6cMGAlJJuCnPgaWLhhZ3JwS9B
 Rh7hMkK6wEhA5ZSuC6IGL1GZDx7P7RtO4aQ2vrg+Ku+r6fm0QcDfiEb0tAsI9h3XiI
 6xuf34xU7Qn2RTYAeL4YRxVZvBIm9YUuyUmHb2fAedIECFk+ZY/NBA8jB+k6WHN602
 d0ufjkLi0ynTA==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Jaroslav Kysela <perex@perex.cz>,
 Chris Morgan <macromorgan@hotmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: rk817: Constify static struct snd_soc_dai_ops
Date: Fri, 18 Jun 2021 13:07:53 +0100
Message-Id: <162401758813.52682.3182841658896977708.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210602113643.3037374-1-weiyongjun1@huawei.com>
References: <20210602113643.3037374-1-weiyongjun1@huawei.com>
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

On Wed, 2 Jun 2021 11:36:43 +0000, Wei Yongjun wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rk817: Constify static struct snd_soc_dai_ops
      commit: 45ce213392df07b9e2443666c0910e1617882cf3

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
