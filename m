Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1505C355A97
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 19:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B1E115F2;
	Tue,  6 Apr 2021 19:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B1E115F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617730964;
	bh=gLki/Xmys1/KD/LzsvZQ8VQy1gbMhA3oTJt1qS4L15w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+1dxAHGAe1cYv/B3vuEjLQAWHJznyb6nMyRPDfFPoojZwrbRLKHagZtaTODzklL4
	 mDAf0CvTrkI1Xz1abMYlUKasd5R10kgZit7yXOsmlXAe+tVr4d1APmVHARu5eszVfO
	 q49oPAlGAXNf584CmZp6k1ejbvDTrHq5oboA2FGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D69C1F8042F;
	Tue,  6 Apr 2021 19:40:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88679F80249; Tue,  6 Apr 2021 19:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB636F80169
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 19:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB636F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cgPyYReC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF8B7613E5;
 Tue,  6 Apr 2021 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617730805;
 bh=gLki/Xmys1/KD/LzsvZQ8VQy1gbMhA3oTJt1qS4L15w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cgPyYReCuO5YST0aI+xw1Kl1DutdnYyZSvPM4OYYK6GBNZTzvObQDwemy9efjLLOH
 Bs/Boy5472poeWiP7bg5qA03vSrVKiV128Fw00IO7bRRLXDhyH/T1wcUyl+8fFlgsD
 Wkxe1qTb20wh7lXgZA2g06l05Hs8fk8+8V7+dh4TXftjyal+lztRib1Ym5OoL0nC8x
 US2lfygxBe7boBmpthLZzfr7+60oa0KeUY/R1ifDArPEk0PFR0vkmJZXHBh6mIt+bK
 Rb1wKDcF9eepBPyZ1qQ7WAHLF6nT1D6+8Y9PM12X3QHfUNmJ0czh3Bn1+DslNc0fZA
 E/0Rn+nYKIzDw==
From: Mark Brown <broonie@kernel.org>
To: Annaliese McDermond <nh6z@nh6z.net>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 0/2] ASoC: tlv320aic32x4: Bugfixes for tlv320aic32x4
 driver
Date: Tue,  6 Apr 2021 18:39:40 +0100
Message-Id: <161773049107.51713.3511483011411927627.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <010101788984f9d0-64bcaa85-ce13-49dc-bfc6-892a6a4e411e-000000@us-west-2.amazonses.com>
References: <20210331182125.413693-1-nh6z@nh6z.net>
 <010101788984f9d0-64bcaa85-ce13-49dc-bfc6-892a6a4e411e-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: "team@nwdigitalradio.com" <team@nwdigitalradio.com>,
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

On Wed, 31 Mar 2021 18:21:36 +0000, Annaliese McDermond wrote:
> These are a couple of bugfixes for the tlv320aic32x4 driver
> that we discovered after the Raspberry Pi Foundation's move to
> the 5.10 kernel.
> 
> The first increases the maximum value in the regmap configuration
> so that the powerup command actually works.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tlv320aic32x4: Increase maximum register in regmap
      commit: 29654ed8384e9dbaf4cfba689dbcb664a6ab4bb7
[2/2] ASoC: tlv320aic32x4: Register clocks before registering component
      commit: 1ca1156cfd69530e6b7cb99943baf90c8bd871a5

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
