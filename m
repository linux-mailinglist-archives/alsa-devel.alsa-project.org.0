Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D75926856
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 20:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B75E7F;
	Wed,  3 Jul 2024 20:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B75E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720031717;
	bh=75LWJFdF9aagmw6N/35Fph3+fUpWNs+Pce1uKbQYf3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t84epDoTim1uW21OXozrOh3e0c3WVCjI62wT8QC4dDAGuv4hnDfC+oBveVgsNSBT8
	 bryyqKV/LthuZni80BMMuevCEfLOxCnKXlZpgmMkDXUfjGcrPqmBKUSWm1HdbsUIb7
	 QsKON3s3hoFAGoEwUFYZeVAPtEcvVOhqJM1fhgAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 800CCF80301; Wed,  3 Jul 2024 20:34:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7094F805AE;
	Wed,  3 Jul 2024 20:34:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FDA8F8025E; Wed,  3 Jul 2024 20:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50E89F8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 20:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E89F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZlFinWsa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E20A460C8E;
	Wed,  3 Jul 2024 18:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A33C32781;
	Wed,  3 Jul 2024 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720031667;
	bh=75LWJFdF9aagmw6N/35Fph3+fUpWNs+Pce1uKbQYf3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZlFinWsaNVrvGmZiNySxfxWG2sUm9QrY1MBykONGigKwpKDeYa0FHi8EKqXBxZJuy
	 dsflTJ9guyvawMQH4J1OX8SDt6pj/rPiloc86OspDM0jkQK1cBoz0J5RU4hVJuPezI
	 CxquH0GajkhBQ43C66pl/D4BpsQuO4oK6BJzmIk3bxrvEYxl+E7/rrW/ibS20Z5D+1
	 QhDpUu0gZi0lZ2J1k67ownG6xVGF9InQMeJANT7C9A6eWg+rvGibhwl1BRtmgFcE9/
	 isSK/HbjmPbXNIDWpfEzxypfSCP5E0ajN4t952uOuWjePgJBMzBYLMKLskq5hIwcaS
	 /WaETrjuuBkiQ==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
Subject: Re: [PATCH 0/9] ASoC: Constify struct regmap_config
Message-Id: <172003166452.103730.17308665420530881641.b4-ty@kernel.org>
Date: Wed, 03 Jul 2024 19:34:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 7MHLCLVXXQNARRJCTLKL44SQKCMLOXNZ
X-Message-ID-Hash: 7MHLCLVXXQNARRJCTLKL44SQKCMLOXNZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MHLCLVXXQNARRJCTLKL44SQKCMLOXNZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Jul 2024 18:20:56 +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_config
> structs under sound/soc that are effectively used as const (i.e., only
> read after their declaration), but kept as writtable data.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: cs35l34: Constify struct regmap_config
      commit: cb148180125ef88a4c1c20ecf25337f1e45657bb
[2/9] ASoC: cs35l35: Constify struct regmap_config
      commit: 306e0317bddfbb6bea1ad31c3daeecaec0304295
[3/9] ASoC: cs35l36: Constify struct regmap_config
      commit: 0271df05e6fe92b7000dcce5058a0ed6af127ef6
[4/9] ASoC: cs53l30: Constify struct regmap_config
      commit: 52f0aa5fb9437013f7f35d61426de497a8927891
[5/9] ASoC: jz4760: Constify struct regmap_config
      commit: 8d9c0ede48f29c9fccd095952d657fc5696da9ac
[6/9] ASoC: jz4770: Constify struct regmap_config
      commit: 7abfa29ba6a43c5e25622de1ba1f1846b9c9b5e8
[7/9] ASoC: wsa881x: Constify struct regmap_config
      commit: 5ffab1d3f3f3281869b894070fe4438f307759ec
[8/9] ASoC: wsa883x: Constify struct regmap_config
      commit: 22c361dc7ce4d4d6a688febee57d6e4b130b96b3
[9/9] ASoC: wsa884x: Constify struct regmap_config
      commit: e15cc906b9c5af5414bb6002b6a036550bca6bd8

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

