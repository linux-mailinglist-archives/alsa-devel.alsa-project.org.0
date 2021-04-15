Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A968361230
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 20:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF5EF167F;
	Thu, 15 Apr 2021 20:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF5EF167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618511769;
	bh=Kbob7OMphmt3u9UFU9U2QWIuSQbjN9slDC+F+dIJdWY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qi3hA5mOvENFzyl/TbFoiOoZMuPcYrLTsOj66/W7ds2x4zx65wgNN1mcyXEQnA1gb
	 OL9/LIR0MaazH0MC+aWaVxzQDNEi3KjdFtuetIOoX9LUw6LVpE19kHcD7npqQJmTiY
	 +01JMIjb/nljuMrrJUzIjSk9WTrug4iaEJm6XvAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DCCAF802A9;
	Thu, 15 Apr 2021 20:34:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEABCF80128; Thu, 15 Apr 2021 20:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5475AF80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 20:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5475AF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="emAwkXVz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39FDB610FC;
 Thu, 15 Apr 2021 18:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618511661;
 bh=Kbob7OMphmt3u9UFU9U2QWIuSQbjN9slDC+F+dIJdWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=emAwkXVzBesOHhCYumFy0reWg57jyFGL0yppj5k2T3gFJ5r0Xl39a4+7ww0K+aKwX
 5xOK/+HQg4sj4YGKqjJ7EDqySKKcpMf6ZzC1nejla4lAPPS9E5zwr7ifevthZkL7uh
 2eVIVx08axFE2BgFfcUaB4k/4RYvlq2Lesty/DvkyFm4uo5RAO8FWHhyKaL0J7s+7B
 3Qs5ydKFgaOZHudeCC8yynOCQvVxwIhlf55DuAVbkVkEWu2GYaxW2H9ZteENV0vbP2
 fUPeooIpzMv9qmi8brYnNO/du4YbexMGyxROc4XAcH0irRjACdMrZ24tADmcPSGZFr
 +73s2EsOk87jQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, zhuguangqing83@gmail.com,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: Fix missing IRQF_ONESHOT as only
 threaded handler
Date: Thu, 15 Apr 2021 19:33:44 +0100
Message-Id: <161851148784.23061.9027207380997094789.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210415073829.22750-1-zhuguangqing83@gmail.com>
References: <20210415073829.22750-1-zhuguangqing83@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, 15 Apr 2021 15:38:29 +0800, zhuguangqing83@gmail.com wrote:
> Coccinelle noticed:
>   sound/soc/codecs/wcd934x.c:5041:7-32: ERROR: Threaded IRQ with no primary
> handler requested without IRQF_ONESHOT

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: Fix missing IRQF_ONESHOT as only threaded handler
      commit: 22ff9c4230bd09ade8971c05463b90ec1d513245

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
