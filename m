Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF82AC56D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 20:49:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6493169E;
	Mon,  9 Nov 2020 20:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6493169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604951382;
	bh=/m1JGlyAk4FN/cPoz0SCCbLefDd4tV4hdp6ny4SdYcE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oar1ZgLOb7mM/3jS9mfGC4d9vD8NnF1SviUZKpaho9V5GG+DM6kY4YRLIr6cEWkbY
	 d6Y2ogB2C3PRgbtwugxFCrNVmcE9ZPkEA5H8Z2iiduhszGipnKVcgLJ6V7O7GySZsm
	 0OAD24lmBZCmp5auNHbU28vgao4juvcOjLPFp3jE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDBD5F80271;
	Mon,  9 Nov 2020 20:48:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91759F80257; Mon,  9 Nov 2020 20:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9700DF8022D
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 20:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9700DF8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hkwynwTp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F12B206D8;
 Mon,  9 Nov 2020 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604951276;
 bh=/m1JGlyAk4FN/cPoz0SCCbLefDd4tV4hdp6ny4SdYcE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hkwynwTplJ8Mj96qps8GeWHJQe2rt3p/0Baajata8d2m4jFZwfzHT55Cd/spUvG/e
 ZxGIYoMSWnqb75TX1CdpFXgMJi8KyvhH7qKyFpfok8yryb6RyB6c4QI9bZhxJzqVTC
 PPe7Uni3zvhaqjcea+pIQEW0MEDaMphBrWGQFSH4=
Date: Mon, 09 Nov 2020 19:47:42 +0000
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "jack.yu@realtek.com" <jack.yu@realtek.com>
In-Reply-To: <20201109062958.16917-1-jack.yu@realtek.com>
References: <20201109062958.16917-1-jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt1015: modification for calibration to get better
 performance
Message-Id: <160495125733.49154.5295077528483644094.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

On Mon, 9 Nov 2020 14:29:58 +0800, jack.yu@realtek.com wrote:
> Modification for calibration to get better performance.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: modification for calibration to get better performance
      commit: 95370acdb87d73b12a0e6895fa422a6409d14a01

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
