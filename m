Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56687B42BCE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 23:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C63D60200;
	Wed,  3 Sep 2025 23:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C63D60200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756934640;
	bh=oYD045PFx4IfNHTb8kF36GnmgwvDxgzMVkLuEyhReU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rEWABZ93F6yuxxmgvSAqr3duOk53T5JvpFLQVga1q20kZ7J9NicXlNk5G1/+i/X4u
	 wxG3jaBwh/JPcTcxtvzwMkWkgxujDv3BcujZe0a+1KniPj51xiBtD5nbzBdI7wE/IR
	 2s1nts4O4A3OuXn6QorD0m0XSSuLPAziM1oFjrxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77899F805D4; Wed,  3 Sep 2025 23:23:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90013F80527;
	Wed,  3 Sep 2025 23:23:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E4CF804D6; Wed,  3 Sep 2025 23:23:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15323F8011B
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 23:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15323F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ShGCTxeB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FE4F6013F;
	Wed,  3 Sep 2025 21:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E705C4CEE7;
	Wed,  3 Sep 2025 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756934577;
	bh=oYD045PFx4IfNHTb8kF36GnmgwvDxgzMVkLuEyhReU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ShGCTxeBX/lrduwrXSmirkUcRIIJNOmhZB3TUI7soO7c+0TjrVEzVz/rw+2CBhw/Z
	 IQsBXLo6GDRyJhX2HzKaWtUX8v7h148A0qnCwBsYOW9ViCIlbFxGk/eMzjU9gC/Orf
	 V/f53B4JkxYn6Z66HEUYRjIUc1MCG1Lt2xrC2XliV1rLSUbwTD56QjKrYxTZX/KzqY
	 iGdBYeHKALKaHpv14sMbgwIABax3STRcDPR+G2kbOHaOSBBq5SpgDHVkpUzqsp9Pzs
	 b5HeXZ8481m3g++GKFAIUm2xkVOuBk6nGFhfZvi6Yk7rV1VvoLQ6qenDq84gUhYtyW
	 rZ/9ZBgr5fwYA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20250903171817.2549507-1-syed.sabakareem@amd.com>
References: <20250903171817.2549507-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: amd_sdw: Add quirks for some new Dell
 laptops
Message-Id: <175693457437.292968.9677235604719840326.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 22:22:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17
Message-ID-Hash: GTTA5EAPLPRPQS2MMM5Y725YB3V4XPZR
X-Message-ID-Hash: GTTA5EAPLPRPQS2MMM5Y725YB3V4XPZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTTA5EAPLPRPQS2MMM5Y725YB3V4XPZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Sep 2025 22:47:47 +0530, Syed Saba Kareem wrote:
> Add a quirk to include the codec amplifier function
> for Dell SKU's listed in quirk table.
> Note: In these SKU's, the RT722 codec amplifier is excluded,
> and an external amplifier is used instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: amd_sdw: Add quirks for some new Dell laptops
      commit: 3254959b4dd065eae396cf78ccc1361460b2f53e

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

