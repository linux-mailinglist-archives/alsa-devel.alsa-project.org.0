Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27768664370
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 15:41:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF6694FD;
	Tue, 10 Jan 2023 15:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF6694FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673361668;
	bh=g2uxEgDDC/isOJ69EhF/95eancI2BHdqdcwczqCKl7E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wulbuteg2UgiomkVJk8Tsiw7GjOA9vM9r+toREOpi0kd2DzBlQCtTYz/H+MdHn/5O
	 Zy7Jd3ZHloSSS5DqtMdExXtSw+5peDePGuMILkxbWxOW7syjQabQSAXNLLk47hoNB1
	 mB/XN1ak73b5j15qQ9m9OxOZHtoZ+N5+Mp1W3W2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7449DF8019B;
	Tue, 10 Jan 2023 15:40:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB2E1F804C1; Tue, 10 Jan 2023 15:40:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46ED7F8026A
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 15:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46ED7F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MdB8qq89
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D83CB8167C;
 Tue, 10 Jan 2023 14:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3689FC433D2;
 Tue, 10 Jan 2023 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673361606;
 bh=g2uxEgDDC/isOJ69EhF/95eancI2BHdqdcwczqCKl7E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MdB8qq89/QXB4jwSj+YyuQFkvdV63vixxiOc2s+BNlvP5+gfSADfBKXG7OE4VuAhL
 K4x5Dc2xWgajn8CV+sSQPW4AvgtmydPmODMMkE+O4Ox+48oq53TSpRntHSR047jgyt
 imKPxXQmRzUwRMxlIWsXtzU4kLM9gNF92gBk4tNGGcVcjaNyHz1AZx1CXi9fikisPj
 GKPeq9tuLlTMVC9Teq7hj41312JWm0iFRCvpsn37PsTcRfy6a82IwgmszyTEw0V6K6
 dlGAZL5I19EU2ODDza14vtupe3WJzYZfYDD/o17khOyH3jCw3hNt6ZHJ5+UFXfzlmr
 lcaTwihDcukXQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20230106-asoc-fsl-err-log-v1-1-49d845c99434@kernel.org>
References: <20230106-asoc-fsl-err-log-v1-1-49d845c99434@kernel.org>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Log error code when we fail to
 register
Message-Id: <167336160487.737822.4519603531969093245.b4-ty@kernel.org>
Date: Tue, 10 Jan 2023 14:40:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 06 Jan 2023 23:13:37 +0000, Mark Brown wrote:
> The chances are that any error we see here will be EPROBE_DEFER but let's
> actually tell the user so they know.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Log error code when we fail to register
      commit: 1a77d59e7e3917e311e91ff2908ef23c3250bec0

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
