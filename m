Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10127619AA3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 15:57:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB331655;
	Fri,  4 Nov 2022 15:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB331655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667573826;
	bh=aFT+OYWwtWWikyYe2ydT4JOUjF+vaIMzzwvgJK0u6u0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EU/PF4Jd4y2X3LUb+3hZ2liDWSAyTE5Q4/3WgZ74Xkyvitc3G8HDp+WkIuu6tJkVz
	 UpjyT4ahOSjC7k/2QreVmtA3pJt8kWam2mY2u3Uw9ULi7xyF/ZVeplwQgqq78mRIeT
	 /UuF2zhyeILZRDIDyNjxlfjfBjOmEvCtrJTi0PgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04693F8047D;
	Fri,  4 Nov 2022 15:56:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CDA1F80448; Fri,  4 Nov 2022 15:56:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A06F5F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 15:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A06F5F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sCTs4qMp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA91F62236;
 Fri,  4 Nov 2022 14:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E7FC433D6;
 Fri,  4 Nov 2022 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667573763;
 bh=aFT+OYWwtWWikyYe2ydT4JOUjF+vaIMzzwvgJK0u6u0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sCTs4qMpQHoWjZwWKZylJU5GOrjmgd5bBsy0I3pfZ9THAWllObwZzZ8Me2QOMcrqb
 ORhc4xj9oT/Z0IigtSXNdzcXcxZ5a1c7ZaK4X9u6tEX46lKvrkdT/xYGcKAzjdQiBO
 VHYfz1Bml0McMBViOUrLN+OewKqxu6ZkPeOkzr9VhpMNcV5s6NbP3HvYVK9xn/M32b
 ONVa8FQZ8vsRf9yb4Z0lTS9KxC9zNCPs6/5lskvWEKJACF46wsoxVgJ/D2uvqI+6KS
 cpdKNPnfBrVlVUUbO0f9GGzFqbkrPrAmihh4icXjFzx/dKohjXFZ/Idy0KT6G/HNdr
 ndnz/sfYo1oNQ==
From: Mark Brown <broonie@kernel.org>
To: Jason Montleon <jmontleo@redhat.com>, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20221103144612.4431-1-jmontleo@redhat.com>
References: <20221103144612.4431-1-jmontleo@redhat.com>
Subject: Re: [PATCH v4 1/2] ASoC: rt5514: fix legacy dai naming
Message-Id: <166757376119.346347.7384763439814980163.b4-ty@kernel.org>
Date: Fri, 04 Nov 2022 14:56:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, cezary.rojewski@intel.com,
 ckeepax@opensource.cirrus.com, regressions@lists.linux.dev,
 alsa-devel@alsa-project.org, tiwai@suse.com, stable@vger.kernel.org
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

On Thu, 3 Nov 2022 10:46:11 -0400, Jason Montleon wrote:
> Starting with 6.0-rc1 these messages are logged and the sound card
> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> it to function properly again.
> 
> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> spi-PRP0001:00 not registered
> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5514: fix legacy dai naming
      commit: 392cc13c5ec72ccd6bbfb1bc2339502cc59dd285
[2/2] ASoC: rt5677: fix legacy dai naming
      commit: a1dca8774faf3f77eb34fa0ac6f3e2b82290b1e4

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
