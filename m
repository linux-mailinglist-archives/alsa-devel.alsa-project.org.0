Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14D92C5BC
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 23:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBDEA851;
	Tue,  9 Jul 2024 23:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBDEA851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720561905;
	bh=FFuhkeWpCgZmxUgtB/VSGlDy6rMj4px88cAsiQEvKrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VssqklKeI/PmSqOxslZgAPutteWJHBaKvHKPGWJWAe1MyTlyW1cC+asIneKSoD6jB
	 rRHbueBilu3Rll7/MiRhZBS5m9x+Ms7z5lXF3IvtBCL/G4LtHIzClIQxncxWwS0dQZ
	 BTvPOI70ZRlvRiJlURmkaCwYvP4ghmcFcTAnHC4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF781F805AC; Tue,  9 Jul 2024 23:51:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49940F80589;
	Tue,  9 Jul 2024 23:51:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF0A0F8020D; Tue,  9 Jul 2024 23:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDD27F800FE
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 23:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDD27F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cVk2dDCg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F04E56170D;
	Tue,  9 Jul 2024 21:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EECC32786;
	Tue,  9 Jul 2024 21:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561839;
	bh=FFuhkeWpCgZmxUgtB/VSGlDy6rMj4px88cAsiQEvKrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cVk2dDCg9odvvweY/X54U4rpNNccWk7MzFezF+6qTU0T/3ZqhEXrcrvaQSX9Z3mHI
	 /fExsFcIA6J8cC5GbjWtCjPOKw8HBInjGAb9rKgZ0AajDxBcFWrvUnwUOFFEewlDej
	 Znbv6rS8MnVAo82uaJvgkxSX+FlAf5xxJuPf3dcITO3qlpAPUaUJrWsRiwmumwmxaL
	 2iLt5sw+0U6noWDH3480zhL8DC4MRcicfRNlFOaGngb8ADU3bD9u2TsMRYxeY409nH
	 1N+DFeHlckjFWOJG4BfaXIFjV+wewsElG0DzFouDPC7wo+fuPl1DUhEU70DhXJCdJO
	 PJG5iV7hSK+yw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 yuhsuan@google.com, henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com
In-Reply-To: <20240709043342.946-1-shenghao-ding@ti.com>
References: <20240709043342.946-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoc: TAS2781: rename the tas2781_reset as
 tasdevice_reset
Message-Id: <172056183406.72205.2485192359283053968.b4-ty@kernel.org>
Date: Tue, 09 Jul 2024 22:50:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: IMSNBN57WVBXXMTWD3VZDJP3ETL77U43
X-Message-ID-Hash: IMSNBN57WVBXXMTWD3VZDJP3ETL77U43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMSNBN57WVBXXMTWD3VZDJP3ETL77U43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 Jul 2024 12:33:40 +0800, Shenghao Ding wrote:
> Rename the tas2781_reset as tasdevice_reset in case of misunderstanding.
> RESET register for both tas2563 and tas2781 is same and the use of reset
> pin is also same.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: TAS2781: rename the tas2781_reset as tasdevice_reset
      commit: be5db7581f59621ed9cb9cbf6bebccda38263eb5

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

