Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDEA63C742
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 19:36:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379D8169E;
	Tue, 29 Nov 2022 19:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379D8169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669747008;
	bh=QO1gCsipqZnV0T36my9UdAFxcW4eBFoMWOl576tJ1os=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FYQwwL2NoXEDL84pjsV7k4zttrvh8uhNlg2S1H0HQ6TnTk1bmZsqXhvoflAiunBG2
	 H48JLpCpp7J8voY67yjANdbuLBzfkjXfCRk76QnCFgHtB5YbW/KdHkn3gMzpr4Z7Ql
	 TArRVd/91qkt8lhG+t01VVMP0jaFRybnYr1quBjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC82BF801F5;
	Tue, 29 Nov 2022 19:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCBD7F801F7; Tue, 29 Nov 2022 19:35:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06738F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 19:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06738F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pBvFP8vz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D224A61881;
 Tue, 29 Nov 2022 18:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32175C433D6;
 Tue, 29 Nov 2022 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669746945;
 bh=QO1gCsipqZnV0T36my9UdAFxcW4eBFoMWOl576tJ1os=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pBvFP8vzD8O5HCx1eZ1dIm6kdQ8J0mr7m1ehxfJFpDBDayx2FsS1LPWbEoK/44Tlx
 /8J7/vxtUcNccPpwmUXuBWmXx1lHTHaRnwwLF1Eg5i+bJ0Migr3oaPKWVhS4bsHYvH
 rZv09zapmpyfpiL2Slm9wS3anq5clGKIJ6LBaJWcLB+JZptWXP24Sm5IQTZ1k5K6xf
 FylOWzPJ+iCW2OBmu/GHYLLMHyMVtdQbr5YJfvVlGA0fcF7w+qF1xK9viOw9y4VW+R
 a/Y/fd+xeFGCHFrW36WVrE33PZ3bZ/CjZtCRw12KG2d0klxuNym5raJkfC8v+jNIPO
 sZScjOxmC2arw==
From: Mark Brown <broonie@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com
In-Reply-To: <20220928160402.126140-1-zhangqilong3@huawei.com>
References: <20220928160402.126140-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] ASoC: pcm512x: Fix PM disable depth imbalance in
 pcm512x_probe
Message-Id: <166974694391.357421.10973764368539860232.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 18:35:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org
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

On Thu, 29 Sep 2022 00:04:02 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by going to
> err_pm instead of err_clk.
> 
> Fixes:f086ba9d5389c ("ASoC: pcm512x: Support mastering BCLK/LRCLK using the PLL")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm512x: Fix PM disable depth imbalance in pcm512x_probe
      commit: 97b801be6f8e53676b9f2b105f54e35c745c1b22

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
