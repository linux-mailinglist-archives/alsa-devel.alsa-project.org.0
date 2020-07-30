Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63900233B6D
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C51031677;
	Fri, 31 Jul 2020 00:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C51031677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148558;
	bh=YH9+ICW/3hXRtSm64orqu19oSdQuuWKrMUBevTvaXkE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIeNXNX8LcE7S2EV26Z5YQR1VZfTdiTUVIpoaFePOq+ixsjJLTHRrQaTBKGqURHn7
	 IEc8bQVmwmk3g4IYHvb80oz6hEm21bhFOIBMGDv2HW1vxertUEb7Uo5XSlGhBVECpt
	 txsoVZuCrPuQZwwic8U2rpZJ8SfFrnxDBtwHGPDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24992F80308;
	Fri, 31 Jul 2020 00:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 928BEF80306; Fri, 31 Jul 2020 00:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81251F8021C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81251F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F+0Ydd/F"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D06520829;
 Thu, 30 Jul 2020 22:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148137;
 bh=YH9+ICW/3hXRtSm64orqu19oSdQuuWKrMUBevTvaXkE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=F+0Ydd/Fgutk16gkyGj2gECpPoXbH4sg6UlFq9catgilRzwkQfA9O7G1w0Kz6j0y8
 QrQ7gUCMeXm93qiW40R2H2WfV9+NT2PCbOx4GxEs87RdYK42aWEzohK3Bf2m4JuD5e
 DShs/tsbsdcOdvIawMZxl9W+REGJfO6Zjj0yspI8=
Date: Thu, 30 Jul 2020 23:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-rdma@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 0/7] drop unnecessary list_empty
Message-Id: <159614804536.1473.16638498246526574558.b4-ty@kernel.org>
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

On Sun, 26 Jul 2020 12:58:25 +0200, Julia Lawall wrote:
> The various list iterators are able to handle an empty list.
> The only effect of avoiding the loop is not initializing some
> index variables.
> Drop list_empty tests in cases where these variables are not
> used.
> 
> The semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: drop unnecessary list_empty
      commit: a383308e50244a28fe927b9c1acbe0a963bf186b

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
