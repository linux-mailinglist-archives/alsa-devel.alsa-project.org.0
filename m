Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED837AE71
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 20:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE2018C3;
	Tue, 11 May 2021 20:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE2018C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620757548;
	bh=dycFQvBD5hPdP7nLkvlCvJ7Hv4xW5/M386OWJG+5YYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAGxFmwiaXkzFpC327N46AGmAxjnFVqDXdywIdWLHiJjMyK30Gsa9MAu01L6nHKan
	 vjycS9Z4VydxCWo7YVLk0zdYSH491vA4u7QNTeODbVz+j2uz7QwttFfQLvlm1kZNx5
	 /QMfRjuLur7/UOU3C8zegijkobqB2nY+f40oRQYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE660F804B0;
	Tue, 11 May 2021 20:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DDDFF804AE; Tue, 11 May 2021 20:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 356ABF80245
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 20:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 356ABF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t+XZAu7H"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 392156186A;
 Tue, 11 May 2021 18:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620757361;
 bh=dycFQvBD5hPdP7nLkvlCvJ7Hv4xW5/M386OWJG+5YYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t+XZAu7HZYo9ammqUL45wFBMwMK3JsYixjjRwCt9TGzoZUE8GwhAipKAxZfSomIOC
 PQYTsUUkrowxMDhgnKty4bZEkYspTikm4J6ASgGTKusN3qDN8g4640rwRRJd149Wsb
 sU97BdEW1yh+/gxcpeGat3YyzsROUAArWy9IBndRIn++ulh4e0onXQ7xEPawNSwssT
 wxsU+uK5DTanXAiT4U4QwEbKJKBvq2v23rlkUS9vy7I6e3UJiTNFRMUtHqOoBNwPO3
 VjN+ADVpY32FC0zo7xK3I3d6k6ftusAau6WMCevrr2OQvXdSUQ3Vvvj9UtBkpEbpnl
 H0Y/kM7Rkc3xg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/5] ASoC: cs53l30: Add missing regmap use_single config
Date: Tue, 11 May 2021 19:21:33 +0100
Message-Id: <162075713911.17925.15118980424314147257.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511175718.15416-1-ckeepax@opensource.cirrus.com>
References: <20210511175718.15416-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>, james.schulman@cirrus.com,
 david.rhodes@cirrus.com
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

On Tue, 11 May 2021 18:57:14 +0100, Charles Keepax wrote:
> This device requires single register transactions, this will
> definely cause problems with the new device ID parsing which
> uses regmap_bulk_read but might also show up in the cache sync
> sometimes. Add the missing flags to the regmap_config.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs53l30: Add missing regmap use_single config
      (no commit info)
[2/5] ASoC: cs42l73: Add missing regmap use_single config
      (no commit info)
[3/5] ASoC: cs35l34: Add missing regmap use_single config
      (no commit info)
[4/5] ASoC: cs35l32: Add missing regmap use_single config
      (no commit info)
[5/5] ASoC: cs42l52: Minor tidy up of error paths
      commit: 4ac9b48adf4d561d0e33419d548278f205dd70b5

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
