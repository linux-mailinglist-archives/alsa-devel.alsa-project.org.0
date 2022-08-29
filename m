Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3785A4CD0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 15:02:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135FC161F;
	Mon, 29 Aug 2022 15:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135FC161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661778152;
	bh=jTDytCuHvzFQa93P6bPX3Q1qKXGCU1D2dILZvqZbiYA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhkgtyKEbHUSFEiFHb8N+1i3mE65hbOONZTp4CuCySWb666ExkMYijo34xaUNNT8X
	 1iDKLmS2dNzDhQPwnozGci//xV3aUYjmz3TRlGEGmqidCWaARZBMxPlepPh1ttulwF
	 2SPJ7sCpmrrhfeVW0UoF0kugTDJ+Ni2E3rkCFw2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE83F8012A;
	Mon, 29 Aug 2022 15:01:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0604DF801F7; Mon, 29 Aug 2022 15:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5622BF80115
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 15:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5622BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hF4S/b9y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 893D0B80EF3;
 Mon, 29 Aug 2022 13:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D5FC433D6;
 Mon, 29 Aug 2022 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661778086;
 bh=jTDytCuHvzFQa93P6bPX3Q1qKXGCU1D2dILZvqZbiYA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hF4S/b9yV+2YFmd1VdFm2VKTCgXSTsCO3/CViG3vS0K1IofLZUXoodZBlGLfJF0+B
 T2kJe8qlw3gcVcXBAh67Uuu4Up9tfRuehW5XaOoh8uty+xxGHxOhOSmkjwqHvhAQfB
 Oo4YdqLa7+zIjUKqGXvTfVNzkvyAiu7R18EuFsMcvncfUTWnq+K28fHlnsA0CI/kQ1
 9AimWhk/rLQrO5CZCfnZPTATMm1E5cK7yrCLJWxbMy8QE1+hfqBjBkhjlVKiPyXf5i
 agE5llaz2Y3YTBue3OqGTJ1zNcrlhcImu3T5T1kafySLiZmyQzFG9KesWvZYDOrxGb
 NYV4SmxhsfmPg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com
In-Reply-To: <20220826064250.3302260-1-venkataprasad.potturu@amd.com>
References: <20220826064250.3302260-1-venkataprasad.potturu@amd.com>
Subject: Re: [RESEND v2] ASoC: amd: acp: Modify dai_id macros to be more
 generic
Message-Id: <166177808385.741330.2587705836145362860.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 14:01:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com, AjitKumar.Pandey@amd.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Basavaraj.Hiregoudar@amd.com, tiwai@suse.com, Vijendar.Mukunda@amd.com,
 Vsujithkumar.Reddy@amd.com
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

On Fri, 26 Aug 2022 12:12:45 +0530, Venkata Prasad Potturu wrote:
> Change dai_id macros to make I2S instances in order.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Modify dai_id macros to be more generic
      commit: 99a387c7818fe422fa96458f56bc74f05f263013

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
