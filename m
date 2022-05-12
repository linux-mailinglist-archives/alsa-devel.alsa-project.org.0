Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E78D524FA7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 338D11AD4;
	Thu, 12 May 2022 16:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 338D11AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364888;
	bh=0hh3VnoWdrScswPThoUAz7IHRdvYsSrWyfqva7PClQk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coYq+sYal2FEKLA50jE7vv4fplK1oVuy4Dp3Y9bB7gTf1G56S0qQO+8zoMYu7zCxv
	 FFOK2q4cJzki7hNHtXo1gc5QOSbgd00dvnOKRHwizU1/OhCM3ubUINhBjEsfzyffWr
	 /ETEUPMFr4N4be4LLpQE4bXCJNu1aeJhfwY/xVQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D402F80519;
	Thu, 12 May 2022 16:12:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E19FF80516; Thu, 12 May 2022 16:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34808F8050F
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 16:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34808F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="csshdifP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7279661B6B;
 Thu, 12 May 2022 14:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F089EC385B8;
 Thu, 12 May 2022 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364770;
 bh=0hh3VnoWdrScswPThoUAz7IHRdvYsSrWyfqva7PClQk=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=csshdifPDDyuUKSgp96tlCgn60qYxckukQoSlyWxGcwgKeeuti4z2ik9F9AnEWPCQ
 isX4F+ZF4oFv6jtdWDMIwvW7h+mwk8AMvBzc17Q4186w43TgYeDmTf5G7VgxDDn3S0
 RN9WdsvQ939yycBgwp05MFZzXm7q0mXcwul1Fs9wKvIPht9HmyUd5UZm2upwxUoOur
 YZA9p0Q+EeWkWGKVit6GzIzoN/4hnfuv1cZBflk+uW5jReIYP+qTu9YR6WEODsaKfI
 dEovtkWepZcuPx/1G0rjE+e+GeyWKsFYJZejW2RpRAuzMBaVLiFc8q95X30AlBWoxH
 g74dxMGfow4Rw==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 shawnguo@kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 kernel@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-imx@nxp.com, linmq006@gmail.com, richard.zhao@linaro.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20220511065803.3957-1-linmq006@gmail.com>
References: <20220511065803.3957-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
Message-Id: <165236476669.1016627.799553310382817495.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:46 +0100
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

On Wed, 11 May 2022 10:58:03 +0400, Miaoqian Lin wrote:
> of_find_i2c_device_by_node() takes a reference,
> In error paths, we should call put_device() to drop
> the reference to aviod refount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
      commit: 41cd312dfe980af869c3503b4d38e62ed20dd3b7

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
