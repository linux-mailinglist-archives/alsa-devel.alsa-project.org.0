Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49B56C15F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7D5850;
	Fri,  8 Jul 2022 22:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7D5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657313355;
	bh=MqR9f7MACYBAcYjxJ+25V00wmb/8vqF0S1efMb76TjM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bu7pyl9NiENQx+vKl4AG064khi5ZguUGT9RgFI3HFcKi0TY6YGyVl2Rb5hl77K/Ge
	 Bk0p2yj8VINI+bblMi2ajY8GfLrh6cpkzAy/ENw8e1pmusCtPDBBHFt/yu+O9l2GOn
	 swExGDrVjT20CsmZSDTJUbqnFPi2PFmq8/CCzUjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A0FF8053E;
	Fri,  8 Jul 2022 22:47:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD914F80538; Fri,  8 Jul 2022 22:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D334F80538
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D334F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TQBO0MJ0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38DB2B82567;
 Fri,  8 Jul 2022 20:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0CBC341C0;
 Fri,  8 Jul 2022 20:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657313248;
 bh=MqR9f7MACYBAcYjxJ+25V00wmb/8vqF0S1efMb76TjM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TQBO0MJ0QfFUykA3qhz9JE22bzFzwiEs3gmTbask+kaw6GPbhLKHHyNbhiN32kwNx
 XrIJHQARbIGgGev4aO34apTojMiOgzs6ZJ48dgO5uC4m9+wUrHMvSNTdOzqDjv9Hb0
 ERk7k/TNwWsX9AWKhIJ2AxeuRZUrEb9KQX0FelcceSf8m/UfjJcbk2B9KPYpS9btgz
 +0O0RUbA0SvlHsk4K1REUXeHT/Jpv9Ccqf5eyiCFp0nlZQME3N1T1zb04vFEe9s1Qf
 I661hkIbRtLq1agGICB2TEUBbSPqsoZj7qvOU01kJOU//S2hRSNeGdIPr0AEs6jVmb
 G3/TiNKhRlNXw==
From: Mark Brown <broonie@kernel.org>
To: 13691752556@139.com
In-Reply-To: <20220707123343.2403-1-13691752556@139.com>
References: <20220707123343.2403-1-13691752556@139.com>
Subject: Re: [PATCH v4 1/2] add tas2780
Message-Id: <165731324741.2467307.10803633570806363088.b4-ty@kernel.org>
Date: Fri, 08 Jul 2022 21:47:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: shenghao-ding@ti.com, asyrus@ti.com, alsa-devel@alsa-project.org,
 navada@ti.com, raphael-xu@ti.com
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

On Thu, 7 Jul 2022 20:33:42 +0800, Raphael-Xu wrote:
> 1.update Kconfig and Makefile 2.add tas2780.c and tas2780.h
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] add tas2780
      commit: eae9f9ce181be4f47dcba1ee93185b71cac3f312
[2/2] add tas2780
      commit: a6426e7189e09bdf8decffd8a539f3727b672d3e

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
