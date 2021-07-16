Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C573CB96B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 17:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CCC1691;
	Fri, 16 Jul 2021 17:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CCC1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626448068;
	bh=pP9BUA31T61wWw+G1Au+42OC05x0XKfLSbUqrMo7N2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgB9dPJadom2Eqvg5weJgeFojr5RXMd+tlBrmcX5LEcBBx2xX6F4ywduG2kN/Q5CV
	 AoWxfJfy4drLVY2sSHpYUtLcpxJu7/nRr78mqrb8xusHJmJBtlw1qlw+ZK0YIGjfBp
	 513nWU/+fZCx1yqd9577vn/9OEr+8EQfZvlrZoQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0122F80254;
	Fri, 16 Jul 2021 17:06:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1E50F8025B; Fri, 16 Jul 2021 17:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30F80F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 17:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30F80F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AhDqSwbm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88528613F5;
 Fri, 16 Jul 2021 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626447973;
 bh=pP9BUA31T61wWw+G1Au+42OC05x0XKfLSbUqrMo7N2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AhDqSwbmZjBTJuBCh23mH4wu5DYeAU40mNh/94PoHaU3ek1MOxNQdQAvFtvc7eV16
 ikpEoJBllPUubZLm6ZQmXsibxOs0q4rsFrjoXxK4mbC3nUxWTZ4tHHrObcBoKqt4HV
 gQuKnmzpEq5e/UyGk2c6t6G0Wb1FZ2up1VerY5sQ5Baqag3OdZZVJKNWseNpFn0oaU
 ZN8KNW6FVp2dvHeESkwqOpbMueWOqxDvAhSa9SduotqiC8jWDguLcrGPEzkGv2mKft
 Z1qASaHAr3FmWHPjrsh1jGTAZPOBcBPfAehJiJv8J19Kbuj1bzL7J64Vk4vf2ZSeEt
 X9a4S3V9cGWJw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: remove unused port-map reference
Date: Fri, 16 Jul 2021 16:05:29 +0100
Message-Id: <162644746764.25983.3659127858981239733.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210716105612.5284-1-srinivas.kandagatla@linaro.org>
References: <20210716105612.5284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Fri, 16 Jul 2021 11:56:12 +0100, Srinivas Kandagatla wrote:
> port_map field was added prior to adding static port map support in soundwire.
> This makes port_map array in struct wcd938x_sdw_priv redundant and unused,
> so remove this.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: remove unused port-map reference
      commit: d9dbe1f9ae4b3463093fcf027d79f20bb9a337c8

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
