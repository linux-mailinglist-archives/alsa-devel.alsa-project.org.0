Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1207D832A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 14:52:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A013827;
	Thu, 26 Oct 2023 14:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A013827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698324727;
	bh=NOLoHnzeY7ifDKFi08/YLpZ4fplBppNDBG/daGdiaaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KSV9KCi/71SyHj5d+lCT7lnD8EXLqrpdznT/Kre4fvTqVumuChb7C5SimwTybbwT+
	 kR5dR2BRmAUZryJeboLyjvCs28scv5BmLiEOM7uE+ujMtxiWCFVhpM+lEoZT0loNO8
	 QyI8PZorUVee3zT/jN0ZwBhv0lR69aUvKpGp242g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04E44F8010B; Thu, 26 Oct 2023 14:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C774F80165;
	Thu, 26 Oct 2023 14:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F385F8019B; Thu, 26 Oct 2023 14:51:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2183DF80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 14:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2183DF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JMpXqQdm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88883CE08D4;
	Thu, 26 Oct 2023 12:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C341C433C8;
	Thu, 26 Oct 2023 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698324657;
	bh=NOLoHnzeY7ifDKFi08/YLpZ4fplBppNDBG/daGdiaaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JMpXqQdmK6o1dK2FEEHr/3yQTDePLYbW1wexUa7TFu8lErlagch+WOyiGFrLfWcsf
	 +0eQK4EsrYxltm194pvZIH9NFlaPBLyqXVk7Aar15itn4MOGof7hAQ2RhdnxxwQGLm
	 aenwggWDpFkBEhuArlIvhhq4KfK8SqogKRmeJNLjuAYKAZi36nWpE9etbGyn5TPlhN
	 nPLPGFSGZFB2HjQk4n6qe43ny9NSic2esjLi/C99AHbP83ULlL+7TmU3qXnHNnSffY
	 aIsvwjgWhiQb8dkkzHWL2CSU/YEbCzDYioHmFlPElHG/83ms/Y+idEGVyx3xZ+U4gT
	 xpcVRvTLVU95Q==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20231026082558.1864910-1-amadeuszx.slawinski@linux.intel.com>
References: <20231026082558.1864910-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs
 fails
Message-Id: <169832465621.47882.5981526590033509421.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 13:50:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: T2VO7TW3T2R672NOV2AWMJSHUU2A42C3
X-Message-ID-Hash: T2VO7TW3T2R672NOV2AWMJSHUU2A42C3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2VO7TW3T2R672NOV2AWMJSHUU2A42C3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 26 Oct 2023 10:25:58 +0200, Amadeusz Sławiński wrote:
> Error path in snd_skl_parse_uuids() shall free last allocated module if
> its instance_id allocation fails.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fails
      commit: 168d97844a61db302dec76d44406e9d4d7106b8e

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

