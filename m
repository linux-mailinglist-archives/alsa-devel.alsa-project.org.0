Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCBD94C616
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 22:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3BBE8E;
	Thu,  8 Aug 2024 22:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3BBE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723150677;
	bh=8HZW9ydPbynTwHn2r0OXZgO4S5M5/tgIuH3d75AJA0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PCR8NgD5Xv/lNS0qfaDqdDr3G+SCg18ThWKis60vkSXZZXI+Mu4CNNM3IENZddfMI
	 +0Qx6bQ9RpsRfXIYPqAQ6XX0yE8R8yY1EIK14uJ4ph2QOJsclMN5fHqs0sfYOz7Gv3
	 aG1G15is8IuLCxsyv/zeYJIUkmMlKnBOSk02OVII=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10EFDF805B5; Thu,  8 Aug 2024 22:57:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C30CF80606;
	Thu,  8 Aug 2024 22:57:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF86BF805A8; Thu,  8 Aug 2024 22:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCF9BF8059F;
	Thu,  8 Aug 2024 22:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCF9BF8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BhCj/MDP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7274615B8;
	Thu,  8 Aug 2024 20:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5500CC32782;
	Thu,  8 Aug 2024 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723150619;
	bh=8HZW9ydPbynTwHn2r0OXZgO4S5M5/tgIuH3d75AJA0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BhCj/MDPwqsTvO3JLNkrAB9k7dGBoLzqHUBEpMVCPYWHzVb//6U/3Bu7qfFHiVNOu
	 5XhU9Zj45yz4eDsztzVZT+32vIvf3AWrFU2rqtvvP4h1oPSvQ7x15SSIdIWPnvfA2p
	 Pi+TtpvQSOqytHTykS4+hcTdwck8CdCcf/bqaIuFKQ/1klNx0Gtbbhb2Ly3cyQ8iyj
	 djApxLe6xJMFY9SvmpqXic7Ka081kFshTyUNNr7blsoA1PFWcPgjIzE6QXL0tymzDY
	 zAmyGxjwRbmsolaTRPGwPTue8rwjM9WMoTk0VM8MEep1bb4tWtst+eHqi9MkEA2VKG
	 h7jxhlbxPkkmQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH 1/8] ASoC: SOF: amd: Fix for incorrect acp
 error satus register offset
Message-Id: <172315061079.475406.3339971086228165624.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 21:56:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ICAHXPRLEBQ3P3CRZ3WD22YDHOL5RKZS
X-Message-ID-Hash: ICAHXPRLEBQ3P3CRZ3WD22YDHOL5RKZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICAHXPRLEBQ3P3CRZ3WD22YDHOL5RKZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 10:43:13 +0530, Vijendar Mukunda wrote:
> Adding 'dsp_intr_base' to ACP error status register offset in irq handler
> points to wrong register offset. ACP error status register offset got
> changed from ACP 6.0 onwards. Add 'acp_error_stat' descriptor field and
> update the value based on the ACP variant.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/8] ASoC: SOF: amd: update conditional check for cache register update
      commit: 001f8443d480773117a013a07f774d252f369bea
[6/8] ASoC: SOF: amd: modify psp send command conditional checks
      (no commit info)
[7/8] ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
      (no commit info)
[8/8] ASoC: amd: acp: Convert comma to semicolon
      (no commit info)

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

