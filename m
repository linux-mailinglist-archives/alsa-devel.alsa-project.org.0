Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C29AD7859
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jun 2025 18:36:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1EDE6017C;
	Thu, 12 Jun 2025 18:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1EDE6017C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749746176;
	bh=uwrwGgQNcdDFRoVagZA9ucg/PWa1ct8dD/273Ttz3G8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=usJjpsjectkrKIbY472v6gDQb7Ow9hcDtCeODy+aolV4khbexylwNvFJ9J6bkrkyx
	 fE/pv4sLIDFCgzgYxGm/tXIZ8Ou7jPnAQrvKC64rtYhGJNZeEpT3Vy1Zc3VuGtTgth
	 kjcBWChdeiX3QxB0+4o39ys4BcjCAGd1EAPkOENc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2E04F805C3; Thu, 12 Jun 2025 18:35:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7F3F804D6;
	Thu, 12 Jun 2025 18:35:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E3CF804D6; Thu, 12 Jun 2025 18:35:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A7C9FF800BD
	for <alsa-devel@alsa-project.org>; Thu, 12 Jun 2025 18:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C9FF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H8TFM9tU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69A925C674A;
	Thu, 12 Jun 2025 16:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A92FC4CEF0;
	Thu, 12 Jun 2025 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749746136;
	bh=uwrwGgQNcdDFRoVagZA9ucg/PWa1ct8dD/273Ttz3G8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H8TFM9tUYQxmbPMmZ6rfs9MAICURdZeqpO4FZ7QO/UxJD9uYRUDrLY0iAFyLrx92x
	 4wazWsGg92hCdgreJ8/gX/ZnpEIIAb6x/Gb3PwOrnN5quiTrmwCMRZDs4pFhJ8KUc8
	 vgifO1e5l82TDvVhNqnroFX8SakB/wPvCNGvOiKNzN3TzQlj7GdLJAHdJzjcDBLcAl
	 1G3jdiRh1uZw0Muiyvi6mQ6FTh30zBfwIRqcX5utg349jhBX00BEDbAPYt5PZaMYmc
	 LciWo728P7X5vLy04We8ScdQaKUIuD/mzTH23bwkf+xzvOC4k4xPd6Q0pci7OOhWf3
	 R8vhusYCx+F7g==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
 13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com,
 jesse-ji@ti.com
In-Reply-To: <20250612044252.1025-1-shenghao-ding@ti.com>
References: <20250612044252.1025-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Move the "include linux/debugfs.h"
 into tas2781.h
Message-Id: <174974613496.91503.16994166821243155893.b4-ty@kernel.org>
Date: Thu, 12 Jun 2025 17:35:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: QPQTOBME4ZBF3E7BWS6XZLJUBFWH2KMW
X-Message-ID-Hash: QPQTOBME4ZBF3E7BWS6XZLJUBFWH2KMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPQTOBME4ZBF3E7BWS6XZLJUBFWH2KMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Jun 2025 12:42:52 +0800, Shenghao Ding wrote:
> Move the include linux/debugfs.h into tas2781.h for code clean.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Move the "include linux/debugfs.h" into tas2781.h
      commit: 8a5a5cecb79058b608e5562d8998123a3adb313c

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

