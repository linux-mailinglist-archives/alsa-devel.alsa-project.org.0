Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D8AE8BA7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jun 2025 19:40:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D904601EF;
	Wed, 25 Jun 2025 19:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D904601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750873227;
	bh=ExdVo+xqNNHCrzpD1GLmq96PFFu7gyIf98fc4flcU+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xj2LXJPYIK7NhMtKT51Zseki0B/OjynrTrQwq0LKv7+RUnKn/vwQGCAl2GGAeFKIV
	 7lenRx8rR+wPitmQ01TCIV5DSS/wZ16my7IQhqhrfudan7RElrHmCsDNRdaTTWUHFd
	 BwfLFNy4f4ymjOS5ySuhBNbyCL4rNL7ncMBauICk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42FDFF805C3; Wed, 25 Jun 2025 19:40:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 093DCF805BE;
	Wed, 25 Jun 2025 19:40:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAC6AF804FB; Wed, 25 Jun 2025 19:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 751C3F80236;
	Wed, 25 Jun 2025 19:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 751C3F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HCq2UUXm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1FCB5C5401;
	Wed, 25 Jun 2025 17:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1FBC4CEEE;
	Wed, 25 Jun 2025 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750873194;
	bh=ExdVo+xqNNHCrzpD1GLmq96PFFu7gyIf98fc4flcU+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HCq2UUXmnpJnMHOp1LKjbUbMqcUjFgHFhgjCtrtXmiqEa3Tu7sLNtf0c/LOaacRZu
	 LcKlDFNNKyM9kbtofh5TiHAb2GdfMZ1FeKqaUVCFjV/0PzQpkwfyGZDPHYE1cNBfFy
	 8Yb5bi6gsNyEN3iU0Kui9N6y6FTvQqxOEyFx4IIqbhtox2BX2ozbj574tJuBa100lT
	 28ZYUz1bz9Aoj18kSMGkKgb78QoNOrEkUTqKxl/YGNHRZFKILpv8h13FdKrQf+JJYK
	 6RVFu2C4HzcBw05TXyY3Gc/abUBDD6tjJoDwVL/2lveyJR+2Lm0uY41cMu60Ete9Ui
	 ycYADo8bFTeQQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
In-Reply-To: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
References: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] Add SoundWire machines for ACP7.0/ACP7.1 sof stack
Message-Id: <175087319206.198995.12597800532047615959.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 18:39:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
Message-ID-Hash: 3QY6SKKLCFUNUZURSPHRCFUZQHINYEGY
X-Message-ID-Hash: 3QY6SKKLCFUNUZURSPHRCFUZQHINYEGY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QY6SKKLCFUNUZURSPHRCFUZQHINYEGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Jun 2025 17:38:41 +0530, Vijendar Mukunda wrote:
> Add SoundWire machines as alternate machines for ACP7.0 & ACP7.1
> platforms with the below machine configuration.
> Link 0: RT722 codec with three endpoints: Headset, Speaker, and DMIC.
> 
> Vijendar Mukunda (2):
>   ASoC: amd: acp: add soundwire machine for ACP7.0 and ACP7.1 sof stack
>   ASoC: SOF: amd: add alternate machines for ACP7.0 and ACP7.1 platforms
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: add soundwire machine for ACP7.0 and ACP7.1 sof stack
      commit: 8b04b766714e93ca5a8021ff3408c9ef89d9eb85
[2/2] ASoC: SOF: amd: add alternate machines for ACP7.0 and ACP7.1 platforms
      commit: 59566923d955b69bfb1e1163f07dff437dde8c9c

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

