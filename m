Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0522B7AC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:26:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 214741680;
	Thu, 23 Jul 2020 22:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 214741680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595535979;
	bh=78hQl5KUO1Gn565TFq0EiLyGKeKiV2pAj9ARRZGNUsc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+K8ugVH+8sdtol8xKeE41Tezv9KM4QKa1z4ufj+s40ZLOZdKUuG1ijZd4Ok3VMyF
	 e1Je9zqEWUCFuSzUtXQMJX1yMnyjEVjyMz0hP/3+ZnIGUTdqb9KB8aFtFPLblisuAa
	 i+zZr/4B0r7BScygeyCFhry4rZAp0BK29sVMEWpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 505F2F80304;
	Thu, 23 Jul 2020 22:20:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 240A6F80305; Thu, 23 Jul 2020 22:20:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94E17F802FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E17F802FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eI2iZ+bP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6AA8206E3;
 Thu, 23 Jul 2020 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535632;
 bh=78hQl5KUO1Gn565TFq0EiLyGKeKiV2pAj9ARRZGNUsc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eI2iZ+bPR+hc2ODo9wOxYYYsE0Ws4LOmX782GrTwbRNURH/BlgQH2XosT/UsKuv0B
 w157IJNk+BatYXuvS9IXbSTxdpOZ6ybS6gGgAN+ovd7+I28FiHVg+fd//5if+dcos1
 nCaJfJRwvPto+DNW3OCjv57iOFGY7tp3vzmagj7U=
Date: Thu, 23 Jul 2020 21:20:17 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, nicoleotsuka@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, festevam@gmail.com, Xiubo.Lee@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, timur@kernel.org
In-Reply-To: <1595476808-28927-1-git-send-email-shengjiu.wang@nxp.com>
References: <1595476808-28927-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: add IRQF_SHARED for devm_request_irq
Message-Id: <159553557414.41908.17763476955607586934.b4-ty@kernel.org>
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

On Thu, 23 Jul 2020 12:00:08 +0800, Shengjiu Wang wrote:
> ESAI interfaces may share same interrupt line with EDMA on
> some platforms (e.g. i.MX8QXP, i.MX8QM).
> Add IRQF_SHARED flag to allow sharing the irq among several
> devices

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_esai: add IRQF_SHARED for devm_request_irq
      commit: c8361757a712dff4db49e18b736635e367b0f473

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
