Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F6660548
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 18:05:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B25F14859;
	Fri,  6 Jan 2023 18:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B25F14859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673024753;
	bh=TGkLPAmTHI5beVTILN8LxRcgzvniy8G4IAn2VJlDzyA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dh3TZ4eoBlt7Gvg3SJEI9EFcirEjxjR9qspedWsw8nRDGsetVnBZ3TeNci4aVU18F
	 VRLmhzMtdRz/kSXIVvCAtpoA+SmESpw+E9/uP3fCoIyMykCyrVqLM+8ZyTTHB4B0rE
	 icrnz7I+QcQRiKnQ0Z1nEjp51pXeNXzk2mut5RYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0500EF8024E;
	Fri,  6 Jan 2023 18:04:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6504CF8024D; Fri,  6 Jan 2023 18:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B72A8F800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 18:04:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72A8F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f9NxORnQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8FC5B81D2F;
 Fri,  6 Jan 2023 17:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8866EC433D2;
 Fri,  6 Jan 2023 17:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673024689;
 bh=TGkLPAmTHI5beVTILN8LxRcgzvniy8G4IAn2VJlDzyA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=f9NxORnQR6/ut/Ch2IGD/2R76unIwu7QF65ukKZLaXVfb1xS0w1Egp25zgaiLoie6
 NYUWt8SVopKDC+K5ZkTNK7+YCpxZ+VEFHRjXOlLXoU6AEq3K+zqLbXvBNpDtd/W48x
 q9Wq3AMzB/axbdkXMj4q8H4W32rRJJq21sT/ZufIopm7NoihEkewyebt8zJ4FrFDRS
 355N70kyyXV3ChAjWGCJ3i+hcevyJ/SbJ/63YjGM9E2cb3qSjp5/rZP7MYRQtK6FS3
 /ZHJi8D0r18hGgv+QG1vRD10Y+iSeCKjZ9mL0bszhFLyFGnX0xYVmDsGUwH43WPKgm
 hnDaNseS5KrQg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, syed.sabakareem@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20230104055435.321327-1-Vijendar.Mukunda@amd.com>
References: <20230104055435.321327-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: ps: add mutex lock for accessing common
 registers
Message-Id: <167302468725.215080.6874492373066173949.b4-ty@kernel.org>
Date: Fri, 06 Jan 2023 17:04:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-214b3
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
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, basavaraj.hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, mario.limonciello@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 04 Jan 2023 11:24:29 +0530, Vijendar Mukunda wrote:
> Add mutex lock for accessing ACP common registers across different
> modules.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: ps: add mutex lock for accessing common registers
      commit: f763fb2fc93065d33f17fe9c5adeac8dec7713dc
[2/3] ASoC: amd: ps: use acp_lock to protect common registers in pdm driver
      commit: 45aa83cb93885d406c178498623b01cf128ca233
[3/3] ASoC: amd: ps: remove unused variable
      commit: 948f317fac06f8c0e2dea8c37f5ae5ee10514034

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
