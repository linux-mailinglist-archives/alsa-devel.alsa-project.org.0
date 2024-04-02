Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251789602F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 01:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8622C6C;
	Wed,  3 Apr 2024 01:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8622C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712100735;
	bh=vewoNZzwNO4E+3r1grBp+IiKHI12TK609zRpSn3opTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tvaeS2GniGKmkMCojYtWS69l7vmJRyg8AiPhHbaRcDLh7y8qctQM3gAzKZocv+kQ9
	 4E5djHPVd7sDZy+qx4OC6N5HdFeVcc1bivg4uwB/jRXP0d/klZvzZmDSqJG3O57jmL
	 MO0+N8ud5xlXWpUIFIs7+VUm5xjijwVAx6J7EvCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E111F805C1; Wed,  3 Apr 2024 01:31:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE43DF805CA;
	Wed,  3 Apr 2024 01:31:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E973F8020D; Wed,  3 Apr 2024 01:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CFF7F80130
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 01:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CFF7F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gWFotQwm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 755B060DBF;
	Tue,  2 Apr 2024 23:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2B3C43390;
	Tue,  2 Apr 2024 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712100572;
	bh=vewoNZzwNO4E+3r1grBp+IiKHI12TK609zRpSn3opTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gWFotQwmFRHmWSIq8UAFv8EEkGWbzu546W4DRZ3CwXtYIKm96aU2bxtKVAefUw83V
	 BntvPeq4s93fp7n1SqsIJqdYcDVinqPP+YLuNjYp3SwyMQyu5p1ORlkioR4i38aWta
	 yLz+WXlNGxAcgnmUbvgLeJ0OxTr73wmpDKaAmZRV5JRDS3XZZJVxNXox4pOD/f+kZK
	 1VGlPquBuI9734k/4eRG/M12VPOG1pvjKJyZ7PLyGHwFVJqNKZkAp7tv1PUD/KTzgv
	 stmFb8uBtlXCIOOyQPL4vVMvltuHL5yGQRT1vcD/zMQNKdk+UCpp23Jxk0vcGh9SOT
	 N4OcKAFyxT3Lw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
References: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: cppcheck fixes and debugfs addition
Message-Id: <171210057103.279166.8183843160177110505.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 00:29:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: TAAED2NVQZ57CC63SSIOZTRCQDFU4JWI
X-Message-ID-Hash: TAAED2NVQZ57CC63SSIOZTRCQDFU4JWI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAAED2NVQZ57CC63SSIOZTRCQDFU4JWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Apr 2024 09:59:55 -0500, Pierre-Louis Bossart wrote:
> Small changes with 3 cppcheck fixes and the firmware version now
> visible with debugfs instead of only via dmesg logs.
> 
> Pierre-Louis Bossart (3):
>   ASoC: SOF: amd: acp-loader: abort firmware download on write error
>   ASoC: SOF: ipc4-priv: align prototype and function declaration
>   ASoC: SOF: ipc4-topology: remove shadowed variable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ipc4-loader: save FW version info to debugfs
      commit: f690cdcc01a5b549715fefe22a98962e7672516b
[2/4] ASoC: SOF: amd: acp-loader: abort firmware download on write error
      commit: dbb6ca68b55ddf23d0b6de782c7641624a285fc2
[3/4] ASoC: SOF: ipc4-priv: align prototype and function declaration
      commit: 458e3870507f7ebd26a2f5c7e925d5b31a873114
[4/4] ASoC: SOF: ipc4-topology: remove shadowed variable
      commit: c143cfe4f87070f11d7550b38f72625b51bf229f

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

