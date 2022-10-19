Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA21604C38
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 17:52:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCE6AE00;
	Wed, 19 Oct 2022 17:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCE6AE00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666194728;
	bh=dL9TR0vXaZI+UJpDpWwIt7YRbkDuvjL73+92DMaLhGc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6DWGzO2RNKWXNo6vARc0GtYpDHxBySXuqHK6vBByfFVCZesLX1NNRN8SsohjDRGu
	 yTROco6z8+puxCFQbNoE4l8mV/EszQ/7tMpwwW78lGAA7Zk3zcEoN7xaspDLBmoGV0
	 G/WbGyFzrDAGEoD5MsTymXxqIYb+N5Od+6hysHng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52117F8055B;
	Wed, 19 Oct 2022 17:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44FE5F8053C; Wed, 19 Oct 2022 17:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8CF5F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 17:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8CF5F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CGQsdB5O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4DF92CE22C8;
 Wed, 19 Oct 2022 15:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C44C433C1;
 Wed, 19 Oct 2022 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666194617;
 bh=dL9TR0vXaZI+UJpDpWwIt7YRbkDuvjL73+92DMaLhGc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CGQsdB5OMOEksPOLaub87hQ2GaswWn+qu+jv6P7DM4/cQvxkZX1WxrEEpSeGruw8S
 7Q6wwyGjrgdG8AZpftDjjRhO3SrF/Xk/AAmMY5hrbGKRJhU+G2HriEg4EZRi6tXr/P
 zWaoFMaO2HoCidynt5BjbJRs7MSeJbZiwm6LFFk/x2HmXLdE/eZg24wsv317Q/6y0H
 qp5je7qkVSHSpmZuABfPKM3lBjBPir1Te2KgrMiySHKD3+/ED0Xind0BRs4Bk7fOjn
 l/Wy+Cd7JY6oFCm165cwfMXW3siTGJBvjtP3/dICa7Zq4akJWo1bfmsNZKs+EMCJph
 IsKCcZLgcz8Mw==
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20221019095715.31082-1-shumingf@realtek.com>
References: <20221019095715.31082-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt1308-sdw: add the default value of some
 registers
Message-Id: <166619461541.884966.2105886090446844759.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 16:50:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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

On Wed, 19 Oct 2022 17:57:15 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The driver missed the default value of register 0xc070/0xc360.
> This patch adds that default value to avoid invalid register access
> when the device doesn't be enumerated yet.
> BugLink: https://github.com/thesofproject/linux/issues/3924
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt1308-sdw: add the default value of some registers
      commit: 75d8b1662ca5c20cf8365575222abaef18ff1f50

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
