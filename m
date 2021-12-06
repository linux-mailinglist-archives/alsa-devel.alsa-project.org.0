Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662046A3B7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:02:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9702F22F7;
	Mon,  6 Dec 2021 19:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9702F22F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813760;
	bh=P/4KZcHyQBwdHWd9kJQOIqw/zF3r6oRodHZk4R4fOFk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/k0lJI65bOa71IlLxclwW9QY8DwI3NVLlbAXTPKTfSgP7NPuznscpx/8exq4n/7V
	 aXJvpSXyy1el2BHxJ5OHEe5Ig3K3uL18UlHttOHPXTWRL8Snl/ldQDqIIa9jnpxtm/
	 eBTqbfx0ebZnxngutz949knF6cNX14KVE6EfPDp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9830EF804FF;
	Mon,  6 Dec 2021 19:00:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5725CF804FC; Mon,  6 Dec 2021 19:00:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F79F804F3
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F79F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q4NPdFYs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1B11B811DC;
 Mon,  6 Dec 2021 18:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40185C341CA;
 Mon,  6 Dec 2021 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813634;
 bh=P/4KZcHyQBwdHWd9kJQOIqw/zF3r6oRodHZk4R4fOFk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q4NPdFYsLfErSx+tyEJOQJolerVVKQvIvS8Z32g3CyoGHdf17pItgJIiI1PKD8Qhe
 I3il1FtYhk2bJF4Nb9AQdmcjpu2yWdYBNqH1oKHoEPmZcvrzMvSek0GjV35ZpwTlFz
 tMCcahI3VfxQAUdvPc40chf3oXqwhuJimxz2EzCq3xkIzUczMol1ZR9sPjuWChk5J0
 ZDFdc2xZ1sNGDx9Q+/B3BQGWvtH4tj10HtuNnL8u3vZJyrwMdjboOOANlZtuEUZp7z
 ZYvRKVz8hay/+hIwjhTQc/Mqo91gy6QMDcEPTgGbB8PcpArdmkPhTuU6bdqq0hWkfm
 M1EF+unGma/bw==
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20211202205612.76216-1-andriy.shevchenko@linux.intel.com>
References: <20211202205612.76216-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] ASoC: ti: davinci-mcasp: Get rid of duplicate
 of_node assignment
Message-Id: <163881363192.2769299.4699480471274162450.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>
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

On Thu, 2 Dec 2021 22:56:11 +0200, Andy Shevchenko wrote:
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove assignment here.
> 
> For the details one may look into the of_gpio_dev_init() implementation.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ti: davinci-mcasp: Get rid of duplicate of_node assignment
      commit: 4db32072b8ab18a8b90191c57c74f42d00bf9991
[2/2] ASoC: ti: davinci-mcasp: Remove unnecessary conditional
      commit: c1a77ba466c0dd0bdf1ec2bbebb8996d7cd7b8f7

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
