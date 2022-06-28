Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67C55C037
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 12:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCB3163F;
	Tue, 28 Jun 2022 12:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCB3163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656412389;
	bh=mcPN7dG6WI58otz+ZI9udh4R7IN2jCr0gOc/tSKYAfw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtD/XrNbju+MPqSKnnBbZn8836fSPGlOFK2DS3P4jJ3UgzFrVJl+hbGfy5rXon+2s
	 R+/KbDxMFZmaDqdhQluep6eBigU2HX0wFVdf2o2mSbIan18mYnQdpbGtu1R1kMjGtf
	 PF20QX6PYTiqossWD0Wpn+PlBuDsEA39Ju6PWRYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 919F8F80536;
	Tue, 28 Jun 2022 12:31:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D81F8049E; Tue, 28 Jun 2022 12:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 952C3F80167
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 12:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 952C3F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X9rFU3VY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 270796191C;
 Tue, 28 Jun 2022 10:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A675C341CB;
 Tue, 28 Jun 2022 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656412281;
 bh=mcPN7dG6WI58otz+ZI9udh4R7IN2jCr0gOc/tSKYAfw=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=X9rFU3VYYeqd5S9pHXRgih16ZwUvg9n3UCsF7+lA+qStGBB0Nr4Xh6d4E4wyL7W5c
 lzIE5hFJyUT0s9q082VKMHFs9SsW/kmEkA40+pEm8EAiUaGU4UYfaqBDIhx9PgZ8N6
 +Ry9kg8tCFosPQl3YNFjYpzhGIRYHcOtST1pa+LAEWkdErQaGrb6zxWpw/KC8GFPAC
 T7DDBYKumCB2eetgonh+XLIege1CZI2+lO59i3PO15MBErszPQLbJ+1OPWnEr/K38N
 wLiA5nTw5cEcnXwcyqIF9MXMOcXN8bCwUa5Lo9TU4y1qmyuDn5LQ/AJV7M3D5tzOTM
 xe5WzBJkoEgtQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 krzysztof.kozlowski@linaro.org, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, s.nawrocki@samsung.com,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220627141900.470469-1-krzysztof.kozlowski@linaro.org>
References: <20220627141900.470469-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: h1940_uda1380: include proepr GPIO
 consumer header
Message-Id: <165641227908.254424.11381365474563768174.b4-ty@kernel.org>
Date: Tue, 28 Jun 2022 11:31:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 27 Jun 2022 16:19:00 +0200, Krzysztof Kozlowski wrote:
> h1940_uda1380 uses gpiod*/GPIOD* so it should include GPIO consumer
> header.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: h1940_uda1380: include proepr GPIO consumer header
      commit: bd10b0dafdcf0ec1677cad70101e1f97b9e28f2e

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
