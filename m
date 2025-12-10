Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63559CB1B59
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Dec 2025 03:22:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A61601F5;
	Wed, 10 Dec 2025 03:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A61601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765333351;
	bh=/uxoRzbJrRjPDXsTarshYtHtLiesJNJtU9NUEQj7nQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tr82KrebC6uhdJWA/sfGl9w7ChIXN77TCqMPdKVRDV4N3kn4iV+Rl+kG4ye1BUl5I
	 aERUn/JiXNX0xZeSUX95U8low6obQ049PvSPzI+CdLXxSL8lCwA+jigl8iQdrRXwfZ
	 NUm2aMDxNqFx8PT/5bvUj2TdRFBFzj+VV83a7Lkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28EB1F805D6; Wed, 10 Dec 2025 03:21:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 572D7F805D3;
	Wed, 10 Dec 2025 03:21:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4A60F804CF; Wed, 10 Dec 2025 03:18:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8923F80088
	for <alsa-devel@alsa-project.org>; Wed, 10 Dec 2025 03:18:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8923F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WMm0aZ/P
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F6FE60135;
	Wed, 10 Dec 2025 02:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5D8C4CEF5;
	Wed, 10 Dec 2025 02:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765333112;
	bh=/uxoRzbJrRjPDXsTarshYtHtLiesJNJtU9NUEQj7nQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WMm0aZ/P2PC4Il8Qg6nIopEeYmDJs4DWHoy2ukRi+hIipW0ZqB5F8wls9K9bwbS6c
	 1NO/omNrCbg/AbHkCg1+7v0Txt1U9SOZBG5drF8qeBmobU18CxeKdBcmrApScD5jpo
	 Bs6yeRZMc0XcPhj+FfZYbGMkp5AcZHkyZR/BtnR60ERzXHP3HS/pPE2wqgmOaK7xdZ
	 6drkvjOqJ6L0gZXRsXFAGvLUe5Y9hYmIpEca2OfkzD6hEQacOAIdp844Tspn7vwZtn
	 R/KsC5bV2eeHVplhOjR7S6R6uS2psCrXmG6a3qyIC1XQpeoduWSiLexFJJGMNxAzPW
	 DLveTR48fFJjA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com,
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20251203120136.2591395-1-raghavendraprasad.mallela@amd.com>
References: <20251203120136.2591395-1-raghavendraprasad.mallela@amd.com>
Subject: Re: [PATCH v1] ASoC: amd: acp: update tdm channels for specific
 DAI
Message-Id: <176533310879.649124.15118877289373769932.b4-ty@kernel.org>
Date: Wed, 10 Dec 2025 11:18:28 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: QNXWNMQC7RLP7BHSZ3XF6KEDRXWFTSZV
X-Message-ID-Hash: QNXWNMQC7RLP7BHSZ3XF6KEDRXWFTSZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNXWNMQC7RLP7BHSZ3XF6KEDRXWFTSZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Dec 2025 17:31:34 +0530, Raghavendra Prasad Mallela wrote:
> TDM channel updates were applied to all DAIs, causing configurations
> to overwrite for unrelated streams. The logic is modified to update
> channels only for targeted DAI. This prevents corruption of other DAI
> settings and resolves audio issues observed during system suspend and
> resume cycles.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: update tdm channels for specific DAI
      commit: f34836a8ddf9216ff919927cddb705022bf30aab

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

