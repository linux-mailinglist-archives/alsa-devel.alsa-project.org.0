Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436EA53FBEB
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D01193B;
	Tue,  7 Jun 2022 12:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D01193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598892;
	bh=x4J04FP7K/DoloiLXlCgLaDZYiUD7aOquyra8ioKyCk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VdxPGsX3/MRTBqomF41xXpyEaTEqp/upd+UOPuZPqjrFw6z9kEAVbr3A425oAlRB9
	 14GB8evdqBBfsH0sL3BuE55EvOKKaNH6hF1D6v1qDrp5cTsB71feohk0zqWO8GgSdK
	 SFCIe835U1x/n92yvyDMP3oAmAJ2YGmEJilDeb1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A8AF80548;
	Tue,  7 Jun 2022 12:45:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBE50F80535; Tue,  7 Jun 2022 12:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69BCDF80535
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69BCDF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N6Ao5dcf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F131961549;
 Tue,  7 Jun 2022 10:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E44C34114;
 Tue,  7 Jun 2022 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598731;
 bh=x4J04FP7K/DoloiLXlCgLaDZYiUD7aOquyra8ioKyCk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=N6Ao5dcfijnZsNNZdZywBAx81HSnwOlRaYkE+BLpHkk+YktfdBrXKzQfnl5Lq/mcY
 x8zDesH+nGHMy1DzTkuCMGWYWJ5P4X0Op5SmgnVcPd2kGZF3PpKpKLoXINWNDSY+qQ
 qige2MsDl4iG10YKxnaBV0HSQVUJ8O0ZKfswBaEfRJSIwXs/yN7+JmA5DhEtT4lxYC
 mT1co71k493oU6zy7c31tza5A6l9sueuKbcEctFMCllZqb4OJ73visxoLILnNib7+w
 aUTE5rN7LYs8ELNSX02lZdK6obf3WUnYUKarsQhWNJUyNYyfNQPuqJn/xFl1l88qfC
 WplttMZSQcF+w==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20220526010543.1164793-1-festevam@gmail.com>
References: <20220526010543.1164793-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Silence a clang warning
Message-Id: <165459873007.301808.10392569410236369306.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nathan@kernel.org, alsa-devel@alsa-project.org, shengjiu.wang@gmail.com,
 lkp@intel.com
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

On Wed, 25 May 2022 22:05:43 -0300, Fabio Estevam wrote:
> Change the of_device_get_match_data() cast to (uintptr_t)
> to silence the following clang warning:
> 
> sound/soc/fsl/imx-audmux.c:301:16: warning: cast to smaller integer type 'enum imx_audmux_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmux: Silence a clang warning
      commit: 2f4a8171da06609bb6a063630ed546ee3d93dad7

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
