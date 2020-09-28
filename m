Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C027B589
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E071872;
	Mon, 28 Sep 2020 21:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E071872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601322096;
	bh=66dVChS3Ww4kbexNYMsWn0gXMt3x46E4BzJS4iET2xM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHut50eBx0/KSeTl+yjsjLn65jxpZ/zDIRIVpPlcZmpvkRRLemNXxmLmvf/iklD6H
	 YakRd4fcaC9DOZpN/WjOLdsKWEAL5jBc82aLPj+E8KuRGWnvZYXVvFfEp5R/Ie4CTw
	 sf9HfgAK/fhY8MDG7pZxjOBeqZdimRK80HxayljY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B46F80303;
	Mon, 28 Sep 2020 21:36:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23B08F802FE; Mon, 28 Sep 2020 21:36:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EE11F802FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EE11F802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VD3gusU8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9520A2075F;
 Mon, 28 Sep 2020 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321775;
 bh=66dVChS3Ww4kbexNYMsWn0gXMt3x46E4BzJS4iET2xM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=VD3gusU8MDUjmYb/gw5skxAbPVKOMPhlDttT8+qVDWjoDpS+2LX85lWalNP0f2a9B
 7VvTDYiZrQVHQn3R+b1C981jA85W11F2cr1MqlFrqyupQRnzS0U4UYrD8NRwzJXlN8
 DuohqK8Pxph/IXsb42Un2BMjKSPq9jk7WAgjo+f8=
Date: Mon, 28 Sep 2020 20:35:18 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20200928053912.16664-1-oder_chiou@realtek.com>
References: <20200928053912.16664-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: Enable the power of "MICBIAS" and "Vref2"
 for the DMIC clock
Message-Id: <160132168198.55254.7460102564786932622.b4-ty@kernel.org>
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, cychiang@google.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Mon, 28 Sep 2020 13:39:12 +0800, Oder Chiou wrote:
> The power of "MICBIAS" and "Vref2" was needed while the DMIC clcok was from
> the PLL output.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Enable the power of "MICBIAS" and "Vref2" for the DMIC clock
      commit: 9fe0ec27557570e4b17735da6ce265bbe20691ed

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
