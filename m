Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A852DC383
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 16:54:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA481815;
	Wed, 16 Dec 2020 16:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA481815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608134076;
	bh=Yq92sFZu7rKClVhWfJ8qHg/nPbAtQoSp0TTWGSYoroU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ofNxWdcDrsYLk3BJw/SHNnuxZF+71+b3J2zacMlsVSPpeqUCl1mwrBlcUfphHJFqv
	 JLgXU59vXcXyRcD86fzTRuruoVa/iUqhALQzs5mj58BwiAAmQdMVjxKJrlY4AVArnD
	 tS++AFpScwer8P296zqD6Pg5l+ZBw1hYDh8c7SkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 457D4F80274;
	Wed, 16 Dec 2020 16:53:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90500F80240; Wed, 16 Dec 2020 16:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5590AF80171;
 Wed, 16 Dec 2020 16:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5590AF80171
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Colin King <colin.king@canonical.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 sound-open-firmware@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20201216125913.16041-1-colin.king@canonical.com>
References: <20201216125913.16041-1-colin.king@canonical.com>
Subject: Re: [PATCH] ASoC: SOF: Fix spelling mistake in Kconfig "ond" -> "and"
Message-Id: <160813397775.31838.1527299026383832413.b4-ty@kernel.org>
Date: Wed, 16 Dec 2020 15:52:57 +0000
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

On Wed, 16 Dec 2020 12:59:13 +0000, Colin King wrote:
> There is a spelling mistake in the Kconfig help text. Fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Fix spelling mistake in Kconfig "ond" -> "and"
      commit: e49037ad12e47cd34239b99b010c5438844923af

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
