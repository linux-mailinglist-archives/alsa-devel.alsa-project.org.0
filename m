Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02F4F2974
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C484C1775;
	Tue,  5 Apr 2022 11:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C484C1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151167;
	bh=ZGgcCi5etsj/pvdNymelG0J+xQ3fmCGazR103cY2n40=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afhE4ah5eHd/HIZOquKYVSnv2+c6uyAstAEsm/gJd9EROq8v3wSQyj1NNdPT7Ek86
	 yomiKX2voAiGpABMGhcoOQaoQjnEI3NhSwLJdkVJvFPwZzIYy/A5PrWXXGuPo1ey5J
	 5pkmJQnHZe5VSSeeTlCJkhgF60iozoXmVuPcT8Do=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB58DF80482;
	Tue,  5 Apr 2022 11:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95032F8016E; Tue,  5 Apr 2022 11:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0037BF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0037BF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bmWpDMVc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EB07616AE;
 Tue,  5 Apr 2022 09:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE27C385AA;
 Tue,  5 Apr 2022 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151063;
 bh=ZGgcCi5etsj/pvdNymelG0J+xQ3fmCGazR103cY2n40=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bmWpDMVcHwGSCkAb/6swRdsLKzarBvMsR6i9BVfhCHLHduWvSaZv+WMdmYukSvxQN
 Gk201GEFtba2J/pONgtfNY9Xdhvi8Y+VzFV1hhctltfQ/F6/wsXo8PnS6pEyqVITm5
 R2HpQVKamxUMRGn362NSS9PzFj5V9pCRezq5FR3ZmweB+mvRyuREnlJvPrxVt5m6u8
 2hVNkIv57E23W8MGcG+934xb8huAUHfj7R1IQNlZVPuEAQaeOsh1IzBKoS+aRpvVRi
 l44Mk0shevncEXQ4eEH2aGsMxEwsZJSE8GYm8LhP+a9QIixz79A0v1hO34CxoethBf
 /zUyV8iMqWryg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, alsa-devel@alsa-project.org
In-Reply-To: <20220322154826.19400-1-tiwai@suse.de>
References: <20220322154826.19400-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: intel: atom: Remove superfluous
 flush_scheduled_work()
Message-Id: <164915106170.276574.15836716587431543651.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: penguin-kernel@I-love.SAKURA.ne.jp, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com
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

On Tue, 22 Mar 2022 16:48:26 +0100, Takashi Iwai wrote:
> It seems that flush_scheduled_work() is called without any real
> purpose at sst_context_cleanup() (the driver doesn't put works on the
> global queue at all).  As the flush_schedule_work() function is going
> to be abolished in near future, let's drop it now.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: atom: Remove superfluous flush_scheduled_work()
      commit: 290186e14c3bbef07a6c68e689f26bf076259ee4

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
