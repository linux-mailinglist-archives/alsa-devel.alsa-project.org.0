Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E44C53FC4F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E951A92;
	Tue,  7 Jun 2022 12:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E951A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599109;
	bh=uLX4133muz5PglvgH9B09s1QXURjw03qmxV23eQhqGo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UK6CAh1/028IkBa/nRDZ6jAgkciBQIZ48Y9c0sMV3chSEFrWVeB16SrqlBHcZBA02
	 DMIaikLoPslG+/+D3A1xRvTeGlmge5jQW/mQHip9nJVJ6EmASIM28RmskscG+udW0u
	 MsT+7kLDs09el20LnMKOY74JmJNv6+r91E5uJk54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D15F8F805CA;
	Tue,  7 Jun 2022 12:46:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C20F805C0; Tue,  7 Jun 2022 12:46:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B741EF805BA
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B741EF805BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uH7hDrr0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EB1B6154F;
 Tue,  7 Jun 2022 10:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0F3C341C0;
 Tue,  7 Jun 2022 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598760;
 bh=uLX4133muz5PglvgH9B09s1QXURjw03qmxV23eQhqGo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uH7hDrr0I4teWmdakpRZ8QNMyazcpVJ4N+n2WFBcnus5NZGzew5lnHTL6SXTueuev
 Nbtm1T13S6KsBny37mO354YUMRQJVeSFwH5+FYePDGjv6u68Gh6jd6lS0YDMCInEMP
 juygQtIOq08+Ibd0bHr8DDzlP8OWBeH8O9nxM18e0fPHJTCYGeAgs7LMT3MR3/PtbF
 POA/n6R/WfzRhMmrPpcoYwwPStp+Y+oD3Form7kgFZBz8bk6wi68rFsb1W8n/8Onfi
 xCFoeuYFNNHpyFlRzZw0m6s8HBaQYDXNG79JSgKT79ZUg4spFevD2E5Ct1oK6GulcY
 sF1k4gCiZ9vHA==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220602101833.3481641-1-broonie@kernel.org>
References: <20220602101833.3481641-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Remove unneeded delay.h inclusion
Message-Id: <165459875961.301808.8554088728218360001.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 2 Jun 2022 12:18:33 +0200, Mark Brown wrote:
> The ops code does not do any sleeps or delays so does not need delay.h.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Remove unneeded delay.h inclusion
      commit: fef94875a72bc63ba60d2e12421d7f49d31523f0

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
