Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0584BAA5
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 17:11:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94230844;
	Tue,  6 Feb 2024 17:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94230844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707235911;
	bh=rt2gbomlAKzHf86rD0Rdi08EvEQCBWqCJ3uvmPmjTF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RB5HHnIaWM4uhnnl8AWRdTCUDWGG5UZtT4reXhv2qd2gywEGsdiYZ79QFub0PF6RI
	 a3cKoHGkkTyT6JZ7KYg8+ObQIajPEdC84i6q+fV44+yvar7FYMFMzUmcUVZIbH0i7W
	 cAW1JNTZJXtCD7e2NB95gqtCod0GXpkKKitEbcGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D87F80589; Tue,  6 Feb 2024 17:11:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5077DF804E7;
	Tue,  6 Feb 2024 17:11:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7CD1F801EB; Tue,  6 Feb 2024 17:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B29BF800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 17:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B29BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hhjk+TCu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40CF3CE13D4;
	Tue,  6 Feb 2024 16:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D417C433F1;
	Tue,  6 Feb 2024 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707235854;
	bh=rt2gbomlAKzHf86rD0Rdi08EvEQCBWqCJ3uvmPmjTF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hhjk+TCu3GJOkW+S758ybNCIvyn0Ca9BCVhLHQNZh6SjtHrezuEaCl3XkfQGZ8+Vn
	 v+aRDxg7dZjeohPRgS4SpBASCui4OkuhFI4lmTgUkkqPw8/ZFSoLuNe+YEOp8azYsP
	 4jGCbrEIJkA5cX261dvVWc/e+PMoulXuhL/sd6FGdlucxsz6o9icMmqMGM8EPJHEY9
	 0OPc84SEqC3K7fLP2OA2IGep5FjG6W7m9D9ke+yrre8qjYJcxbWqAwJFM0MlFhgCPF
	 pnyStuxBke7AIYmD/6x5Pwd5MoOqGSp6u4zTdByF4simCNAhQxHXFJFZgse26HrD3H
	 Ezs5RO08eGmKA==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Dharma Balasubiramani <dharma.b@microchip.com>
Cc: hari.prasathge@microchip.com
In-Reply-To: <20240206064418.237377-1-dharma.b@microchip.com>
References: <20240206064418.237377-1-dharma.b@microchip.com>
Subject: Re: [linux][PATCH] ASoC: dt-bindings: atmel,sam9x5-wm8731: Convert
 to json-schema
Message-Id: <170723585073.1032228.17039996472357795011.b4-ty@kernel.org>
Date: Tue, 06 Feb 2024 16:10:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 5KR5FRCYINQF2JJGZEFAQXNGWLNWUIH6
X-Message-ID-Hash: 5KR5FRCYINQF2JJGZEFAQXNGWLNWUIH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KR5FRCYINQF2JJGZEFAQXNGWLNWUIH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Feb 2024 12:14:18 +0530, Dharma Balasubiramani wrote:
> Convert atmel sam9x5-wm8731-audio devicetree binding to json-schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: atmel,sam9x5-wm8731: Convert to json-schema
      commit: a15f859ca312feb4730c93320bbe46929d0f9d26

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

