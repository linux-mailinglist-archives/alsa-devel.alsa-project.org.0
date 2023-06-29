Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F89B74251A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86BB57F8;
	Thu, 29 Jun 2023 13:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86BB57F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688039058;
	bh=9smR4hwjfU8+YKynETyJV8YFpd23KQ+7eQokkBFjjxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rRBoPSasybvDn2Grf2UWPKnqJqoNzOGNaXm8VhCbp8nCZWOkH+xMhap0HeBDd/fjF
	 6b9/IpnKdpUKXzHM54la4SqePTOwbfJsSP25kgRyN61KKdLjP4jxqef+R4SDHYBIS8
	 oReGlOiymIg3rBx6brwkajG8Ur2PhvyF5Fkp2ou4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B800BF80246; Thu, 29 Jun 2023 13:43:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C8EDF80212;
	Thu, 29 Jun 2023 13:43:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 704FDF80246; Thu, 29 Jun 2023 13:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2544DF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2544DF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eXaFaPa2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82EE76151E;
	Thu, 29 Jun 2023 11:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D27C433C0;
	Thu, 29 Jun 2023 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688038998;
	bh=9smR4hwjfU8+YKynETyJV8YFpd23KQ+7eQokkBFjjxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eXaFaPa2JvlA5gSM+zRwrlkmrGw4sbUzixco2eOeN+bwt5GgVDGpUToNRZZKSna8T
	 IO8n7YBxIynizRXRtyfqVp62ep57cuKXsqKJpYgf5l45CyRMH6AWKeSYo3nBX2DHLU
	 /7VXlbvI/zJ7te3oTWeNxbuP7qFzwNWSwh+oCAUzoxTJOzj9Ig6VA6xTZy3C7z6jrj
	 wJucG9fdSNAk21U2dkwMJTCoKb7r5xsaIoh4cQ0T7IvxCx84g+8BqD+f5Vwc+xmpYP
	 I1oIdpuZJhtpU8jccUoR1GI6EqG2WZ0nRlt4Bo4wSI3116+1fMYylAdcuV9zo0nqgj
	 d+TK1gMFfRsBA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzk+dt@kernel.org, thierry.reding@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com, mkumard@nvidia.com, sheetal@nvidia.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
References: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH v2 0/5] Few audio fixes on Tegra platforms
Message-Id: <168803899500.40884.7057697107524456502.b4-ty@kernel.org>
Date: Thu, 29 Jun 2023 12:43:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: RKBNFBFR57I4GCIK6R7C7DOEGPOOJLNK
X-Message-ID-Hash: RKBNFBFR57I4GCIK6R7C7DOEGPOOJLNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKBNFBFR57I4GCIK6R7C7DOEGPOOJLNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Jun 2023 10:42:12 +0530, Sameer Pujar wrote:
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

[1/5] ASoC: tegra: Fix AMX byte map
      commit: 49bd7b08149417a30aa7d92c8c85b3518de44a76
[2/5] ASoC: tegra: Fix ADX byte map
      commit: 6dfe70be0b0dec0f9297811501bec26c05fd96ad
[3/5] ASoC: rt5640: Fix sleep in atomic context
      commit: 70a6404ff610aa4889d98977da131c37f9ff9d1f

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

