Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6640C83D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 17:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C301836;
	Wed, 15 Sep 2021 17:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C301836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631719441;
	bh=Y+IgB7x4TncdKeCgHbbXhKbAz60C86uklGZYbdQeRrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwwkygkfcoKkEcKtpUIX0XFIM8YWmXauPZ+8dDfo7Oxc8iRtlFoIiTppnz5Ioo8Tm
	 JOw3gOeA/d3LqnDJSgj9lLCH87lfv/NtTO4vzFyAO6QBCNZ7pUTIDZyEn+YIRcI/8J
	 bXqWZ8quUlJTQX99Z9eID5ezKEaSR1hDEVsxShQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AADDF8049E;
	Wed, 15 Sep 2021 17:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6364BF802E8; Wed, 15 Sep 2021 17:22:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3BB6F80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 17:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3BB6F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SUOCK4e+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5646060F5B;
 Wed, 15 Sep 2021 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719356;
 bh=Y+IgB7x4TncdKeCgHbbXhKbAz60C86uklGZYbdQeRrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SUOCK4e+HFB/n9HpxulMEKS08TaEWvyfUmsqY9HcY3i7CbycEUiAkyRTSI6ksOfGq
 zHvI08i3hK0cOIKgSLu7Agd2WeW/KDC5lHPLjjtDVdmh05bf7TI137gatxeJoLcLZe
 XRUFwiSN+TgEquOELGpYl1i4ze4/gK377z+SURiPQU+KHCTE39IvAVKZvs2TCGuUyd
 z/4AJ0ZYuoi/ewWLOk+uwlqO542/sJmZhMV75usjS6HQZA+o5/HIcUWUfuzpqSa7by
 SqwXyly8DL9Yg55cR854YB77/4EieBeuWiApkOo5bzS7D6uz4g9FnL7/pi2lZ0IgQN
 a55/Fg2cTgY7A==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: SOF: loader: load_firmware callback is mandatory,
 treat it like that
Date: Wed, 15 Sep 2021 16:21:43 +0100
Message-Id: <163171901942.9674.508208752648143518.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210914125356.19828-1-peter.ujfalusi@linux.intel.com>
References: <20210914125356.19828-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Tue, 14 Sep 2021 15:53:56 +0300, Peter Ujfalusi wrote:
> Since the load_firmware callback in snd_sof_dsp_ops is mandatory and it
> is tested during probe.
> 
> Move the snd_sof_load_firmware() wrapper to ops.h as inline and drop the
> check of sof_ops(sdev)->load_firmware
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: loader: load_firmware callback is mandatory, treat it like that
      commit: 96ec1741067dd73c6061c8f6ec1e9976aee5337b

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
