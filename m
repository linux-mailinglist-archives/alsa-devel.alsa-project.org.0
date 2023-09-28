Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646CC7B1627
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 10:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5037CE0F;
	Thu, 28 Sep 2023 10:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5037CE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695890237;
	bh=FSwConUjZIxe3YIjZXjdGETHRwEytleBmz3Wk6V8jsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kRyb5Kcp8HRviEAowQYn/73FKNmu40NMKOLDustXNMZu3Q0m2TR0PlyzKUoKJFW2C
	 qwaqbBPWyN/awViF8F7lZwqVfINmdsCxcjgJvEiRCTPQ/0jFLJfhcKdgrMMvvMAs7x
	 kLNenitDhTEjdoBfDxPjy7rPNrryvPpFQw1vu9VU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3872EF8055C; Thu, 28 Sep 2023 10:35:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DC5DF8055A;
	Thu, 28 Sep 2023 10:35:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E8CF801D5; Thu, 28 Sep 2023 10:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8985AF80130;
	Thu, 28 Sep 2023 10:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8985AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tG6gu8nm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 36A1ECE1C43;
	Thu, 28 Sep 2023 08:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9ACC433C7;
	Thu, 28 Sep 2023 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695890120;
	bh=FSwConUjZIxe3YIjZXjdGETHRwEytleBmz3Wk6V8jsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tG6gu8nmBr//c+0sxeGNAKgiqhPzAheOubFfmZHix/2WQKZ40yLhBzw93ow720DUa
	 pOqwYaAn4OG0t/EoWve7+iUQpy0ZsDNkdL4o+fiwVUDEsbkOAmHKmuwZQ7pjLa0EFl
	 YlhJLK222o1MVevD6Bg1NOddV+u13e79/mAusHqz7yI19sQHjH0b7F5qQsXW3bNwGt
	 1kfoUuJSBTQLl09IRPgW5Irfn30ENJMDshFkJDUqTyvvPx8p99TFAQuyIhV3cHCi7+
	 1mntMPVJz6GugJ6OzG0UN1DBgu5BEIXuDBwN7mGE+E0wunvUufvAgN+p848DLR4z5/
	 xDV7tGIPPDfjA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, coolstar <coolstarorganization@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rander Wang <rander.wang@intel.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230927071412.2416250-1-Vijendar.Mukunda@amd.com>
References: <20230927071412.2416250-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: fix for firmware reload failure after
 playback
Message-Id: <169589011676.2716296.8639160633859429574.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 10:35:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: WDUCRY627AOS44MCEVTH3HKNEBSDIWMY
X-Message-ID-Hash: WDUCRY627AOS44MCEVTH3HKNEBSDIWMY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDUCRY627AOS44MCEVTH3HKNEBSDIWMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Sep 2023 12:44:10 +0530, Vijendar Mukunda wrote:
> Setting ACP ACLK as clock source when ACP enters D0 state causing
> firmware load failure as mentioned in below scenario.
> 
> - Load snd_sof_amd_rembrandt
> - Play or Record audio
> - Stop audio
> - Unload snd_sof_amd_rembrandt
> - Reload snd_sof_amd_rembrandt
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: fix for firmware reload failure after playback
      commit: 7e1fe5d9e7eae67e218f878195d1d348d01f9af7

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

