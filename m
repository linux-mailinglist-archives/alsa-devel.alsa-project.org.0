Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36177D33C
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49717DEF;
	Tue, 15 Aug 2023 21:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49717DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692127169;
	bh=klMvkG68KKvGceDjga7OCnWF+ktJazkneos4Ls9WMhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JMDwAmfduBV+4GeyFu93EX02rylwZev/HWAWWKntmo523XlC/SdQOj11t52NjLFiG
	 CeDW2GtuqCCQcWzVTx3w/RiXOmR91m/h9/EFj1G0FmvemNMUH5WeL/rUknybnMR01Y
	 JFiZ8KdKEMApJyoG1IJtkldPIDH8QySr75ipJvtI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F106F80570; Tue, 15 Aug 2023 21:17:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A544CF80563;
	Tue, 15 Aug 2023 21:17:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8387DF80553; Tue, 15 Aug 2023 21:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBF44F80290
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF44F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eeJKga6v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A76B466092;
	Tue, 15 Aug 2023 19:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66092C433C8;
	Tue, 15 Aug 2023 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692127069;
	bh=klMvkG68KKvGceDjga7OCnWF+ktJazkneos4Ls9WMhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eeJKga6vLYO54aQfI+5jCwUauoIKFjb+vd6U2LHXnBgP1LMQzuZ3+2BR+CQvbrHUk
	 HvdoZSDOEHi9gQFUfuxC3gXZUEGfJleVr9zJlZlipg3UaTk9onN4VIZ0qqWp5QfPkR
	 4lcGcyFmUw4GbDc96xMzjZS1iC/X8sjI/UnXACtS3ZLLfS2tFU7c2v9d4ccPUXuUGa
	 X/z9QoZgGymX6KxEbaz9a6ZjfnnkdOQGNCKfn96wOq5QuK+aLiglDRiVLMF3yZeMB6
	 l883LV7rLvX8erRNXKviKa6GdS7mFQ2E9M4i2shPMOsFPFamVmYRb64akmDqioLEzF
	 2Pv2eVXYjqX5w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
References: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: RPL/MTL machine updates for 6.6
Message-Id: <169212706814.68178.3841436524942064334.b4-ty@kernel.org>
Date: Tue, 15 Aug 2023 20:17:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: A4AKQFBKPWVTSHKMXDSAYKXOSEBJ2QA3
X-Message-ID-Hash: A4AKQFBKPWVTSHKMXDSAYKXOSEBJ2QA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4AKQFBKPWVTSHKMXDSAYKXOSEBJ2QA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 18:13:54 -0500, Pierre-Louis Bossart wrote:
> 4 commits with the match tables for RaptorLake and MeteorLake devices.
> 
> Balamurugan C (3):
>   ASoC: Intel: soc-acpi: Add entry for sof_es8336 in RPL match table.
>   ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in RPL
>     match table
>   ASoC: Intel: RPL: Add entry for HDMI-In capture support on non-I2S
>     codec boards.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in RPL match table.
      commit: fc8b9d05a01f7cd98e0805aa773603b07515de06
[2/4] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in RPL match table
      commit: fbc82c016d96aa4a2d99587cae2b78d5c5a59ea7
[3/4] ASoC: Intel: soc-acpi: add support for Dell SKU0C87 devices
      commit: fec75606f48f6c85eca8a9e868e41fb657abd1ca
[4/4] ASoC: Intel: RPL: Add entry for HDMI-In capture support on non-I2S codec boards.
      commit: f7555da71ef6eb9d289173d94ec2cc9d15061f33

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

