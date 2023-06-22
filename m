Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55273ABC3
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 23:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57800839;
	Thu, 22 Jun 2023 23:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57800839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687470220;
	bh=CmoCKyNaOpNX7hbl6+IjFa9Mgxj6fjzJg7My8SnO4Jo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jbyk2fHLklOmDu9hdtZmIKL8nfwp68L8Tvp1LPk5Qv8dEVx48zdA0BmZ19G+yagmt
	 TXPm+cDQ/qCTfN5SToYoVNn2DZ1OettTvyasnyt3Dx6786gXTf0b9W+irvLmULD38S
	 S4irBp39dAx22Tyr+avvxKUtf04D7VQYAxNrqDpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C442F80163; Thu, 22 Jun 2023 23:42:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C20B3F80132;
	Thu, 22 Jun 2023 23:42:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB89F80163; Thu, 22 Jun 2023 23:42:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C26D7F8003A
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 23:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C26D7F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YEbeTuG/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A18361898;
	Thu, 22 Jun 2023 21:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F086C433C8;
	Thu, 22 Jun 2023 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687470153;
	bh=CmoCKyNaOpNX7hbl6+IjFa9Mgxj6fjzJg7My8SnO4Jo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YEbeTuG/V/Mw8pMW2ykLWzTkV+Ujvw27lgCNVzl2bc/F93XgxYmxuxv0Ebr9K/yYH
	 Mj+9YtNH/FkgIHqRHwQc3lOnSAS5Zy60sleRogWIVseiia/4PsTudAaUZFNAz2jfBR
	 7GaQKJow5Bff1kXvQ4uRGYa5IS9WzAHPTujsFRDGwk4DN7fcGUgX3PNh8cOIA/Fmrc
	 I/IDY1HQ3n+vfjq/ihcMeuLNl2sbRhNYbC1RO5Ol9A5/vDjS/yMubOXUTThaTzQhXq
	 79BsBexoWDtgrqZ+SDCB0yQ9IF5+Hh0IymcmCb7X9B7CyfOOnm16EToyxkAfyRcDwU
	 cW2sF4V5ZtpZw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 ryans.lee@analog.com, Tom Rix <trix@redhat.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230617122635.3225639-1-trix@redhat.com>
References: <20230617122635.3225639-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: max98388: set variable soc_codec_dev_max98388
 storage-class-specifier to static
Message-Id: <168747015091.308583.17966762362837372641.b4-ty@kernel.org>
Date: Thu, 22 Jun 2023 22:42:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: MZ2T77YWMGCO7KK7VSMVT7IDXP4HS7UF
X-Message-ID-Hash: MZ2T77YWMGCO7KK7VSMVT7IDXP4HS7UF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZ2T77YWMGCO7KK7VSMVT7IDXP4HS7UF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 17 Jun 2023 08:26:35 -0400, Tom Rix wrote:
> smatch reports
> sound/soc/codecs/max98388.c:890:39: warning: symbol
>   'soc_codec_dev_max98388' was not declared. Should it be static?
> 
> This variable is only used in its defining file, so it should be static.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98388: set variable soc_codec_dev_max98388 storage-class-specifier to static
      commit: 320d0e2db9edcde026aac93359624c1d429cb865

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

