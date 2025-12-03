Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FAC9F615
	for <lists+alsa-devel@lfdr.de>; Wed, 03 Dec 2025 15:56:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4587601D1;
	Wed,  3 Dec 2025 15:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4587601D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764773799;
	bh=heEwWGYaT6SNGxBWgFrYIuACgmsZuCCbIJrxQibpcqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iNoC9PXIQZcsZvggriWnitc7fI3szVmRrOQgCA8MrBceIyfM22Pufe9CWuu5g/Wf/
	 nzKPB6Smpejf994AobsT2ZShSuE0ziDZnec0YiEmDY61wQC0O5kB5TiMXy/OigplFh
	 +iPKtA9Ev+lCuOVEEZlBLLv9mQnbLods2oXNHLSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0B94F805C2; Wed,  3 Dec 2025 15:56:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D79CF805C8;
	Wed,  3 Dec 2025 15:56:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B59FF8051F; Wed,  3 Dec 2025 15:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B80C1F80269
	for <alsa-devel@alsa-project.org>; Wed,  3 Dec 2025 15:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B80C1F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t9pLrSHt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB8A3441CD;
	Wed,  3 Dec 2025 14:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFD3C4CEF5;
	Wed,  3 Dec 2025 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773653;
	bh=heEwWGYaT6SNGxBWgFrYIuACgmsZuCCbIJrxQibpcqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t9pLrSHtmoNs3ktOHnroaQ5XFE56xllTUiICQVgbqdkJipVDLRhrM5J4AwbfIuWNq
	 eTHob3DuktZAGL1q9KCbN4ROG4Jyh4VVzucHP9V750CWfuRCMmPjgMywxLCNwQc4Sm
	 wEhmbqQzL1CCrvuNLuiUFYWfrNCfTQdKtXfUB+fJi6UetLw1MpzGHdJwfv3jwwYhBU
	 Et6WWfaHGtNe8w2e6Co+xmUO4BtCzHvdmv3l9ngsuCgtm0Qg9BUy0qnd0VPgqnV9c0
	 S8hyUrMaFatr/wVrEoB//OcPE6hxE6tbbAmJ6t+zj5IOoOuakz5sjhemLaY6J9zdfh
	 I4ipQSI22eFZg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com,
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
References: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
Subject: Re: [PATCH v1] ASoC: amd: acp: Audio is not resuming after s0ix
Message-Id: <176477365049.48347.16119915786526806162.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 14:54:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
Message-ID-Hash: 3AZ5SVPIBUNBWURBP4XNXYEVULHKW34U
X-Message-ID-Hash: 3AZ5SVPIBUNBWURBP4XNXYEVULHKW34U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AZ5SVPIBUNBWURBP4XNXYEVULHKW34U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Dec 2025 23:26:14 +0530, Raghavendra Prasad Mallela wrote:
> Audio fails to resume after system exits suspend mode
> due to accessing incorrect ring buffer address during
> resume. This patch resolves issue by selecting correct
> address based on the ACP version.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Audio is not resuming after s0ix
      commit: 3ee257aba1d56c3f0f1028669a8ad0f1a477f05b

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

