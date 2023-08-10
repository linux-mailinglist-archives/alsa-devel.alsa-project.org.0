Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AF777ED7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 19:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBFB822;
	Thu, 10 Aug 2023 19:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBFB822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691687472;
	bh=wIA0S7mxlR4Ky71elyGKdHqq35BkWhyk0nrYZYNjJoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ukfK9UgiU2KDLW+X62MoKf5MeyRe4GXoS9e/adE/kRrN4E82Hd4aAl95FmnUUdfrk
	 IH9WxeMde+dZrUyoreJJGZ7BOkK+NtV4k/6WxNqkc1fVDmI/9b+dOQmZrjaqP5vCmQ
	 XpYUhZzZfU2ukBuGrAwD65unIBoyyJdOA7Ps6nGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6584F801EB; Thu, 10 Aug 2023 19:10:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D796F80166;
	Thu, 10 Aug 2023 19:10:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69765F8016E; Thu, 10 Aug 2023 19:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17686F800EE
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 19:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17686F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dJ9msqRc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 915FB658BE;
	Thu, 10 Aug 2023 17:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B32C433C7;
	Thu, 10 Aug 2023 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691687408;
	bh=wIA0S7mxlR4Ky71elyGKdHqq35BkWhyk0nrYZYNjJoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dJ9msqRcAp5UpTHJdHlRiKy9EOdc5n6cqqBVIVdeydnywK47n7FCxuOT4EVnEvbUD
	 J5BVmVpibazFPsFukhVNNZowSmhT3xcSGeN0w9mXAn2HwnlZDBhOdzJOCLVR4LiRvO
	 lMWugFb7c13Oh/sAoj2CpzOZXjRq/9r+yMnxP4eaX9bKe1LcFQyqVri8DL20phR7CF
	 9OKp7ecW+XjwviSPRwf4L0MbKXtAnruqOn54P1O0ortcjWRRsfvvolM6/6pJ1BRBhm
	 G7YEl/OVbnn+LmsbeZQZDetBZnsfE09tw5/+FkRcsQcVATn0Df9GhaRJfbnAxWWNGj
	 E1/Y3/UkYqutA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <4f405c7deb9642e1a8599c5f103b5759@realtek.com>
References: <4f405c7deb9642e1a8599c5f103b5759@realtek.com>
Subject: Re: [PATCH] ASoC: rt715: Add software reset in io init
Message-Id: <169168740547.495427.940490572580278843.b4-ty@kernel.org>
Date: Thu, 10 Aug 2023 18:10:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: PE5VHVNDBH5W7BBBNGNIHNA7GJEW4XSB
X-Message-ID-Hash: PE5VHVNDBH5W7BBBNGNIHNA7GJEW4XSB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PE5VHVNDBH5W7BBBNGNIHNA7GJEW4XSB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 10 Aug 2023 09:27:45 +0000, Jack Yu wrote:
> Add software reset before setting preset registers to make sure
> all the registers are the default value before preset.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715: Add software reset in io init
      commit: 927073ee468d9d9f7ef0fe1eb777a673120e7caa

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

