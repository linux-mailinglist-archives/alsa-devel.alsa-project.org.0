Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2478CDE3
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 22:59:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7F0F741;
	Tue, 29 Aug 2023 22:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7F0F741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693342758;
	bh=X/dvtRLB9aS4Mm8IC9aF3IMr0YP9VbjRxqIhlkw5NV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TH+2bb9YZ8FQVLP3sgxx/PaXsH/BPXqsByPr3d5rGlcAMUP3ivDP7ZHKeugZk1ywy
	 zJIhbefZ8wcMZUNh9RynolEQrmMSf0HTNsU7tr9PAGIsm9BsJIquTxRFgF4c4rlME9
	 eFl0dEwsQ2DK+BCApBvhz7wVVazEN9w6FphOkxxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 709CBF800F5; Tue, 29 Aug 2023 22:58:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E4AF80005;
	Tue, 29 Aug 2023 22:58:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAA0AF80155; Tue, 29 Aug 2023 22:58:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 50755F80005
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 22:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50755F80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fYPvskLJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6BF363B20;
	Tue, 29 Aug 2023 20:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD6EC433C7;
	Tue, 29 Aug 2023 20:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693342673;
	bh=X/dvtRLB9aS4Mm8IC9aF3IMr0YP9VbjRxqIhlkw5NV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fYPvskLJJo4TDTBIal60pg43xsR6kl/2N+7XkEgHZvGRHeLEjK15EE5hH5jlZf2Qu
	 Yyx4HG04i5ILhYd6/maWZikMY26wfCDIYCaO53QdoAqk3fnSSGKp3IkHDI07njd2hA
	 +o1I6FZN2sjz/+hIkGBIZpLG8wfEzSVIc6oqT4V/AD+uhEnATDfwY9MHGrusw7k8iK
	 eOju1laecm0QREM0LiOAHn5aEFfS9Bc9dYpoqGht5fv8qTy50lonq2LaQOHGvwZx6d
	 657YlfTqiixa5EALalBmxnBIGyzdiOm1u0iaEWi8IcULxTrk+5fHRLa3hoUyQ52iW5
	 n4ByFm1QS5NAQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20230829160433.2647889-1-rf@opensource.cirrus.com>
References: <20230829160433.2647889-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Waiting for firmware to boot must be
 tolerant of I/O errors
Message-Id: <169334267086.3156492.16645897237264725852.b4-ty@kernel.org>
Date: Tue, 29 Aug 2023 21:57:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 5LFRGJ3LGGTSH4277CQNOKPESVSJXFHM
X-Message-ID-Hash: 5LFRGJ3LGGTSH4277CQNOKPESVSJXFHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LFRGJ3LGGTSH4277CQNOKPESVSJXFHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 17:04:33 +0100, Richard Fitzgerald wrote:
> Ignore failure to read from the cs35l56 when polling as the device will
> NAK i2c accesses until it has booted and this would terminate the poll
> of regmap_read_poll_timeout().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Waiting for firmware to boot must be tolerant of I/O errors
      commit: 06afec5c988acb2c4f566eac2f6ec53d30d3a1b5

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

