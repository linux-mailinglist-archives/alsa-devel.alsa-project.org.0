Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35BB4F93F9
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:26:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66CE9192D;
	Fri,  8 Apr 2022 13:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66CE9192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417178;
	bh=xeM8rY564xTTiRsahpqEs06K4aRbXxyrdVvwU0Ozc3g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s9FSSPTXgBNCA6szguas3oTLJo/H2CW99ykPmCQDHNP0zpHPOq8P0AYvDy90GXtzY
	 0fjiXyrd8YDDhBZN0IHI1nclEQegY4fmP3i+nDNfHAO/3Es1yCoR1OQPlicxEWEbNm
	 IMldMfSIbI70sQJAMyhT/nmvBzA1+ht15tKdonJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD7B5F80518;
	Fri,  8 Apr 2022 13:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D042F80516; Fri,  8 Apr 2022 13:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B7B7F80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B7B7F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cGkM/Nyh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6743761FA9;
 Fri,  8 Apr 2022 11:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68CCC385A3;
 Fri,  8 Apr 2022 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417053;
 bh=xeM8rY564xTTiRsahpqEs06K4aRbXxyrdVvwU0Ozc3g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cGkM/NyhMcWj2Hxsj9NJTb3DOJU0oGdxb0juog+Gphhfn1/+5ki6Nh5Z3B0AMsIrV
 We8Dds1zrAhSCzs7H3uecZc8rssS2Z2SUqlDVarsohlMzXbKPSIXwsgnkm9nhJa7FH
 2PURsJGsDM5IjFd0/KWO3EW6auV9spzcvVQ7G+vNKtO1l1bJSb3U39F2zDEH21RSJp
 V+El4Zx1poEe/NVbF/XyGHp/kkJWhbMPO6OrAAGSP2Xxb5xGmc4fcXDdCT0wulf20f
 9kraYzrlr9fr+svBSyn3OomRt0uk9u982jMx5KZ3/chhAdSL8zHMjReG7KxHG7nytl
 Ood626rlGh1qg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220406192341.271465-1-pierre-louis.bossart@linux.intel.com>
References: <20220406192341.271465-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: correct device endpoints for
 max98373
Message-Id: <164941705255.1295287.16867133780409002608.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 12:24:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, chao.song@linux.intel.com
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

On Wed, 6 Apr 2022 14:23:41 -0500, Pierre-Louis Bossart wrote:
> From: Chao Song <chao.song@linux.intel.com>
> 
> The left speaker of max98373 uses spk_r_endpoint, and right
> speaker uses spk_l_endpoint, this is obviously wrong.
> 
> This patch corrects the endpoints for max98373 codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: correct device endpoints for max98373
      commit: 97326be14df7bacc6ba5c62c0556298c27ea0432

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
