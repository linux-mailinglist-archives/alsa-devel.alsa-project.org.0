Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8347335D0
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 18:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D2A851;
	Fri, 16 Jun 2023 18:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D2A851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686932354;
	bh=M7ONoV4bj3k5GfAhyt9ZW1Z5B2gKgEc2DcstwuWT7K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NRESDt+IH75IZvvIR+HYtOWrhpGMiZpGWIO8bEcatEW5Efu/yGEPE2TOWAh1Q7ULN
	 APJxDqCt9dZt/volvjfQBfHyfW9BeeaDdE57I2P1/9agOGbDfm+IC4xeXGqOhC/JuA
	 tWLVA9cb/YSLJiMzE/pynb5sSMZ4RFCh6kY3KI0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAE83F80552; Fri, 16 Jun 2023 18:18:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41004F800BA;
	Fri, 16 Jun 2023 18:18:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B3FAF80246; Fri, 16 Jun 2023 18:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DD05F80132
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 18:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD05F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N1p0d5YG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5A0161737;
	Fri, 16 Jun 2023 16:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5366C433CB;
	Fri, 16 Jun 2023 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686932220;
	bh=M7ONoV4bj3k5GfAhyt9ZW1Z5B2gKgEc2DcstwuWT7K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N1p0d5YGkOVyF++Mp6nvNQ8jTfPAMEUnb8YPZyr+Rb/TqAOrWIpk5jdpBBZ3Q/w8Y
	 ExG29opnwS0zyGVscYHoC2qbVXY1aV0foi1sQdje1slCArgoFJG8xPsFsJETu9tEEb
	 mhe7F7T5Uge4SM2l6JcBZrzXDDmTQDOZb0gX9JaNlgjKW6KqRA8MxtS4LRTazLv+4f
	 bGkmUBsj4U/m/yO6KTQ4gaaRkCL1l5Ne0CcMEix1LqH9iWfEqOsXSwkK/H0D8m6Q8W
	 AZV06HTdfM4D8azU1zXoAkn/c4kNgRDhqgFXSm2T2KNB4wdCtuE0ttAevPqTWgQEn9
	 iTrYozFrM63/Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: misc updates for 6.5
Message-Id: <168693221939.298269.3014423310202851634.b4-ty@kernel.org>
Date: Fri, 16 Jun 2023 17:16:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: E53CWVFNWV2D2ZC5MEIKA2F6RQ2Z567P
X-Message-ID-Hash: E53CWVFNWV2D2ZC5MEIKA2F6RQ2Z567P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E53CWVFNWV2D2ZC5MEIKA2F6RQ2Z567P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Jun 2023 12:00:31 +0200, Pierre-Louis Bossart wrote:
> Couple of improvements on virtual_widget support, firmware trace free,
> IPC payload dump, duplicated code in suspend and MeteorLake primary
> code support.
> 
> Bard Liao (2):
>   ASoC: SOF: sof-audio: add is_virtual_widget helper
>   ASoC: SOF: sof-audio: test virtual widget in sof_walk_widgets_in_order
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: sof-audio: add is_virtual_widget helper
      commit: 90ce7538659aad1c048653c23eadaba9d1648559
[2/8] ASoC: SOF: sof-audio: test virtual widget in sof_walk_widgets_in_order
      commit: 0557864e9dbe8f6c0f86110ad5712f81649f7288
[3/8] ASoC: SOF: core: Free the firmware trace before calling snd_sof_shutdown()
      commit: d389dcb3a48cec4f03c16434c0bf98a4c635372a
[4/8] ASoC: SOF: Add new sof_debug flag to request message payload dump
      commit: d498a3bdfe954afb4155ab2bdc3ae534c949b907
[5/8] ASoC: SOF: ipc3: Dump IPC message payload
      commit: d01c7636ffa051297672c55ab6088ae539d221ee
[6/8] ASoC: SOF: ipc4: Switch to use the sof_debug:bit11 to dump message payload
      commit: c3d275e3a84833368c47c803043105bda095a624
[7/8] ASoC: SOF: pm: Remove duplicated code in sof_suspend
      commit: 399961423314680c6cb14ac822600b9ede2b991f
[8/8] ASoC: SOF: Intel: mtl: setup primary core info on MeteorLake platform
      commit: fd4e9e9bfa0b1c63946fde2ff61440ff1e5eb75b

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

