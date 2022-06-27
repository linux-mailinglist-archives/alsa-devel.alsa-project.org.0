Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556955BBF3
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7E2E16B6;
	Mon, 27 Jun 2022 22:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7E2E16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656361242;
	bh=C2qjYmuV60Qu5KvUhBVP6x+pgLCW3knDlTonYpWpK/w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LR0TBmzTf95oRWD4oe1lQlS1TSm1E0xU6WGPMU52OEnnAeIZrxWD2JMi3YE6GmLbK
	 cgBgAtBz56DWhTfz+ZqBBn+pe9FbB7rLqXCA2p2woG8YDQD206XqS0jhdbW3qLkozW
	 vUH+KaLuh843qainK3Sr5caNbEbEge4K6njewPtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C914F804FB;
	Mon, 27 Jun 2022 22:19:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E045F8028B; Mon, 27 Jun 2022 22:19:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E696AF80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E696AF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XZ/rc208"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7876FB81ACC;
 Mon, 27 Jun 2022 20:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B42C3411D;
 Mon, 27 Jun 2022 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656361148;
 bh=C2qjYmuV60Qu5KvUhBVP6x+pgLCW3knDlTonYpWpK/w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XZ/rc208PUx8G6v/nKveA/8TDJ6aUaLxeJ8dASXThTOfmjAN7OEwDh8AmtvPeL97P
 5qp68vNt2wDPCbEkBjE9h4SWBZC3PI8oGP9sLn60PvTKY1IepPJl2xQiRZe3xLnfDf
 nSYjKA5qZGXQ85zu2X1gr/BHdHhIyAVq0PnBG0qMPCg1wUMb3MHYjjnpxY/9P3sbEW
 pyWT3PVy1nbhqAMcfH1u+bPywqguFOjD/KytFJxZwmZMt4g4nz58O44zY+Hv1oDG5o
 Ss8QCmtJQapvR83PQkhTWUMMJ0ZiDn8jIWYORGeU66mK0cZcRkJ7WlnwevvBwORgnk
 t2EGcjGNBNukQ==
From: Mark Brown <broonie@kernel.org>
To: jarkko.nikula@bitmer.com, tiwai@suse.com, perex@perex.cz,
 daowens01@gmail.com, peter.ujfalusi@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20220616202645.1645972-1-dowens@precisionplanting.com>
References: <20220616202645.1645972-1-dowens@precisionplanting.com>
Subject: Re: [PATCH v3] ASoC: ti: omap-mcbsp: duplicate sysfs error
Message-Id: <165636114606.3997797.14770643051127333961.b4-ty@kernel.org>
Date: Mon, 27 Jun 2022 21:19:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: dowens@precisionplanting.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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

On Thu, 16 Jun 2022 15:26:45 -0500, David Owens wrote:
> Convert to managed versions of sysfs and clk allocation to simplify
> unbinding and error handling in probe.  Managed sysfs node
> creation specifically addresses the following error seen the second time
> probe is attempted after sdma_pcm_platform_register() previously requested
> probe deferral:
> 
> sysfs: cannot create duplicate filename '/devices/platform/68000000.ocp/49022000.mcbsp/max_tx_thres'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: omap-mcbsp: duplicate sysfs error
      commit: 6d31e225742a1955db8a0c6f6f52beb748a2895e

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
