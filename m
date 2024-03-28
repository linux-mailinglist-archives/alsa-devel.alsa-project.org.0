Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E647A890CD9
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 23:02:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC1C2CAD;
	Thu, 28 Mar 2024 23:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC1C2CAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711663358;
	bh=c6tBfXAorSFrCAwy+dAcRla3vtX3ePerZfaK2+3P1Os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hc2XFZ6ajmAKIVX3td2J2Sgqt8ojuWzpZSY78Npeu6WS8ZOuBIGM/mylW4w1bty6B
	 /39Tl7JDFoB0xY6lX+DlOm8YI7Sj5ylqMlD7GXWNksjjoZQEWPGXVhHvGjGFDE1yg3
	 OT5W/34ijeqLy++y2uw6Yuht3EBErRgD6emb83Ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 576B7F805AF; Thu, 28 Mar 2024 23:02:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A185DF8057C;
	Thu, 28 Mar 2024 23:02:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B36EFF8025F; Thu, 28 Mar 2024 23:02:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97010F80093
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 23:01:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97010F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eTmGNy4x
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68B9561044;
	Thu, 28 Mar 2024 22:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935F0C433F1;
	Thu, 28 Mar 2024 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711663297;
	bh=c6tBfXAorSFrCAwy+dAcRla3vtX3ePerZfaK2+3P1Os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eTmGNy4xAJbgQ3Iuf5oISoOo6PcIVzpw/Wz77nZBmeW5yWWKxw/s6IuVXhDWa9Q5W
	 azi4rjqcTixylT6tEWqtgLMyKAV8A6AG3LKM7yOmfruJXqYrDx1hEtqmWb/M8dIgz7
	 qzByJotMu2EZ5kkfBz93CFCkb28ZDZGzdm8Ix2xW32lAQPIqFP3y3MFkrejW9yDuJZ
	 bfkYKfuzdC1ydkgEYmwE5Tm7zDSJqBUemm1f/T/tuNqWN5rZnqWZ0dk18BaxIafvGd
	 h2OLzacNUWAs4Wa9KkTrMLwTNpjNxWwRD5zwQ/uPRNA7e/ZaXt0D0F6PlCsxi/R3Vj
	 uM7+E5G0j/WIw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
References: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: amd: acp: fix for acp_init function
 error handling
Message-Id: <171166329431.152246.4663516656562563292.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 22:01:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: MS6RDAN6SBCQ3FQKOGLHOZZRUTCCKB3V
X-Message-ID-Hash: MS6RDAN6SBCQ3FQKOGLHOZZRUTCCKB3V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MS6RDAN6SBCQ3FQKOGLHOZZRUTCCKB3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Mar 2024 16:16:52 +0530, Vijendar Mukunda wrote:
> If acp_init() fails, acp pci driver probe should return error.
> Add acp_init() function return value check logic.
> 
> Fixes: e61b415515d3 ("ASoC: amd: acp: refactor the acp init and de-init sequence")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: amd: acp: fix for acp pdm configuration check
      commit: 4af565de9f8c74b9f6035924ce0d40adec211246

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

