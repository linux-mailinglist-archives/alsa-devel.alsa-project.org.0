Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66FA6C1F0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Mar 2025 18:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92190602FF;
	Fri, 21 Mar 2025 18:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92190602FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742579738;
	bh=eeYxR7f0iZY1hKXnypXqzksbgvicyU2uUIq3yrFEag8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=njqi9jpmeRCHWmyrVv1r9c4kOw2LdGgVANyL9m5llQsL722tp5GMe5+A4ELJmS+uD
	 MbUXHpmotyermBUXA4ur7w5PK17skmrsYyTOVTNgcglHjy16DZCecPTLQloZxds7xq
	 HBl5XDAhXjO/wO1fAyt2oh/9uVNxUFSKjCD6j46k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F6D4F805B1; Fri, 21 Mar 2025 18:55:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01E66F805BB;
	Fri, 21 Mar 2025 18:55:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCD07F8014C; Fri, 21 Mar 2025 18:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD3A9F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Mar 2025 18:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD3A9F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MSDvU2HF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C12394359D;
	Fri, 21 Mar 2025 17:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1799EC4CEE3;
	Fri, 21 Mar 2025 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742579696;
	bh=eeYxR7f0iZY1hKXnypXqzksbgvicyU2uUIq3yrFEag8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MSDvU2HFy2pRCbKSWUbeugzG7hn07ukshx+wcLjxPX8gx3dlQxRASUmk+Mk9hHep0
	 oXiEJ6i8w1Cw09ZRwSN2D9XegkbERXwsQWRDJP3njd4MnC4jHBa9Ml0gp8IL3hkSQL
	 yqNBP/l66mDoBewEY10VjadXPK85gCmXvXykBMgOG/xAg3xXl9bLwfw+0yG/2774ph
	 8NJOoL6nHjITXkyUEJhCz0YxCEuk7574O+P02bWE2WnzI6zP8RtI2/po6e9aTuLJuC
	 kkVMXBCe9631PD+/HgF2+wU7XrF/LhYzd8qRaHsNVmIxHz3xrA+c3+gm2j03qiwHT/
	 JftuuHx8QtInw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "end.to.start" <end.to.start@mail.ru>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20250321122507.190193-1-syed.sabakareem@amd.com>
References: <20250321122507.190193-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: update quirk data for new Lenovo model
Message-Id: <174257969276.2379177.13162726793964465058.b4-ty@kernel.org>
Date: Fri, 21 Mar 2025 17:54:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535
Message-ID-Hash: V34YOQOBUMDEK3LGQNZLHN2UKF5Z5MLA
X-Message-ID-Hash: V34YOQOBUMDEK3LGQNZLHN2UKF5Z5MLA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V34YOQOBUMDEK3LGQNZLHN2UKF5Z5MLA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Mar 2025 17:55:03 +0530, Syed Saba Kareem wrote:
> Update Quirk data for new Lenovo model 83J2 for YC platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: update quirk data for new Lenovo model
      commit: 5a4dd520ef8a94ecf81ac77b90d6a03e91c100a9

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

