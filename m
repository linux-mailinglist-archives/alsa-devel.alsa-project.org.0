Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E091A6DC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 14:48:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68C38218C;
	Thu, 27 Jun 2024 14:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68C38218C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719492529;
	bh=kwG4pDE4sXaZo2v92lBOIo5YyQRpnCgFs4AA7YDFwbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bIMR+Kp5ps7rd4z/xNIHK+WhgvAX4pGTVPh/skE/TMZfXurkdQammBtRWLmRI1aUe
	 zFIdGfw/4L4D/kWyi2hYEGxMsS+FYxf3vTnndeX32QhyIrjvVPricud8wwxy/uHv9N
	 /H+a6wFWDO821AVE2TtmhwybH5S5PYwjcF2ken40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD5BAF805A0; Thu, 27 Jun 2024 14:48:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 457E7F804F2;
	Thu, 27 Jun 2024 14:48:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD8A3F80495; Thu, 27 Jun 2024 14:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5615EF8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 14:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5615EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r1jDJ8gx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C785861E87;
	Thu, 27 Jun 2024 12:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32285C2BBFC;
	Thu, 27 Jun 2024 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719492476;
	bh=kwG4pDE4sXaZo2v92lBOIo5YyQRpnCgFs4AA7YDFwbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r1jDJ8gxTFY0XtG2wAsqNNAo6U7HRCbuBOu6M4eimwr+nx4R4JcIn/CT39kvxoEIe
	 g6wlSyAb2wvKer37vGa6QDKN5lHI1+T6was2Lcyf3vHYXPIz96qg5hPFPxzZSWyvOL
	 TkJp/oojmPUntcEl17o6zQZnXanNJ6ad+jZsgibxoUD+FHUWfYz1cOOvxAHSHYkHAm
	 sdTkLDjQhEYs3+xHhq8rZbiqd+CrVPpSJw6V/bw8TgX6DI3TnK1kGvmv/DM1N1wxdw
	 HdounDAYNnh1zebFKqa4yVE2EOfp9Ajg0jh5GpX8f5JCth0b4SxCF81RakWih8ECft
	 FuS5Tnq3Q5w+A==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org,
 Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
References: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/5] ASoC: simple-card / audio-graph:
Message-Id: <171949247492.260548.7964627144622460151.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 13:47:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: WX2F52Z2SZMAPQF3MC2K4MVOZBUDGZLI
X-Message-ID-Hash: WX2F52Z2SZMAPQF3MC2K4MVOZBUDGZLI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WX2F52Z2SZMAPQF3MC2K4MVOZBUDGZLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jun 2024 06:02:04 +0000, Kuninori Morimoto wrote:
> Cc Kochetkov
> 
> This is v2 patch-set which adds link-trigger-order to
> Simple-Card / Audio-Graph-Card.
> 
> Link: https://lore.kernel.org/r/87v82ls82e.wl-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: audio-graph-port: add link-trigger-order
      commit: fafc20ded3f4659873c83c2af6d389983d480994
[2/5] ASoC: simple-card-utils: add link-trigger-order support
      commit: 5d9cacdccf17bd33dac3ea378324650159c2a863
[3/5] ASoC: simple-audio-card: add link-trigger-order support
      commit: 8696d732f1c804312d44806242d4a91c49a7a154
[4/5] ASoC: audio-graph-card: add link-trigger-order support
      commit: 4d4125d8f5e19476c006014d5530b8127ed5703f
[5/5] ASoC: audio-graph-card2: add link-trigger-order support
      commit: e64343fa57335662b555477d9ddebd8285db2b66

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

