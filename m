Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EDD50E734
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:26:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F70F17B2;
	Mon, 25 Apr 2022 19:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F70F17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907596;
	bh=kGNKLYoYkIqyAIUqooIaCkDmUVcEL/KHpxMnxdUnrRc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HP2QZqn64J2N6yjm4rD0m8DH8BvxsDzh/nOlJUsFT/kU7d0cEj/Ql4ze7WFy2j92K
	 r7V9axdKNyPSLhPSvWKqM6FQ6HN9vdWNVaDbpUBY1S8WwXM+QKt6MH82Qv+jWaPA+Z
	 VY0AIKRlyRlJcgCsacr1M4G3mquv84dRwsuRKqzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D46FF80510;
	Mon, 25 Apr 2022 19:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FC7CF804AA; Mon, 25 Apr 2022 19:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80969F8016E
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80969F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ACFU4LD7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99E31614C1;
 Mon, 25 Apr 2022 17:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F697C385A9;
 Mon, 25 Apr 2022 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907460;
 bh=kGNKLYoYkIqyAIUqooIaCkDmUVcEL/KHpxMnxdUnrRc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ACFU4LD7VqRkiZApiylS1fOnq2RPRL/i0D0eEj9j11l26LRlXNcUfP0flySj5nH0N
 CZlLTaf5OfTdKYlW0x6/U5oEkxP3GmCRzI/SvYuTAYpM6532fGOpywGxCsqV+QkHGV
 LxkWTwG4Zd1nyQRDO1RxXZRvTRyLHoKOsxoRIfkf0dLx+Y57vhwkT9qwBodmmK0HeM
 B0GuAsX4WQ8V8bpaPJHRorlMNc4R1NKVtP0hI8a8vowE/JtKfPcxddIVPZObFqC0D4
 kKg+/OZyqoXeL6xYRlriZYJuv/53u9bhPuE21qxkmamjf07huqSwwbCLzzsYTuV3Lh
 Y02qO6wjsch3g==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, lgirdwood@gmail.com,
 Xiubo Li <Xiubo.Lee@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 shawnguo@kernel.org, perex@perex.cz, kernel@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, baihaowen@meizu.com, tiwai@suse.com,
 linux-imx@nxp.com, Shengjiu Wang <shengjiu.wang@gmail.com>
In-Reply-To: <1650509120-25377-1-git-send-email-baihaowen@meizu.com>
References: <1650509120-25377-1-git-send-email-baihaowen@meizu.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: remove useless null check before call
 of_node_put()
Message-Id: <165090745710.583823.18355681135160167823.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, 21 Apr 2022 10:45:20 +0800, Haowen Bai wrote:
> No need to add null check before call of_node_put(), since the
> implementation of of_node_put() has done it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: remove useless null check before call of_node_put()
      commit: 666b0cad75dc9517100295aed590aef2ff9a73d1

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
