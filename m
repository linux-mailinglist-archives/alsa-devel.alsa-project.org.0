Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C27A2CEA
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C5BDEC;
	Sat, 16 Sep 2023 03:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C5BDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826813;
	bh=Bj2qh4y6sKb9dvuxkfpcxQVhYnAqob9WgtHaABSZtlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=swywmpZHY6Br3p+OZ8IyomHT6rwurKppbPoNKZGsocGsWrKp2WXxd45F1/6SlSPPG
	 asCx2qdjrPXD69dIzKZRke/wetvV4/dxBT0sPZTblabw1eNVipBXHltFxiPSXyvv/b
	 6lAx5O6gSMFICrPyQTcztnlYgGoGqnWu955Kmtpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3863F8057F; Sat, 16 Sep 2023 03:11:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C0CF80571;
	Sat, 16 Sep 2023 03:11:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACE02F80425; Sat, 16 Sep 2023 03:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2290F80141
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2290F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UXpT5QjT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DC592CE2CD5;
	Sat, 16 Sep 2023 01:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58260C433C9;
	Sat, 16 Sep 2023 01:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826691;
	bh=Bj2qh4y6sKb9dvuxkfpcxQVhYnAqob9WgtHaABSZtlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UXpT5QjTyKN5n5xo8qmVHdtuL1XzaLDtkv+t3h2xYtDFoRJuSqO9SHSLm4yYGVJI+
	 RWIpPM5yXAZoX/TiLJxcs1HKuo0N+955KKZlQuMClCIMNzDDxxZxZ8qXdJDqQVCRJY
	 Rcu4B+OZRnMumfUQgntjK2F8XUZNebDgygYgiBD92pPO01O++klFamDVUDPwiMSQp7
	 xramL8E/PKOOwVvqI7QTnhwh2QCskir7Dg2z1iLs1BOT4C8I0VcXwEtP2HdeMNKVe1
	 lv4pwK8qSJ9eDSjmKCbegyVOuYHDUrFNixiazSeQTexpjdA9muxVBNlGZ4ZPbbwmkL
	 VrMZ7USP8oHbQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230914150918.14505-1-rf@opensource.cirrus.com>
References: <20230914150918.14505-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] ASoC: cs35l56: Define and export I2C/SPI pm_ops
 only if needed
Message-Id: <169482669005.606223.15627123606539321145.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: L6SFPR2Y2OPGUPUTXNG3U5EWTURCIAX3
X-Message-ID-Hash: L6SFPR2Y2OPGUPUTXNG3U5EWTURCIAX3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6SFPR2Y2OPGUPUTXNG3U5EWTURCIAX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Sep 2023 16:09:15 +0100, Richard Fitzgerald wrote:
> These 3 patches update the pm_ops for I2C/SPI so that they are only built
> and exported if they are needed.
> 
> Richard Fitzgerald (3):
>   ASoC: cs35l56: Use pm_ptr()
>   ASoC: cs35l56: Use new export macro for dev_pm_ops
>   ASoC: cs35l56: Omit cs35l56_pm_ops_i2c_spi if I2C/SPI not enabled
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs35l56: Use pm_ptr()
      commit: 3d3a86679541044a65ea23175cb95206921c8fe2
[2/3] ASoC: cs35l56: Use new export macro for dev_pm_ops
      commit: 6399eb58254b98bbe42c9d14e07c50e1c3d9f8cd
[3/3] ASoC: cs35l56: Omit cs35l56_pm_ops_i2c_spi if I2C/SPI not enabled
      commit: 01e76ee227564008d71ddce6e43132b36d2d2252

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

