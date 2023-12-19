Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F3818F47
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 19:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43EB9E9C;
	Tue, 19 Dec 2023 19:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43EB9E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703009280;
	bh=75Es5ASDNV/OKxp/HlaSmARaKwxlUSU1EzBIpJTahRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PlwyQRLhH9wFE2cw4FQV2R+OQSHZlAVSCRC7vZRXrX3RhH7SmdoBXocQ3Sh2Ilntm
	 6BI9tM0ly/aLYDaavd4vWZLZ1NQoE8xj+55S9AtqkqYg2iNgZiVINVSv7o98dsufAJ
	 b5hs5I4rFjxaLiIe0AyULhBwJDWgRMHByMmQ4s5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBC3AF805D6; Tue, 19 Dec 2023 19:07:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A5BF805E2;
	Tue, 19 Dec 2023 19:07:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFC26F805AB; Tue, 19 Dec 2023 19:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F081FF80588
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 19:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F081FF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bbamb6wM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E121BCE1AAB;
	Tue, 19 Dec 2023 18:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8CCC433C7;
	Tue, 19 Dec 2023 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009215;
	bh=75Es5ASDNV/OKxp/HlaSmARaKwxlUSU1EzBIpJTahRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bbamb6wMIQTNf2EwRtb8UiN2rGhkeT3P8P/X+6ptYEgRlQK5Da0Dsmh+XELFHeiBw
	 pbkfnuMPYvQpHiCXo99GPo74qlJW/vBKogHtjMGgJkEge+lCEBy1l5k5YiLW08nSi2
	 YzNBgl3Scxhv0zJOG/HH9nfVsGWB9sIZo/C9VEELwDkWrVWsM6eB7EgRwq8pX8c4fC
	 Mlx/oEX/JenyAaKtZ2zHR7PEAipdYLRY6TpQmPqv/NhJb1fSZxRhOU+5js1HhcbSZ7
	 BO/sVIwYoObutr8vagWBI8lvIHRIzkYCTff8tKgQusvFu4BNvGCt4E0l5sj44sJpl/
	 LqbEy6WVyTmlw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
References: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
Subject: Re: [PATCH 0/4] GPIO inclusion fixes to misc sound drivers
Message-Id: <170300921190.125466.2748505947171245430.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 18:06:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: ZYQX52GJCDZMMJ62Z5JB2C3IH2EVOHYR
X-Message-ID-Hash: ZYQX52GJCDZMMJ62Z5JB2C3IH2EVOHYR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYQX52GJCDZMMJ62Z5JB2C3IH2EVOHYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Dec 2023 14:15:41 +0100, Linus Walleij wrote:
> Mostly dropping unused headers, and a single driver rewrite.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: hisilicon: Drop GPIO include
      commit: 487b467206fb2f3a21c93759d3b0ffe7044ed197
[2/4] ASoC: qcom: sc7180: Drop GPIO include
      commit: 809fc84b371a0364160254037d2bc34a8f5ce372
[3/4] ASoC: simple-card-utils: Drop GPIO include
      commit: 4504f63321e1a581a3c0cbc8de91bd0175d94783
[4/4] ASoC: tegra: tegra20_ac97: Convert to use GPIO descriptors
      commit: 26e91f61d6b91ccfb0bbb15cbc81845dd1d223af

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

