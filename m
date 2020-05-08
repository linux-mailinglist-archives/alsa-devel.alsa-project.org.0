Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE51CB5A9
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 19:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3352C10E;
	Fri,  8 May 2020 19:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3352C10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588958225;
	bh=viZ00MJBuhmJgek0Ad3pRgcBZsku7sJ2EeZwQzRCpSc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlYuouX22t4OQmyWC4TjvWZv1m4aq5wv0luxZTDhpbLsiGz6VKeaWHrFP0IFm+3Hh
	 VieMVzqkAIbSuLokOGSqhDRNX6jzxXaa6TFCFtEOtZaz2EaZ3J0h7YSWNEsikKhOrU
	 2vlGLyIjKPTmzlR+0+wYtFIBbi/JjE1vFAaUmqmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA91F802A7;
	Fri,  8 May 2020 19:13:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA1D3F8029A; Fri,  8 May 2020 19:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AEB6F80291
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 19:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AEB6F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F3Ub/89+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B837206D3;
 Fri,  8 May 2020 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588958023;
 bh=viZ00MJBuhmJgek0Ad3pRgcBZsku7sJ2EeZwQzRCpSc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=F3Ub/89+cKxKWO717WhnufWx6pw+S4t1dF9CxzRAJ4T8KS/a0ZWNQisZaWcqEqmUt
 GNXnz7eyaX50EAcigCS88qUAS0vqEjycabo/DLGKLS8iZN6kkrtGfciu+jE2BYTCgK
 MObxugh7aD/1q9x0lZbdKWMnBDXYGWpuuq402GzY=
Date: Fri, 08 May 2020 18:13:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Johannes Krude <johannes@krude.de>, alsa-devel@alsa-project.org
In-Reply-To: <20191120202334.GA4579@phlox.h.transitiv.net>
References: <20191120202334.GA4579@phlox.h.transitiv.net>
Subject: Re: [PATCH] sound/soc: only first codec is master in multicodec setup
Message-Id: <158895800278.30774.7135029343990319515.b4-ty@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
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

On Wed, 20 Nov 2019 21:23:34 +0100, Johannes Krude wrote:
> When using multiple codecs, at most one codec should generate the master
> clock. All codecs except the first are therefore configured for slave
> mode. Before this patch all codecs in a multicodec setup had to be 
> slaves. This is needed when e.g., connecting multiple sound hats for 
> simultaneous playback to the raspberry pi I2S output and one of the 
> sound hats generates the I2S clocks 
> (https://github.com/raspberrypi/linux/pull/3337).
> 
> [...]

Applied to

   local tree regulator/for-5.7

Thanks!

[1/1] sound/soc: only first codec is master in multicodec setup
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
