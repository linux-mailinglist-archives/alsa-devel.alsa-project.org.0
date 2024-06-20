Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A91BE910255
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 13:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3216E67;
	Thu, 20 Jun 2024 13:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3216E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718882147;
	bh=WafxhliPRyEtdHu8XM3VmHwl4v4hXdKq5VAzEfEn33A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QgL8yJJisHsafyBKtKa0GYO0F44QplGL6AysUyygvwv5hoEZoUCydeRGTlGe6fVbr
	 +e5TviakYPY7diFrZa1GcXkxdUcXlZlezVSf2H5t2s84+bdcViVsyntonshe+7A2iA
	 eesWHfqE9bgqlcEWNYIIp/elwuPisnoKkJ6WivOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EBD5F805CB; Thu, 20 Jun 2024 13:15:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D59F805C2;
	Thu, 20 Jun 2024 13:15:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C0BF8023A; Thu, 20 Jun 2024 13:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A24BFF80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 13:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A24BFF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EQVhvBka
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CB360CE2470;
	Thu, 20 Jun 2024 11:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773C9C2BD10;
	Thu, 20 Jun 2024 11:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718882008;
	bh=WafxhliPRyEtdHu8XM3VmHwl4v4hXdKq5VAzEfEn33A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EQVhvBkaTcXX2ugHc17DdJJc7uPAkD9nnqJwFgZs70Ecvo6vXRpWKDhF7TSy4CRwp
	 1ojtSM346+GaTunvzBOUKPBziDD/AjuHyfGx9ewjcA/0IsfV0ITMbhvhPHAKVwTupn
	 H4/Z4Qv5i4pF3oN1Qxz1Lb2FpO0R2RR9JYFfBou6vNiKdSzPKxRTgRMUg/M21K0E+N
	 LT6JmRJdafRDy0I6yV7uHVzUWuJMiQCJCq83jEchamCaYxuZve2Eu42YswQUex57Ru
	 4mGJ7083usdaziEGFYVRUd2FEqa+bFXifKlzvG4FG3uRHJZjQz/+f8G4WJ6gVQKB8y
	 QM2hyUrkzWF0g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <11f7e2c1a77f418a9965b96b81f6e660@realtek.com>
References: <11f7e2c1a77f418a9965b96b81f6e660@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1318: Add RT1318 audio amplifier driver
Message-Id: <171888200619.41155.11200893860620854951.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 12:13:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: U7FW2YMIAE5I2RFXSWTK2FFMLOGM2X7T
X-Message-ID-Hash: U7FW2YMIAE5I2RFXSWTK2FFMLOGM2X7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7FW2YMIAE5I2RFXSWTK2FFMLOGM2X7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jun 2024 10:20:41 +0000, Jack Yu wrote:
> This is the initial i2s-based amplifier driver for rt1318.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1318: Add RT1318 audio amplifier driver
      commit: fe1ff61487ace69cd4e680e36169c90667eb9624

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

