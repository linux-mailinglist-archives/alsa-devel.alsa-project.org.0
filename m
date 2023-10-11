Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E37C5DE6
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 21:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C637DFA;
	Wed, 11 Oct 2023 21:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C637DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697054089;
	bh=49brBIxir2A/eI0wSsvoiOpX9CqLvfF5NO+bYDf2LHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pRdNX8NcmI5u8rSdysBDqdL+96gxrh0wglxLXvkElgOlItpUv3nIHoL8TRCzIYAbV
	 Vyo069Bu/4gX2hknjtvQCTVLlNo1kyue/P+qEXf/JjDgEzlwWoaNOW808qCnrRNpx1
	 Tm1J6KinyILdeoMR9+dCI10zRAT6ZqMJBwZy4hNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E8E8F80557; Wed, 11 Oct 2023 21:53:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EEB2F8027B;
	Wed, 11 Oct 2023 21:53:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89A98F802BE; Wed, 11 Oct 2023 21:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D0D2F80130
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 21:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D0D2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qQHnOKP8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3C396B821F9;
	Wed, 11 Oct 2023 19:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D95C433C7;
	Wed, 11 Oct 2023 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697054020;
	bh=49brBIxir2A/eI0wSsvoiOpX9CqLvfF5NO+bYDf2LHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qQHnOKP8Yog1aP6Q0ugc+XLAq/6nbwFNaqWNS4OTx9gAquHhqPkoXEcpHjwqiYrWy
	 psCTd3Wbe1j4Y4yJXtEzz8oXNYRa+7aC3SkPOgiE0kR/RfJj23rzMedsOb2j2vn3tz
	 7mq0qdCUUvoH4m8qcp0h1Kb5Svy6RoGYrPtQDjinrVvOBfy6ExLn6szu+3nHbn0oT3
	 JmRY3HXQL1iWeBVDKMogLREnEmQ534XjLqxki2RAD7D52Q77oZXtvxgpMdTTMmDlcx
	 dRQbgUOEZj1dNqvaWEmv70JIyBaK6kx1H1QHpCNMsyUJCu8mWDyTnYdkYL/fXuhFd4
	 tKWuAwtolZkBQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20231011134853.20059-1-rf@opensource.cirrus.com>
References: <20231011134853.20059-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Fix missing include of gpio/consumer.h
Message-Id: <169705401914.99325.7680075672500717976.b4-ty@kernel.org>
Date: Wed, 11 Oct 2023 20:53:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: FOJYQH7T4VUJ6PYYGI7DBQAPVNXRYSM4
X-Message-ID-Hash: FOJYQH7T4VUJ6PYYGI7DBQAPVNXRYSM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOJYQH7T4VUJ6PYYGI7DBQAPVNXRYSM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Oct 2023 14:48:53 +0100, Richard Fitzgerald wrote:
> The call to gpiod_set_value_cansleep() in cs42l42_sdw_update_status()
> needs the header file gpio/consumer.h to be included.
> 
> This was introduced by commit 2d066c6a7865 ("ASoC: cs42l42: Avoid stale
> SoundWire ATTACH after hard reset")
> 
> and caused error:
>     sound/soc/codecs/cs42l42-sdw.c:374:4: error: implicit declaration of
>     function ‘gpiod_set_value_cansleep’;
>     did you mean gpio_set_value_cansleep’?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Fix missing include of gpio/consumer.h
      commit: d6cbc6a3a856a7d8047316d81e2e039e44432acb

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

