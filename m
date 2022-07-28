Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC53583F2F
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 14:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF2E15E2;
	Thu, 28 Jul 2022 14:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF2E15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659012569;
	bh=oKG0k/HCujEOjDRj8n7oPM/49lyliRDHFtvxw2due3U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+potfQmxruwDUlMKR9m4tQPQki/GXwQk8Vx/Xi95bpbDmBwQdKbJPxsXQk4zlc27
	 ZNE/nO+zo1gX4eXNLalNViqgAjlX2l9vFHvlItVfaVGrxU8M7org4/ycJuFJxoDtlB
	 1aEJSqVQXO1EjKPOjmcsduZv66+o3/XcyP1NuDAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A18EDF80508;
	Thu, 28 Jul 2022 14:48:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0824FF804EC; Thu, 28 Jul 2022 14:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABCAAF800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 14:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABCAAF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fvlzfp7g"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2805161CDA;
 Thu, 28 Jul 2022 12:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B40C433C1;
 Thu, 28 Jul 2022 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659012501;
 bh=oKG0k/HCujEOjDRj8n7oPM/49lyliRDHFtvxw2due3U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fvlzfp7ghRMCmqTdOLLf2dA33B5w/JPPu+qcpHNBy7C6r3tIpxK2bbFmBhL9Ij8QM
 2xaSzjtvGqWM6WYwHygCYiM1GpbL0SbHlwIDPzp4bUiWnHwAHmxIBPO81JlcIKP2BI
 MzPHghVbW6WAj4XYbr9OqER6tCDRXZJvSCX+tWv1Ym56mqMfc0jAQatiyt5Hy0VWDh
 kEuog6oizp9fOcjPfi+Qaz6u6H6Bgk8CcN6IGgI0ruGujAlpCpJgQ/JPfcsP0XAVmq
 VVCSRlpc9ryeR2WAnQyPe5yrrAhpmW5V6gAWYrulFSlgJi2NlJLK0pR6TOu3T2ATJT
 gBjZyspmM8snw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20211006180810.GA913370@embeddedor>
References: <20211006180810.GA913370@embeddedor>
Subject: Re: [PATCH][next] ASoC: q6asm: use kcalloc() instead of kzalloc()
Message-Id: <165901249963.1738594.15790903946126347978.b4-ty@kernel.org>
Date: Thu, 28 Jul 2022 13:48:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Wed, 6 Oct 2021 13:08:10 -0500, Gustavo A. R. Silva wrote:
> Use 2-factor multiplication argument form kcalloc() instead
> of kzalloc().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6asm: use kcalloc() instead of kzalloc()
      commit: 40d060b8158e26438398bf1132925f666e3b6480

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
