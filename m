Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DAB429525
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1197E16A2;
	Mon, 11 Oct 2021 19:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1197E16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633971864;
	bh=jm+MmghP27mX/Vw4z1PWGh2UsatbCOer/kNjOSXtGSI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpfLOXBwkW/5mKqeOSyN3qI2yv+DtolHYiQN7i+eIeC/LFbGO/WE9/Z3Ly1hSFIdH
	 FbS2Eap4xMLfvjp07hX6sm6xQCTn5HsbhNx4rMoGCkJxNFp/QDnQ46s7va8gNzaHAY
	 8HLQmdu85/fJK4ofhnfZG/nv0Y1CRFhLUo7o3OrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8004FF804EC;
	Mon, 11 Oct 2021 19:02:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B7F8F80269; Mon, 11 Oct 2021 19:02:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD1E4F80269
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD1E4F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SprZptrV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0CA56103C;
 Mon, 11 Oct 2021 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633971716;
 bh=jm+MmghP27mX/Vw4z1PWGh2UsatbCOer/kNjOSXtGSI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SprZptrV5S23fsND4ATcbmrILSVzjoDUuw2bGr9aAyNU1u1MumrMa7BFyULBRae9O
 JsqmxucdbNDFkuTkBrt6vssF8zUCSKyRA8i9+aVZmpM4ECjKRdo6fg+gdyvRI6l/CG
 gACeQPsyyVJG6RHI/3K9Jm+1BfOlKjwRQuCCjQOLW74DNe/qSFAWiLH+jJCs1poQef
 0Ksv2ME3Fs78L+4gWlbJ2F66sqKkeliJXLAJNpJoPv/VaYrJUIjDLLnIQsUv07ecof
 xbYPDaDNF5rAXkSlyLcRcYxe3yfTCsg3VoFCyKkHOKN86yho4P1vv3rRU3Ue16iSNq
 OWLOA5qlxilsQ==
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/4] ASoC: Intel: bytcr_rt5651: few cleanups
Date: Mon, 11 Oct 2021 18:01:41 +0100
Message-Id: <163397094550.6567.12613609707745181814.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007170250.27997-1-andriy.shevchenko@linux.intel.com>
References: <20211007170250.27997-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

On Thu, 7 Oct 2021 20:02:46 +0300, Andy Shevchenko wrote:
> The small set of cleanups against bytcr_rt5651 board file.
> 
> In v2:
> - added commit message to patch 2 (Joe, Pierre)
> - added cover letter (Pierre)
> - added Hans to Cc list (Hans)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: bytcr_rt5651: Get platform data via dev_get_platdata()
      commit: 0c465e7a8ea26f4ad52dd9548f22afdaf6e039a5
[2/4] ASoC: Intel: bytcr_rt5651: Use temporary variable for struct device
      commit: 269da8f7626b1de69998fe1a0c0e069749d18a28
[3/4] ASoC: Intel: bytcr_rt5651: use devm_clk_get_optional() for mclk
      commit: a8627df5491e00e23d4f2e648ff796adbfa23cc5
[4/4] ASoC: Intel: bytcr_rt5651: Utilize dev_err_probe() to avoid log saturation
      commit: 45c5dc45d80d41596bc0364fafc523648e6124d8

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
