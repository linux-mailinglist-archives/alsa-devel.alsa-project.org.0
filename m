Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70053B6739
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 19:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F999167C;
	Mon, 28 Jun 2021 19:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F999167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624899852;
	bh=Fiv1YQ90stTSnPr6LUlfDc0aZQp0fWAdibbVI8+dBWs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sqn+xJq0InnxHyQu1x5c+Po7gRGh+0sGx+my56dwpuSJBh529h0SgfJ8HKAu7ljMh
	 v3kZlLDR9ePURXEam/zCxAj22J5pih8d9UH55ybrFrwWf+/msMkD6rqRGCT4pCC8rF
	 W9kEiQFcysgGaicLVVpeOwXiAti9JE0hONxfZiBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 068B3F8027D;
	Mon, 28 Jun 2021 19:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F2A5F80229; Mon, 28 Jun 2021 19:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8B40F8020C
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 19:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B40F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N8hDwMqo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C4BF6199B;
 Mon, 28 Jun 2021 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624899757;
 bh=Fiv1YQ90stTSnPr6LUlfDc0aZQp0fWAdibbVI8+dBWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N8hDwMqoWGGZHKSi7eAoVjCSMh7VCf/o+0Q6YC8L3aAeQxjCP9UfFfOKRGim/9tO1
 MI31QxB6H4g7MqnDvN5fI7Jwf9kFDbvvuvQBxBxX30SiGcVCO7egQsUCF5L7W3efzo
 NwnFQWe66P2xK5hQYkzAr1Nfi1Dned/whOD0UjRiLtuGYmc7E5Fw8+Re0hph1IGCJE
 eGHUd2qAUT3kQhfviAU9qJAqyIHiZ71qG3ACosIEsXurDB4eKiae/u2r4+5tX+qkYp
 TXzm1dFdyQj8WP4zz50vb/X7+I2HucDUR9w8L7NGtq2iQuTDpDkQVyyP0ErB7azgSR
 elUbCty22QUgw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/4] ASoC: Intel: machine driver corrections
Date: Mon, 28 Jun 2021 18:02:00 +0100
Message-Id: <162489923152.4847.16597431604027903670.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
References: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Fri, 25 Jun 2021 15:50:38 -0500, Pierre-Louis Bossart wrote:
> The first fix solves an underflow in SoundWire platforms using the
> max98373 amplifier, the rest of the patches are minor corrections in
> machine drivers.
> 
> The fix should be queued for the 5.14 cycle, the rest should be
> harmless but can be deferred for 5.15 if it's too late already.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: boards: fix xrun issue on platform with max98373
      commit: 33c8516841ea4fa12fdb8961711bf95095c607ee

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
