Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9537A205
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53AFE1786;
	Tue, 11 May 2021 10:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53AFE1786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721827;
	bh=uzIUXmmWVharUwwMxFDeaL2AN14Lz0cJsHF6MbAcCGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D0CDcfDVk8sJ+fH1rcySv/VS0gHpY5+k9kZI9HMROSBBdqKOLN2oT1xPWPj6Kxb40
	 LHJVOR9Nt7xP7l3QwztTBZog0dcM4EasNRVMe5/R9pLz3sB47IyoR5srHkJcGoqumE
	 c37aqq2xwtQ8oOOSSuhNj6C6ELwBe8Xxbs4JY1ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B925F804AC;
	Tue, 11 May 2021 10:27:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C281CF804AE; Tue, 11 May 2021 10:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 593B8F80431
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 593B8F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R8dzV1Hk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 967FD61432;
 Tue, 11 May 2021 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721655;
 bh=uzIUXmmWVharUwwMxFDeaL2AN14Lz0cJsHF6MbAcCGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R8dzV1HkYNv/mNUWY1V8C/GJk6Ff4RhJJ09ZbfacGWQEtvO3jsw1GLCV1d8wjP6BS
 SOjvJF3HimxxJ85iopOFWzLvFOimplB1rSY5qje7QdoQpo7Zc1Ts865C4smxdBct72
 BSTY56mPFuvpzBu/WaRzwby6YVU91SD8Zib0/QViDhqgeuGdCFcwmvsYgS9ARQg5kM
 X4UJs9Fo12iUetqtgfF0RPbGFtXca4Bi9mhBqcv7s42XtXaA5MWf1X+SKVhsVIoMl4
 +UjTkOtPfV1Pg/7nzKQvqRVMKdnuObDRrLYMxyUO2rQVIoZxFupC69kVCljTJjeS8N
 9TVMtTKmetd1w==
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: jz4740-i2s: fix function name
Date: Tue, 11 May 2021 09:25:47 +0100
Message-Id: <162072058168.33157.14483051619888083091.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
References: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: letux-kernel@openphoenux.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
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

On Sun, 2 May 2021 15:08:55 +0200, H. Nikolaus Schaller wrote:
> This driver is not related to I2C protocol.
> 
> s/_i2c_/_i2s_/

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: jz4740-i2s: fix function name
      commit: 16f2a3cdaacaa7c077e238df45e4d38d6bc0a6c5

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
