Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E0076B35C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 13:35:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91AFA3E7;
	Tue,  1 Aug 2023 13:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91AFA3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690889743;
	bh=pouY4EyX9X9ZrNNUzBc/7MWkYR2A9nY7yypQaMTy1bY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e7M5fHTdSCZ1Y890wXKZEfy97bwNeRPG2DrEyGrh/IgvDGo2Z3vDdDImn46RQsfid
	 b60dRMlu3CMWvNKwfnrfn63LFu5qaP13WcCL7L+9UECyiZ0VjvO4ZTfxF1B3qUC8WB
	 BQoHsaXXMEYOvObbSa6+lk9RuikwFN+8PjDflvso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB0C8F80520; Tue,  1 Aug 2023 13:34:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7310CF8016D;
	Tue,  1 Aug 2023 13:34:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6BD8F801D5; Tue,  1 Aug 2023 13:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2455AF80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 13:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2455AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tviWq3IE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80FC36154C;
	Tue,  1 Aug 2023 11:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2059C433C8;
	Tue,  1 Aug 2023 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690889675;
	bh=pouY4EyX9X9ZrNNUzBc/7MWkYR2A9nY7yypQaMTy1bY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tviWq3IENVzpCK9njZfy5bBeErXgeCA+brPq4TnKV2aNsxKuHx3O1P8taWgvohFz2
	 K3Wr5SLY1yn6EGQMMcDxUuDql62okzhR01CmevHWODGwuro9TVtbZkjl0P/pko6QDH
	 djbbHZu0u2Yv10/kepMWDnCTON85lp85uNwlsFyJxSA5G2uMCD1xH0yYCuwDiSlYZa
	 3/fLM9va6s/8zy2MERQBnKgvv4W7AVwko9CqkmsUqM4ZTvlxFwv1IZjKlIIob26Cze
	 cxHldwSCjvlPOtg/NMZdcAHfVNGZ4vyU/og7n9G8uF5pvM8PdA9Vw5AP5HoIVM9aJL
	 Svfj0hHfcj7BA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/6] ASoC: SOF: misc updates for 6.6
Message-Id: <169088967447.28502.12961598105104638462.b4-ty@kernel.org>
Date: Tue, 01 Aug 2023 12:34:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: PZHBTYSSDU6H6S6QLLWKLBM7TIGBRG5B
X-Message-ID-Hash: PZHBTYSSDU6H6S6QLLWKLBM7TIGBRG5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZHBTYSSDU6H6S6QLLWKLBM7TIGBRG5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 16:32:36 -0500, Pierre-Louis Bossart wrote:
> Cleanups, move of code to promote reuse and Mediatek minor updates.
> 
> Curtis Malainey (1):
>   ASoC: SOF: Deprecate invalid enums in IPC3
> 
> Pierre-Louis Bossart (3):
>   ASoC: SOF: Intel: start simplify the signature of link_slaves_found()
>   ASoC: soc-acpi: move link_slaves_found()
>   ASoC: soc-acpi: improve log messagesin link_slaves_found()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: Intel: start simplify the signature of link_slaves_found()
      commit: 799d9933ba47d9b679637fa17454ed81ac353f52
[2/6] ASoC: soc-acpi: move link_slaves_found()
      commit: bb29a33c4b4da9c11e021b9a257ae2944ccaff01
[3/6] ASoC: soc-acpi: improve log messagesin link_slaves_found()
      commit: cf35ab3d58c65a924ef8caf5c40e5849d4aa253e
[4/6] ASoC: SOF: ipc3: update dai_link_fixup for SOF_DAI_MEDIATEK_AFE
      commit: ed19c4a9b1024c4069d3d9f4daa3eb26a622069d
[5/6] ASoC: SOF: Deprecate invalid enums in IPC3
      commit: 8dc97ccf94c73c62344a270986b837d02fb77c0f

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

