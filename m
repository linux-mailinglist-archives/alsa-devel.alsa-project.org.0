Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B97BBDF5
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 19:47:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0E31112;
	Fri,  6 Oct 2023 19:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0E31112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696614455;
	bh=eR2R0F/vcWmTXvkygEMikVDgfUW8yNTc/B0mv/Thh/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QkVzgMG5N5rlgM7HzinTHoLBvBglbRsDUHqT15EPce4nHOYqaN9YaFl1Nnng+//+B
	 H6o0fZN13CSWviLOihZSyW666RUYPSlZfVfFblGbTAK9SsfE7KxM1jWQMz4szXI1Ba
	 1N8rwc7AD/3pdKX6ly1P0vR2JN0ZRrRNXmr3bbhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 027C8F80553; Fri,  6 Oct 2023 19:45:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C09F8055B;
	Fri,  6 Oct 2023 19:45:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E844CF8047D; Fri,  6 Oct 2023 19:45:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E2DDF80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 19:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E2DDF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H3+2v7Y+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9068160C06;
	Fri,  6 Oct 2023 17:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041DDC433C8;
	Fri,  6 Oct 2023 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696614339;
	bh=eR2R0F/vcWmTXvkygEMikVDgfUW8yNTc/B0mv/Thh/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H3+2v7Y+DSgsz0T5otVWlNHANJXOJ5610MQm+JQ5HL6JBe9soPh07DyrGaiAQEKzx
	 kRpt/7yu3hew9LpWKdWNZgbsSxTRUC8tj8vTBgaQx9c+9T2v9LzYTbYZ+NoLSJ0qMa
	 SgTu9j7tsGszpThY+Ifqwxa12g1xGOu05D3EBLNUzrPPbhyrPpU1ETpSNtuQ3IJgqp
	 2cdCLqJHQReUXZtr00Vz+IPajuyhMhtUmM6jDivPHJwLL0MGwhw9g2jBue0Pz3SyJb
	 Tmq6k0fYbLvcqKgFHW7NTMXIjewIHDNDJhj3DsY5Q+c8POuLpaeuHkYogpWtu/vj49
	 L5SA3fNqvyLRg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20231006111039.101914-1-rf@opensource.cirrus.com>
References: <20231006111039.101914-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Update hibernate/wake sequences and
 enable hibernation
Message-Id: <169661433758.222574.6492928964060068556.b4-ty@kernel.org>
Date: Fri, 06 Oct 2023 18:45:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 6AGIFCC4WSX26QHSD32XHMTRKF5CO5DH
X-Message-ID-Hash: 6AGIFCC4WSX26QHSD32XHMTRKF5CO5DH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AGIFCC4WSX26QHSD32XHMTRKF5CO5DH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 12:10:35 +0100, Richard Fitzgerald wrote:
> Update the hibernate and wake command sequences to meet the latest
> datasheet specification and enable hibernation for I2C and SPI control
> interfaces.
> 
> Richard Fitzgerald (1):
>   ASoC: cs35l56: Enable low-power hibernation mode on SPI
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs35l56: Change hibernate sequence to use allow auto hibernate
      commit: a47cf4dac7dcc43ef25d009ca0ad28fc86ba0eef
[2/4] ASoC: cs35l56: Wake transactions need to be issued twice
      commit: 3df761bdbc8bc1bb679b5a4d4e068728d930a552
[3/4] ASoC: cs35l56: Enable low-power hibernation mode on i2c
      commit: 79b101947a829a1c4c3eca4b6365093d2b534cf4
[4/4] ASoC: cs35l56: Enable low-power hibernation mode on SPI
      commit: 634ed138d80b1cc8a903edb226458ea203c44abd

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

