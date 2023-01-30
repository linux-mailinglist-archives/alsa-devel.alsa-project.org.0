Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3FE681C08
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 22:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC651AE9;
	Mon, 30 Jan 2023 22:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC651AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675112472;
	bh=cf47b8CAKK73Es+LoTlxJKk80qn/DQy1RvwAP1SqyUM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I7jCexHYG5ig8UE74Zdkaw46eUmscl+KcuUzqxvR1hlZqFckqN0bl9ULI64U6Pyv1
	 GNzxlPmSl1uTI2bxSybOaPl1soNccpmoq2vFeqJwHjaiZcC8IS6eyrEjHCJmUy4A8M
	 GrRCjQgDBbVL48QEb+SrmpaT2qXH52GJAXEq3uHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38ACEF8007C;
	Mon, 30 Jan 2023 22:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCCD7F80423; Mon, 30 Jan 2023 22:00:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6AB9F800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 22:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6AB9F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WzI0yrz5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AFCB6122C;
 Mon, 30 Jan 2023 21:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB98C433EF;
 Mon, 30 Jan 2023 20:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675112400;
 bh=cf47b8CAKK73Es+LoTlxJKk80qn/DQy1RvwAP1SqyUM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WzI0yrz5MLh+YZP+wofAz67AukTVZU0QtEHdm3HjwLu9Cx6+g6Czt3cMj+vOooU0Z
 Cpk0GEweBMxjMk0N1m9K1Rq2i1jqMDfUE6MoT5G+vhufLGiPHjZ3zZ4T68xHfYVewc
 XnM6v212lKPlOEP8KjKyN5rSiBP/nKBQO8+UdqC8wXOhlIrIvEljMctmFD2GroXXgM
 uywzlLb4K7sO8NuzoRWlIwz+q1ioND79PWyhEro+O6xWVIkm4pQE/O/M+GJexKCQN4
 /oaVYcKpWRqxaz/Ik+Vy65kSsOMMpQFWAg3CU822fw78T2JDjwnPpwu/aI0pPnvAKT
 71Uew8aWOAJ2A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, KiseokJo <kiseok.jo@irondevice.com>, 
 alsa-devel@alsa-project.org, Colin Ian King <colin.i.king@gmail.com>
In-Reply-To: <20230130092157.36446-1-colin.i.king@gmail.com>
References: <20230130092157.36446-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: SMA1303: Fix spelling mistake "Invald" ->
 "Invalid"
Message-Id: <167511239928.2141894.16999579130173129133.b4-ty@kernel.org>
Date: Mon, 30 Jan 2023 20:59:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: kernel-janitors@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 30 Jan 2023 09:21:57 +0000, Colin Ian King wrote:
> There are spelling mistakes in dev_err messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SMA1303: Fix spelling mistake "Invald" -> "Invalid"
      commit: 5b28c049ff53cf49e3a97d80cebd2e9c2779ea96

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

