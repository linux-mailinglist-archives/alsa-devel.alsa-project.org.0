Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F232E53FC5C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F051959;
	Tue,  7 Jun 2022 12:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F051959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599164;
	bh=7hyUoDD8U/8SSRsc3zmtGqzvEKN++qYD6+Qv3iS5Xhc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1NIwokHtncTeqZ20iiWETQLY+2hyYtWUxScaKX2Lt1Xcut74NNRrr2MGQKH7xcex
	 p11WmDwtikuvEAOXvssybmV2//s7v+Blig3q2DxqS53cwLnYkIEWIquFZsMs2tzxlW
	 MuKkQD9JTYE905MFVJ3RqgMFQebY51cwRJf4glRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AB3DF805E8;
	Tue,  7 Jun 2022 12:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 820B4F804E6; Tue,  7 Jun 2022 12:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 298C3F80159
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 298C3F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SuY6LaVu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6DC1B81F0B;
 Tue,  7 Jun 2022 10:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC6BC34115;
 Tue,  7 Jun 2022 10:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598771;
 bh=7hyUoDD8U/8SSRsc3zmtGqzvEKN++qYD6+Qv3iS5Xhc=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=SuY6LaVu/gau0DpI7Q8R6xBJsfAfYKiB2tzYXBqpju6IK2algZNMjsISeFm2c5mcf
 04kJDOvZtD20nCeo/ySGr9a6ZtiXymq42zEVVheBgn4ryHMKDJep4rde4QyOwQPaK/
 NjP/fFnu5XCKAaeJIHiCFKUb8wPcrHx9e7BOwjeYfYeRZv7donfF1xSYEjnM2ZRPSf
 JEydpVrI9LTVF3VRtRKSx1E4UvCFRCMdkJ9y+7te4dD2193R/TC6duY+LwF07ajZQ3
 imwWFFORep06HVYBmlSmUi9cMwF8HkcsmycD8ELFEYi5cuHkoxQB2BvE4UbxEPBZQL
 PlxPo9YHEPBHQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linmq006@gmail.com,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@google.com,
 Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org,
 jiaxin.yu@mediatek.com, koro.chen@mediatek.com, akihiko.odaki@gmail.com,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20220602034144.60159-1-linmq006@gmail.com>
References: <20220602034144.60159-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Fix refcount leak in
 mt8173_rt5650_rt5676_dev_probe
Message-Id: <165459876882.301808.14719420011203139333.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 2 Jun 2022 07:41:42 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Fix missing of_node_put() in error paths.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
      commit: ae4f11c1ed2d67192fdf3d89db719ee439827c11

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
