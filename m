Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5774A8BE65F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 16:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A062D209;
	Tue,  7 May 2024 16:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A062D209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715093317;
	bh=3AZkPRrRshY93Q6JptuwVd5oSxqFvcglCxVwlhrT5zQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AZFnhFn0G5RrM9ATui8O0isKbsObe8PbPni+BSBT+EZbxaK44VtQ73aT5irrO2Za1
	 KGcF2jfq58CxtbxcBbl2EmANvZRsJp5efECajygBzOwlMoU5aT1guODH5US5aVcbcA
	 ptSFeCp/+M+neEb4M1VVqxY2cMBSm6dsBStivk9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC4CF805A1; Tue,  7 May 2024 16:48:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BF8AF805A0;
	Tue,  7 May 2024 16:48:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFCD8F804FB; Tue,  7 May 2024 16:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED652F8003A
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 16:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED652F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G+G9Ej0G
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 338326179E;
	Tue,  7 May 2024 14:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57BDC4AF67;
	Tue,  7 May 2024 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092509;
	bh=3AZkPRrRshY93Q6JptuwVd5oSxqFvcglCxVwlhrT5zQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G+G9Ej0GUDMbx8En+DsBZ6tKZztNh3L2Zko9I+4aPB15k0Ikcl2VZ94nFkuDtk9sr
	 GkMXmTMpjP/NxaaE+ceqJPFH6xX3q9tqHgQ1/buqO42jyBRm4eksWT26UmWZqU4YuO
	 cVOrZ4QMjGcm6SqRAq+QJ0HGqSsZqmQLprpvP8z5r6i0/3mKFu8vtWoAP+gge0LYJQ
	 1xhoHqI1qPLoH5NyVpzUzWQ3+5nmG3c7AptJf1P1ihWNqEKTijjqiaIb6jYkn1V4C0
	 TBxB5yp2VNoQxvjXYB2960/7apx38R5IQdwDiAsl+U2AVK00n3GIl+euIaA/KX7p9k
	 obDUYgQE+spOw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/9] ALSA/ASoC: Intel: clarify Copyright
 information
Message-Id: <171509250762.1985791.12584556363311325143.b4-ty@kernel.org>
Date: Tue, 07 May 2024 23:35:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: RIJD6AGWG2UUBR4FSP34OYWVPSMTT7P4
X-Message-ID-Hash: RIJD6AGWG2UUBR4FSP34OYWVPSMTT7P4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RIJD6AGWG2UUBR4FSP34OYWVPSMTT7P4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 May 2024 09:03:50 -0500, Pierre-Louis Bossart wrote:
> This patchset does not change any functionality. It only clarifies the
> Copyright information in ASoC/HDAudio contributions, where an "All
> rights reserved" notice was mistakenly added in a number of files over
> the years, likely due to copy/paste. The Intel template never included
> this statement.
> 
> I chose to group all these patches together, they could be merged with
> either of the ALSA or the ASoC tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Intel: clarify Copyright information
      commit: 293ad28116e2c3e4d3eb28bd0378558edc897f55
[2/9] ASoC: Intel: boards: clarify Copyright information
      commit: 0e0440535de8e7c5c0ae0bd469b6ae184f9c732c
[3/9] ASoC: Intel: common: clarify Copyright information
      commit: 5cf4ffa4113da2e797c8281bac2838d29f5a03bf
[4/9] ASoC: codecs: Intel: clarify Copyright information
      commit: 884077bd7110db61eddff086f9ab7f2c6748d169
[5/9] ASoC: Intel: catpt: clarify Copyright information
      commit: 618ae0d7e740d212044ba25d0f1013374eda448a
[6/9] ASoC: Intel: avs: clarify Copyright information
      commit: 94001147a09ffeaf0657db7c189af77cda427f30
[7/9] ASoC: soc-topology-test: clarify Copyright information
      commit: 83e495d7b29b663861c68a1ad77710b6315472ad

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

