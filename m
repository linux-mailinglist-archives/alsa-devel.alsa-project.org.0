Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDD6756FB
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 15:23:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7AA32F2;
	Fri, 20 Jan 2023 15:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7AA32F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674224588;
	bh=PtxDICPJNZhUoxVkgqifR1jH9tzOzpv7vQmz1llEeR0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pv4mzzMKmvLOUoq3VPtrPlQxpA0bDW+N55muYN4p76A3WozlASWiaL4ET3Ky+D7Kh
	 AbSXRM12NGPEVS/J2BMaBe2aulMGq7EEuND3bVXUfReV8tcwORIA3M+GGvQxmaqlbu
	 InWQTA9PukLDMD323M2mIAhw6G5RtzGyoVsaQ8bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E570BF8053D;
	Fri, 20 Jan 2023 15:21:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0623F80482; Fri, 20 Jan 2023 15:21:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE59EF80482
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 15:21:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE59EF80482
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iYtgVZmY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4598961F8B;
 Fri, 20 Jan 2023 14:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4F7C433D2;
 Fri, 20 Jan 2023 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674224486;
 bh=PtxDICPJNZhUoxVkgqifR1jH9tzOzpv7vQmz1llEeR0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iYtgVZmYQ8jcsz84XJl25nw3AQE4Ml8w9FEPM2vZW1nFPOLUAevTbKE1qzM9bgTHt
 yiNxcHuDK//clXtj58DEvFLSKHvZjeaueTd9aVIReqoYbT3xQdAVqkTfN0x0iIB/Bn
 Oi2jc4V+nG+GrANjsDaCfxav1im3V55hsFQrSzRcOcAkx7YcP3dHcAK+gBevCjbrSm
 wBUYt6zwk4O9/7+STirMAIJDA+F+fuEGrA9xdstdfioNeC9t1E59C+pSz+myWAE3pz
 hJEVYOVkEcjVs8fdOJ3awGI0qBJA7x+hNdH1wRYbRXjtGcL86wao1FTxO72zv/59yi
 7qugkfbnva+Mw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k01hlnqj.wl-kuninori.morimoto.gx@renesas.com>
References: <87k01hlnqj.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: zero clear HDMI pdata
Message-Id: <167422448552.1273927.11924063921389370740.b4-ty@kernel.org>
Date: Fri, 20 Jan 2023 14:21:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 20 Jan 2023 06:32:52 +0000, Kuninori Morimoto wrote:
> commit f77a066f4ed307d ("ASoC: hdmi-codec: Allow playback and capture
> to be disabled") added new no_i2s_playback/capture.
> We need to zero clear HDMI pdata first, otherwise unexpected flag
> will be added.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: zero clear HDMI pdata
      commit: 54650eb17132a099100264caf59bb2210f65085a

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

