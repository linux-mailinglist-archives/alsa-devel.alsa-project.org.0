Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD05635F02
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 14:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43CF8163B;
	Wed, 23 Nov 2022 14:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43CF8163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669209155;
	bh=Pmimk6P6al4IzF3uS/yD4sA/hKmZqcQ3viaO89EoanQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H6PnoY9mZAGDAywuhRwtDOX0U1TU7EjstJ+bxNuxpwCkRfp49l99IIw1EzO80iOAi
	 xQYnsuymEljoMrXsiM7ZjaSvXqjzQOpyjHBFlpuw5pEDLtGbPHFRy9oZRAfgwdbhNs
	 oANe8jsfZRDsjSMig0FIEFKgWTdQDLBPYRD8eVxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C31DEF80115;
	Wed, 23 Nov 2022 14:11:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06254F8025D; Wed, 23 Nov 2022 14:11:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE81FF800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 14:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE81FF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZrUI/t5m"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2A81B81FDE;
 Wed, 23 Nov 2022 13:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F3FC433D6;
 Wed, 23 Nov 2022 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669209090;
 bh=Pmimk6P6al4IzF3uS/yD4sA/hKmZqcQ3viaO89EoanQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZrUI/t5mVj7g/IwF947jY7DEP46UTmCGwZm1yrfeZj8sJpE/0UsmGkHz1oufRXJJT
 VOoyod3pAfIt0tEPQ6mCEfbNTvdMImsLCgXoOXxN93nxZ3VQ9vEkBWU8/oaCgNo4+W
 k4KDT+73KAx2I71qfX7xPMecXaE1GHnkrllRaM2dbqwB0souBB3OxSpKGHeHAVB5U+
 WxRLzI4nKX6m4gcIwcosJQ5DhFHeZpPB7hyiwa3yGPbQIxb+Y+y430e8cbuxJ/Sysh
 Zd+HS13Y8PBubLg5c1lya7GG/ae0Y6SAnCLQmUcQjytq+uokYlVfTowmBOtEXYDroi
 iuz03vebUOwIg==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, linus.walleij@linaro.org,
 maz@kernel.org, tglx@linutronix.de, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, robh+dt@kernel.org
In-Reply-To: <20221109165331.29332-1-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 00/12] Add support for the Cirrus Logic CS48L32
 audio codecs
Message-Id: <166920908765.125457.5735851922084989509.b4-ty@kernel.org>
Date: Wed, 23 Nov 2022 13:11:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
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

On Wed, 9 Nov 2022 16:53:19 +0000, Richard Fitzgerald wrote:
> The CS48L32 is a high-performance low-power audio DSP for smartphones
> and other portable audio devices. It has various digital audio I/O,
> a programmable Halo Core DSP, fixed-function audio processors,
> configurable GPIO and microphone bias regulators.
> 
> The CS48L31 and CS48L33 were derivatives of the CS48L32.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[10/12] ASoC: wm_adsp: Allow client to hook into pre_run callback
        commit: fe07130870c8540bc0cddbaa8d4521ecdba6b560

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
