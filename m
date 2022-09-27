Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05C5ECC63
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 20:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F454850;
	Tue, 27 Sep 2022 20:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F454850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664304582;
	bh=DdiNQ6ubKx38dAQV29xM1ugIafN4xWawCAnztFVD/6c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGXaaG4DX+Rp2Lm3D3Sid9sAfum964L5W0dvoQa+sXLxGxADfrOg7mkdFA3X0rldY
	 i7umLkNXpRWaMk1kpRzzKUYW4Nu0w/wvK7jaYGlmVcdQOOedgo0oCENDXz6EflyTfQ
	 ebnWwugbeV9YBE21C/BMYHHCYYJf8j04dI14Pf1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91659F80166;
	Tue, 27 Sep 2022 20:48:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C9DFF8025E; Tue, 27 Sep 2022 20:48:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF472F80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 20:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF472F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gjT4Xcce"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8184A61A01;
 Tue, 27 Sep 2022 18:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEFBC433C1;
 Tue, 27 Sep 2022 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664304518;
 bh=DdiNQ6ubKx38dAQV29xM1ugIafN4xWawCAnztFVD/6c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gjT4XcceYv7AuT1HcN8uPqr079VEGiZhNM+h8ESBi0D9G6LetQhKR2E+CBjvJAxus
 FiADT+J7pbBms5Kr2ColQhjbpwtdWbDIZcoS+P/8Izk+/bPqviikf91G16r2OmO/LW
 F4W1OJWgL15MNmMvj2Laf5ga7yYljhTuUs9bd3iW5S/vn5VrGMCiTglOFijmTcnLgL
 U8smJwZTMyp7KPJWMFTN3hMh+ouWHiedAUwTN7vr5aveZMtoRz3dI3TyxsMXGYhrfT
 M6NekLtUHGE5kGLcpBmENYtw6gIfNVrll/fg0hqjXQZxioWLLogTukx2PjCqPJqtZR
 RhLs601fconGQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, arnaud.pouliquen@foss.st.com,
 lgirdwood@gmail.com, mcoquelin.stm32@gmail.com, 
 Zhang Qilong <zhangqilong3@huawei.com>, olivier.moysan@foss.st.com
In-Reply-To: <20220927142640.64647-1-zhangqilong3@huawei.com>
References: <20220927142640.64647-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH v3 -next] ASoC: stm: Fix PM disable depth imbalance in
 stm32_i2s_probe
Message-Id: <166430451684.508490.13326782067739160405.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 19:48:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
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

On Tue, 27 Sep 2022 22:26:40 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of stm32_i2s_probe.
> 
> Fixes:32a956a1fadf ("ASoC: stm32: i2s: add pm_runtime support")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm: Fix PM disable depth imbalance in stm32_i2s_probe
      commit: 93618e5e05a3ce4aa6750268c5025bdb4cb7dc6e

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
