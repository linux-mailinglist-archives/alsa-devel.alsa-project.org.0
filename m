Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A375F7620A3
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 19:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FCFD7F8;
	Tue, 25 Jul 2023 19:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FCFD7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690307696;
	bh=11L2pPSUZPkoFKldi8nLvqGWfgLnUcHEt/G9YMShSks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjovjasBFGTE+9I39f0gowSNwkWwo97vIBrBw75J+RwZPhk4FV+BDm3o7QH7ybRE5
	 rKc7P6a+5uKtxikKIM/RZPtJjOaPHhJA0/gbEYJY1+wMBNvG/hCdiif29it83/D+cJ
	 sh4LihB0OCLMEO5WdaHIZJ+nKugwyJs8WR5P/z1A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FDBBF80535; Tue, 25 Jul 2023 19:54:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD33CF8019B;
	Tue, 25 Jul 2023 19:54:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90AEFF8019B; Tue, 25 Jul 2023 19:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5763BF80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 19:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5763BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E+guE5Gj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38C2161777;
	Tue, 25 Jul 2023 17:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F91C433C7;
	Tue, 25 Jul 2023 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690307639;
	bh=11L2pPSUZPkoFKldi8nLvqGWfgLnUcHEt/G9YMShSks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E+guE5GjajLb7/o620LDhj8smQ4MLfEQOkrXRoVHieikIsJLLCAOOPldygK3R6YTO
	 h4Ysqd9aALbr29Ue84OF7dpVuNzXSAnN6okM2DZnhWeSJzx1Z5UFyxYEFvtQJG5ESS
	 UX16pL4c4DA/KlEgXjzIyqnapx6NXUkylTyWFxI2H42Mc0Oq/tVlkG9scLVy60Y7Od
	 0v7ZuMDeJ6hSJze5AxTI9cQODcQmUczOgSpaK+NsrwzUMFY27d7Ihe4ej/1xSz/C8O
	 9JcpP+Rn76Q/Fa7qHGVD5XkoSYF8gYl3jsVnucW1vzyRquCqkXPhAcBcrGBaUddDrZ
	 DN5oE2xGF7Mnw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Edgar <ljijcj@163.com>
Cc: yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20230719054722.401954-1-ljijcj@163.com>
References: <20230719054722.401954-1-ljijcj@163.com>
Subject: Re: [PATCH] ASoc: codecs: ES8316: Fix DMIC config
Message-Id: <169030763850.1533302.8809616718160850718.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 18:53:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: OOQJSDTXNE4QSGF3IB25MQIY6DEAFBQF
X-Message-ID-Hash: OOQJSDTXNE4QSGF3IB25MQIY6DEAFBQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOQJSDTXNE4QSGF3IB25MQIY6DEAFBQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 13:47:22 +0800, Edgar wrote:
> According to the datasheet, the DMIC config should
> be changed to { 0, 2 ,3 }
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: codecs: ES8316: Fix DMIC config
      commit: d20d35d1ad62c6cca36368c1e8f29335a068659e

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

