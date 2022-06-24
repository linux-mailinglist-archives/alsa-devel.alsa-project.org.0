Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC33559BBB
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6336185B;
	Fri, 24 Jun 2022 16:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6336185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656081409;
	bh=t/Tf6J/AANuVldAvrbb1l1OA4Ss/PFndiFh59pDsU/o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/FCW6L4OJ7xVCeUnCPjcq2LuLrlHK1TGsQbBH56+6taFVXyTWwf2bsBHUpuCpgz4
	 4944AG/F0HxdOHucDKxA/EZfhFOFFkFJyiWK5xYjrDaoMfPTyMw4ktoIlmFMeXltx2
	 +dGWH6hu5mILu1HDbKWwBsYkPal3P968vLblaBL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2439F80165;
	Fri, 24 Jun 2022 16:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F334AF80165; Fri, 24 Jun 2022 16:35:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FADCF80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FADCF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RCGpbBTy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14703B82926;
 Fri, 24 Jun 2022 14:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B398BC34114;
 Fri, 24 Jun 2022 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656081342;
 bh=t/Tf6J/AANuVldAvrbb1l1OA4Ss/PFndiFh59pDsU/o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RCGpbBTyD76YoVkatmj8Squ9IMzjadZE+jZnOY9R11r52qjKSGEHg3EhHiy7okVTv
 mB07dyC5yirbzQFV2nl4vP78c2wisWp5jr0X1gvgbg2UlQg/ZCqLQI73y3BUGXlVrD
 liwNuSMaPPuDf35KEkHTQQi5qZyFXBYGf8NH37HFE7zJ5zgHzaBxum0WiZRqYqnIuZ
 t9JFLs4WcBR4o+zpDk0S1UhM9z4456uZdXAUAMpm+EnFG8L5A5vR7ntEpMkusdAQmH
 qHUFpXrD9QyFkrm71oerugNAUWq7asR0llnPjtOWgKlbdTx92usJZBKY5KEOVWY3gN
 924C5Mr5WDFmA==
From: Mark Brown <broonie@kernel.org>
To: james.schulman@cirrus.com, cristian.ciocaltea@collabora.com, tiwai@suse.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, perex@perex.cz
In-Reply-To: <20220621213819.262537-1-cristian.ciocaltea@collabora.com>
References: <20220621213819.262537-1-cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: cs35l41: Add support for CLSA3541 ACPI device ID
Message-Id: <165608133945.445804.16792879989339290449.b4-ty@kernel.org>
Date: Fri, 24 Jun 2022 15:35:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
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

On Wed, 22 Jun 2022 00:38:19 +0300, Cristian Ciocaltea wrote:
> Add support for the CLSA3541 ACPI device ID used on Valve's Steam Deck.
> The driver is fully compatible with the indicated hardware, hence no
> additional changes are required.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Add support for CLSA3541 ACPI device ID
      commit: 658e95953075ca781ef8712d0a3203e485888c7f

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
