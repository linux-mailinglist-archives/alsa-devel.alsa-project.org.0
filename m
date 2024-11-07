Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA49C06D3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 14:07:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2E4FEC1;
	Thu,  7 Nov 2024 14:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2E4FEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730984864;
	bh=WpXkdW58NwJpi1pGQBZHFsJuQ2oNn8UxUGi30Sv955k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oAFSCVSbq4kSMQ1pgxWP38tXRTyLkKkK3uFcvca7eU/idFMHMbW6wcNYZ8SRG1slQ
	 PRwdW5Jv9irtQ8Phx/uqF/DJstcQphnovan2INdes7WZn5SOQNIAAMAnPhA5VpUcm3
	 XdN42GEG1+E4aY7/1cJaWcCj1m59APbIu0Cvd+04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2469F805B2; Thu,  7 Nov 2024 14:07:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0296BF805AC;
	Thu,  7 Nov 2024 14:07:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FD40F8013D; Thu,  7 Nov 2024 14:07:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 104BFF800AA;
	Thu,  7 Nov 2024 14:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 104BFF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W2klslHa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B9205C0767;
	Thu,  7 Nov 2024 13:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA61C4CECC;
	Thu,  7 Nov 2024 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730984821;
	bh=WpXkdW58NwJpi1pGQBZHFsJuQ2oNn8UxUGi30Sv955k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W2klslHatOvfEzop97ZNdi5LkY8g3XSNRpV8nQURb9wLjqSNTxFb75WKIappO9f/D
	 bqvgHZ18Z995UzpcpvzQV8+ajMME7/1tRgPO9+BSZOnTk/Ws+ws0ZhEjR9L/5SKqn6
	 MchKVHlmHnK08ZqI1v27lxBVPvh0cKOZZOm/Tri8gaFbZsrQTbqGu7K316NuYg9mEU
	 L2Z5rLdWj8tUxyqPzBWumXQgAGblQG3+UZFw3Kz3Ct100XgN2y2HkbwSExbo3I0sBh
	 R8XUgIFFpsN5QJkKLn5hMTWDLMh52N1q1wI9RUSdb3co+1PmhWtdlGlk2cQd92kk2A
	 5QJ/xu9/UKasQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20241106101455.1229113-1-venkataprasad.potturu@amd.com>
References: <20241106101455.1229113-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Fix for incorrect DMA ch status
 register offset
Message-Id: <173098481508.15423.6358343520867651072.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 13:06:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: UF3L5A7MJFY2R274WT5STAUXEDZJJV4M
X-Message-ID-Hash: UF3L5A7MJFY2R274WT5STAUXEDZJJV4M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UF3L5A7MJFY2R274WT5STAUXEDZJJV4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Nov 2024 15:44:53 +0530, Venkata Prasad Potturu wrote:
> DMA ch status register offset change in acp7.0 platform
> 
> Incorrect DMA channel status register offset check lead to
> firmware boot failure.
> 
> [   14.432497] snd_sof_amd_acp70 0000:c4:00.5: ------------[ DSP dump start ]------------
> [   14.432533] snd_sof_amd_acp70 0000:c4:00.5: Firmware boot failure due to timeout
> [   14.432549] snd_sof_amd_acp70 0000:c4:00.5: fw_state: SOF_FW_BOOT_IN_PROGRESS (3)
> [   14.432610] snd_sof_amd_acp70 0000:c4:00.5: invalid header size 0x71c41000. FW oops is bogus
> [   14.432626] snd_sof_amd_acp70 0000:c4:00.5: unexpected fault 0x71c40000 trace 0x71c40000
> [   14.432642] snd_sof_amd_acp70 0000:c4:00.5: ------------[ DSP dump end ]------------
> [   14.432657] snd_sof_amd_acp70 0000:c4:00.5: error: failed to boot DSP firmware -5
> [   14.432672] snd_sof_amd_acp70 0000:c4:00.5: fw_state change: 3 -> 4
> [   14.433260] dmic-codec dmic-codec: ASoC: Unregistered DAI 'dmic-hifi'
> [   14.433319] snd_sof_amd_acp70 0000:c4:00.5: fw_state change: 4 -> 0
> [   14.433358] snd_sof_amd_acp70 0000:c4:00.5: error: sof_probe_work failed err: -5
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Fix for incorrect DMA ch status register offset
      commit: 94debe5eaa0adaa24a6de4a8e5f138be7381eb9e

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

