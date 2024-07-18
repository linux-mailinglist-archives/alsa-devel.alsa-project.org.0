Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93744934FB7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2024 17:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22818E80;
	Thu, 18 Jul 2024 17:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22818E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721315664;
	bh=oWv1oGl/GTLJXgxvgrl4uvx3M8z/wDMz5cxH6HjEBFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MQxh+ppO5jamOngmlcZpeaWI7jCJDmTkzTBwa9mMBJFADWEcCEslPN1ouhNPaLO0a
	 Mm2Qpuk65b4SX8q/wYbtbmisQOSCzMrYQfX+GP3aDCyLuPYonZibgegwK9hUFtZ+ZI
	 yrS6KtGF/Gq87U5JB6b7vp47P1nXkhtRirXVhQ1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A527DF80589; Thu, 18 Jul 2024 17:13:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9715BF800FA;
	Thu, 18 Jul 2024 17:13:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9BB1F8026D; Thu, 18 Jul 2024 17:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A662CF800FA;
	Thu, 18 Jul 2024 17:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A662CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VDiKjJLy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03C5ECE1A33;
	Thu, 18 Jul 2024 15:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37863C4AF0D;
	Thu, 18 Jul 2024 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721315611;
	bh=oWv1oGl/GTLJXgxvgrl4uvx3M8z/wDMz5cxH6HjEBFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VDiKjJLyay2P55bNcVqZKBQqtjm75AqLk52Qd/EoDF6sAQo9nFkLDj/YmgUqNiw/S
	 EspfbUPrA4X9B9aAU/eIAB46e7gCmT/+C09q56+moPSvJoNZWXgkzy6opPeqD54oYX
	 yqNQm1l04zKjovLvbrPtAzw9+Yt3hEGQM8P3+0rXBY9WIxauCKarERyP6hWFMI26k3
	 IJBcmMHZZ2SLG8MQBmqWrEhewue8kUknQh9YAWvlRjVB7whZdhCAamzP96++pqZrhv
	 avFnhB9WMm9RS2900Fq6ngikRr/S4/qLshaiv2mUvi1nmw7ozXD5SFVt0fJACH07JB
	 DZHftEJEzpkWQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240718062004.581685-1-venkataprasad.potturu@amd.com>
References: <20240718062004.581685-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: sof: amd: fix for firmware reload failure in
 Vangogh platform
Message-Id: <172131560794.82656.13194361470516878188.b4-ty@kernel.org>
Date: Thu, 18 Jul 2024 16:13:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 5MP4K2AASP24PKCZNR7AZ5FTP55TMHTD
X-Message-ID-Hash: 5MP4K2AASP24PKCZNR7AZ5FTP55TMHTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5MP4K2AASP24PKCZNR7AZ5FTP55TMHTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 Jul 2024 11:50:02 +0530, Venkata Prasad Potturu wrote:
> Setting ACP ACLK as clock source when ACP enters D0 state causing
> firmware load failure, as per design clock source should be internal
> clock.
> 
> Remove acp_clkmux_sel field so that ACP will use internal clock
> source when ACP enters into D0 state.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sof: amd: fix for firmware reload failure in Vangogh platform
      commit: f2038c12e8133bf4c6bd4d1127a23310d55d9e21

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

