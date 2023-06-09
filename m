Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF17298FA
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 14:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA7A839;
	Fri,  9 Jun 2023 14:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA7A839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686312316;
	bh=0GQBW7j6HSXG2QxcUM0TdNRXbL/lSlkl2bRBEArjBJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mrBzZCYtTRTZC1kP6yBYyliyNcqNBtFohB+G5g6KXWc1cy1saSlaaQ7IwylgB7IEL
	 NQ5aKVyEQq4I5xA8QZyQrdI1TS1j85iGY2RdA0BytDswjlfJ8yFzKd5aBD257m30bk
	 mG3fVJIkpCShD5p4GvF0FN3uZFZY3cQxLsATNw3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC022F80568; Fri,  9 Jun 2023 14:03:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 587D4F8055C;
	Fri,  9 Jun 2023 14:03:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30203F80254; Fri,  9 Jun 2023 14:03:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97753F80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 14:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97753F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KhtCQHvu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6989F65750;
	Fri,  9 Jun 2023 12:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1590C433D2;
	Fri,  9 Jun 2023 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686312194;
	bh=0GQBW7j6HSXG2QxcUM0TdNRXbL/lSlkl2bRBEArjBJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KhtCQHvuFV2JPe9WKJ87HcwKMLoLizq08fFT/79lz55uxi+xXl6qH2vrpRODBb0EV
	 7edF8VDB4R/A2Iwnh79YHprxh3DQMceGVQL0B8wsv++Z06ZgpkSsgIRsK/iC+Q+mnn
	 /KIFD2mE3v5S0rqg5xAkSJ/GdTy0+E48QJOfCZ7YBv5bv7d2XgpXw0AJE6tagGYtUz
	 5Ajtxu8D8bxk5z3KPQg+cOun6gSd4YLvaDRz0uouHchcTFScDME87k5bZhfOs/tbeT
	 5SCNYWkJdH/nu6tTZSjjRcPfapvdLG1Km7Ggiu8ldwcy4J3vNxhlvs7JQ3bCSAgUco
	 //WxU8hbQXoCQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230606175951.215740-1-marex@denx.de>
References: <20230606175951.215740-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: dt-bindings: audio-graph-card: Expand 'widgets'
 documentation
Message-Id: <168631219234.40482.5968107738874823812.b4-ty@kernel.org>
Date: Fri, 09 Jun 2023 13:03:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: BGJVJ4PX7UUDTFXECJZWJQENOCWF66S3
X-Message-ID-Hash: BGJVJ4PX7UUDTFXECJZWJQENOCWF66S3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGJVJ4PX7UUDTFXECJZWJQENOCWF66S3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 19:59:51 +0200, Marek Vasut wrote:
> Document the encoding of 'widgets' property to avoid confusion.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: audio-graph-card: Expand 'widgets' documentation
      commit: 7077b1864ca8f0d616c497b3ee890d72d1da0a26

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

