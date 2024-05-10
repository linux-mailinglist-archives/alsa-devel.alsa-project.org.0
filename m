Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF7C8C213D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 11:45:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707AEDF9;
	Fri, 10 May 2024 11:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707AEDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715334299;
	bh=YZDyPDoYwp2evd96TgCP6DJrbrwjATDoKr/htFbES+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IpsM3jusxXMbFCftGmSyq9gO2O/Jd5ThaPeKQVgHboH7SOrpqLMy/on5tXISQlUT9
	 jEHgWBRfu6e1cFjvnQBEEypPsBGv/dl8geaitrXAyJR5xw5iBSbfv/bw0skfNkvscQ
	 GIUuYhATYrK4KI82lc+18xEEqxDyboJ11LmBw+Eo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38D5CF8049C; Fri, 10 May 2024 11:44:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCBF8F805A0;
	Fri, 10 May 2024 11:44:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C1F9F8049C; Fri, 10 May 2024 11:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8111F800E2
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 11:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8111F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n47szgIW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7EC6DCE1D36;
	Fri, 10 May 2024 09:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3772C32781;
	Fri, 10 May 2024 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715334069;
	bh=YZDyPDoYwp2evd96TgCP6DJrbrwjATDoKr/htFbES+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n47szgIWaTwDqZ51jqCh+1lrUi52oo82Qn0zDqwMPMV3pY2iOucL/4Y/sIOzaQ4Df
	 iNYM4l9xED2JIE+Ve76xMNEUt38DIQdpzai091c7xZM2wQsd6r3ag+9XSRipSvtgZi
	 A83mSop3hzTCvHu/D87uEnH6/y1JNraDQPtqcv+UmvgTx96wfTbBPLGzcoxyukxfgd
	 C9VM2Iz2hrpEHYpSYcOajfuWZPqsLsbFDQp6rvcn9agFj0VoG6aeHw49ucldRo6HDM
	 ymr4xMFze4yvXsuj3LZiZl7AW3Rgrs26n4W99GmxB29ALK3InUq/AQHTi9h+HHLvJo
	 Pm87UYPawU7gQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240509163658.68062-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163658.68062-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt715-sdca-sdw: Fix wrong complete waiting in
 rt715_dev_resume()
Message-Id: <171533406764.2055397.10613116905468386028.b4-ty@kernel.org>
Date: Fri, 10 May 2024 10:41:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 3QXGEINU3A55VVUVUAYYARXSRF5QEVVQ
X-Message-ID-Hash: 3QXGEINU3A55VVUVUAYYARXSRF5QEVVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QXGEINU3A55VVUVUAYYARXSRF5QEVVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 May 2024 11:36:58 -0500, Pierre-Louis Bossart wrote:
> enumeration_complete will be completed when a peripheral is attached.
> And initialization_complete will be completed when a peripheral is
> initialized. rt715_dev_resume() should wait for initialization_complete
> instead of enumeration_complete.
> 
> the issue exists since commit 20d17057f0a8 ("ASoC: rt715-sdca: Add RT715
> sdca vendor-specific driver"), but the commit can only apply to
> commit f892e66fcabc ("ASoC: rt-sdw*: add __func__ to all error logs").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca-sdw: Fix wrong complete waiting in rt715_dev_resume()
      commit: c8bdf9e727acb6e1b37febf422ef1751e5a2c7d1

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

