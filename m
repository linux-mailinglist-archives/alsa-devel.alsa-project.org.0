Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D529413638
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 17:28:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4CE5167A;
	Tue, 21 Sep 2021 17:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4CE5167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632238120;
	bh=kC2meo6Fvlk2b3uZGSxQXxf1+PcarHHiV4qO9lBt04Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5Unsmq8ZKmQwitS0H+Xb/cqthUjhsrLC7vmFP6t2NL9dlSa8z/W6KZfJk/7dUX9k
	 bR2HTHs4DbuS8sdrKMTXsQdMvhQYjm93CxpDTGVvl9FiDudB8c7YVYAJ/4Dp0Ayqk3
	 ifgNj0QatckmS5YUH6fQ9vrc6sl44lIBSFmnxqH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42707F804F1;
	Tue, 21 Sep 2021 17:26:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D44AF804E2; Tue, 21 Sep 2021 17:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D10CBF8026A
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 17:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D10CBF8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n3thaoIj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A64F61178;
 Tue, 21 Sep 2021 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632237964;
 bh=kC2meo6Fvlk2b3uZGSxQXxf1+PcarHHiV4qO9lBt04Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n3thaoIjIv0L09oIwvxTwjsDNb2wN0uyjH7zdzAYBohmfDCJ5vOsgD3BPQsOrIMjk
 ysYO8m5cpD2MokPtN3IWfqcAmRfHnXSZAjgBYPC6xzv6fT8QG7HuaNoTemsovPA8Td
 2CeFHvHh+rrCaz8SyJs4km5D8KTrevbyrfPMXLb274JRQ9lCmW2zcJ3+9od1ZWijYg
 2+w54f1VMEP22hS13mG1zxcADMRrdAka3e1qPPUfvt8rYqG3AIZe5xVOIruvectJOg
 iapVJtEXwQiy49Mum50GyFRVQC6PWV7caoissk3k1CtFhKTd6F88uzhcfE49AY7L0Z
 F5uGM6fGbiP1A==
From: Mark Brown <broonie@kernel.org>
To: Colin King <colin.king@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qdsp6: q6afe-dai: Fix spelling mistake "Fronend" ->
 "Frontend"
Date: Tue, 21 Sep 2021 16:25:10 +0100
Message-Id: <163223651319.32236.12537335411732111582.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920184152.18109-1-colin.king@canonical.com>
References: <20210920184152.18109-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Mon, 20 Sep 2021 19:41:52 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the module description. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qdsp6: q6afe-dai: Fix spelling mistake "Fronend" -> "Frontend"
      commit: b5377a76782797fec63c4461ef961d8d4abe9cbe

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
