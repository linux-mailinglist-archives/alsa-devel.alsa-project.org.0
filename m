Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DC579F327
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 22:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9044D84C;
	Wed, 13 Sep 2023 22:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9044D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694638199;
	bh=TPp8uZFB0/jwp1EDhvKFZZGBI1llyQdj0zqebEXZ3/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cs5lcOlesNUr9HZrdWZQjEullQLvPJkTtgwoSQb0eZKtcRMMEoUCXoVYsK0CSmOqM
	 ji9NDZ7um0gb+xD38rchJxSBWHyZnJO5bAFst1rw8ZKa3pWJbVAZHsitasedwP7eou
	 guz+nlBrUHtIQ/+vrfy5iJOOC4Qzo5Ex1J/D3Za8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9456F80558; Wed, 13 Sep 2023 22:49:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAB95F80246;
	Wed, 13 Sep 2023 22:49:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8912FF80425; Wed, 13 Sep 2023 22:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 819DEF80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 22:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819DEF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lnsD/7Ow
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 465EF61752;
	Wed, 13 Sep 2023 20:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0D3C433C9;
	Wed, 13 Sep 2023 20:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694638132;
	bh=TPp8uZFB0/jwp1EDhvKFZZGBI1llyQdj0zqebEXZ3/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lnsD/7OwVBBCmurWsce1FrMMCcYPQnnHpplnqrDNoe/w2MRN4C/umJHkiOLCCkb86
	 OWB/3+AYda6S/d6tAXI4ukhebJEpqT7yvfnBqUZ3rz03655LNlG0u1fumBFwZDCddo
	 8vMBT2+HMdmPFOwjZVHQ4GPWNo4VlueinzrVSz9iF1wENPZ6QbRZbtALGN/eb5ruoX
	 FZ52QQk1FxtViC+fauFgizWZ3jfKh4NlskH8V4vlsNlDLNOn8eoMAgmt54nMT4f99J
	 5F61kN0zLhZXoJMgj4iH7IzqK4ZtvhxF5PgR7Rk5MtUPH9FwONo5L4yujsbp8gB19f
	 6PuZJKswUBm5A==
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, scott6986@gmail.com, supercraig0719@gmail.com,
 dardar923@gmail.com
In-Reply-To: <20230913064003.2925997-1-wtli@nuvoton.com>
References: <20230913064003.2925997-1-wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Revise MICBIAS control for power
 saving.
Message-Id: <169463809596.94259.13475036447436979290.b4-ty@kernel.org>
Date: Wed, 13 Sep 2023 21:48:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 7JMFQ3XRDTEMWZZVGZ2TO763VEWV44EA
X-Message-ID-Hash: 7JMFQ3XRDTEMWZZVGZ2TO763VEWV44EA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JMFQ3XRDTEMWZZVGZ2TO763VEWV44EA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 14:40:03 +0800, Seven Lee wrote:
> The patch helps save power by control MICBIAS. The headset's
> MICBIAS should be disabled without button requirement.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8821: Revise MICBIAS control for power saving.
      commit: 8885ab34201c5c34a82539ba2753e8e743b38f38

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

