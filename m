Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 758FF53FC98
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:59:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1592E1AD9;
	Tue,  7 Jun 2022 12:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1592E1AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599594;
	bh=YKQELZvzOJkB2IeJeCi/2ArpKhhJ5jPIj53TtIQHsb4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqFm/uULiz3P8LxX0amlj0YB7cC/qa1PqfdxkeuwLwuzyV6vyswLtSDBC6rDc11oE
	 FDBd2dz0hlJ3jvW+AiYJKCgEeanlUvYcGpy0H4nV3drLRw5t/wNXGzlUTsykjbg//v
	 4nzgIpLuMVqS3NnWzFuj4qNjZPVx9h7y0Ig/veU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B929F805B3;
	Tue,  7 Jun 2022 12:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA04F8057C; Tue,  7 Jun 2022 12:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E2F7F8057C
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E2F7F8057C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RVzCIMPu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A3856149A;
 Tue,  7 Jun 2022 10:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E677C34119;
 Tue,  7 Jun 2022 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599322;
 bh=YKQELZvzOJkB2IeJeCi/2ArpKhhJ5jPIj53TtIQHsb4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RVzCIMPuqWo0PnTjLAXeE9v2Y3FOP0gij5Bsm33iDPRYTBawOIVgByaANq7UPTi5L
 hHhypTITYYeFQytlZDJbtuOB/4vG7hBf5MYcCcqsmx6RpZLDxeq9gdzXeSA2gxPyev
 TrABORqK5VipxUQQBxlqAEN5vgyWGxGVp5wb4ZNDGThXULEHXmbdGJn9Uoype3dYjx
 HRG5guIWj1KSKAB7g7FVBsIksw4oaZm5OTYRX9E4jze4lcBuh7Pn6vjmN4VFGSkNTO
 mSv0vf9c3pi9VNsZZtsiJkppydpXPF8mz7Uv0FI1+a9KtGSLA8yYlhAa6zic4a6mhy
 Rjv3nl42Ae0KA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
References: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: soc-acpi and machine driver updates
Message-Id: <165459932198.399031.6743207029116653347.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Mon, 6 Jun 2022 15:46:19 -0500, Pierre-Louis Bossart wrote:
> Small updates to add initial tables for MeteorLake, SoundWire machine
> driver support for tests without HDMI and RT1019 for consistency on
> Chromebooks.
> 
> Bard Liao (1):
>   ASoC: SOF: Intel: add MeteorLake machines
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: add MeteorLake machines
      commit: 11fe58c4450a8108b498d2f849976ba2686820fc
[2/3] ASoC: Intel: boards: rename RTL1019 compatible driver to rt1019p
      commit: 93693dcf2a4d7ab6a355f80c14653cd9c27a1422
[3/3] ASoC: Intel: sof_sdw: allow HDaudio/HDMI disable
      commit: 8208dd75eb468d1bb90aef52f385e5b3486bb737

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
