Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3A50E733
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:26:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 119511811;
	Mon, 25 Apr 2022 19:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 119511811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907578;
	bh=UYeLk4eFqLkaYMknBOIlAl5C6wWequqNThJQkWUVbRs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snuHw/Ooz6M2qUk3D+WSzeNd/O6vuYH6yB7R0Ob1STdk5QaXo6HvTp3XIBQrAmnqi
	 v3gk9GhxzdiyzNy39elD+XmuiCLJFVA7EBJve60WplRMu8sLBE0IX/Af8n5zHCVGHh
	 vpPMJ71BGaqNOqSM6WGwkjy1e5FhMtgwHTiIaKpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78CC6F80511;
	Mon, 25 Apr 2022 19:24:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C106F804F1; Mon, 25 Apr 2022 19:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 754D6F8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 754D6F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K3/sW0BY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6AD761588;
 Mon, 25 Apr 2022 17:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3953C385A9;
 Mon, 25 Apr 2022 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907455;
 bh=UYeLk4eFqLkaYMknBOIlAl5C6wWequqNThJQkWUVbRs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=K3/sW0BYOT+EPsoPyW71Vl4OtX8MamBhCgTSRWFIpE9TC2uYVxWjeWDWlfZ6P2n3v
 oNBmoNIZVmX+Lnl3diZcYpwuftv5a4au4uhUcd1cfayoJswzvyuS+n9drdgyOB0rEp
 8CZU/HV5H/8Q+I2hjFEClSCpVKTpLzdqbdlgdoQdBOJ7mIdj6Gl6Pbty88pPuDNOSq
 i5fLHAoJcIaRGQRDzAHVYnCOvLCDJEscnjP3PyZ/3AJc1usBYFmVRMMUcC/ElUvnqQ
 pOpaDssmAZBcUxYm9IQooCBnRiUTfhw7SF2BHdVcFqpqiGFOjHsN0G8MBeX/Nz/QPy
 2UosfSoz7no5w==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220420030402.2575755-1-chi.minghao@zte.com.cn>
References: <20220420030402.2575755-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: fsl_asrc: using pm_runtime_resume_and_get to
 simplify the code
Message-Id: <165090745244.583823.17649634383855678993.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 zealci@zte.com.cn, lgirdwood@gmail.com, chi.minghao@zte.com.cn,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
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

On Wed, 20 Apr 2022 03:04:02 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: using pm_runtime_resume_and_get to simplify the code
      commit: d05040741afef6eb5d4366de7d5b62f700958787

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
