Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B365FDC8F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 16:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 705305C87;
	Thu, 13 Oct 2022 16:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 705305C87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665672317;
	bh=W42GQL7pv6vkfuXrmEpVAq3AR2/GElzKCFsDEllv7hw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOC/gL/fCmaiinXWrKCvQCgAxfTjFOMh2X42xRe4a3drrbwBQm2F8HJp+XS/4mQ9S
	 D8JuHMQiQMqF8FOU8FRCzsGMj1oQc8rOV/2gPsWtn7ea8gJfBT7+H5fJT2ZOcWlV7A
	 i3uC2oBZYEr9g9FtiYrd0Kf+uYK6fXroJ1VA4NeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E0BF80549;
	Thu, 13 Oct 2022 16:44:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 371ABF80132; Thu, 13 Oct 2022 16:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DAACF80132
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAACF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VBwVTJg8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 459F9B81CFF;
 Thu, 13 Oct 2022 14:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A2FC4347C;
 Thu, 13 Oct 2022 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665672237;
 bh=W42GQL7pv6vkfuXrmEpVAq3AR2/GElzKCFsDEllv7hw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VBwVTJg8V8KRjFmxiaea9sVRkh9q7btGgFYwMlYXa7uPXic/tTLd3/1VEHODXFCLL
 xzmYa1bVrqQvTtEdyT4Pgf158+v3nC7K9qY1kxT+3uGoqo0ZnTsslumVWCV79xcnjW
 YwLdm25K37rU8x0u9yxX1b7Y/EJZh485GZib0sgAvWvC3LcmwTOo5nB72KwCMLVks0
 RgqEJ1+baTlOEvUWAJ2/kLOp8T1ioy78/TN+URypmryHLgfxs9iyTE93d37TU6sNNK
 fhzDXhAG80V8AlL1/s3FwLDbJhbPs8f3G5+3IrUVa2e76sD++zb+QOBwa2vFjJ3hEH
 HChSmQLQo9iJg==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20221012030102.4042-1-derek.fang@realtek.com>
References: <20221012030102.4042-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt1019: Fix the TDM settings
Message-Id: <166567223440.170727.7359474076645163341.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 15:43:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, albertchen@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

On Wed, 12 Oct 2022 11:01:02 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Complete the missing and correct the TDM settings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1019: Fix the TDM settings
      commit: f2635d45a750182c6d5de15e2d6b059e0c302d7e

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
