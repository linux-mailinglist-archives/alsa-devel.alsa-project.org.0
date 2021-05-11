Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D029E37A232
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4994B1784;
	Tue, 11 May 2021 10:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4994B1784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722041;
	bh=8QV1prZgcnGVckULuPrsf8ultZnzYbadIC/1Rfk5wjo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s7sLB1g2v4UDYdv1d6NI+cosnrx9H17Cpy53p/qKZLQZ4TLD13r3Xn1COJVw0V/QC
	 ZH7xWX2++pUWywKjcFb6htZTWXMIbu/Rlwl6kkOrQTMKYATtoy8MnZxsBa0VWBnHuV
	 7jBpzlO3NDmW39MZnh2FAGLbUWtnfiYahgpTjwmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2FA9F804FF;
	Tue, 11 May 2021 10:28:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C3F9F8028D; Tue, 11 May 2021 10:28:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C1B6F804B1
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C1B6F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fi6WJ+I+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05B9D613CF;
 Tue, 11 May 2021 08:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721682;
 bh=8QV1prZgcnGVckULuPrsf8ultZnzYbadIC/1Rfk5wjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fi6WJ+I+vNOQWCgTURDw2P7tcol8qlTEN/y52elLb8qbZ6h+r9f3J1yqlvYz9L/W5
 /UtipGYVPOTygS2M6h2oftXMh+aOl1jot8k5uRvGDbdYzRpM80kDLD+xNc8PeJfQBU
 RKb80KB3wDma6yLylO8nixrWG1VZcfgy/D6lUk4Q3Aznp06aPTiCC5RZ1dBL+ELE/e
 Rq184qzKxAI4nEIelF80jTzqiLa7Cw1PWKP6BgskmuZCVPgthDx9VHJkgY4+jeWqC2
 aGcuCyDg7efqR91MX37ic2baOEB9hj8TrzDULItlpuNL2DzmOqxPQjdQ3JICc+vSNk
 8jS9iLEerOrvg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: split Baytrail and Merrifield
Date: Tue, 11 May 2021 09:25:56 +0100
Message-Id: <162072058169.33157.264989229865467686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505170235.306797-1-pierre-louis.bossart@linux.intel.com>
References: <20210505170235.306797-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, Mark Brown <broonie@kernel.org>,
 arnd@arndb.de
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

On Wed, 5 May 2021 12:02:33 -0500, Pierre-Louis Bossart wrote:
> We've had recurring randconfig issues with the two platforms relying
> on ACPI and PCI. I think it's time to split the two and introduce a
> common 'atom' module, so that dependencies are better handled.
> 
> I chose not to add a Fixes tag since the changes are rather invasive,
> and the randconfig issues only happen in non-functional cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: byt: prepare split between Baytrail and Merrifield
      commit: 1c5ab2dc752fcd02264e8dca8bde55ca479aa684
[2/2] ASoC: SOF: Intel: move common ATOM stuff to module
      commit: 47fad2393b0446229883f95e373067441794e22f

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
