Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22873AC94
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 00:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2692850;
	Fri, 23 Jun 2023 00:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2692850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687473331;
	bh=ma8yFR5QnALuCTyQbyzW/gXgi2WHYs1DAJMOAeHZ5cM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UC5/bLWM2QeI0261Oyg7lqmeJVSl9T3RVN9D5MuQNUe6YeK3DBnG0tZqvNaJw+AOt
	 rjsGuf/laDDVwCDVGb6+Fvmgbzd4i7pUJX1iadGOvaxYqwLcPeoqGQ2WAwsMy+KMV/
	 Ieiwa3PdEwtxbFtOeKenPE/tjYy4h+X5vzZWm/3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89361F80570; Fri, 23 Jun 2023 00:34:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD616F80564;
	Fri, 23 Jun 2023 00:34:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 443B5F80567; Fri, 23 Jun 2023 00:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 137AFF80169
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 00:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 137AFF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qSKzWAxV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7DDD61903;
	Thu, 22 Jun 2023 22:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69A6C433C8;
	Thu, 22 Jun 2023 22:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687473229;
	bh=ma8yFR5QnALuCTyQbyzW/gXgi2WHYs1DAJMOAeHZ5cM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qSKzWAxVTU4YlMrv/k79Lu0IAzA7Wuogok1jqFuTUcVQTZbDinrIT/ypsWQXoPztj
	 QGJfeDsP/MHMWyOvELrLXkMyUdX5/lC5PdIYronA+rNWHuZ4DKxycGqO/DXRMKfv+W
	 qqAXy9hmZA34ySWMUyggPp6Y/T26LS0hOcRbALM5HtFP9agcaia5ZXHoI9sbUPjQw0
	 dsIFDnYxlma7cTAIK4aQLEUWtgDoSZwLM0ufNS1q+AB4QecICkq/wB3jK//SXY7sJN
	 vPoYmPztsWKGbxVo9akSbHF/zBS2dhCvc79B2drdjiEWCEqTqzeka1jkJYWbJBbu91
	 tn+reAMp8lDCQ==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzk+dt@kernel.org, thierry.reding@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com, mkumard@nvidia.com, sheetal@nvidia.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH 0/8] Few audio fixes on Tegra platforms
Message-Id: <168747322434.318849.728081824901814342.b4-ty@kernel.org>
Date: Thu, 22 Jun 2023 23:33:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: IECPPK6WMWELL4FMP4PIIGM6OFWROJCJ
X-Message-ID-Hash: IECPPK6WMWELL4FMP4PIIGM6OFWROJCJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IECPPK6WMWELL4FMP4PIIGM6OFWROJCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 Jun 2023 17:04:08 +0530, Sameer Pujar wrote:
> This series fixes some of the issues which were observed during an attempt to
> enhance automated test coverage on Jetson AGX Orin. Below is a short summary
> of the issues and fixes:
> 
>   * Sample rate coversion failures above 48kHz.
>   * AMX and ADX test cases failures due to incorrect byte mask.
>   * Atomic sleep in RT5640 codec which is present on Jetson AGX Orin.
>   * AHUB clock fixes on Tegra234 and previous chips.
>   * Minor cleanups in ASRC and AHUB driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: tegra: Fix SFC conversion for few rates
      (no commit info)
[5/8] ASoC: tegra: Use normal system sleep for ASRC
      commit: 2cc41db71a434844ca97b6e30c9a30a2464a996e
[6/8] ASoC: tegra: Remove stale comments in AHUB
      commit: f47d43283a4233528683deaaba95f0ee2cfe862d

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

