Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF4346D8D9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 17:48:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B622431;
	Wed,  8 Dec 2021 17:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B622431
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638982130;
	bh=o0Xfq88/Qvxm4jCum7Hmjy3/tv/PnI2RqmMSIV8SAy8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q7DqJXY99jrkhMvBxjjydcrl0uoEbRXMzNW5IBt2KV1l2igP4F3eOkpu5LT62kLrV
	 0V4bVLXFB+r7fSxurRPysFRQwlpw5QfKos6C1JZEK2SERYREOCfMsLNbFpvUN6H0EP
	 fHZg3u23Ut3zwEFpdMPE+Fn9NRDLSZFQegr25PJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D63FF80506;
	Wed,  8 Dec 2021 17:46:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B7DF80506; Wed,  8 Dec 2021 17:46:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C0A3F804E5
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 17:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C0A3F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mQL35443"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3341B821C7;
 Wed,  8 Dec 2021 16:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EBBC341C7;
 Wed,  8 Dec 2021 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638982008;
 bh=o0Xfq88/Qvxm4jCum7Hmjy3/tv/PnI2RqmMSIV8SAy8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mQL35443PKoKfRjTpT9offBSzLuTaw5uvMxGVXEQw+isubpB+iyXqvL1emcPc90dc
 Zw/nNi1v5Q35duy6z+jJiXDnNbNw6K8IAr0kNSXgWwCluhhM8I0kzc9g5v36DBgQD9
 G8UM0aSVIhokqn2sVq9KIz/BIVikYft1mpkwcI8nqL8Jo8Cz+ihk3YU+zHWp9hxHCJ
 RuOVzVJFTaY4/MG3ZXKFbzZibFgiepvOWGtqKPNM2RieXqU+J1drpKPIovFra4az4K
 rBZ6dspqmUrhNxn3hNa2/wd0Q6T5NBM+oZEQBITghW3GDh6dvqO3Y3HgYKIpSnfVaS
 WOPc75is6YK4A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20211208101654.28925-1-shumingf@realtek.com>
References: <20211208101654.28925-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: rt5682s: add AMIC delay time
 property
Message-Id: <163898200634.3880815.3850635215001645317.b4-ty@kernel.org>
Date: Wed, 08 Dec 2021 16:46:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 Trevor.Wu@mediatek.com, flove@realtek.com
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

On Wed, 8 Dec 2021 18:16:54 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Add the AMIC delay time to control how much delay time (ms) to unmute the stereo1 ADC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: rt5682s: add AMIC delay time property
      commit: 6c7ac18cd82108a0cd58e21b9814503e631dbb5d

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
