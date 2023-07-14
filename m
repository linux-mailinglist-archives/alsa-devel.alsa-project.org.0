Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0295754376
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 21:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD43A4C;
	Fri, 14 Jul 2023 21:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD43A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689364444;
	bh=T4CbZZn7curMN80ojLMCQBF84CUUYpiULkLb3tIQ4Uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gc2wbLtSNiVSEKcCzvHcQcMM1/sPKC16S8EEHaBXcV9A7ildJWXdWpGMESwXhPbdh
	 w8oIqbmzvUFwYl6VIT9tg92dW7FssSsKt/3SFUmPi4WUXGEAJKTwh13sqbiB9QazW/
	 7FBCe/Qnha4nbHUPxO4cahkbsOh0+GETE3zjcGeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 708FFF8024E; Fri, 14 Jul 2023 21:53:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB782F80236;
	Fri, 14 Jul 2023 21:53:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DEC8F80249; Fri, 14 Jul 2023 21:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9964EF800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 21:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9964EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hKsR+Lti
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2470B61CED;
	Fri, 14 Jul 2023 19:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91648C433C8;
	Fri, 14 Jul 2023 19:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689364365;
	bh=T4CbZZn7curMN80ojLMCQBF84CUUYpiULkLb3tIQ4Uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hKsR+Lti7R95tdWvqUSkX6tYWqjXfvLr1doGdQCv6je1sqRir7UszVmbY7i9SVcZ0
	 QPCQ6zP4gvM8pyEID7V59suQvXTJsGsc0ex7c6rF86zhTRCWjD6BbbZLua7GqD8ueA
	 Opoq5TTfGvHWvVsbjRdkb7aoYSRhoV7OjoN53X48foqUr6nLTI6T5ADZeoYmUdj8f2
	 ZyBRDr9vLA8wz7Ph5T1DAReoDb+vYzcREdX+QFtLKTfbv+/+sKTGU4XwQB6OPZ57R1
	 LB2WFP2agyhF/E4Rtx+yhvrlOLo3iZDa98UVRRVlUGHnIuDJaC/pXja3M4DtNqjPhl
	 PNaYzW4yQRbLA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, derek.fang@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
 albertchen@realtek.com, wen_chun@realtek.com
In-Reply-To: <20230712062553.31066-1-derek.fang@realtek.com>
References: <20230712062553.31066-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5640: Fix the issue of speaker noise
Message-Id: <168936436330.83415.4563632670988241521.b4-ty@kernel.org>
Date: Fri, 14 Jul 2023 20:52:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: CK4UOC7YK3GJDE3BMHCZXMBH3JNY7GFW
X-Message-ID-Hash: CK4UOC7YK3GJDE3BMHCZXMBH3JNY7GFW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CK4UOC7YK3GJDE3BMHCZXMBH3JNY7GFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 14:25:53 +0800, derek.fang@realtek.com wrote:
> Remove the class-D internal register setting during initialization
> to be compatible with most speaker designs to avoid noise.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5640: Fix the issue of speaker noise
      commit: cc8ff2dfcb948f16267335ba5440a42abb41aee2

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

