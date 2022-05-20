Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022452EAA3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ACBA1758;
	Fri, 20 May 2022 13:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ACBA1758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653045641;
	bh=8fut9JzJYxNLGDgXqNqvjdjqVOf5PzcnA1tSy99j53M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PD63UgIUZLz7o8cs8Zp60DLID12Adp0oyx0MxkqtHDjnY9mTnWn2+qGMR1iF/k+2U
	 HJ6+/h3wpzUtR8NkwvCBW53dh2Zqc23NB2ebXSiWJlmnV67COm5jLPj/ECQmxrvNIG
	 2mFsMDatUOvcRWE4DeFJB/S62fQU3S0v5XRubEbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BFCF8051F;
	Fri, 20 May 2022 13:18:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83568F80520; Fri, 20 May 2022 13:18:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84A0CF80519
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 13:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A0CF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TSfCWZcz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD6F861DC2;
 Fri, 20 May 2022 11:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78082C34113;
 Fri, 20 May 2022 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045524;
 bh=8fut9JzJYxNLGDgXqNqvjdjqVOf5PzcnA1tSy99j53M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TSfCWZczSs8IpkVlMLlX/SNVZs2B5/nmDn8nYxyBPA/4OIJvc2qwftb2PuNIG1vlT
 zwfMGn0gs8m0RJ9KfejCYrWSPaLJzCNAQJoF86PpnVLYM0Ltzzhu/jrx1ppUwBqMXl
 FhV/J0T5H4F7LgIsImNEcyqgqs0LKn4RP0VFxCaaUIWyAqqk/4BsR5+6Anthd98iH5
 qwmKlh+PBkXJ8QrtHNAu7yGrTc/DEu8sF0y5vYcvqfxq5hx1ch4b7OVqMkGRtV+E40
 CuqXKRdj61RUjEGSOG+8CcInbg8SgVODV34PJPi/pn8BwmUSL+tvzaEBnicAJUxjXB
 GlLyZUYPMK8uw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220517173109.468568-1-pierre-louis.bossart@linux.intel.com>
References: <20220517173109.468568-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: mediatek: add debug dump
Message-Id: <165304552320.45439.13190111170352860473.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Tue, 17 May 2022 12:31:07 -0500, Pierre-Louis Bossart wrote:
> YC Hung (2):
>   ASoC: SOF: mediatek: Add mediatek common debug dump
>   ASoC: SOF: mediatek: Add mt8195 debug dump
> 
> sound/soc/sof/mediatek/Makefile          |  1 +
>  sound/soc/sof/mediatek/mt8195/mt8195.c   | 29 ++++++++
>  sound/soc/sof/mediatek/mtk-adsp-common.c | 84 ++++++++++++++++++++++++
>  sound/soc/sof/mediatek/mtk-adsp-common.h | 10 +++
>  4 files changed, 124 insertions(+)
>  create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.c
>  create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.h
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: mediatek: Add mediatek common debug dump
      commit: 698c1e99a0a3b883a629159ae47fa41778209258
[2/2] ASoC: SOF: mediatek: Add mt8195 debug dump
      commit: 3a054f90e95500387cc871f5a04ad91def1664ed

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
