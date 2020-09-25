Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 134542792A3
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9991943;
	Fri, 25 Sep 2020 22:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9991943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066938;
	bh=QSevX1flL8R5A+fqYXDssSpKP80IyBfwUR79zCY1bHU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u+/IDHpRqwaZHH4PElHB9/RLGz0q4SaoPovsLQBWwPavAUiI/4a5T1jNmUKf/atNX
	 sTqb7bl2ggEwIrTlnPm8ZGWGLLZbGgoRlDrOd5Ss9LQvWMLsxxLAUrPHOnQX9lbRtI
	 9RGiaYbu0BDVCwcc4lDcvuwhWR6iG2xapZMbgf28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA7B6F80306;
	Fri, 25 Sep 2020 22:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2740F802F9; Fri, 25 Sep 2020 22:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 690C7F802EB
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 690C7F802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="urarfz8P"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5C7421D42;
 Fri, 25 Sep 2020 20:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066576;
 bh=QSevX1flL8R5A+fqYXDssSpKP80IyBfwUR79zCY1bHU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=urarfz8PuyF+GFxvTcJYGPU6CbYQ8EubrmxlSDW9MN3ATbi+2rDYcNTjBeE48/ruw
 crrsbsCFqMnUqSLnZQTb0cnZqgn/dcxsCC/GFG10dW40H5dXz45Mdu4W9z6BfPF+ok
 YKR556UJKd7h3q8k7lWpnMA3X9s5YP8+egymxK/I=
Date: Fri, 25 Sep 2020 21:42:01 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, linux-arm-kernel@lists.infradead.org,
 festevam@gmail.com, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 nicoleotsuka@gmail.com, shawnguo@kernel.org, perex@perex.cz, linux-imx@nxp.com,
 s.hauer@pengutronix.de, Xu Wang <vulab@iscas.ac.cn>, shengjiu.wang@gmail.com,
 alsa-devel@alsa-project.org, kernel@pengutronix.de, timur@kernel.org
In-Reply-To: <20200921015918.24157-1-vulab@iscas.ac.cn>
References: <20200921015918.24157-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] fsl: imx-audmix : Use devm_kcalloc() instead of
 devm_kzalloc()
Message-Id: <160106647647.2866.12055149870190769449.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org
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

On Mon, 21 Sep 2020 01:59:18 +0000, Xu Wang wrote:
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "devm_kcalloc".

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-audmix: Use devm_kcalloc() instead of devm_kzalloc()
      commit: f95cc5c18c15a425c3dceec48df6b4e27a202dda

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
