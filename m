Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D523C52E3
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:50:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D80584D;
	Mon, 12 Jul 2021 12:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D80584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626087049;
	bh=6I21jOSt2z0gqLk0ND4rhdMDbKCAlffeVuEN0sf5oH4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bDeJjqUzqNI+RJpI7m5axcV2ljaDL+eJ46NUL9zySQ2YDuxRawpoK8vylsk/tbe+R
	 JogA89T30ZRii+d21e9xqX8yUaxfcGgB4sykh+1j5FYyb4sXEjWrXiA4fC9hxQ1QVC
	 8jhkuf4gTDb1p+FPQXs4IlYpc28rV4+R+MdXwyIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DD0DF804E3;
	Mon, 12 Jul 2021 12:47:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BC74F804E7; Mon, 12 Jul 2021 12:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAB59F804D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 12:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB59F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D1un9XkS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAFBC61152;
 Mon, 12 Jul 2021 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086870;
 bh=6I21jOSt2z0gqLk0ND4rhdMDbKCAlffeVuEN0sf5oH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D1un9XkSk2rlSxB1C0Xg2KUqEDA1YZxMQPl87Rlc/v6z7Sptmgpumi8T1PstNopV0
 QCkVV02dkOMZXV4aYMYBll+EHoYVVxGMhCxpvkl+eeNJ4p+SXxdpc2vHJ1iNh+z6wA
 qpRavDKkpkc352rpsl4e3Ja7alCnpTrYLzSRmewaBSLqoDNxdq9sgdZCMuddFZCVfs
 U0OIDNEwnM/CwJBr0ap/uNCxdWDwVAr3GxXQLxDqDgyBDUyNrAFSZMvNNEMTyxGKQk
 KEowvIOrLr4kL7XYTfmYt9W54PlHjll2qKU6XEVB2mKScqTBx7cWHeRinkuqyBm9uR
 o36i04i/JlcIg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/4] ASoC: Intel: machine driver corrections
Date: Mon, 12 Jul 2021 11:46:01 +0100
Message-Id: <162608623150.3192.15945956952232307901.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
References: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Fri, 25 Jun 2021 15:50:38 -0500, Pierre-Louis Bossart wrote:
> The first fix solves an underflow in SoundWire platforms using the
> max98373 amplifier, the rest of the patches are minor corrections in
> machine drivers.
> 
> The fix should be queued for the 5.14 cycle, the rest should be
> harmless but can be deferred for 5.15 if it's too late already.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: Intel: soc-acpi: add support for SoundWire of TGL-H-RVP
      commit: f99acc259f621ae6667782778b2065c15e109693
[3/4] ASoC: SOF: add a helper to get topology configured bclk
      commit: bc619cfc6278c87b4e310f9db9f45abc263220e8
[4/4] ASoC: Intel: sof_cs42l42: use helper function to get bclk frequency
      commit: 837ad6da36ba765d9ff8120c93dd243b9200957e

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
