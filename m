Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC4147E6D5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 18:19:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5335118D0;
	Thu, 23 Dec 2021 18:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5335118D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640279972;
	bh=Sk7H+nhdFE764xNL6pqceUv9O6Os6KdUst6P2k4cENc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CpC8IQT93HzteBzbJkEsejRtMdIrNgLkjQwKQ1dQSQxA2jgJ5QM7NjDT9W0rOrYoW
	 ZBtOAJ1+H9f+PT/gUQlCstFFPahw+91nQqrbHtkvMr2/x2c5bzqU9KdyBiM/gSf9IH
	 a9TLHby38hB/XP7oVTAUpVhB/fxM7DI9q8h/ssXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC6A9F80084;
	Thu, 23 Dec 2021 18:17:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B95A3F804E6; Thu, 23 Dec 2021 18:17:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29737F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 18:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29737F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uYm3lRLk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ED5961EFE;
 Thu, 23 Dec 2021 17:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0E7C36AE5;
 Thu, 23 Dec 2021 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640279858;
 bh=Sk7H+nhdFE764xNL6pqceUv9O6Os6KdUst6P2k4cENc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uYm3lRLk2w/GkwN2NTWKady0B4TYkZeuXh2Ca5r4dUfvvdL8xI1kTMht9MyyjU6aT
 4S2uYNg175qVLqdfA5PoDj08+cLMDhURFyovMknc72spMJcBC4GpOzV2bNN1rgevCl
 m5Fezpow35iK0MHHjH0oI3uEEnEU1pTgrjQLwy28q81PCmrltEhRl0E5BsQjk9eti8
 VVJzzoUmmbTsDv/p0WXwplBhXrfLo1zONlFBFxQ8kmKwILrr6BAgncdV7ejj5T/611
 sNzQI+vPFVVNtxka+RNewFZ23v4sqRg/r2gHrusn6ZgSbq24R6ZEXbjA/NLy0yypjB
 1QTsnQVcL1noA==
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20211223122434.39378-1-alexander.stein@mailbox.org>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
Subject: Re: (subset) [PATCH 0/3] More amlogic sound-name-prefix DT fixes
Message-Id: <164027985607.1292681.12642503043684144882.b4-ty@kernel.org>
Date: Thu, 23 Dec 2021 17:17:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org
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

On Thu, 23 Dec 2021 13:24:31 +0100, Alexander Stein wrote:
> Following up [1] here are more fix for missing sound-name-prefix properties in
> the arch/arm64/boot/dts/amlogic/ subtree.
> 
> [1] https://www.spinics.net/lists/devicetree/msg466125.html
> 
> Alexander Stein (3):
>   dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix
>     property
>   ASoC: dt-bindings: spdif-dit: add missing sound-name-prefix property
>   ASoC: dt-bindings: aiu: spdif-dit: add missing sound-name-prefix
>     property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: dt-bindings: spdif-dit: add missing sound-name-prefix property
      commit: c6cef35bf723ef0152258d15179c725c5f8cbeba
[3/3] ASoC: dt-bindings: aiu: spdif-dit: add missing sound-name-prefix property
      commit: 559ec82aa47d7c9ce39f3c769f1ba5f3237f6869

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
