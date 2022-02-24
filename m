Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9234C3973
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 00:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 850FB1B09;
	Fri, 25 Feb 2022 00:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 850FB1B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645743713;
	bh=jZ9MIH4Jj1yAJ+Ufl6G/v1GBLlI6z3+dKXp/E88UvZY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dcV1muD3oFPUzHtW3B4HkHrpf/HZZcZVykBGSzowvoX7BMrdjFq7azCtns59luGju
	 gTVDB0yW6TrD107dLQxF7reC2uqWpazGxaT2kDdEykDexBB8aWl1LZGqMIGTc8BzmO
	 T1pFQ6MstLI2FtS3sFgfqtvMXwUlYS2fUpuoxlzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC18FF8053B;
	Thu, 24 Feb 2022 23:59:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6F71F8053B; Thu, 24 Feb 2022 23:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F9B7F80538
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 23:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9B7F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mih3qMi/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2A59B829ED;
 Thu, 24 Feb 2022 22:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76A6C340F2;
 Thu, 24 Feb 2022 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645743554;
 bh=jZ9MIH4Jj1yAJ+Ufl6G/v1GBLlI6z3+dKXp/E88UvZY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mih3qMi/6e0mFHyxxKpmndoHefLCYVT3wxjEMk5hQLX3Yrr1qUw3FXVMN9gDJIev2
 sDKXr7htUn8Hg4mAVXHobOkCHtx+Tzu2PrMxnRC2/LDDTgdcjwAmDMDfshScKKwYMU
 dkijRbSeMn9D/72TkrKOgeLmYBBqqTuUIh72Ecwjcbc5fL7IzjVAfVwGU0Cy724cCT
 bBBJ6jTWb9z6rT0L0RjuS6rXIDfaxxciuOOAb+hRggfMAE7FZcfOBJl+hpYzWXuiiH
 OZrEC9wuWHD3wodFuw3S/xEey9Jq6fKI7e7sGeVDeRHxGJs7wWYiBMeFEyWMK1v++v
 kt4wjnLZiDNzw==
From: Mark Brown <broonie@kernel.org>
To: ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220224172324.17976-1-peter.ujfalusi@linux.intel.com>
References: <20220224172324.17976-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Declare sof_compress_ops in sof-priv.h
Message-Id: <164574355267.4011497.5057222949756744436.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 22:59:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

On Thu, 24 Feb 2022 19:23:24 +0200, Peter Ujfalusi wrote:
> Fix the following sparse error:
> sound/soc/sof/compress.c:310:25: error: symbol 'sof_compressed_ops' was not declared. Should it be static?
> 
> Do not enable set the pd->compress_ops yet as it is not a valid assumption
> that real compress support really works when CONFIG_SND_SOC_SOF_COMPRESS
> is set as the HDA Probes support also selects it, but compressed audio
> is not supported (yet) on Intel platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Declare sof_compress_ops in sof-priv.h
      commit: 299905881ebd3b7ee5e3525356529c3d0ceb0688

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
