Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB8898B13
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 17:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A403E2CD8;
	Thu,  4 Apr 2024 17:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A403E2CD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712244389;
	bh=/knebWZeaaEDHH+qAZ96R0RgaVmS7oZA7zCTSzDKjuY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VPsdzGuxc4MbPmIpL73bUPVmLsCF1ROAqE20DhkSKVXAqdd20ZSDhv4mbiaI6oXPt
	 TsO9InsHeBCnPWyTarBBqS4gds8cL/fJpT0l6DW9IorxXj/C2XGYgy9DPvh4rtHjh0
	 9Iwi+dPrqPh1VfWHtlMA/ZA+yzasnPHWYxe1gT2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83CCEF805B2; Thu,  4 Apr 2024 17:25:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B18EF8057C;
	Thu,  4 Apr 2024 17:25:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F24B5F8020D; Thu,  4 Apr 2024 17:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70279F80130;
	Thu,  4 Apr 2024 17:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70279F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mZXS+h1j
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79F89CE32AF;
	Thu,  4 Apr 2024 15:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F17C433C7;
	Thu,  4 Apr 2024 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712244261;
	bh=/knebWZeaaEDHH+qAZ96R0RgaVmS7oZA7zCTSzDKjuY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mZXS+h1jP5e1ftHIhw6bJjSrAeelq+ogn5rVYsS0ZEzBL8YQk0sYPi7wUmXZz/U9A
	 JC49Q4Dnv0mHGisesAqspV6Oe/7jlbTa1VYbuSHc0QW+wUFaPdApNhtimMWjcrYfeO
	 Z8ltojDLVGnzlHj4Ns2tDmni1R0zLmmCPZw57ezQyetvfqrcDs/3Auu/jtDOdkcnnZ
	 2zESNKZQAg5lmR6nCXyvf7rYQPwi9EE23XUDYKS4TO4QaE1n6UsqOCYbcPexqDzjVn
	 D+GbXGna9NjF8skj+FagEt4saLBrX+8HN8K1khNMAVtZ3VgXmPkxjHZ669ETTdauKg
	 L6KktWSgGulig==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, venkataprasad.potturu@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Mastan Katragadda <Mastan.Katragadda@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240404041717.430545-1-Vijendar.Mukunda@amd.com>
References: <20240404041717.430545-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: fix for false dsp interrupts
Message-Id: <171224425713.53181.6209478455097069217.b4-ty@kernel.org>
Date: Thu, 04 Apr 2024 16:24:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 5AOWIN5266IWEVJPCIEM6JPYFRXROKJU
X-Message-ID-Hash: 5AOWIN5266IWEVJPCIEM6JPYFRXROKJU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5AOWIN5266IWEVJPCIEM6JPYFRXROKJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Apr 2024 09:47:13 +0530, Vijendar Mukunda wrote:
> Before ACP firmware loading, DSP interrupts are not expected.
> Sometimes after reboot, it's observed that before ACP firmware is loaded
> false DSP interrupt is reported.
> Registering the interrupt handler before acp initialization causing false
> interrupts sometimes on reboot as ACP reset is not applied.
> Correct the sequence by invoking acp initialization sequence prior to
> registering interrupt handler.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: fix for false dsp interrupts
      commit: b9846a386734e73a1414950ebfd50f04919f5e24

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

