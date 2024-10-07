Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282FF99376D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 21:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 286631CF;
	Mon,  7 Oct 2024 21:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 286631CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728329690;
	bh=6ynytpOjSUntd07z36DKBqaETz7RE9GenJgpqvbXcg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cYYTAGMLfc1Yi838iGkXfgzxxKikNpOU9WL4fojhyRliAFnXEF+I6Ml9HKpbo2ooS
	 MpsynJuRt9eZz//05l6Uhc97pks4s3A59gDZ5ZTzKuiTWO1UP/905+ouiu68vUd4zJ
	 o7AsViG8QT8X6IMOPxT09MiMbQdANWBhP0KAfI/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A33CAF8058C; Mon,  7 Oct 2024 21:34:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23217F80580;
	Mon,  7 Oct 2024 21:34:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBD0CF80528; Mon,  7 Oct 2024 21:34:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1DB1F80496
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 21:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1DB1F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cq8lQQYu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 960375C5992;
	Mon,  7 Oct 2024 19:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF80C4CEC6;
	Mon,  7 Oct 2024 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728329647;
	bh=6ynytpOjSUntd07z36DKBqaETz7RE9GenJgpqvbXcg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cq8lQQYuT4ETk1F7nOfgA+vzAOhWbA13XlI/al4uVIdK/Fq4gGQLsUUl4MdtreWVR
	 17TbDd6mf1No7W+xCHOvN8PU95R6XmCmJgcHtTVQRuue+NjfaLCarfQbKud0qrP8ev
	 +dMaRJAv++6yjLFhboZ2oZbbWvmFSEccESnpC6ruVtwd/8EDcNMUZ8lZ/9ZZbrJZcB
	 aoQF5Nyzou368nHrzdjcn36xT4sedtd7vonE7xwz6/XwB23lRBUgUGmCq2ZlhYo/mA
	 eZ+rzEVVdVlCs6WHPgdf1oNxeV+1/+LmJ0M8FfWGu6Yb3q60ZIPRrvWTW2qvpTFqfQ
	 kjnzyGD6XxkEA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <959e8dcb075948459be4463f6a4ca6ee@realtek.com>
References: <959e8dcb075948459be4463f6a4ca6ee@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt-sdw-common: Common functions for Realtek
 soundwire driver
Message-Id: <172832964347.2482031.12726348743905029079.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 20:34:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 7HMNTSEL52GKBGAXTIIECMNTQAR7OZAU
X-Message-ID-Hash: 7HMNTSEL52GKBGAXTIIECMNTQAR7OZAU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HMNTSEL52GKBGAXTIIECMNTQAR7OZAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 01 Oct 2024 09:16:27 +0000, Jack Yu wrote:
> This is the first version of common functions for Realtek
> soundwire codec driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt-sdw-common: Common functions for Realtek soundwire driver
      commit: bbca8e7050e0769d46eb775082d1926db05e7dac

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

