Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70472E838
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E47E97;
	Tue, 13 Jun 2023 18:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E47E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686673215;
	bh=4GhrvWbWuYPJtW5+CanHJB0yv/xqs36FuvVinX1XPMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FCxJqu39IChzkyY7Ts/Iwa7YY1PfB2CbGysljuo/j4D9oZHzluSJjsTdUUHmocite
	 JTwQQHDmdr/nPW6D6+Oi3leM/OsDDprUiIaVmpwcNm65l27On1kC6OeihtKE6zlHOk
	 vp+uBuwK0NXYU06JcM1yTVjb8u5WPWeaoM3JhuX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59D20F80558; Tue, 13 Jun 2023 18:18:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F42F80549;
	Tue, 13 Jun 2023 18:18:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94642F80149; Tue, 13 Jun 2023 18:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BE2FF80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE2FF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VdKrTbJI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 770FD62E84;
	Tue, 13 Jun 2023 16:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA90C433F1;
	Tue, 13 Jun 2023 16:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686673088;
	bh=4GhrvWbWuYPJtW5+CanHJB0yv/xqs36FuvVinX1XPMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VdKrTbJI02Y7hAXp4r1VqU+GYKqVFthf8VqNVyh8oe7qits/QZQYO9WAHp+9qppsY
	 8jjdIf4ANvUiCXwAZgLpimzbPO3kVdOflDjxhy5bKn2WaSctWATz9mcoOvk5RI74VS
	 WMyAkBTlnbDQkIbcEaGBWl6ULasFxDOCiU46KbxtJXXWrkOPhnc2Ih+2mWNysUIhmH
	 wfgHNdf5TKL1pCLmG93zgG7KdRkhuqoKJExxDB1qQ42RgWD6h74qqJYrfX4wyOoVSy
	 TZGRxVYM7xh2Qg5INXq0uMp6N2mHuQ9LwboC+ClRBv1Ftq47W66LU7/G9rGs7YHusr
	 rHt3mDa8Elrfg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
In-Reply-To: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Message-Id: <168667308755.106697.16107089561663778961.b4-ty@kernel.org>
Date: Tue, 13 Jun 2023 17:18:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: TSVOVQG6LO4QIFVJ6FVDT3PBELZHKGVL
X-Message-ID-Hash: TSVOVQG6LO4QIFVJ6FVDT3PBELZHKGVL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSVOVQG6LO4QIFVJ6FVDT3PBELZHKGVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Jun 2023 11:12:40 +0800, Bard Liao wrote:
> Currently, ASoC supports dailinks with the following mappings:
> 1 cpu DAI to N codec DAIs
> N cpu DAIs to N codec DAIs
> But the mapping between N cpu DAIs and M codec DAIs is not supported.
> The reason is that we didn't have a mechanism to map cpu and codec DAIs
> 
> This series suggests a new snd_soc_dai_link_codec_ch_map struct in
> struct snd_soc_dai_link{} which provides codec DAI to cpu DAI mapping
> information used to implement N cpu DAIs to M codec DAIs support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: add N cpus to M codecs dai link support
      commit: e8181a895b05b264883288c4043ff83f893b56b0
[2/2] ASoC: Intel: sof_sdw: add dai_link_codec_ch_map
      commit: 0281b02e1913a9443ce891dcc13613829e4dc3c5

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

