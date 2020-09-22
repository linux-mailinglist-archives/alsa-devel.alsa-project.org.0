Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E15732744FA
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 17:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4871D1726;
	Tue, 22 Sep 2020 17:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4871D1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600787269;
	bh=sZHWS+6GrMG2nrT6339PzN+FS8DpEX0pnvRec/GoSb4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzqV8Rc82ebDi4z7zJXpAAVkdsfb97zVlPKSv9dU2FxWAZRJlOCCzxaShhRN7ijw8
	 q+tiZzW/43Su9qGvGzgSmDui/GkjguACzeOEcUHcf0uezYi522UKvOnoDm3zrQwYw5
	 9GYawsTI1qY2dzbLhBAeZBGTYOewqQULB0Z9qPYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EA4AF80229;
	Tue, 22 Sep 2020 17:06:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6798CF80234; Tue, 22 Sep 2020 17:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18CAF800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 17:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18CAF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T20PUZSU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49678206DC;
 Tue, 22 Sep 2020 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600787153;
 bh=sZHWS+6GrMG2nrT6339PzN+FS8DpEX0pnvRec/GoSb4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=T20PUZSUtegwd4/D25gfbdUw7stZkNb0CFWzN9QmHR2eRqhcQDeeXiLagdSwQ5N2l
 SmJYpVWoXlR1wqcPnvrHJhQCtHn//1O72gG1l+sDfhvWma0mChInvhYcmNNXhk8Ukq
 npLZ3qDfFZCVnpvJ4kHtBa/37QMaM7HgPwfordtY=
Date: Tue, 22 Sep 2020 16:05:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
In-Reply-To: <20200917141803.92889-1-fazilyildiran@gmail.com>
References: <20200917141803.92889-1-fazilyildiran@gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: fix kconfig dependency warning for
 SND_SOC_CROS_EC_CODEC
Message-Id: <160078710095.52882.3222732916592587624.b4-ty@kernel.org>
Cc: paul@pgazz.com, alsa-devel@alsa-project.org, jeho@cs.utexas.edu,
 linux-kernel@vger.kernel.org, ardb@kernel.org
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

On Thu, 17 Sep 2020 17:18:04 +0300, Necip Fazil Yildiran wrote:
> When SND_SOC_CROS_EC_CODEC is enabled and CRYPTO is disabled, it results
> in the following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for CRYPTO_LIB_SHA256
>   Depends on [n]: CRYPTO [=n]
>   Selected by [y]:
>   - SND_SOC_CROS_EC_CODEC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && CROS_EC [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cros_ec_codec: fix kconfig dependency warning for SND_SOC_CROS_EC_CODEC
      commit: 50b18e4a2608e3897f3787eaa7dfa869b40d9923

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
