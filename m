Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820077D33E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2934DF5;
	Tue, 15 Aug 2023 21:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2934DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692127182;
	bh=phJbuXz6HF2w4yjZZxtGzNVVKy2Ep36uFxfwru/qKdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DiPN5mWt4HOPDisicpTLvAEh6ZIAbT3q3/3dJpHpNMUNaGj7JXncKzKif/8Qg/INB
	 SF5w2iXPS7p4fsDGupoIgeVhXJpQKdpHbQSZTzkFpknLcUMKR+pJsxxUFz91faPTqB
	 EMqpfASsUc9W2M/V+KUcaACR4bPykjR2wJjv4i2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B39BF8057D; Tue, 15 Aug 2023 21:18:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9580CF8057A;
	Tue, 15 Aug 2023 21:18:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 984EAF80553; Tue, 15 Aug 2023 21:17:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 27D4CF80536;
	Tue, 15 Aug 2023 21:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D4CF80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oIeiwQyv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1C6D660C6;
	Tue, 15 Aug 2023 19:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2936C433C8;
	Tue, 15 Aug 2023 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692127066;
	bh=phJbuXz6HF2w4yjZZxtGzNVVKy2Ep36uFxfwru/qKdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oIeiwQyv2KlcnqwHhiOdhm/qsEiVQzcfDXPPGNVECnyn8MiSNQXae0OXsnUj3oJeJ
	 ekhSA9a0qXttfqCptpIIf2i9vlfS86chRGAinL+GQVpq/wJarwtCz8DyqOd3eNWFCh
	 tWy2jv5ddZaeeHvS+xmntqZI9+uiP3lp0GxHgesT92bbW/QwpSsHEZSZyXOGiR886d
	 aDEFdza80MuIHUGEmtOEjaztHyk+hTg4AYP6LH2mhRP8nOgKcaBiNAVPThnGgcjsSY
	 Xnjb+2L+hDgXYJGCRl/BxeQoob0ZLsNrD46HB1G1QJj3Ch+qqeW0YNx/+/0dEx6x2e
	 ZVLqoRHkwU87g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
 daniel.beer@igorinstitute.com, Jonathan.Cameron@huawei.com,
 luca.ceresoli@bootlin.com, luzmaximilian@gmail.com,
 u.kleine-koenig@pengutronix.de, Li Zetao <lizetao1@huawei.com>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org
In-Reply-To: <20230810114738.2103792-1-lizetao1@huawei.com>
References: <20230810114738.2103792-1-lizetao1@huawei.com>
Subject: Re: [PATCH -next 0/2] Use devm_kmemdup to replace devm_kmalloc +
 memcpy
Message-Id: <169212706337.68178.8111393898316449081.b4-ty@kernel.org>
Date: Tue, 15 Aug 2023 20:17:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: YU7OQZIXIUICITFHS4VIXQLPCGYCA74Q
X-Message-ID-Hash: YU7OQZIXIUICITFHS4VIXQLPCGYCA74Q
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YU7OQZIXIUICITFHS4VIXQLPCGYCA74Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 10 Aug 2023 19:47:36 +0800, Li Zetao wrote:
> This patch set use the helper function devm_kmemdup() to replace
> devm_kmalloc + memcpy, which is the same as implementing the function
> separately.
> 
> Li Zetao (2):
>   ASoC: tas5805m: Use devm_kmemdup to replace devm_kmalloc + memcpy
>   ASoC: SOF: ipc3: Use devm_kmemdup to replace devm_kmalloc + memcpy
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas5805m: Use devm_kmemdup to replace devm_kmalloc + memcpy
      commit: b0a4c7f5921d9c2998bdd767a93d995786d72adc
[2/2] ASoC: SOF: ipc3: Use devm_kmemdup to replace devm_kmalloc + memcpy
      commit: 29681184da28babc990a66e197d27ab98f2027af

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

