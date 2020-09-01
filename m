Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBC259197
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 16:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1A917B9;
	Tue,  1 Sep 2020 16:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1A917B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598972003;
	bh=ZXbib2oV5w0YlPIh/haYE+UDUt9otm2EZ8ObPawlcOA=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UNO5eArNXDXNXHsg1gpivNlgVFaM9apWU2S8Hj5LA5fytq5+qC9ql1WSfLsU+2jMF
	 1PnNkEg5qfMzIBD7BpWSuG5BUZeS6xpaepjcPeQzU9naW2J0CHwD8nOiZaNNcnB6Nc
	 4Dn39Ztubfg17n/Ksu+G2JjXwSNa/cctr9j80lGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A1EAF802C4;
	Tue,  1 Sep 2020 16:50:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1825CF80278; Tue,  1 Sep 2020 16:50:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC851F8021D
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 16:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC851F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KZootyeL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8501D206EB;
 Tue,  1 Sep 2020 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598971845;
 bh=ZXbib2oV5w0YlPIh/haYE+UDUt9otm2EZ8ObPawlcOA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=KZootyeLyjib4y1qrCcS/xBceUm4FEua8DQgAHaJjhfgX7+u4D16kmrSqqBLGSh3D
 bXvX0dlfHef/j/SyplsIQ7kz5odClVmMG4A4FO32MhAVMV93T4XPS4awe9d1XoK0E3
 xGl01/tUrNUkhhuiPc+dXN/6wxzxOnBRZAlkG43M=
Date: Tue, 01 Sep 2020 15:50:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>, devicetree@vger.kernel.org
In-Reply-To: <20200830112633.6732-1-krzk@kernel.org>
References: <20200830112633.6732-1-krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
Message-Id: <159897179515.47719.6003518135515395142.b4-ty@kernel.org>
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

On Sun, 30 Aug 2020 13:26:32 +0200, Krzysztof Kozlowski wrote:
> The "sound-dai" property has cells therefore phandle-array should be
> used, even if it is just one phandle.  This fixes dtbs_check warnings
> like:
> 
>   arch/arm/boot/dts/exynos4412-trats2.dt.yaml: sound: cpu:sound-dai:0:1: missing phandle tag in 0
>   arch/arm/boot/dts/exynos4412-trats2.dt.yaml: sound: cpu:sound-dai:0: [158, 0] is too long

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: midas-audio: Correct parsing sound-dai phandles
      commit: 3e7ba1c0432ef9a792b9c77d36f78037626303b0
[2/2] ASoC: odroid: Use unevaluatedProperties
      commit: a57307ca6b661e16f9435a25f376ac277c3de697

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
