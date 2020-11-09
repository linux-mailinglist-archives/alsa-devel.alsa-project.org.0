Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B42AC56F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 20:50:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94772169C;
	Mon,  9 Nov 2020 20:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94772169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604951422;
	bh=D88LKGcSlBOJ39RYigSgZ5B3rCrHED6og8uInQvXrQk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAu2QZlI1PNYyY5NbL51nlzBSCfez+Nz8DpZLoLySZDI1FtqWtQvTegiOGpr23elw
	 Vl6Dm5uah6YZmdy+TDkBcz284WbEpHxMkcjjzaH3DUkAKD1NUsKp1BYTcxtuXsZzdD
	 kUyHmTWeGF8vBoP/2m2irHrHpsi/cPd96wEm2JWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 711ECF804BC;
	Mon,  9 Nov 2020 20:48:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70591F802C4; Mon,  9 Nov 2020 20:48:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F677F8022B
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 20:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F677F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0i02/85k"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C32A206E3;
 Mon,  9 Nov 2020 19:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604951282;
 bh=D88LKGcSlBOJ39RYigSgZ5B3rCrHED6og8uInQvXrQk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0i02/85kzCh2xRgOSVHmLk2nRQgwdguc9IulaPSxcugbK8epCuNLJeNIJ8TvkpBUc
 C6SE9sMT0Gd0YNuyNCZTVANiCXKWMHMavqofdGh61YjO5my/79fldCx7fZBm30bo7N
 w1AhJB5R7IXz2cdi4Ez2JJIe/vEDxdZi9PdsEr9Q=
Date: Mon, 09 Nov 2020 19:47:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, lgirdwood@gmail.com
In-Reply-To: <20201106072551.689-1-peter.ujfalusi@ti.com>
References: <20201106072551.689-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH 0/4] ASoC: ti: davinci-mcasp: Handle incomplete DT node
 gracefully
Message-Id: <160495125732.49154.9087262437678828222.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nm@ti.com, tony@atomide.com, alsa-devel@alsa-project.org,
 tomi.valkeinen@ti.com
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

On Fri, 6 Nov 2020 09:25:47 +0200, Peter Ujfalusi wrote:
> The series is inspired by the effort to standardize TI's arm64 dtsi files to keep
> all nodes in 'okay' state and let the board dts files disable not needed
> peripherals (and not properly configured):
> https://lore.kernel.org/lkml/20201104224356.18040-1-nm@ti.com/
> 
> In the unlikely (or likely?) event when the dts misses to disable the McASP node
> which is not configured we currenly and luckily just manage to not crash as we
> had fixup code in place for legacy pdata boots.
> This however prints out a message which does not really help to identify the
> issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: ti: davinci-mcasp: Use platform_get_irq_byname_optional
      commit: 372c4bd11de1793667e11d19c29fffc80495eeca
[2/4] ASoC: ti: davinci-mcasp: Remove legacy dma_request parsing
      commit: db8793a39b293d5a8983e1713a70a76cb039c2fe
[3/4] ASoC: ti: davinci-mcasp: Simplify the configuration parameter handling
      commit: 1125d925990b8d8166c45396c9281e2a705c97f8
[4/4] ASoC: ti: davinci-mcasp: Handle missing required DT properties
      commit: 1b4fb70e5b28a477478417a7958e0228460ffe68

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
