Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF879A96F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 17:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6A87F8;
	Mon, 11 Sep 2023 17:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6A87F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694444927;
	bh=V/6hBx5mfx0fd3CGt05eTAr9zX0uhJnhj4yOo8q7jvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iWx1V95NPHQG3dq7Yvqg6gvOTIme5PnjUElT4Ty6VGQ1Tf2jvqcp/NCnGnpI6TQRr
	 d/Y1NzntG+waKwW9eOAlvl0cQRj/2c3dD6tgqaDOr6wKqx0/l0dEKkg4GsNilQpcav
	 Mq5oTdPHmh/S3v4kI/ZL6WgWZz2vFdAakGlyhqLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A5AEF8047D; Mon, 11 Sep 2023 17:07:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE95F80431;
	Mon, 11 Sep 2023 17:07:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA96F80431; Mon, 11 Sep 2023 17:07:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63CCFF8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 17:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63CCFF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GpTK2/sR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C56FF61122;
	Mon, 11 Sep 2023 15:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EFEC433CA;
	Mon, 11 Sep 2023 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694444862;
	bh=V/6hBx5mfx0fd3CGt05eTAr9zX0uhJnhj4yOo8q7jvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GpTK2/sRNv5OM0TZC09QCDJ+z89ykEEW0HzWjtUQQQyDMbUAlotSUgO3hDmQms3mC
	 SjHNXCrzzH3pciauKJw+s6l2epY5XBuDMYEjF8WWilN+uhJJtdvn1MroneBHbJikO9
	 ewk5EM+L8Kn2cZI1+UBtOJK6H5sJ76fg2iEmUh+H421I4e2ywu6oVxJQP67AiuWDuF
	 IMh11Tx5q4HozD4yYj9J3IhfxRKmfivF6zQKuRP6hdo40cIrnZTkynN0lxhBVL94NC
	 t73StKrOtJSZL5ROTYjSKz8v62D/aAEB7UiJurIMUmXXFYTL4zoZOG59zI+8qGN6VA
	 fBcSaSQjbXlYg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20230907090504.12700-1-jbrunet@baylibre.com>
References: <20230907090504.12700-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: spdifin: start hw on dai probe
Message-Id: <169444486047.1851820.2260771441651865260.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:07:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: Y46TR7TNGQ2NF6O45VF2NCBR3BEKTRL4
X-Message-ID-Hash: Y46TR7TNGQ2NF6O45VF2NCBR3BEKTRL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y46TR7TNGQ2NF6O45VF2NCBR3BEKTRL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Sep 2023 11:05:04 +0200, Jerome Brunet wrote:
> For spdif input to report the locked rate correctly, even when no capture
> is running, the HW and reference clock must be started as soon as
> the dai is probed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: spdifin: start hw on dai probe
      commit: aedf323b66b2b875137422ecb7d2525179759076

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

