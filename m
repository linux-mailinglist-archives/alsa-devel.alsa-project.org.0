Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E312A7F16F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Apr 2025 01:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B2463245;
	Tue,  8 Apr 2025 01:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B2463245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744069779;
	bh=lk3294jy+i1Zyw8OTcudQdwcRZhXRnpOmKOB+6Wu+OQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hc/acW4pjT8p99wpz7h0VhXcv14ycM3//p411RYNZoczFWA13xtWl68IPsPf2YkkY
	 oBJt33X8w3c+ce02wtGgF7JcuMX1fDeiR+9o8/2DTz9zoQbthwNFJITOV3z3UK//uj
	 rWJyBCG5wRwOuwzZrl0v1GeI8uT8pxBFdyxdKGOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A639F8055C; Tue,  8 Apr 2025 01:49:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E131F805BA;
	Tue,  8 Apr 2025 01:49:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53CF7F8055B; Tue,  8 Apr 2025 01:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C5ACF8003C
	for <alsa-devel@alsa-project.org>; Tue,  8 Apr 2025 01:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5ACF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jT3mEt1f
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2481A61157;
	Mon,  7 Apr 2025 23:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348F1C4CEE8;
	Mon,  7 Apr 2025 23:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069735;
	bh=lk3294jy+i1Zyw8OTcudQdwcRZhXRnpOmKOB+6Wu+OQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jT3mEt1fowtbtLBkmQkjm0Ybtk21DKZOwUux2eVnQIU7WhcMEe2np/BS7e/CQb1Wo
	 dV/UYu8VeYj4UMIzGB3Kk86KRA7EeDbrKqjgfXvwGkRQDbj9CaLIQDNrptb0nxl64E
	 fQj5AXiWiZcGmE5xyERMQ8QGAjTH5TDb4OiTgSeuLMCk/f5STLfVuhUp5xfDANe/iM
	 /hPy32zMlTIuA+oq1KgmQOOSxp+DMUInUppb6gAy0YsJsAkbrdgsLPFN0ER/KBbWpj
	 KViDoWJtYFXaF7YAzkA1hPot3iAGFDTVy1c8HJq55O/BZhMZg/BJNnvJFduXhUa5ZM
	 UzFDOJCxV5xYA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Brady Norander <bradynorander@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 u.kleine-koenig@baylibre.com
In-Reply-To: <20250330130852.37881-3-bradynorander@gmail.com>
References: <20250330130852.37881-3-bradynorander@gmail.com>
Subject: Re: [PATCH v2] ASoC: dwc: always enable/disable i2s irqs
Message-Id: <174406973394.1344763.1510125660737652294.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:48:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: SKXF5SJAKUTB4AD3MTGHAV6SNYKLMIYM
X-Message-ID-Hash: SKXF5SJAKUTB4AD3MTGHAV6SNYKLMIYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKXF5SJAKUTB4AD3MTGHAV6SNYKLMIYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 30 Mar 2025 09:08:54 -0400, Brady Norander wrote:
> Commit a42e988 ("ASoC: dwc: add DMA handshake control") changed the
> behavior of the driver to not enable or disable i2s irqs if using DMA. This
> breaks platforms such as AMD ACP. Audio playback appears to work but no
> audio can be heard. Revert to the old behavior by always enabling and
> disabling i2s irqs while keeping DMA handshake control.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: always enable/disable i2s irqs
      commit: 2b727b3f8a04fe52f55316ccb8792cfd9b2dd05d

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

