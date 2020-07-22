Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E187228D59
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 03:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55F71682;
	Wed, 22 Jul 2020 03:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55F71682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595379673;
	bh=riS8bMs892HGteqg2+0T2hRaNKMd6XV6TpU0/EGhfIg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaBF0NQS3/XLvyz4wfgwmjN+q6vcYmSQqzcrCGV8Bu3t+zlj7zSNKs5gqWaAdKlxW
	 C/wj4O0G1h/Uwjy7a1ACbkjPg1C+EkecAE3MfX8VEUR+Nx/7Y3DCIXgAYAvIEHvMOU
	 unSY0GmpL8Wuiu41SOeinL15FL18Gi/42ZG/ObKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA30F802E0;
	Wed, 22 Jul 2020 02:57:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5868FF802E2; Wed, 22 Jul 2020 02:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5F3DF802C4
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5F3DF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dzOHzGLH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9088208E4;
 Wed, 22 Jul 2020 00:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595379437;
 bh=riS8bMs892HGteqg2+0T2hRaNKMd6XV6TpU0/EGhfIg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dzOHzGLHSeUIJy5drw5i19eUV72jDThgW8NRwVEUiqXR2i43WuJBnmQ6hNdyKb0z8
 9v4FVqeko9e7+2ESsir/SsIDktaD9vWMQEyFtcXsMWvp3J93SZC1dgNDVw9mDRmEEj
 ILWzTuDF5YeLjfbuJkbLzlSnh2wLW7tLO/iHnD1Y=
Date: Wed, 22 Jul 2020 01:57:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20200608174658.1315325-1-thierry.reding@gmail.com>
References: <20200608174658.1315325-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: sound: sgtl5000: Convert to json-schema
Message-Id: <159537940423.49432.17540517625529265309.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
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

On Mon, 8 Jun 2020 19:46:58 +0200, Thierry Reding wrote:
> Convert the Freescale SGTL5000 device tree bindings from free-form text
> format to json-schema.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sgtl5000: Convert to json-schema
      commit: c3061bc73fd7073e6ea9a780a99bbb15587f8abe

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
