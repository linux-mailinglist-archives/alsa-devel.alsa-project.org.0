Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA01535358
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 20:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCE671686;
	Thu, 26 May 2022 20:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCE671686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653589950;
	bh=sQ0PhzqEwWl1eOGC2iQSwjyIDLxlpV5KM/s8Awt7wUk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4OMew7LG91P2xvKdrM/I0twv0UdnTv+R6lbvCGXqX2CGdUZ2M4jeNGLQGTfmbmft
	 dD7YEecBbVZ6NpE3hrgmWU7I+Gt4sCIKw+I+IhH6mb9Zvh8dOz3NPgNCvz2Vd0XrYd
	 fRiEbyFhoZ6mg5hfu39jwV5ApM7iK3PHiRHHYAP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FEB2F800D0;
	Thu, 26 May 2022 20:31:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5478EF8014B; Thu, 26 May 2022 20:31:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0799F80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 20:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0799F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BgV5Rl1H"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E6836170D;
 Thu, 26 May 2022 18:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1A2C385A9;
 Thu, 26 May 2022 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653589885;
 bh=sQ0PhzqEwWl1eOGC2iQSwjyIDLxlpV5KM/s8Awt7wUk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BgV5Rl1Hrvbq1x2BU1zyPQiE6WiJTglM5eYHQv7FMs+qoznuD/Bup7q/+AC5UiQIG
 pmpP/+Il9X1+yDqwSXDntpt2QIlc/ykZXS/dDFlZ2d2B1WU7LjrYMwYOLZN4qQLeRJ
 wLF5nsfTu9K/SQqIHkxsm+UAFiPMFKdNHwgTPPJlSMU6J0dPHQzA0o127TN0fPwJKQ
 ggUeq1yniEPNjKYdZukMq9ljBZ7RxjBU2WsHcaMKMo6gIXNY9Zrs0fd1Evtx4UqQXW
 bWeMS7tNr/wWE2pWRLgrD8oB2mGYhuJu9OcSe9Db5C/Xs0tt7gQMGO9pE+SrijB2fM
 6+E26M+MaEjNg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, CTLIN0@nuvoton.com
In-Reply-To: <20220526121301.1819541-1-CTLIN0@nuvoton.com>
References: <20220526121301.1819541-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: Intel: common: fix typo for tplg naming
Message-Id: <165358988346.3218972.14197938083427381484.b4-ty@kernel.org>
Date: Thu, 26 May 2022 19:31:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: ctlin0.linux@gmail.com, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, YHCHuang@nuvoton.com, mac.chiang@intel.com,
 vamshi.krishna.gopal@intel.com
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

On Thu, 26 May 2022 20:13:02 +0800, David Lin wrote:
> Correct typo form sof-adl-mx98360a-nau8825.tplg to
> sof-adl-max98360a-nau8825.tplg. The reason is tplg naming without naming
> limitaion of length. It will be consistency with sof topology generation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: common: fix typo for tplg naming
      commit: 5fa66f29937eb806997a4d1d3edd360ef4e93db9

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
