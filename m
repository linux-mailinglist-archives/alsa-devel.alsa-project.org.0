Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859664F9892
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 16:49:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22C831933;
	Fri,  8 Apr 2022 16:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22C831933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649429355;
	bh=uFnBK08Qb+sRg8CpeU7lutMdHslM9UrQV5P3vlPmCTo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sJ9O9Kvssu7kEb5rcBHSQnhfKZkGEHOaDt0zHSfZm8T6vQHUXOPJnYYRI3YI4XTPM
	 rPmR3fqRDy2ZKXVhoIALLPy949bsvTQQPia3APui1KPCsHtTtGUDecO8uYFUSjS07e
	 Wr4UhLJwByanc5R5BDV2J5Ra0KPFP4fD7o5Q3J5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B04DF8051D;
	Fri,  8 Apr 2022 16:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 405DAF8051C; Fri,  8 Apr 2022 16:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 122E0F8051A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 16:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122E0F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SR14bS9X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BBFF61E80;
 Fri,  8 Apr 2022 14:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83655C385A3;
 Fri,  8 Apr 2022 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649429236;
 bh=uFnBK08Qb+sRg8CpeU7lutMdHslM9UrQV5P3vlPmCTo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SR14bS9XZdZlWBPdwJk2dhc0y7mJ3szTSdJQBHqgk7Dzg2tKGWt7uvap5xdqLKfbW
 vUrsxRBZge/RaZlppUwlKeylWmzUoBV1vw7+vjMR4jZucZNy/qCvaLK8vpYgpKjoUU
 Xf3KkLTFwji71kNfzl2Eirl4xanWmsxRmMZAjhFm75lB43/+w8u+hZ91Z4f6vYhkvK
 k4xsG7An4L/Ot7YhrlvX7wjJyq/GOEndRnvUspEO36JGWOzRFsUg1hcBqrCvQ5ROwK
 lPnFop0aQZQfP+FnltShJ05o8Eq5Oa29RoJYPd+KZI+hTWJUGTvFsDu4cTKeuTSptd
 YerGw4ef56s1Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, cgel.zte@gmail.com
In-Reply-To: <20220408100309.2495462-1-lv.ruyi@zte.com.cn>
References: <20220408100309.2495462-1-lv.ruyi@zte.com.cn>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Make sure of_device_id table are
 NULL terminated
Message-Id: <164942923326.1424253.13615107780674647897.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 15:47:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, zealci@zte.com.cn,
 linux-kernel@vger.kernel.org, tiwai@suse.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, lv.ruyi@zte.com.cn,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Fri, 8 Apr 2022 10:03:09 +0000, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> Fix the following coccicheck review:
> ./sound/soc/mediatek/mt8195/mt8195-mt6359.c:1657:1-2:
> mt8195_mt6359_dt_match is not NULL terminated at line 1657
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Make sure of_device_id table are NULL terminated
      commit: a2c11c5b68f49b36be9ad4a60165bfbeca5cbb1d

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
