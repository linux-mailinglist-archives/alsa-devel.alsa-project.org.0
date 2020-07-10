Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D921B9BA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 17:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 818221679;
	Fri, 10 Jul 2020 17:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 818221679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594395796;
	bh=V0MxTffCGmaOnddHTfSCUdkOwgjWSlGLURFExxwvWa4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYLYC4n9x544l6jgHK5KjIf84WcSMcDLJQ036fu+v9wAQ9JgpLkFcBkmH6VmQDjJv
	 gPRVBJs5RBGPkfqxa8UMkhjE3dIKGDu2sfXBLiByzN3xz8Z8tE4tXsXnLNXsrbFR8Y
	 Lhl5c6Ch74+rlnR4sDqjggO3rEddZvbVSxgosglU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50AA3F802C4;
	Fri, 10 Jul 2020 17:40:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94261F802C4; Fri, 10 Jul 2020 17:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE93F80161
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 17:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE93F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dqsxumqg"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3047D2078B;
 Fri, 10 Jul 2020 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594395599;
 bh=V0MxTffCGmaOnddHTfSCUdkOwgjWSlGLURFExxwvWa4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DqsxumqgRIHMunsu1recsgEeyIYZ60a6TTOR2kIBx0AjtDK+mqMeeRWWug34Uwwll
 TaVCn0Lr4pknuDBBo1+XRnsMmERCLg9288IhTdISfrsyt/5DIk0M9e8+Begy4OB3Hu
 3YkbaQZphfB+fp1hSO8vi2YGo46gkISC8AkMYPuc=
Date: Fri, 10 Jul 2020 16:39:53 +0100
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 nicoleotsuka@gmail.com, tiwai@suse.com, Xiubo.Lee@gmail.com
In-Reply-To: <1594112066-31297-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594112066-31297-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_spdif: Clear the validity bit for TX
Message-Id: <159439557864.48910.15440396587948281544.b4-ty@kernel.org>
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

On Tue, 7 Jul 2020 16:54:24 +0800, Shengjiu Wang wrote:
> Clear the validity bit for TX
> Add kctl for configuring TX validity bit
> 
> Shengjiu Wang (2):
>   ASoC: fsl_spdif: Clear the validity bit for TX
>   ASoC: fsl_spdif: Add kctl for configuring TX validity bit
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_spdif: Clear the validity bit for TX
      commit: 055b082156704b85a059770359d6cdedfb24831d
[2/2] ASoC: fsl_spdif: Add kctl for configuring TX validity bit
      commit: aa3fce5cd454db551a4ea1656bab9c2bacd2d1f4

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
