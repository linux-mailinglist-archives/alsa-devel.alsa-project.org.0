Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1B48568D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 17:14:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108121A3B;
	Wed,  5 Jan 2022 17:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108121A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641399280;
	bh=LRFNrgss+xIi1J6OY9225bbt64RcNCWaztOCJzwcQuU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHuB5WXJBC2UcjLo51sF5AN0TBPSWtP90uViYDhG5djnhuadt4pcKk7pCqqxyN62f
	 vaR9jCQbr8dj6HA59y/SafjeH4QF2rfQ+Hm22N8S0u7MlHOE9gmAf2jTvKRu/x8mxC
	 ucD63ZoZYfApj7kq40ulIbTX/+0vIuFWys0TyRkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3218F802D2;
	Wed,  5 Jan 2022 17:13:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23242F802D2; Wed,  5 Jan 2022 17:13:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F099BF80089
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 17:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F099BF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UprKjiKG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B74D6617A2;
 Wed,  5 Jan 2022 16:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD271C36AE0;
 Wed,  5 Jan 2022 16:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641399166;
 bh=LRFNrgss+xIi1J6OY9225bbt64RcNCWaztOCJzwcQuU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UprKjiKGkFwYcWmpQYDNb3FpUZ0nAeEK81FWlWnWk5+ZjCfzXMpsqkgAfx6s+VtZE
 Tw0ehwb7x8xaqi/OHTN/yYHb0VaCKBmkwEP0rl+cjtAlfp1Z695PB93p/ijjmiqlie
 xgT669OmmbIppkJvWVRKdMMK/gNkoGg5szffRe1v1vT5wrFL6VmcqUwGC2qBpWjMKS
 WB1hhlcKkS2MTkGzZruiHXJe3ptiNQkECZzc5CfnPlnRs0c0Vu3YfblIyUMl9CZCfC
 1eQnu9HSsw2RPChyHcbxtwVpwHwZU3ZBzwc/B8VhTY+uHTMzPQu3MsQxdY/gRuUFNk
 xtzXata/tRnzg==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20220104180613.639317-1-festevam@gmail.com>
References: <20220104180613.639317-1-festevam@gmail.com>
Subject: Re: [PATCH v3] ASoC: cs4265: Add a remove() function
Message-Id: <164139916453.3066423.11098261040208863967.b4-ty@kernel.org>
Date: Wed, 05 Jan 2022 16:12:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com
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

On Tue, 4 Jan 2022 15:06:13 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> When the reset_gpio GPIO is used, it is better to put the codec
> back into reset state when the driver unbinds.
> 
> Add a remove() function to accomplish that.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs4265: Add a remove() function
      commit: a319cb32e7cfd2703db3a883ce260a7b06729895

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
