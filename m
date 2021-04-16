Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D53627D0
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 20:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E38016EB;
	Fri, 16 Apr 2021 20:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E38016EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618598209;
	bh=6C5h3ykupL+D+Of/6i1rYRBhVMcJIbSTPovNGU1E/cA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbMttcl/DLvYyqpqrEX/BFB3QgyMifxedmtMPJO8a9OThKeC+QQqlVjqLRwZ6HiXf
	 rrjuGgbcaYMRYr8fXr4yVLJ638ufVI25VraoN7tAA0AJijRatRrYjXY90fOKmO6ONq
	 /QMyKiGH8Gzx1N/Qt+pmSh0/cJ3cNUa5plrSAlx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EBC6F80128;
	Fri, 16 Apr 2021 20:35:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF8BEF8025B; Fri, 16 Apr 2021 20:35:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4126F80254
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 20:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4126F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sh0loH/O"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AD83610FB;
 Fri, 16 Apr 2021 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618598099;
 bh=6C5h3ykupL+D+Of/6i1rYRBhVMcJIbSTPovNGU1E/cA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sh0loH/OADYJM36Geaqa38W6xyGMkSOQCgZNTbHFo2bQrisTwo1EauHktmrcKfTe+
 Kp09u9T8pp+5jhyE52I5TPBG0KnYFlKR9IHnmU1vi3QZAieKgsWH4PPpfObexlB8hG
 Rsw+R+onEEbCVULUDX4vuXZvItB+52TEr+ZOZtx/c1uqUNSb58e2Rf6XE0GSO/Z7ts
 E/U8W0PwfPkayP1nH5pCL8mSb25ynBDev4+YaEgUYiWPc1KpcU6WexTCkXqfcaIKxl
 6kfHeLjGPupkXFwzZmk7NwZ6yT51AFSY5h9+UJBfawwXRp8rUVmIV3CX7ydiDLRgb6
 FiVFpRkqA+PFQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
Date: Fri, 16 Apr 2021 19:34:31 +0100
Message-Id: <161859792865.33058.7125147768271126827.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5c314f5512654aca9fff0195f77264de@realtek.com>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 lars@metafoo.de, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Derek=20=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?q?Shuming=20=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 bard.liao@intel.com, pierre-louis.bossart@intel.com
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

On Mon, 29 Mar 2021 06:54:00 +0000, Jack Yu wrote:
> Using new kcontrols "Capture Switch" and "Capture Volume" instead,
> remove kcontrols which no longer be used.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: rt715: remove kcontrols which no longer be used
      commit: fa2f98378f941786a93f8e63696f59fb4ac7538b

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
