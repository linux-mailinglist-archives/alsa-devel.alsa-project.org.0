Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B898FD961
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 23:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6901CDEE;
	Wed,  5 Jun 2024 23:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6901CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717623990;
	bh=8hay60Greow1omChJOGvvYkdjMVtVCAHBT0W/Ohlr/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X5z0pqy1GRVj5Q9WRiyYH5pyYCSNXm+6AQBbpBlCowSw4YKNoUuYMSmxFwGV0BYY1
	 j6nYDVA7T6JPvRKGTNiG/Myu5bBQU14Bbaub6PDYlqnihUoskmANbUE4FqdmGHcQ0S
	 rfQTBVa2sbn3LuUZ+Wa4tvuMRsnPL4XId/90Cyz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 754A7F8059F; Wed,  5 Jun 2024 23:45:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DEDDF8058C;
	Wed,  5 Jun 2024 23:45:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39EFDF802DB; Wed,  5 Jun 2024 23:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A6B9F80496
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 23:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A6B9F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TKdvPWUa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 089D2CE19BE;
	Wed,  5 Jun 2024 21:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E725CC2BD11;
	Wed,  5 Jun 2024 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717623506;
	bh=8hay60Greow1omChJOGvvYkdjMVtVCAHBT0W/Ohlr/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TKdvPWUa35aZm/YidZOLUclkifjdNdJ4sK3LN9XTkOV+0/UEqGfwMZKdwZZ8rZrMK
	 zrCngkF3t4ikRnDHdIrvv5atgc/esY7h1Te52fLbSeeYgGH8MAZa6gsBbd1K/pkIQ8
	 q8XDwCyb4aInC9jaOC2UQ6uJU4G2h8MiG7DIXDIVDHVZ+mZ+Cnb1A0+1RRw6H18gHK
	 YIY9TNXKJMtFfh5DPvqaYQSOMt9vljSO3ZAFnfhtMcYtSkxJk67b4ddmy8LdbJM1pA
	 dIiG689+qgW540wYbbt1x9IOP4B+9Bzc8/8Os8z/sNNuSURDxY9hbn7h4oCMvmtt1k
	 A4/iWSdPf3IIw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
In-Reply-To: <20240528-tlv320adc3xxx-dt-gpio-fix-v1-1-209fb2c2f86f@axis.com>
References: <20240528-tlv320adc3xxx-dt-gpio-fix-v1-1-209fb2c2f86f@axis.com>
Subject: Re: [PATCH] dt-bindings: sound: tlv320adc3xxx: Fix incorrect GPIO
 description
Message-Id: <171762350367.565712.5511446466309082536.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 22:38:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: PYFD3HH4DLBBZJLVPBOWI4EI5VWN5I5P
X-Message-ID-Hash: PYFD3HH4DLBBZJLVPBOWI4EI5VWN5I5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYFD3HH4DLBBZJLVPBOWI4EI5VWN5I5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 May 2024 17:40:04 +0200, Ricard Wanderlof wrote:
> Fix the description for the ti,dmdin-gpio1 and ti,dmclk-gpio2
> properties to correctly describe that when configured as general
> purpose outputs (ADC3XXX_GPIO_GPO), the pins are available via
> the GPIO framework.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: tlv320adc3xxx: Fix incorrect GPIO description
      commit: 39d762edd1f353c4446dbce83a18da4e491cc48e

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

