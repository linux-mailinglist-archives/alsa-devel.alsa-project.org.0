Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E2A604C36
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 17:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812E3AD84;
	Wed, 19 Oct 2022 17:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812E3AD84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666194721;
	bh=oMxztditmQbZR7+DrctklPnyl2cHfutQghmyLJRjwCQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JUvKA0VwapkZRZnaT+AjeNL8V9fWDzW9+tms6WtylvR2n4fOuje7Lpb5BrqQzlgIE
	 f2vd0Kulf/HLYvTT3o3mjZevgVuKTCD8FrARWcRBU/hTIwBb+TfYR+KzV5ePXFeubp
	 sXObtOnRhgZ1DXqlqZTCBXa5QYPdRw+MX7V2QNtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48274F80552;
	Wed, 19 Oct 2022 17:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE415F80549; Wed, 19 Oct 2022 17:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3556CF804F1
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 17:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3556CF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="juhzztDP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 171CCCE22C9;
 Wed, 19 Oct 2022 15:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFBAC433D6;
 Wed, 19 Oct 2022 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666194623;
 bh=oMxztditmQbZR7+DrctklPnyl2cHfutQghmyLJRjwCQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=juhzztDPhSvnkTsGVI0KuTg9czWwFcxaBCk6Be6q69WSasQQcNsKWND43EUif1OQh
 I0CjGRRGUysZP9Kzc80OOse3wvOM/oQ0H1d0PwCXmdal7C6QGgeM5Xq6jEXUSZDBlh
 k+KDVlNm9FQH/EPllNLLKvd/2eA00fCnG3Q5J61fZHxjhEHMqAQKW0KgBgKqIjx/Ui
 2RCgmUsCtDkLelZOXJZzWHM9uk1RjVi2u0cWbiLMjG9gG9xDg4hNjppPDhaVflRFs2
 pnTimfgXPMnWEAZSeQcpusoWTWxgV/rCEIOqtH9mZPNcs93PXNEDLSwpdIj6qErC6e
 O87zSXsWkx3Xg==
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220921090750.3833256-1-venkataprasad.potturu@amd.com>
References: <20220921090750.3833256-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add setbias level for rt5682s codec in
 machine driver
Message-Id: <166619462028.884966.16711536183815156169.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 16:50:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com
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

On Wed, 21 Sep 2022 14:37:44 +0530, Venkata Prasad Potturu wrote:
> Add set_bais_level function for rt5682s codec to enable bclk and lrclk
> before codec widgets power on and disable bclk and lrclk after widgets
> power down, to avoid pop noise
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Add setbias level for rt5682s codec in machine driver
      commit: 9e693e81745f03845788ef409f03a39e92f8dd48

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
