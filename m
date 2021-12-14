Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8D474373
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 14:27:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662C31AF1;
	Tue, 14 Dec 2021 14:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662C31AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639488438;
	bh=C1uJktXTIMr7sT2GFRLDAAL2YnFQrtakUNIPjjHazus=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdu7XWfwQ0JmFaguc/HqqXjavLI2KtoY4mRS3UvSCG+HudGallDEhxLdH2SMwOBGf
	 0Rn0GF3vHGSrz6EzXj4SSKRu+0/1yObvrTpn5mEd6/Jlp8uS31WgBnccii4Sgr9RAs
	 x7fql4j1oNAY5lnjn5zExVZ8KMhvr4xNLt43U1t4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27EC5F80510;
	Tue, 14 Dec 2021 14:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 385B7F80271; Tue, 14 Dec 2021 14:25:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9735F8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 14:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9735F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pBayhBOI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA233614E3;
 Tue, 14 Dec 2021 13:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10650C34605;
 Tue, 14 Dec 2021 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639488327;
 bh=C1uJktXTIMr7sT2GFRLDAAL2YnFQrtakUNIPjjHazus=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pBayhBOI91scR4orTqi8lR9XS5GYX9pBvTo9urfTJAaIPYF3hkmUt2d5VVrmSz9X0
 V4lJohLQjkfw7Zj0jlYRtotFOahoesgLNJhiozUm6YZJMJdv41mUV7gWqSs0Jy9oTK
 jTDv3J2C4csu8xxImqbkCadkQAql+EXOBV+rvvUV+P+LN4NYz4xEpJ0SVCLjWzJ0si
 Y7oh4ILao5VkdyVj+XYV1ISd6c3qjjb02nyWYi2T/jnvKSZ3BVguGAW7Hp+/l6slwu
 qipepkPv3OTBCL/+aQZRFH50jukBBotgzjsAQJJBO0uJ67zsTIu3+KSdHYXENYJG3i
 kKLbZqFUS4gog==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20211209200830.145005-1-daniel.baluta@oss.nxp.com>
References: <20211209200830.145005-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2] ASoC: SOF: Remove pm_runtime_put_autosuspend() for SOF
 OF device
Message-Id: <163948832478.2865729.8112402279770630792.b4-ty@kernel.org>
Date: Tue, 14 Dec 2021 13:25:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-mediatek@lists.infradead.org,
 Paul Olaru <paul.olaru@oss.nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

On Thu, 9 Dec 2021 22:08:30 +0200, Daniel Baluta wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> In SOF OF device, pm_runtime_put_autosuspend() is not
> matching any pm_runtime_get_sync().
> 
> This is imbalanced for PM runtime.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Remove pm_runtime_put_autosuspend() for SOF OF device
      commit: 475b17b4a875ef31246c6a038ee60d5ca4982ea5

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
