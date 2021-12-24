Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD047F014
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 17:19:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C36817DE;
	Fri, 24 Dec 2021 17:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C36817DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640362753;
	bh=Ug7MgkARQjzTdBT5xt2EBO4kufmFltAfOCADeAkS8DQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V36oVlkQwUOmOWM2ytR2O0tAWo+rY8MBt4FYG18uMvUdaAzlNdUut2pLhXp11iNc/
	 g06qaImhzpBQqWdbYUC0M/obcMADFNBou8Wzj1gU6/LhkbEHL2SVel24J6udKerctx
	 p8ymmRcpMzKDTKUXJ3iXA7aP7rtgHTm6jhzW7bWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C06CBF804F2;
	Fri, 24 Dec 2021 17:17:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7FEBF80162; Fri, 24 Dec 2021 17:17:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF752F80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 17:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF752F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tivlVGhl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31DD1620CD;
 Fri, 24 Dec 2021 16:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C00C36AEA;
 Fri, 24 Dec 2021 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640362652;
 bh=Ug7MgkARQjzTdBT5xt2EBO4kufmFltAfOCADeAkS8DQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tivlVGhlNtPLzZMoW5SpMeW1y4mTPFkq/im04/MvwXR7VqSQnCF0LBZs7qDFg1iiq
 zMxV39Eg0tQeDedRr98u3bUtxc4rHQRAOeYNSJKEPlXZotZV71OflQJbQmXtIj/k7e
 O8dvZIhw3wSNx+IC804bWaRpvFfLr2LVDejfgVnR7psHN8B7HTjjeRoGJ2f0qOxreV
 vQ2QxRD1p+7Ly+IekZw2f19W6AcsI2qKrgWLJB2el7dnqXtoN875vAejFui1kfwGfZ
 k9J6JBzkkykqLKJpZxFHHYHZOPtJ68KCiTRo2MIwn5+uQtQ4NDQAfGQV1ImfSQisLm
 pzDjVrQIUXVHw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
In-Reply-To: <20211224150058.2444776-1-vsujithkumar.reddy@amd.com>
References: <20211224150058.2444776-1-vsujithkumar.reddy@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Power on/off the speaker enable gpio pin
 based on DAPM callback.
Message-Id: <164036264944.3720027.17021218639884939671.b4-ty@kernel.org>
Date: Fri, 24 Dec 2021 16:17:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Arnd Bergmann <arnd@arndb.de>,
 ajitkumar.pandey@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>
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

On Fri, 24 Dec 2021 20:30:43 +0530, V sujith kumar Reddy wrote:
> Configure the speaker gpio pin based on power sequence of the DAPM
> speaker events.
> Enable speaker after widget power up and Disable before widget  powerdown.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Power on/off the speaker enable gpio pin based on DAPM callback.
      commit: 5c5f08f7fc0bee9a1bc3fbdcb7a21cfd0648ab14

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
