Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC939434A13
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:31:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C3A816DD;
	Wed, 20 Oct 2021 13:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C3A816DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634729494;
	bh=Hc5cuk9glDaRbaSAq4FdX0qHDgJuvg1tQjkipEezNvM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ggbbyBmFJHxT5EshQpkoEowTHqLrx/ORUt8BxnhzCdzv/uaJ0/hiAMF0tNUeTPzUT
	 qCOhRru3KShA7vSQdWOJLUXZG7pGWCF2/+DNNTOTviwKITw18XFOcHRbSRtynLRZn/
	 dCDHTh2sp/9gOgmEVi5Wvy+5TMUv7xnBwP4tgPQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C2BF804EC;
	Wed, 20 Oct 2021 13:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D181F802DF; Wed, 20 Oct 2021 13:29:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C318F80229
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C318F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LZF5Rfu3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B39FA61359;
 Wed, 20 Oct 2021 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634729329;
 bh=Hc5cuk9glDaRbaSAq4FdX0qHDgJuvg1tQjkipEezNvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LZF5Rfu3GUprtBYrB0BU2YZ4eiM3rLK3Jig8bOQm5cQ3FghfMbGuEB0HiI3mjDEL7
 HcI92HqOvIYR+xyeSL+cWhNkp3RjFLDOowqPlkUO3yWnehhLcwcU9KykqucYUPLXm8
 t37If7zQ/usbfxpBS+fK1PU2bjFJ9Dju4VQX6u0DnmtyiP/kzXYER6BTYInbKQCqWI
 Kp6FzguBtH7sH/PW9v75AiutVwbLb4GQefEqmsUQ8NMVvICf+mOSRai/GDSxoCSB4A
 4ixMHcXIa6D+V67GUnqNFJCeBCAooaizOZZUT6UXeokfbMx6+j6kBjbjDs7ZF6aVtT
 pEXW/S7NDTcKw==
From: Mark Brown <broonie@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: implement driver_name for snd_soc_card in
 meson-card-utils
Date: Wed, 20 Oct 2021 12:28:36 +0100
Message-Id: <163472931364.2896549.2043578112545946668.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017160028.23318-1-christianshewitt@gmail.com>
References: <20211017160028.23318-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Matthias Reichl <hias@horus.com>, Mark Brown <broonie@kernel.org>
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

On Sun, 17 Oct 2021 16:00:28 +0000, Christian Hewitt wrote:
> Implement driver_name to provide an alternative to card_name for userspace
> configuration of Amlogic audio cards.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: implement driver_name for snd_soc_card in meson-card-utils
      commit: bc387887ae22d6ed6439e83968b5be3443a8e57d

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
