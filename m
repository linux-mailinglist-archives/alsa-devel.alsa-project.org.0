Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B190C9DA780
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2024 13:14:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 259502973;
	Wed, 27 Nov 2024 13:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 259502973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732709649;
	bh=Tv5cvq2RgINXn8PDA5t2XSd2bmj+HeJ5oa/gl47q78A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OjPYYiOs3i/7lJRoXRW334o7TDXUbxJh+fwXtDcjJWpBN0TAEE68UUPSTFUXza7QN
	 P+XENvOvUP5xGHP3f0TDHid6ZESH8Fl9NWwpa4mu7q0Xtottjv09fAdbYN/NzvDcn8
	 L0SgRtbAnonQOdBUWzZdD72EG0ugCAw8iq+/PZ1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E98FEF80528; Wed, 27 Nov 2024 13:13:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 877E1F80528;
	Wed, 27 Nov 2024 13:13:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BAE1F80236; Wed, 27 Nov 2024 13:13:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C72AF80134
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 13:13:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C72AF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fr8e21Wa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A5455C5639;
	Wed, 27 Nov 2024 12:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E24C4CECC;
	Wed, 27 Nov 2024 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732709606;
	bh=Tv5cvq2RgINXn8PDA5t2XSd2bmj+HeJ5oa/gl47q78A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fr8e21WaORVm3rr7fng1OjQIehgnDrbBCsfivQAVs5Zq4iqvomDxLgO2/m2KHFMiI
	 GPeaNtV6K3D8iRQG5FU+IE6PNJI0Tal9xdgZIMny0BjbuDD9X9RaIxNbg+/1MkAd9x
	 KcfaG0gLr0PECSpv2UqjwnI0leEQzY8BepN6CsVcQFrrVWWiZfbz+6AweruKTxle6H
	 jRHrBStcSIJ0C1PiNutJ2lmuu82mw2V+o7LJ80lv07dbMR+qiuKA1FMwsMwtx00A9n
	 xXvC2SYDH3NQvHU9bw2Xo/odVd7kVB42UVu/IQdSyaM6IvlpwqazvZ4mTSgw/RiT0b
	 4tl0LMpFuXdyQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 mario.limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Tim Crawford <tcrawford@system76.com>,
 =?utf-8?q?Attila_T=C5=91k=C3=A9s?= <attitokes@gmail.com>,
 Techno Mooney <techno.mooney@gmail.com>,
 Jeremy Soller <jeremy@system76.com>, Malcolm Hart <malcolm@5harts.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20241127112227.227106-1-venkataprasad.potturu@amd.com>
References: <20241127112227.227106-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD
 entry
Message-Id: <173270960306.162310.9745646028251378835.b4-ty@kernel.org>
Date: Wed, 27 Nov 2024 12:13:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: OZS5TMXDCDA6VH34BHCTALOY5SI2OH2C
X-Message-ID-Hash: OZS5TMXDCDA6VH34BHCTALOY5SI2OH2C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZS5TMXDCDA6VH34BHCTALOY5SI2OH2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Nov 2024 16:52:25 +0530, Venkata Prasad Potturu wrote:
> Add condition check to register ACP PDM sound card by reading
> _WOV acpi entry.
> 
> Fixes: 5426f506b584 ("ASoC: amd: Add support for enabling DMIC on acp6x via _DSD")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry
      commit: 4095cf872084ecfdfdb0e681f3e9ff9745acfa75

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

