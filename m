Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B764429D26B
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 22:24:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217DE15F9;
	Wed, 28 Oct 2020 22:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217DE15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603920243;
	bh=EJQkK2roS7SBBH2NKUDZvqNoOZjq9icIXI82V7St+Ek=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HOtvb0h0ixNlJO6jJFEnleWTGtf893yov9fIhXORfqrNW3qRQW0osABPKvvCCgLaH
	 B1qTBtMXJNqf/ha2L0+tyPjvpH8iwde52RWXHbpeVPZQCy7lh26J2XltZhswrs2xYK
	 j6RnnDFNxFvdDw7Or55RJsaLiQdwvtVXWs0YLz48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31328F80272;
	Wed, 28 Oct 2020 22:22:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB202F80249; Wed, 28 Oct 2020 22:22:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4071F80249
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 22:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4071F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hAIIgT2W"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87D5E2483A;
 Wed, 28 Oct 2020 21:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603920136;
 bh=EJQkK2roS7SBBH2NKUDZvqNoOZjq9icIXI82V7St+Ek=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hAIIgT2Wg3fIK/UjRyToe65sfkAbD3F8y8ciTb/Jbf1g+pEowfs9DNO9/NdmvyM3J
 498HO574eeR1JUDsfJlS+kqvp+UxUhdUQ3ZT5200M64xSSQpU9z9wyqqZo19krc087
 nSz91PVOCuz/EbTEgvhbPSLNxI2PX7/Tq7vHSook=
Date: Wed, 28 Oct 2020 21:22:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201028142001.22431-1-srinivas.kandagatla@linaro.org>
References: <20201028142001.22431-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sm8250: Fix array out of bounds access
Message-Id: <160392012411.40829.8539672124304600568.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Colin Ian King <colin.king@canonical.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Wed, 28 Oct 2020 14:20:01 +0000, Srinivas Kandagatla wrote:
> Static analysis Coverity had detected a potential array out-of-bounds
> write issue due to the fact that MAX AFE port Id was set to 16 instead
> of using AFE_PORT_MAX macro.
> 
> Fix this by properly using AFE_PORT_MAX macro.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: Fix array out of bounds access
      commit: 7c91d02068c342918003606bf378b259f37b31ba

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
