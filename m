Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104B910252
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 13:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D821A4D;
	Thu, 20 Jun 2024 13:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D821A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718882135;
	bh=R2NB2dD7Vzl5o6yFPTha42LD8dT0EaIaGzHj+oxhCUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vn2RMqqPZuSjt3z6grG7YjHB6loCFfTFI2MlcJ7MSjJoFwck/KnM5uA1DujyM0hT9
	 Vu019gue1JUQpIBaXolQCc3Ah0avyv2Nml1Zm/YF6dbkeNYaoPslluJdbRDkGYlQvj
	 /eOf2R78UHZdFIGvMVzF5iOHhJ+W40B9KvpYPu4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C143CF805BE; Thu, 20 Jun 2024 13:15:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE40EF805A9;
	Thu, 20 Jun 2024 13:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36FCFF80266; Thu, 20 Jun 2024 13:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB12DF800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 13:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB12DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ucygHIlH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57B4862155;
	Thu, 20 Jun 2024 11:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FEDC32781;
	Thu, 20 Jun 2024 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718882010;
	bh=R2NB2dD7Vzl5o6yFPTha42LD8dT0EaIaGzHj+oxhCUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ucygHIlHyWU4C7EZlSnLKPYUfCv+DCzIrlH56q88HLNjb+bVzU1nxO32F9UHfOWYT
	 SFvuMoZ8jQyHHDA9M8omJd9bxzI6dy5F9mF4MM+r7SLP0F5YqS+sehuxgApaeO6Jfw
	 At6tU+Ca+K54JveHCGWAVjLOndG+hyMv6esNQkyMP3ziOFaJywjCI6oTpq/loo+iId
	 D6TVaieLl/OQe3H8HPPT9TBznrD9Me070U6Algbu1Thic5yOV6q41E/rf6BUhX0S2D
	 7DuJ3w/+jU/zelkfh4tNvj+jw13OD2e+Ez3uAKJ0MOB/3D6JIwkrhoHPKvwj4VCk/A
	 TRakVVcEileig==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <b3055442ce6d4994aa01aa1fad6ba1fe@realtek.com>
References: <b3055442ce6d4994aa01aa1fad6ba1fe@realtek.com>
Subject: Re: [PATCH v3] ASoC: rt1318: Add RT1318 audio amplifier driver
Message-Id: <171888200821.41155.10538174248657308306.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 12:13:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 567COV6GJA7UUPPRBXAWRXCAVYLHQHCS
X-Message-ID-Hash: 567COV6GJA7UUPPRBXAWRXCAVYLHQHCS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/567COV6GJA7UUPPRBXAWRXCAVYLHQHCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jun 2024 05:53:42 +0000, Jack Yu wrote:
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

