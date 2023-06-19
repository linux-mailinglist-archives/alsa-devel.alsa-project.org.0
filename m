Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F14D735FE1
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 00:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC25DA4D;
	Tue, 20 Jun 2023 00:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC25DA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687213891;
	bh=1Fai1c9PqtR1nbAseq/sPKVMxOFXSch7MmBt+o0w9SE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B/+be6Q1VcS8Zq/Hv+nbsdEJh4sferET5R6SKdM6q9lJeF8+FUhR1swH+ZH8UN+2f
	 dQ//CHNH2UJ5Ohl/ZKqsGxOli+LyWX5I5zCXOrV7Poy5IiiNSNKzXkiusfiXZ72YYU
	 9oxP/CMrc1u9UofztNXQ9Nrq09UofR4088AU8YPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3430F8057C; Tue, 20 Jun 2023 00:29:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7438CF80587;
	Tue, 20 Jun 2023 00:29:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25C18F80169; Tue, 20 Jun 2023 00:29:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D4D48F80130
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 00:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4D48F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W7bI+Z4R
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5A2560F38;
	Mon, 19 Jun 2023 22:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32074C433CA;
	Mon, 19 Jun 2023 22:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687213757;
	bh=1Fai1c9PqtR1nbAseq/sPKVMxOFXSch7MmBt+o0w9SE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W7bI+Z4RXdoKnSAQfVmWdPXZIz6ju2OLKJyLf75gQ3sLjh1VUnG4zk+WskfVUk4j7
	 vowDxMBzOLKs5fPcVMXgXrdyacOdwhtb9q3OCK2rYE3BuAP1iD3OSrTpqHu4t7M07k
	 bOsbtyvti6RUptBz1ITex243pDdP0LED/em/IHfz1WIgs45P3e2Q8lraGG/pXNoKxW
	 fKeGSkC8YtsX+7THc2ljZeTLsxCzJuAaDjcqs2tfyTZ4VJ7qBhUGh9dCGpQyFffuJH
	 bN8VzmlNpCYqwYR4gG9UY8CYe/mpo/4fxtqh1ZnYcCRDqOafZJRTTJfLnwsubokOKh
	 XmjGSeEKybNyA==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, Shenghao Ding <13916275206@139.com>
Cc: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
 navada@ti.com, gentuser@gmail.com, Ryan_Chu@wistron.com, Sam_Wu@wistron.com,
 tiwai@suse.de
In-Reply-To: <20230618122819.23143-1-13916275206@139.com>
References: <20230618122819.23143-1-13916275206@139.com>
Subject: Re: [PATCH v6 1/4] ASoC: tas2781: Add Header file for tas2781
 driver
Message-Id: <168721375392.200161.3235917580792681848.b4-ty@kernel.org>
Date: Mon, 19 Jun 2023 23:29:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: C5572KCHTR7G2ED43D44UQUFHZLUUY4J
X-Message-ID-Hash: C5572KCHTR7G2ED43D44UQUFHZLUUY4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5572KCHTR7G2ED43D44UQUFHZLUUY4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 18 Jun 2023 20:28:16 +0800, Shenghao Ding wrote:
> Create Header file for  tas2781 driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tas2781: Add Header file for tas2781 driver
      commit: 678f38eba1f2fe33ff700e85390ac98393e609ef
[2/4] ASoC: tas2781: firmware lib
      commit: 915f5eadebd29ba185ac506766a90120153b7e14
[3/4] ASoC: tas2781: Add tas2781 driver
      commit: ef3bcde75d06d65f78ba38a30d5a87fb83a5cdae
[4/4] ASoC: dt-bindings: Add tas2781 amplifier
      commit: 3e4ecd6c4e14e1eff8f52bd89240399e7dac881c

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

