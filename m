Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 919384D1EF4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:24:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9CA18C1;
	Tue,  8 Mar 2022 18:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9CA18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760263;
	bh=tvhfJPi0JmcP0R6mjk8i1krTBkEIDDxpDLNaiuGZXAg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=neFgtExXJjQcNDHGN0fX5Le2jp5dLeffp6cnOsMjsxDp7YvwmLbRAFf9+z2Hd6Gi5
	 GbKV2gKh1QTtGUmgAX4y8Altyg+Y5Tc+h13KxV6P/RM9veJxK4Tks1LefamjWsyww4
	 as7m+BA/o71CjbDkQlaXr6qUmhkwEitIAMX0S3sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B55F80518;
	Tue,  8 Mar 2022 18:20:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C997F80279; Tue,  8 Mar 2022 18:20:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1342BF8026D
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1342BF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A2CddHZy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4B6F6123C;
 Tue,  8 Mar 2022 17:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19F2C340EB;
 Tue,  8 Mar 2022 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760047;
 bh=tvhfJPi0JmcP0R6mjk8i1krTBkEIDDxpDLNaiuGZXAg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A2CddHZy94LgbRB8wjPn4KVlKWYk1NDrVhKp0CIX/+QAwBncvNRbwmdNwaO+WHDZ+
 fdKdOr8DXoDjh6w1EKb7IYzeAvtRsm7Fd+fv/ECFQTCMaKAoIWVnlLed8oh7X32hmz
 YbBZFeXtJ/P9ISZfpeWhaRCQRcl3dDiTUoQYUAa+waYwvX0QQOKBHw4NQCW5kLRJ1n
 NfihRcGXeY9tZI33DudkI+Otibn5UO5QtJASoERVTP3w7dAjVQRUp1epcd6cAN3Gjc
 9BUkoP4b10ghjC0cJ9B6dXZhXdbdebwEDrkiiUy1Jg4v2w4jYRu87BAzyZBl3Zmq/O
 8us52rkdvwiAA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, tangmeng@uniontech.com,
 YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 Vijendar.Mukunda@amd.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220305123705.3708-1-yuehaibing@huawei.com>
References: <20220305123705.3708-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: amd: acp5x-pcm-dma: Fix signedness bug
Message-Id: <164676004557.54315.464423816098781060.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:20:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sat, 5 Mar 2022 20:37:05 +0800, YueHaibing wrote:
> In acp5x_audio_probe() platform_get_irq() may return error, but i2s_irq now
> is unsigned int so the error handling is never triggered.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp5x-pcm-dma: Fix signedness bug
      commit: 954e615497cc95cd918bdfe6590abdfbaa068842

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
