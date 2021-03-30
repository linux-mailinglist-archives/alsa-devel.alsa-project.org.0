Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1934ED32
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 18:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F73167F;
	Tue, 30 Mar 2021 18:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F73167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617120513;
	bh=LcfNiuaHxShmpOMM7bIh9+cRZVxKyNwsRLx+S7WkUrE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WcH3I33b3/r1QjDupZaiwTcRPzVtySslHYwdIxM+q9IajTRUfBYRq3RCwYwKFoqP5
	 SmrMPAS9Il97jbQeU0twdYFwsaXQdOsM7A/JxNO0cmgMKExhbUMqRmF75A7StHZAkO
	 LEq3jn6FhGedFmeuTjNDpkyHk+pod6X8W/yqbw6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 349B5F802C8;
	Tue, 30 Mar 2021 18:06:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6CF6F802C8; Tue, 30 Mar 2021 18:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD74EF80240
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 18:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD74EF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N4w0e/X4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7104619C5;
 Tue, 30 Mar 2021 16:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617120372;
 bh=LcfNiuaHxShmpOMM7bIh9+cRZVxKyNwsRLx+S7WkUrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N4w0e/X4HD6ZFXJaJbwQbxqRZisLjH28suTfoGysW+F4DGQxOhLGtW2oFkAmJLRnq
 7U4GoiKEwMNXPRduc8MtfuwTZxtKE15qyJo9et2Q5Mvss7RX4o9+zfuzREKMkQAbjs
 8Ob2qYi2YQqfVtCUpWmUDMxJ6OGI+StPD90E/ifgllS7BQAdTDiKtiwBB7o57Omxte
 n8Jdg4HE5d3uxIqMO1e6nl3qPUf5YfBMsPvI4l3WFFTMTPvcgdSX0uBTeIZtn1XIYE
 L+Z4mX/w3bFO8mh3JUOvpBP52Bh4YjtWRQDtZzsxtE4tXh8qbxpcRVUtLvudggygbr
 BmfMozp054VAQ==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Argus Lin <argus.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Colin King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH][next] ASoC: mediatek: mt6359: Fix spelling mistake
 "reate" -> "create"
Date: Tue, 30 Mar 2021 17:05:50 +0100
Message-Id: <161711993559.12915.3840156650478962312.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330084710.997731-1-colin.king@canonical.com>
References: <20210330084710.997731-1-colin.king@canonical.com>
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

On Tue, 30 Mar 2021 09:47:10 +0100, Colin King wrote:
> There is a spelling mistake in a dev_err error message. Fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6359: Fix spelling mistake "reate" -> "create"
      commit: f556de6087f0d19825ffcdddc4816f83ddfd35e3

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
