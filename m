Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5649A42A395
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 13:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC46B168D;
	Tue, 12 Oct 2021 13:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC46B168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634039211;
	bh=YqGQHIeclGE3rrxpHL3otX/2GEBFvzn7qYCPeJ5/f8c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsbrGMODwb4BU3n+U3Q3DhE02LUVDTgkUsJCHcEtgceFe0k1YGC7PAdy3GYSh6jpD
	 lW495Xh0hTWs7mXY2vi9PlqtkwWvy+UPKavrcy3EZhMX9rPs2fbu/RAYyZNob0qs3H
	 ELAu5GAyR797DhsfpDbNuA0fltq8FgiZ9jP5SSow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE88F80302;
	Tue, 12 Oct 2021 13:45:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D883F80245; Tue, 12 Oct 2021 13:45:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AE73F800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 13:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AE73F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OJUy6Tyk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45AB8610C9;
 Tue, 12 Oct 2021 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634039124;
 bh=YqGQHIeclGE3rrxpHL3otX/2GEBFvzn7qYCPeJ5/f8c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OJUy6TykzRiwXrE/X/vbdxzyKcXTuejUfqJV7qSfPVOXbXJzSifj8+4wDNTPsdDRc
 dWyqnxFnuERkk4nK44gz/fyjr+P8Ox08gp+ONza4+YwHh3Zmx5V3r73WdaVYQtAWZc
 1OtfXiGkcA3jHynFTp31ec5YlzN9d3SRC4pak0gjiQOqc3N1iJkH608wL3tGTXKN6e
 Tiq6TQeTb2D2W+EPymrUNngD/y7ifQ3BKXCok6omanspz9U5Fr+kDtiCZpkpHs3fTg
 l/VIXzhL7T4shUnBkP8JRp2pxRwuCcNSFEVLN0sPEYGmtD5AdwBhP6MSwh7fsacYU4
 mKeAJbDOOiK4Q==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, oder_chiou@realtek.com,
 jack.yu@realtek.com, lgirdwood@gmail.com
Subject: Re: [PATCH v3] ASoC: rt1011: Fix 'I2S Reference' enum control caused
 error
Date: Tue, 12 Oct 2021 12:45:19 +0100
Message-Id: <163403898174.2091644.13928014844510803055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011144518.2518-1-peter.ujfalusi@linux.intel.com>
References: <20211011144518.2518-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 pierre-louis.bossart@linux.intel.com, seppo.ingalsuo@linux.intel.com
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

On Mon, 11 Oct 2021 17:45:18 +0300, Peter Ujfalusi wrote:
> Access to 'I2S Reference' enum causes alsamixer to fail to load:
> $ alsamixer
> cannot load mixer controls: Invalid argument
> 
> cml_rt1011_rt5682 cml_rt1011_rt5682: control 2:0:0:TL I2S Reference:0: access overflow
> 
> The reason is that the original patch adding the code was using
> ucontrol->value.integer.value[0]
> instead the correct
> ucontrol->value.enumerated.item[0]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1011: Fix 'I2S Reference' enum control caused error
      commit: c3de683c4d1d68ff27f21606b921d92ffdea3352

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
