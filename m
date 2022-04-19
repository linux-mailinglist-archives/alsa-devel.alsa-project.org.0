Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3504D5071D6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 17:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD6D51AF2;
	Tue, 19 Apr 2022 17:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD6D51AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650382282;
	bh=xr4+GRv6uRv/fbQhe5BhSVrxCf6BcMHd+siZ/yc4BXI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ODbQ0wT1cm3UEyZ6gpoOZtrRyl4MkVUULj+BA4pxNucPGTv+uCS9XYutc0pN/ye+E
	 nOi+c3Q93csVs0VKAIFFWUvloR4tl9JLi9CY4PoZJa3Oh+NxWJAeCYvvStuDKvdynr
	 pwT9cVvjIEYKEZ7sBqMQ+hiaSi7kQPzYh4SQOEG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B9AAF800C1;
	Tue, 19 Apr 2022 17:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D28F2F80269; Tue, 19 Apr 2022 17:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 833D5F80237
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 17:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 833D5F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dQ+zPpGy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B0EB3CE19AE;
 Tue, 19 Apr 2022 15:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F96CC385A7;
 Tue, 19 Apr 2022 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650382186;
 bh=xr4+GRv6uRv/fbQhe5BhSVrxCf6BcMHd+siZ/yc4BXI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dQ+zPpGy7WHc/HYs1aqLbzGB2sT86nFs/Kspn61Rcnerrb1n8fjPnwaA9GnxKhgLJ
 BiP/GGLfYWauPUphdkw5+/test+0g6d4/Rrfeeq8kqBuane6h/O6F5CFUQS1aA5Ze3
 HSRZ9fNmdHvThnN43iwgzqZ7OYHzmZ+vlMhTm7i3eOfrxkRXlT1v/C9M6uhmoY+2jD
 /+KNb0Bx9SvHUbpcFfjm6JJaQamajy3/csb9SpfCU4q/03InmizQI0G3fwHMmcTAJw
 zmp+aDO3hy/4S7iiJUtY90Lk1OFnUNZ14oK2OEDvG5CR2WDnU/0PPGBYVdO90ZtKDw
 4ujXMEZ/xtegQ==
From: Mark Brown <broonie@kernel.org>
To: patches@opensource.cirrus.com, broonie@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220416125408.197440-1-broonie@kernel.org>
References: <20220416125408.197440-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wm8958: Fix change notifications for DSP controls
Message-Id: <165038218491.995461.7141441522433059070.b4-ty@kernel.org>
Date: Tue, 19 Apr 2022 16:29:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Sat, 16 Apr 2022 13:54:08 +0100, Mark Brown wrote:
> The WM8958 DSP controls all return 0 on successful write, not a boolean
> value indicating if the write changed the value of the control. Fix this
> by returning 1 after a change, there is already a check at the start of
> each put() that skips the function in the case that there is no change.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8958: Fix change notifications for DSP controls
      commit: b4f5c6b2e52b27462c0599e64e96e53b58438de1

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
