Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D799200A24
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 15:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC4D1682;
	Fri, 19 Jun 2020 15:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC4D1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592573413;
	bh=lu3A8dgfddBJOdAh48Om/2tmW8Fdzk+zN7yT4K1Hta0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYedjrP/ROOtvDz2CpBi8oT3xMk9lLs0atfJuBaEFjHDOcBKf19+iroZ3rqpyXP+3
	 +M3cpkjp3eJNJqeeKbYjusRIld3DR6Hdst5u1eO6Cw3exeWQkQ8VLT5ryIEcCnU4J2
	 hNUASYmFgH4QuGyX72lNNoa5LIAZqozljXdZGYdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22AC5F8028A;
	Fri, 19 Jun 2020 15:27:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99AA2F8028A; Fri, 19 Jun 2020 15:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C102F8025F
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 15:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C102F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mAoOQ5S2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26668207FC;
 Fri, 19 Jun 2020 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592573262;
 bh=lu3A8dgfddBJOdAh48Om/2tmW8Fdzk+zN7yT4K1Hta0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mAoOQ5S2dI0eG+mUTj3k4LYTRCwGkCXuZ0Ed8a8oUVDhRLNiRi1OnOcQhLIEW1R14
 sdRWoDgPRRmdNx43+xX9LgOEzxcHGhUWB0f+rxdQakxaejVm1eGPFQ6fwtnP9yXLyG
 jKCk8ZQjC/AqhcH0w6Hje01KzFQyEuxeWfAvcjZQ=
Date: Fri, 19 Jun 2020 14:27:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, festevam@gmail.com,
 Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 perex@perex.cz, tiwai@suse.com
In-Reply-To: <579c0d71e976f34f23f40daa9f1aa06c4baca2f1.1592552389.git.shengjiu.wang@nxp.com>
References: <579c0d71e976f34f23f40daa9f1aa06c4baca2f1.1592552389.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_spdif: Add pm runtime function
Message-Id: <159257325526.5735.7482602069730796749.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Fri, 19 Jun 2020 15:54:33 +0800, Shengjiu Wang wrote:
> Add pm runtime support and move clock handling there.
> Close the clocks at suspend to reduce the power consumption.
> 
> fsl_spdif_suspend is replaced by pm_runtime_force_suspend.
> fsl_spdif_resume is replaced by pm_runtime_force_resume.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add pm runtime function
      commit: 9cb2b3796e083169b368a7add19faec1750ad998

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
