Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB122662BB8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:52:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 377AAC384;
	Mon,  9 Jan 2023 17:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 377AAC384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673283154;
	bh=rPvp+nyVFAXbsnYKzM13/h6MAT7PR0HaVYfLYnxO7B8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=StxopobUhzUKWT9B58+nJphtVhLHDVS61yEvz5hAKB6ev1y3VC3Nj5wVJD2XvxpTF
	 mUhlmgx49agheFkTIoPMJvXAKkOxoGKLQB1rKXigNj1/sc4Ecn/tuN6L0wlOKbGSVf
	 KzCBa5c2DA6hae01iWRfkpKSri/F7liyGCiPjDN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5703BF8057D;
	Mon,  9 Jan 2023 17:49:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C41DF80580; Mon,  9 Jan 2023 17:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E75DF8057D
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E75DF8057D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mGERPPgz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11D7CB80E7B;
 Mon,  9 Jan 2023 16:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A1EC433D2;
 Mon,  9 Jan 2023 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673282967;
 bh=rPvp+nyVFAXbsnYKzM13/h6MAT7PR0HaVYfLYnxO7B8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mGERPPgzm5FKlfcj3PUXg2Hi05Chrv72wUywZipivsUZr2+ldG81HBTmkLYno5zvU
 WO+vZhs3uBsuAtg/dZ3ohFVxyL0ZquvYtaRyDCV5+rfja1fMy4a5rTNW7+tvuv/eUl
 GWpXiCkX4zGiPvC2odL/bvZ6FseA0zWlI772bYOuLsN6k/DB4mjI/t7z9KitNxcIHD
 AXu3iyW1nywpr1bDQ1eQy5unm3diACzLw/lWz2WO7FpDYUS+QclPAPYkowFw9rRG/S
 ASw2iuNLya9+R+sBCji5iFcxAB5mDt+bbMCd9vKHp2RnjdLlXQ2s1zZpAoDCh/dlx+
 ZY22tIkyOoOzw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20230108114351.539786-1-ajye_huang@compal.corp-partner.google.com>
References: <20230108114351.539786-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1] ASoC: nau8315: remove dependency on GPIOLIB
Message-Id: <167328296387.323147.13503501873673996744.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, Terry Cheong <htcheong@chromium.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 kernel test robot <lkp@intel.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 David Lin <CTLIN0@nuvoton.com>, amadeuszx.slawinski@linux.intel.com,
 Linux Patches Robot
 <linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com>,
 Ryan Lee <ryan.lee.analog@gmail.com>, alsa-devel@alsa-project.org,
 Sean Paul <sean@poorly.run>, Brent Lu <brent.lu@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, 08 Jan 2023 19:43:51 +0800, Ajye Huang wrote:
> commit dcc2c012c7691 ("ASoC: Fix gpiolib dependencies") removed a
> series of unnecessary dependencies on GPIOLIB when the gpio was
> optional.
> 
> A similar simplification seems valid for nau8315, so remove the
> dependency as well. This will avoid the following warning
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8315: remove dependency on GPIOLIB
      commit: 523ba3b70fc572f69673d8bd88af00df0e716529

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
