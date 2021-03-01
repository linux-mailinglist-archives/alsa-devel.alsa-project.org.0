Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706C532954B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:41:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03C591668;
	Tue,  2 Mar 2021 00:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03C591668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642080;
	bh=dg6BeBGISWGF0gV3iR/jlBIXrHb5RFxCFDTOZcWhzpQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C8QZ1AzVOgwmnT03WGVnUQ5nQYceIRzkdmwPVao5jWFhUag+uMbrzV+DctsHPTYk4
	 Yy1oBb6v7MLXggl5i24Lt7uS7wqwibmb3CSC9LAdsXMBrHCQ2s5h2tCKtu8xUHr7Qd
	 FsafX7GPc+N0i0XpMT6ltbrzejwuTlPS9PvhT4BM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E64A3F804E2;
	Tue,  2 Mar 2021 00:36:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 925BFF804E5; Tue,  2 Mar 2021 00:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D70F804E2
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D70F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="feHCcUT4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 023B5600CD;
 Mon,  1 Mar 2021 23:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641801;
 bh=dg6BeBGISWGF0gV3iR/jlBIXrHb5RFxCFDTOZcWhzpQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=feHCcUT4vETo/jlSM0CULkHV1p6YmCQqv2co759EbmZjUppRf62tip3GnWKaSpSak
 ju/LHU8rFlEqHJWAo8kLNr+vMKiibKHLVLbp/XFZ3/hjoIe1TyK70Feiwnw1ngZ1QX
 6BRDdf/7O6y7m12tqVokxAP73uanIX1MymcXYBqOUWVdZcMiPF5DrbUYTzF47hJRcW
 l59bckpzuMQ10OeW/dI9FUNGtLG7lel2fg7ZUToOXRagI8FfEsLJofvwYQYR+OHYe2
 ECVloriWDG/jEAdZyzdKnvYXoV4b4TE4JBvd23t3FgGm1hpbMzqdVxLvfuJYmhUSxI
 BSC8AWLB2Bqgw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Colin King <colin.king@canonical.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20210226185653.1071321-1-colin.king@canonical.com>
References: <20210226185653.1071321-1-colin.king@canonical.com>
Subject: Re: [PATCH] ASoC: Intel: boards: sof-wm8804: add check for PLL setting
Message-Id: <161464168097.31144.7451844470598305958.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 26 Feb 2021 18:56:53 +0000, Colin King wrote:
> Currently the return from snd_soc_dai_set_pll is not checking for
> failure, this is the only driver in the kernel that ignores this,
> so it probably should be added for sake of completeness.  Fix this
> by adding an error return check.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: boards: sof-wm8804: add check for PLL setting
      commit: e067855b814600248234a2a7283a7a9006e5aadc

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
