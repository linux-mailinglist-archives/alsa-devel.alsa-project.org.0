Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB450E725
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2E1E17CC;
	Mon, 25 Apr 2022 19:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2E1E17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907552;
	bh=s9MBnllajfacTuJ2LFd7tcHg09U6GQd9u2Gz1hjsecc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8qUKP4PSNzIdA2+5PN/YRX6VI+481m4vIcWkhcYky+SI1Renx3uF45ldnunvZg6Y
	 RWyzZeS6yrVqTe9VhFQ4bLnA0+GpENwLRfJEhZyRIW7VFZkOJpkAGVxRaT8fcd8P3h
	 LgxaR2Da6OX6SFlwqeKUlfWDaJtJTEjeC/+sW5/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1F10F804F1;
	Mon, 25 Apr 2022 19:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4776F800CB; Mon, 25 Apr 2022 19:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 586E7F80152
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 586E7F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qZ7F4TLr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31B716157A;
 Mon, 25 Apr 2022 17:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B87AC385AD;
 Mon, 25 Apr 2022 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907447;
 bh=s9MBnllajfacTuJ2LFd7tcHg09U6GQd9u2Gz1hjsecc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qZ7F4TLrdKnGBYfWTsWpQF3a4QoSZqUOdwclJrLRDj59B6EmQhRA7mWmRICZ+3na5
 fMIm9Y/HkZvPgUBg2Bm16Ggu5pb5SW2bWpINVryOGIeYMNpCWYGmCZHoYx6na/qBBv
 Vv6e2TKWUM6/jpWD0fTn3uo0DTO69NtUA4DFJYypYsbG3Nt6RtYNWGNefPLUuobwpb
 nSGJWRWOrh9mUQAfIiX6fgmTViFeZiCNUtap+urfjjoxEVprDDVyurPlNRThdc0Vxc
 dS59nyDGhnOOiUGexmY8z34fmQUvbMayjMMkAy4qQ04iUviRMhitoQmys+EBrnj9M8
 FyYmeNyYf8Mzw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220419110718.2574674-1-chi.minghao@zte.com.cn>
References: <20220419110718.2574674-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: img-spdif-in: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Message-Id: <165090744607.583823.4175599379103783503.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, zealci@zte.com.cn, chi.minghao@zte.com.cn,
 linux-kernel@vger.kernel.org
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

On Tue, 19 Apr 2022 11:07:18 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img-spdif-in: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: 6eaaf9bd9b4e3125779b292abd1c00b5baea67dc

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
