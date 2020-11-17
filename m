Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2413F2B71B0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 23:39:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D374717D2;
	Tue, 17 Nov 2020 23:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D374717D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605652791;
	bh=xJ9Pd7l3GU/MkR4nj1eWuIVcIYyomVZnVKN9YEHBkVc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9nTJJnlwQ5uGoXsiw6uNL7RoQ9FRHQ0xA14DsPnImKFP0oQP/rOA1l27Dxyt2jiy
	 D7t3Eib3CiY1euhhLNS0Nl9Swu+9SGkIl1GWEDJTrA6GvdMV0A7tnviowm8N08Alza
	 OaU0+dQIvfgg32tBpnUUPVyuVZ+WCoffRTwY64Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92126F80276;
	Tue, 17 Nov 2020 23:38:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A05AF801F5; Tue, 17 Nov 2020 23:38:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 070AEF801ED
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 23:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 070AEF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bc4R7dxU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91B3020715;
 Tue, 17 Nov 2020 22:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605652683;
 bh=xJ9Pd7l3GU/MkR4nj1eWuIVcIYyomVZnVKN9YEHBkVc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Bc4R7dxUzVahvleAMpXicdadc7Wg5xSUEkrMntGqA8v6GyvUQHPwYkgiwBpxJCESl
 DWkfNPYo71fveHES6NAUwr3Sxkwu+wvVu4KdH2sUSqmLPSpqpM3aXFNNnMSKqMasCf
 EAKiZbGVPSjnCVgis0N5nTvBc9jaVzZJnH5QpAoc=
Date: Tue, 17 Nov 2020 22:37:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <20201110174904.3413846-1-geert@linux-m68k.org>
References: <20201110174904.3413846-1-geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: Fix 7/8 spaces indentation in Kconfig
Message-Id: <160565265704.23689.7331273235338322880.b4-ty@kernel.org>
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

On Tue, 10 Nov 2020 18:49:04 +0100, Geert Uytterhoeven wrote:
> Some entries used 7 or 8 spaces instead if a single TAB.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Fix 7/8 spaces indentation in Kconfig
      commit: 5268e0bf7123c422892fec362f5be2bcae9bbb95

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
