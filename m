Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C083E7A0271
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 13:21:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B690F1E0;
	Thu, 14 Sep 2023 13:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B690F1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694690515;
	bh=BAzmsoSj0BnX7MoU6zXX/2/yna/irLVGocmTBn20dLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iltLjrgvw0xKM0qF+9+pgxlUup4mmSxb1V9XluWNaxwOQYlKoDnF1dCOu/dbGdQjJ
	 8wUlyJwMzQSXcVUCPS9zQmhQWCDb3wXQBWLFn2swYh6sUdkX3m+01+jrGeAF8gBc/X
	 PTVBW5Oa578aYVqZrIk+qxm9R0pUMVVdhU8yzIXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DA00F805A9; Thu, 14 Sep 2023 13:20:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81631F80580;
	Thu, 14 Sep 2023 13:20:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD8FCF80246; Thu, 14 Sep 2023 13:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD2C0F80246
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 13:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD2C0F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CO+q3UPZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A3D29CE268A;
	Thu, 14 Sep 2023 11:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CFBC433CB;
	Thu, 14 Sep 2023 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694690381;
	bh=BAzmsoSj0BnX7MoU6zXX/2/yna/irLVGocmTBn20dLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CO+q3UPZlmZLLf52885QGYBw+GfGnDj3i2p/OQmZzu3eZty6e9GYRLtwlYF/1iBvy
	 JqqHmvqKPUjITmfleG4EcUwE+DtLuNOQEcw/qKx4WQTB8+Nnh2n2Qier9+TtZgwEfe
	 QPjk14lFH9/4hrgmmOXQZ6mYO8oRvsAAFV4bbaJAW3ES8u31V3SM0Zh88DarVHYRg2
	 ht6//d0ZbYMVqTQvLJ2YE7CGO2+So9cGEIQzNVkmdXPm5WBZUt3GLcfAMPZhFi9A7F
	 QmM1Tk+/hbBOtl4cbRK8jd8C0L1pZq/2IFiJHZ1xWC2N0rQK39eYPzl7QVjCkC0dja
	 OtBbIe1FfxNAg==
From: Mark Brown <broonie@kernel.org>
To: Uday M Bhat <uday.m.bhat@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230913150012.604775-1-sbinding@opensource.cirrus.com>
References: <20230913150012.604775-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/3] ASoC: cs42l42: Fix handling of hard reset
Message-Id: <169469037974.23670.12014281893865046396.b4-ty@kernel.org>
Date: Thu, 14 Sep 2023 12:19:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 4MSOTDUYE7RYAWHZR34X6CCOHQ2AX2MM
X-Message-ID-Hash: 4MSOTDUYE7RYAWHZR34X6CCOHQ2AX2MM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MSOTDUYE7RYAWHZR34X6CCOHQ2AX2MM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 16:00:09 +0100, Stefan Binding wrote:
> These patches fix 3 problems with hard reset:
> 1. Ensure a minimum reset pulse width
> 2. Deal with ACPI overriding the requested default GPIO state
> 3. Avoid a race condition when hard-resetting a SoundWire peripheral
>    that is already enumerated
> 
> Richard Fitzgerald (3):
>   ASoC: cs42l42: Ensure a reset pulse meets minimum pulse width.
>   ASoC: cs42l42: Don't rely on GPIOD_OUT_LOW to set RESET initially low
>   ASoC: cs42l42: Avoid stale SoundWire ATTACH after hard reset
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs42l42: Ensure a reset pulse meets minimum pulse width.
      commit: 41dac81b56c82c51a6d00fda5f3af7691ffee2d7
[2/3] ASoC: cs42l42: Don't rely on GPIOD_OUT_LOW to set RESET initially low
      commit: a479b44ac0a0ac25cd48e5356200078924d78022
[3/3] ASoC: cs42l42: Avoid stale SoundWire ATTACH after hard reset
      commit: 2d066c6a78654c179f95c9beda1985d4c6befa4e

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

