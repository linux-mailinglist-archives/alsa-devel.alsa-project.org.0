Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C74089C3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 13:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA0A1616;
	Mon, 13 Sep 2021 13:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA0A1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530902;
	bh=ETQbsAKO5SXI7fHHzl337FM8JMNZ1wphuPa7wypweBA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XuJvLJzeLGlFP+rWzp/u/jHiJ47d+lUgzjzybBERtABsZ40iCxolOuBF+EpQaqy+d
	 BClAZF02R304KiEoQ/a8jvq1yy8h7Rhu+8eE/nQBGBv1IoDlb3w5nFMmp3lR+MSwTU
	 3BBnqiQl1ixj+gVgCgL5X10Cm6Z2dLiyBdOFJshU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 809A8F80559;
	Mon, 13 Sep 2021 12:55:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5C83F8055A; Mon, 13 Sep 2021 12:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C97ECF80538
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C97ECF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FuBwWgCJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8D4C6108B;
 Mon, 13 Sep 2021 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530522;
 bh=ETQbsAKO5SXI7fHHzl337FM8JMNZ1wphuPa7wypweBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FuBwWgCJ0PT+DoqItWIfKuTR/rlisusUttpRXAX2086aN1pZfT6UChjI729HB/8fV
 reCGit3fq0L14L1H7glE9X55xSKXo4I56k8jmdVXGMRz1dDg0t+hZlZVd+5lpVMhO8
 gHCAUtrv22bjzV/mbv9rPCA45lCqkQnFqYYPWDRXQ88bmRnWpM/0x7oNcW0CZ13bMs
 T/PU/AsLJ6ikTbdRjwuTvprU5YW8URW+YpKhaXXEz/oS0MOJ0L/AD1QWVqxtEhyB8t
 FmjHgetKimz7f9hLBugIdpxZrtOd5u1tnhQRh/6Hcwjh7kkzu/mBxq1MYodtaG0c1R
 eR0wqUwmYrOiQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: core: allow module parameter to override dma
 trace Kconfig
Date: Mon, 13 Sep 2021 11:53:31 +0100
Message-Id: <163152996585.45703.8653739784315625887.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210907184648.33306-1-pierre-louis.bossart@linux.intel.com>
References: <20210907184648.33306-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Tue, 7 Sep 2021 13:46:47 -0500, Pierre-Louis Bossart wrote:
> Most distributions do not enable the SOF developer options and
> specifically the DMA trace. This is problematic for end-user/community
> support since the sof-logger tool cannot extract valuable information.
> 
> Conversely in rare cases the DMA trace can lead to Heisenbugs by
> creating more traffic to system memory and more interrupts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: core: allow module parameter to override dma trace Kconfig
      commit: 6ade849e30b470d11d591528d7cebb3174298336

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
