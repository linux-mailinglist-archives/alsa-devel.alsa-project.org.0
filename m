Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C615474375
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 14:27:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF19D1B06;
	Tue, 14 Dec 2021 14:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF19D1B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639488464;
	bh=CXlirWpNtiv8wz5K4EzPuevYWM3pXeCBCGuXbnoMg4g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWKb6Mm73DWTlcstlIe0K3UzllF+8q6UeLz0VxaNjI1lS9b7fG8pOtnkCtRikYZOd
	 iwCozfWu3+hhOqvtEZ5hhMzUwO2l+CQDHEXNmG7+A1LGly4vZMQFRmZbBM8XLqmtkH
	 X3oMiVqXf48Gy6WShwXrj3NnrXoYzUTPBUQYmPR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEA0F80246;
	Tue, 14 Dec 2021 14:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2000CF80246; Tue, 14 Dec 2021 14:25:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7519F801EC;
 Tue, 14 Dec 2021 14:25:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7519F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m0eIIm1l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06CAAB817F1;
 Tue, 14 Dec 2021 13:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD7BC34601;
 Tue, 14 Dec 2021 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639488329;
 bh=CXlirWpNtiv8wz5K4EzPuevYWM3pXeCBCGuXbnoMg4g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=m0eIIm1lOkOQ7SFJ5VEJ7buHuN/A1tRSn/wawPe1l3lOyt4uehRzvT8zXz7KlQIMl
 Q8S/lz4qY6I2NxYzqY3ES7nWfyQi3V2mnpFg82Pzzbx/vSKtyxBf4zPGGhRT5p4OO4
 O2+gPFN4w8gnhm6dQVdXkvsjPsjtbdeBx2AzOwHtv4RblmbPqhI8onVDuV7KQKjtBB
 +oaKVyTQmstzYeawV1vUyGqacxDp7nysczgtQ2gxwi5Ku5rGoV3DOuFeyWWHpWxfgi
 2mpSXy9pJwylCc+Kuwt9t8NpgzbSJveh8FoNeRNFYwk0hmXleFgVyJxbs83yuQzlXC
 TZIV+as0AG5yg==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20211204203220.54712-1-rikard.falkeborn@gmail.com>
References: <20211204203220.54712-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: sof-probes: Constify sof_probe_compr_ops
Message-Id: <163948832737.2865729.1547928501780400598.b4-ty@kernel.org>
Date: Tue, 14 Dec 2021 13:25:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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

On Sat, 4 Dec 2021 21:32:20 +0100, Rikard Falkeborn wrote:
> The only usage of sof_probe_compr_ops is to assign its address to the
> cops field in the snd_soc_dai_driver struct (in
> sound/soc/sof/intel/hda-dai.c). Make it const to allow the compiler to
> put it in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-probes: Constify sof_probe_compr_ops
      commit: ec247fea7380244626d7095dfc1a0bb6c1f84f29

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
