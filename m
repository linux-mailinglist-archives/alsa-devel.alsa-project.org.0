Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1215FDB42
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 15:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D560E4AFD;
	Thu, 13 Oct 2022 15:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D560E4AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665668591;
	bh=NeVcqoAgGh1lg3PWWmMZ5nDkI8q9uYsVwlypSbyohVA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KNqV4+UFQLuw9XiO1a1szFmjH90EA6Q7eayOTp9EkQmhXoEeKZKP/1+NepbpmpwP0
	 rdKXnDwlyeChXQj8DRBGga4r/xlhzFEKGlHm5fi6I9HLjdOcWmd5ClvWT+MkD96zMn
	 EjBnoN9cAMVWJM2XAwyd3xogkmO9+9X2PLVRC9G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6A1F80508;
	Thu, 13 Oct 2022 15:41:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D3F6F80269; Thu, 13 Oct 2022 15:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F270F80132
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 15:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F270F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZAkLT160"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87F62B81E52;
 Thu, 13 Oct 2022 13:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3F7C4347C;
 Thu, 13 Oct 2022 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665668506;
 bh=NeVcqoAgGh1lg3PWWmMZ5nDkI8q9uYsVwlypSbyohVA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZAkLT160sc4//zyppU6zd2zshwlfCZyAsD0INn1oK7/r3PqcmHUe9n1R9DVmqMcny
 zfd9b01povtaLzdxRnjTWlME7MwZXRdAeX6z8hyCe0M91VhHulDUkb190jDr5wH8Dq
 FctGAl6QXToNHE+vkj5xadDt6mKlQI4D5WVWlT+aIu6Lcl8gYNuvTkasNeE4DtCrWd
 JwnypBYqzN6KNp2xBobmOs/VQcYVzWDf8Vp4pY7nDUHoyzZhst39oBA0yULIrFQKCA
 Sf9Xl10Y5iUjT56U8skhjIquzreyLpc/9UMElTQ3m456IZQqHa6HGoRRs6uCyikHVS
 8FXO5D0DGivDg==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.wolfsonmicro.com, matthias.bgg@gmail.com, tiwai@suse.com,
 Zhang Qilong <zhangqilong3@huawei.com>, 
 jeff_chang@richtek.com, angelogioacchino.delregno@collabora.com,
 lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20221008140522.134912-1-zhangqilong3@huawei.com>
References: <20221008140522.134912-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] ASoC: mt6660: Keep the pm_runtime enables before
 component stuff in mt6660_i2c_probe
Message-Id: <166566850374.143340.3115691779887204250.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 14:41:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org
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

On Sat, 8 Oct 2022 22:05:22 +0800, Zhang Qilong wrote:
> It would be better to keep the pm_runtime enables before the
> IRQ and component stuff. Both of those could start triggering
> PM runtime events.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
      commit: c4ab29b0f3a6f1e167c5a627f7cd036c1d2b7d65

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
