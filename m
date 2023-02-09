Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CD69106F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D87583E;
	Thu,  9 Feb 2023 19:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D87583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675967940;
	bh=m3VjIjkXjpczEE/UKggPWCZa7ltciaHAVYcIm/gP1Mw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldLzp3z7kGglu7nF5mxyfyttLw2qXQYlM5vL8WFxliiQKZEgyQ7/hO0oXA8sV10wm
	 r60rkZzNB1x+HWJKHjFDwh8UUPXE/MP9iljOWNiDcOmVtth3YOydTINTQGwk3GFdMD
	 qGAz4Wd1MwL6PsXwsiDoentgRGZHbF7/DuROLS7w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 964D9F8052D;
	Thu,  9 Feb 2023 19:36:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E375F80551; Thu,  9 Feb 2023 19:36:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81ECBF800E4
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81ECBF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n2kUP7FO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2358261B95;
	Thu,  9 Feb 2023 18:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE69BC4339B;
	Thu,  9 Feb 2023 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675967788;
	bh=m3VjIjkXjpczEE/UKggPWCZa7ltciaHAVYcIm/gP1Mw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n2kUP7FO4eMwJ3xUqLKBncdTLjfyZEf/gQC4otqY7i/XBwWsByQW/Xd4pL2W4BirR
	 OcYEelgbeJ9Wx1UL8/MnHFFJjXSFu0YblgXQcDlpgulw1To93dG2kloxEc4hvqvvoD
	 lvbzO6Gmue47PyqPkA5zPOw5WEOKE0hJsR57LfBvjMTv+AQDBzG7U/pnnM/jTo8CHs
	 TIAKzs0Mq5op+OfP76353a3u9r4rTSuFdlqSd5+fvk9TFnBgikQSk9qbPV4TTv9GJr
	 nSrO04ax3DKmArkf7AFz5rLo1nrNH434BjzoReYzAqCDguW256rsI51QIqgthS5IOJ
	 96RgDokh+ayWQ==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, oder_chiou@realtek.com,
 Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1675953417-8686-1-git-send-email-spujar@nvidia.com>
References: <1675953417-8686-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH 0/2] Codec support on Jetson AGX Orin
Message-Id: <167596778569.879652.2944492731365735456.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 18:36:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: IKDX2YS3K77Y3373IMCF3RUKHKBANBZA
X-Message-ID-Hash: IKDX2YS3K77Y3373IMCF3RUKHKBANBZA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKDX2YS3K77Y3373IMCF3RUKHKBANBZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Feb 2023 20:06:55 +0530, Sameer Pujar wrote:
> Jetson AGX Orin has onboard RT5640 audio codec and uses I2S1 interface.
> Add DT bindings to enable codec support. Series also contains a clock
> fix in the codec driver.
> 
> Sameer Pujar (2):
>   ASoC: rt5640: Update MCLK rate in set_sysclk()
>   arm64: tegra: Audio codec support on Jetson AGX Orin
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5640: Update MCLK rate in set_sysclk()
      commit: 9f138bb2eaf661788df459dfcaf38feb080af41f

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

