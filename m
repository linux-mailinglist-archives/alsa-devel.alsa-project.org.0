Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55713731AA8
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 15:59:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4E6823;
	Thu, 15 Jun 2023 15:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4E6823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686837587;
	bh=t+2wC354QWhU+O19T6Rgik2yRjFWn188LUJeRwNUofc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UTdNu3eI7AwjhR9AzzQ4IPaKp4mdAFM4EpRooULm69T4fUtvyFF/CcJlh5JWMw3/N
	 zrpSlBHG38CwIIyj4ZI/hzbnh5o6hKw9VZz9uDQIvKcmi7Eo3uXIDQzbPuIAwEi/fy
	 8qUoLT/U8J19OPG8Mz4VfdoCrVbwqhsC9E9ZMP20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6584F80130; Thu, 15 Jun 2023 15:58:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38148F800BA;
	Thu, 15 Jun 2023 15:58:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47911F80155; Thu, 15 Jun 2023 15:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A3EEF800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 15:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A3EEF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K//TbDno
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8089160FD7;
	Thu, 15 Jun 2023 13:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596B6C433C8;
	Thu, 15 Jun 2023 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837501;
	bh=t+2wC354QWhU+O19T6Rgik2yRjFWn188LUJeRwNUofc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K//TbDnohYFTagexGKtrRwrEcpN/jzaTeuXG/IgwXLO0tFsKSB2ekf1fUWY6laii1
	 vYKI1iTvA/ARANfsLZpZr7aOvHlfYkeWAUBIuWwYCfK2ttfbnKwyndrzncdYo89vro
	 BAJGpMo0u134UwgHdV2qEllY1Z6q1vL4Kgj5r2jpNTjGT82vFqrEgbRmD9qjCJpnt7
	 z6PQ/kSbZ7YMWix3F+oTjpvKZMT6XlxmIOmBrz7anElgNaPi4TqLcdIM/04sFPCNn7
	 3z3yjXZOyHFZlNrVM2Q0k/uu3KnO24RVabGom8+uR0ylXX29cFu/I2vOYC3NeIYd1t
	 uSO27Q++cW+YA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, YingKun Meng <mengyingkun@loongson.cn>
Cc: krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230614122140.3402749-1-mengyingkun@loongson.cn>
References: <20230614122140.3402749-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v3 1/3] ASoC: Add support for Loongson I2S controller
Message-Id: <168683750003.557448.10961262618538846845.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: PZJXEJGFNKD47B5PXWAWA6HGW3RFPH7U
X-Message-ID-Hash: PZJXEJGFNKD47B5PXWAWA6HGW3RFPH7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZJXEJGFNKD47B5PXWAWA6HGW3RFPH7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 20:21:40 +0800, YingKun Meng wrote:
> Loongson I2S controller is found on 7axxx/2kxxx chips from loongson,
> it is a PCI device with two private DMA controllers, one for playback,
> the other for capture.
> 
> The driver supports the use of DTS or ACPI to describe device resources.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Add support for Loongson I2S controller
      commit: d84881e06836dc1655777a592b4279be76ad7324

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

