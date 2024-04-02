Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F1896024
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 01:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3EE2C25;
	Wed,  3 Apr 2024 01:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3EE2C25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712100616;
	bh=oKQ0VJW7bHDzLwWr3TpWv+xHaaTKQu+N/4JyHM68B1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JBI6aILImzWqKKgfSos4qflpP+zAAZUdO7Ys7Gqq/4WvWqzoVvSSWD4wd2l8ehH3K
	 ZopvTjiyuNBwJawRHWtDfwJXlV2wGUnwuwxVKhJvKP2pAcclKwozk0CO9hzQcVPWan
	 OgZpA7+g/VYW7gMcpnNDrmpFk+27Z6HJBtv3OBXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65A3AF80589; Wed,  3 Apr 2024 01:29:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 138B2F8057B;
	Wed,  3 Apr 2024 01:29:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21D98F80238; Wed,  3 Apr 2024 01:29:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36991F8016E
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 01:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36991F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qLIyZLxX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3234D60765;
	Tue,  2 Apr 2024 23:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CE8C433F1;
	Tue,  2 Apr 2024 23:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712100570;
	bh=oKQ0VJW7bHDzLwWr3TpWv+xHaaTKQu+N/4JyHM68B1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qLIyZLxXLNgeDMDYzwXORviptrgRd1XrD0Ztt0yrpeG9RMOG0BJcK+JDVMxSRPbKS
	 BTrFfmCBbwDsKNnVx4dTugJY79oySnTCD/A1PPZ/2tECgObRSd5Z86rFfRSUOGEHXU
	 JB9w+8yVJhR/sit5Z8w+pKGyMF1asLdGnl7RWZVZUPOQju1CS56VESVB+a4OlFC0tP
	 A85r0egfur7VqJGPSo4yhFktoE5l0N53v035eLS/z0cexa0SvSJp08IacvkWF0n4N1
	 rZZa2DpVe7gHJUWMEjOou+mp/9/FtJMHn8NrHYxB2FhX8q7tZJwyQG1mYhA+jR10n4
	 pHSkjh2gyjG3Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240401100210.61277-1-rf@opensource.cirrus.com>
References: <20240401100210.61277-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] ASoC: Use snd_ctl_find_id_mixer() instead of
 open-coding
Message-Id: <171210056940.279166.10362892119296653551.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 00:29:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: BOXPX7XNAJLHX7EKXDW62UEYDGTTIO7B
X-Message-ID-Hash: BOXPX7XNAJLHX7EKXDW62UEYDGTTIO7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOXPX7XNAJLHX7EKXDW62UEYDGTTIO7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 10:02:07 +0000, Richard Fitzgerald wrote:
> The first two patches change snd_soc_card_get_kcontrol() to use the
> core snd_ctl_find_id_mixer() functionality instead of open-coding its
> own list walk.
> 
> The last patch adds a KUnit test for this, which was tested on the
> original and modified code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ALSA: control: Introduce snd_ctl_find_id_mixer_locked()
      commit: 08ea486a61451189b190c7b89e406b889cf693fa
[2/3] ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of open-coding
      commit: 897cc72b08374c1224a9ded03c82dfc8e41f80c2
[3/3] ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol
      commit: ef7784e41db73f3d31ce545227ebba4483479a26

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

