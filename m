Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386FB25402
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Aug 2025 21:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D629860200;
	Wed, 13 Aug 2025 21:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D629860200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755113756;
	bh=Oa/mn1bIvlYCCZjy/9e9Ga8TzPTrAjMEY3+qdBPpnMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mgzm0AXkXnmnTE9kOsjvPyjwgl+CtgEVKqbChebLnZGvR8V6sm9sXGQm+40fNfPgn
	 fJObtjCCU9zWfLEH3qhgzTwc8xL8UeBn0B8wyU2dZdDSZlJhS8WUPP3P6iFeEmQ8Mj
	 Vl0ErDJrnETb01Fkl5h2ODtW3Sy1KEVM8KJT3jbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01239F805CA; Wed, 13 Aug 2025 21:35:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B19CDF805C4;
	Wed, 13 Aug 2025 21:35:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 609BFF8045D; Wed, 13 Aug 2025 21:34:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E6FFF800F3
	for <alsa-devel@alsa-project.org>; Wed, 13 Aug 2025 21:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E6FFF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=giytaB1T
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD0065C06E3;
	Wed, 13 Aug 2025 19:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132ACC4CEEB;
	Wed, 13 Aug 2025 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755113691;
	bh=Oa/mn1bIvlYCCZjy/9e9Ga8TzPTrAjMEY3+qdBPpnMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=giytaB1Twi28I0MYrwISILn40Uh/YaH0AH9XaUa2d9BpaocwWypjcDoP1qQTMQJaR
	 K8U3d0bB25f8hpzDR6sqHW38Qo7Ja/YtrY3XO/w1ZrAjaeF2zsfw34uCJ1ZEdcBznS
	 wOV8VqLZh+8C6HAp6BaylYdvyKuX74tE/HcHylr88YM4OjCR6BdzUKoLvbymBs/c5S
	 ycnrMi9NUrIJ8+9smUwFw2ZaRchWU+XXiKC44ZVj3JVZRh264mCIXX9zYWZTIuJQIx
	 Hn8l2BKWDeMd23ypOXc9RA4Ugp8ctbpS8RO2XoXKr5aObb4a70RqQSr9AeN6JiKmkR
	 nuUO8UEh43I0w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Baojun Xu <baojun.xu@ti.com>
Cc: andriy.shevchenko@linux.intel.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, 13916275206@139.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250730053236.57643-1-baojun.xu@ti.com>
References: <20250730053236.57643-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Normalize the volume kcontrol name
Message-Id: <175511368980.254480.12270174451313958597.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 20:34:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: DBE2Y5JUQMD2ISNJRH25F4BBFJDNRKAO
X-Message-ID-Hash: DBE2Y5JUQMD2ISNJRH25F4BBFJDNRKAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBE2Y5JUQMD2ISNJRH25F4BBFJDNRKAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 30 Jul 2025 13:32:36 +0800, Baojun Xu wrote:
> As more devices become supported, add "tas2781" as a suffix before the
> TLV name, correct the DVC step, and normalize the volume kcontrol name.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Normalize the volume kcontrol name
      commit: 47ed64db8c17eb16541098add865178fb7e68744

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

