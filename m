Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABA0429527
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FDFE16D0;
	Mon, 11 Oct 2021 19:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FDFE16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633971874;
	bh=F8/FG4wlt4xTlS+woET9GXpzyRycR0DvcYe7q5SnHFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7yPDtSNYv/bZwLCeF4M04cMvnF7tqKCCIfh5f9NLZmI0g5vxaPMWdTuPkfCTzOVg
	 lWt4YO0//GymemR2FiheWvRO0AKSxwWhsffCfMnLcY+eu8gVzZ5cVGGAw8hPz3/iue
	 PUHUPYmTesZwhNv7Rq4yP+pqDgdQyIQbhvyg0kwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D7AF804F3;
	Mon, 11 Oct 2021 19:02:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22D8BF804EC; Mon, 11 Oct 2021 19:02:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7290FF8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7290FF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BOEJGj1u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5011F61040;
 Mon, 11 Oct 2021 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633971721;
 bh=F8/FG4wlt4xTlS+woET9GXpzyRycR0DvcYe7q5SnHFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BOEJGj1u9dbGKE8w4fKpNL0m6V1DxY7jUO7YzAo5XDJSvaDy0deXoz8ZE7n/yCHoT
 QgE7GVO8DoFlM/97lzHoUaw7ZNw3lOiCqGELTDDUzaCtHbkpvXODeglAy6b/ycvH7R
 nZzArhZwMtcT9tnGgjrCXxpbY45ehs3X610CdikbqSsM+CX9Dg+MvfXI2U40ELDPvY
 0RsfLS0GILO3TRUF5R6Ka0sQKKSskMBqqLPisT2Eqka5lHWjsOM3G7Y7xu2sUcESDS
 2Ksst7CyqYJsqRpd7sGIJDprPoTSM4MER8NkZbZHxKfz8VOCT94n2xcUvyI1lp+wFy
 /ar+hSjkKi6Dg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/4] ASoC: Intel: bytcr_rt5640: few cleanups
Date: Mon, 11 Oct 2021 18:01:43 +0100
Message-Id: <163397094549.6567.12509842562892439300.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
References: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Thu, 7 Oct 2021 19:57:11 +0300, Andy Shevchenko wrote:
> The small set of cleanups against bytcr_rt5640 board file.
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

[1/4] ASoC: Intel: bytcr_rt5640: Get platform data via dev_get_platdata()
      commit: e86c1893d6785a0f5e5d82cd161b991564720eaa
[2/4] ASoC: Intel: bytcr_rt5640: Use temporary variable for struct device
      commit: 81d43ca17506ba32c6ead7fe4cf3b7f37368cc83
[3/4] ASoC: Intel: bytcr_rt5640: use devm_clk_get_optional() for mclk
      commit: a15ca6e3b8a21ff335a2eedbc5ba4708967be2be
[4/4] ASoC: Intel: bytcr_rt5640: Utilize dev_err_probe() to avoid log saturation
      commit: ee233500eea421118cd9d53c82fd5e612f6d7bd5

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
