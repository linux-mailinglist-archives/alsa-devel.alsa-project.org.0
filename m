Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2842228D52
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 02:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39434167E;
	Wed, 22 Jul 2020 02:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39434167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595379527;
	bh=oIp8NKER4ssGNhyEtqI9MFmD3glq88VorUyW/2P2XK0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WanqLRyE6LpG6THq40emm7j6RQ6y/hj/BZHkc4q2etq4gsWmTdDjS4RZfqL5yCSuY
	 yVKUnwzik/CNGIuH0NO2YCG3kmU+kWccanZXdmsbXBH/3FMsTQMkmr9fyE0PUDd8b2
	 UgBWupPFYX/WInC70RVmVg/npqoqNjOkg0f0FX+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B32CF8024A;
	Wed, 22 Jul 2020 02:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0381F8024A; Wed, 22 Jul 2020 02:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2627FF80117
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2627FF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vmcZPhK/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BE07206E3;
 Wed, 22 Jul 2020 00:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595379417;
 bh=oIp8NKER4ssGNhyEtqI9MFmD3glq88VorUyW/2P2XK0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=vmcZPhK/xcJyGS+wVWbJRtb32pQVTCYgLS+yY3QzNYn/tvFAZvUypvwXEOF2E43G4
 nV/OamqlgkzLIijE3ME12HkyHq+Js000DCmyHKqb4JgSbKkxvXHh9TF3lEfV/0pyNg
 1cvlkWJqI+NOgu/fnyHv6Yj9UEP4rAFGruj31UZU=
Date: Wed, 22 Jul 2020 01:56:44 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, Dan Murphy <dmurphy@ti.com>,
 lgirdwood@gmail.com
In-Reply-To: <20200710145016.384-1-dmurphy@ti.com>
References: <20200710145016.384-1-dmurphy@ti.com>
Subject: Re: [PATCH for-next v2 1/2] ASoC: tas2770: Fix reset gpio property
 name
Message-Id: <159537940424.49432.4655713572634784064.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Fri, 10 Jul 2020 09:50:15 -0500, Dan Murphy wrote:
> Fix the reset property name when allocating the GPIO descriptor.
> The gpiod_get_optional appends either the -gpio or -gpios suffix to the
> name.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas2770: Fix reset gpio property name
      commit: 58b868f51d6e38146e44cb09fcd92b5fc35d83bc
[2/2] dt-bindings: tas2770: Convert tas2770 binding to yaml
      (no commit info)

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
