Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C83070C1E8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DDD3A4A;
	Mon, 22 May 2023 17:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DDD3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767898;
	bh=Cb7wYsL4GyXP/HGoxz6KSl4qGY9mIiX9Yg7CdwhMpu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GbEIfCkVe7SnAH5BevBBi73uoAC6ctgREYvQYZ+sA/zBOjo2yblKlOXxpyoQvW8iC
	 Vr/OHiBOzCcMVXnS0RK8vnKPfViAkNRPxGIoTpCQVvopBeFtLQ0ts6h4AZa/mOIbum
	 RYk1AOdJzUMKep2wmEQF8ZfUYhie26FdYUGGQDeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5302AF805BD; Mon, 22 May 2023 17:02:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C604AF805BD;
	Mon, 22 May 2023 17:02:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2903F805AE; Mon, 22 May 2023 17:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8656F80549
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8656F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fROP6QjY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8645623C4;
	Mon, 22 May 2023 15:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AFFC433D2;
	Mon, 22 May 2023 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767715;
	bh=Cb7wYsL4GyXP/HGoxz6KSl4qGY9mIiX9Yg7CdwhMpu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fROP6QjYw1cwPrTFMPPa52tHByCRAnAEYRJKYY/vLIZKUtsKCM8abpK46pBkHFgJu
	 V19r5mGgnv288GhjqNer5i+YZVov8RrPjn4Uj8HIS+c9cHE/PRTbCzZEz1AFLJXUPI
	 gy4i0ddWfVyErmnVB1L8Vgx7P3qJY4N/SV9TJ5c7eiF37I6WHHwBEtYHOBV3lVGQ1v
	 WiI9AItD9+w5zZpV0yVSNzVbWx+NwIAyJCyfwnp+r/zMlPNPgIQv77tJFUltMjZBJa
	 lWh4dwXhkC7qVpEy1Bf4rNYoW60hPhehkP5Y0GT/SJE5APF5VCWlARCJx3+pPG6Jfm
	 p2hfVEskU2NKw==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: 
 <f7987f18dadf77bfa09969fd4c82d5a0f4e4e3b7.1684594838.git.christophe.jaillet@wanadoo.fr>
References: 
 <f7987f18dadf77bfa09969fd4c82d5a0f4e4e3b7.1684594838.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: stm32: sai: Use the devm_clk_get_optional()
 helper
Message-Id: <168476771240.849172.17021857411511988497.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: WB4RLKHIXZM26SKDTLLOIU436423FSPG
X-Message-ID-Hash: WB4RLKHIXZM26SKDTLLOIU436423FSPG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WB4RLKHIXZM26SKDTLLOIU436423FSPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 17:00:50 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: sai: Use the devm_clk_get_optional() helper
      commit: 374628fb668e50b42fe81f2a63af616182415bcd

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

