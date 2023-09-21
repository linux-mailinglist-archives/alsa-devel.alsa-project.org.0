Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A859A7A95C6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14F68E10;
	Thu, 21 Sep 2023 18:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14F68E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695314064;
	bh=H43DsDU/RmLDaEl6eOKwt5T7tmutU77sEJ06ee0iqD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMo0vCZgydh27iuZ44SB+pnizNtzeJdsjK3siu+S8TpWwLzO7obI6qkj6W/Irp8cp
	 qZ4K4dKRjaNrpwAsFJUDtAj77p8KS8w/oH7xUxLDuHRD4grmEBTZV9y3w+8H0652el
	 xNCcft3aGF8mcVNqxdf7txgLCi7vW/adaJeqbwD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F210F8060F; Thu, 21 Sep 2023 18:30:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D25C7F80607;
	Thu, 21 Sep 2023 18:30:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 584F5F805EF; Thu, 21 Sep 2023 18:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87D5BF801F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D5BF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AFcwJO2a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5CA961ADA;
	Thu, 21 Sep 2023 16:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFACCC611A7;
	Thu, 21 Sep 2023 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313831;
	bh=H43DsDU/RmLDaEl6eOKwt5T7tmutU77sEJ06ee0iqD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AFcwJO2ac/NhmC/ILDrN2YVf6OO344kixEXsAw2GOVeIrHIp8H72OC6bLTibPLcdJ
	 ai0NjtmBD15yMK1PwbsZGdZwOZw3EcgUx+j9UfxZmYUdSOCCbzGK29GfUQwEj2C5qb
	 Aj23mzLLZDI3ExFlv7F7/+Ve+a1Z/ZoG5Wua613qxkvP/S+VE6IE78+N0DEZBjOKrm
	 BquFlNYTtN4XU0XFKci7TPQujloO745FSjC74tFBuxpPYMDG4Uv1K3yZXjnU5bRriE
	 zmT1bJLgwMTX4jucYH5yiITKwypdiOUuUOYptIyAjHPlLT13HeQ0/aOlh+hDiSW8Ha
	 CcqXhzBtWEMqg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20230919020011.1896041-1-yung-chuan.liao@linux.intel.com>
References: <20230919020011.1896041-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: intel: Add CS42L43 sdw machine driver
 support
Message-Id: <169531382970.61074.5109700499295851468.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: J5QJSWBCNHMZRQ37GSM4RW7TC7HN4EHB
X-Message-ID-Hash: J5QJSWBCNHMZRQ37GSM4RW7TC7HN4EHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5QJSWBCNHMZRQ37GSM4RW7TC7HN4EHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 10:00:09 +0800, Bard Liao wrote:
> Add cs42l43 codec support to sof_sdw machine driver.
> 
> Bard Liao (1):
>   ASoC: intel: sof_sdw: Add CS42L43 CODEC support
> 
> Chao Song (1):
>   ASoC: Intel: soc-acpi-intel-mtl-match: add acpi match table for
>     cdb35l56-eight-c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel: sof_sdw: Add CS42L43 CODEC support
      commit: 06d94b43fc39af16d3d74a93d27ee92902b56bc6
[2/2] ASoC: Intel: soc-acpi-intel-mtl-match: add acpi match table for cdb35l56-eight-c
      commit: 05fe62842804d644d986cb248ca871335b2628af

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

