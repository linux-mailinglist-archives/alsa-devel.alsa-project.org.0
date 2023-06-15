Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A712C731AAE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 16:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1867D839;
	Thu, 15 Jun 2023 15:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1867D839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686837619;
	bh=HDfK6TZ6p1z9konXBYN4xiV7FVSWRCnUgThCTPlpODE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GDLruza44w5midr0L03uuUdz8f2kqUq8LJcOSWiXd28tDn80sORo4Ub4288bAZ5tA
	 OivydwBILtj4N3mmOqOmqtFXP8DjTc8BsuwdtLQpbJPMZuXDATsK3YcXeftN/GgqdS
	 PHX/NhypMcVqLRgiMOyfZ7LihMMnDAP0dezt3bEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4864FF8056F; Thu, 15 Jun 2023 15:58:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 983EFF8055B;
	Thu, 15 Jun 2023 15:58:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C311F800BA; Thu, 15 Jun 2023 15:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F35ECF800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 15:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35ECF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MijxV188
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D37C763194;
	Thu, 15 Jun 2023 13:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBA3C433CA;
	Thu, 15 Jun 2023 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837507;
	bh=HDfK6TZ6p1z9konXBYN4xiV7FVSWRCnUgThCTPlpODE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MijxV188M3NQstbEsPBKj+rQV+7WTV0//Wbr3a4d9hw8Uh4EqXOfg6QCDXnAbBL3w
	 +pAhyiO0Nd5YMsZFl9bhjk0PQDxIxAWDXbE+BhfykWcGOwQ8DNQQ/Md7bB9BirALm8
	 UGFWqGhWUmu/KeTaAjC0+hOdgJ8A0F0Ygzh7ZPkV81o3IxSnB+foK4J0l78ccT1KjQ
	 yJtEqC3LtEmWDIbFo1IHk8it1Rh+JUSK+oIbMePCKvnQtwP1Irr2hBe17qwVe8U1kP
	 N/9GukHMt5b9RS/sLbuKqTNkrLStQp8A2nVjbO7weAdBsWLYqVjVDSx9DjqSUDgm9g
	 pivHGmCjswPKw==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, krzysztof.kozlowski@linaro.org,
 YingKun Meng <mengyingkun@loongson.cn>
Cc: devicetree@vger.kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230614122659.3402788-1-mengyingkun@loongson.cn>
References: <20230614122659.3402788-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v3 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-Id: <168683750444.557448.16842931306884549608.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: 7MVHOHTO4PHBSTAYEYKOJM4PNGG2E2QF
X-Message-ID-Hash: 7MVHOHTO4PHBSTAYEYKOJM4PNGG2E2QF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MVHOHTO4PHBSTAYEYKOJM4PNGG2E2QF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 20:26:59 +0800, YingKun Meng wrote:
> The audio card uses loongson I2S controller present in
> 7axxx/2kxxx chips to transfer audio data.
> 
> On loongson platform, the chip has only one I2S controller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: dt-bindings: Add support for Loongson audio card
      commit: fadccca8f33959857948e279045a3757b5f21d55

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

