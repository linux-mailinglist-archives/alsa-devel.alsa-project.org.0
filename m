Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E0787428E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 23:14:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC70F868;
	Wed,  6 Mar 2024 23:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC70F868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709763286;
	bh=jNi48i2+fTqYr+Y58lY9CyC84hVExCbXJ7dH0iED4sI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BEeB3KI8jkMRGxq3gVAL32M8IN1vBUMaJ9WzseNDkWml9IDhx2F89pBKSgcMagG0d
	 grf4GDhUnA/Umj7rTW2KcHFUcoXc7SozLQH4Aj7aOj/txsrJzedtBQ8G1+80Z3rK3K
	 BnkLnhi0CCRkG34gOGrWuWUYqTBgm1pinzvxYgZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD9EFF8059F; Wed,  6 Mar 2024 23:14:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83BB9F8059F;
	Wed,  6 Mar 2024 23:14:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F512F8024E; Wed,  6 Mar 2024 23:14:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE25AF80087
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 23:14:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE25AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dtP0IQve
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9A1C61120;
	Wed,  6 Mar 2024 22:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C74C433F1;
	Wed,  6 Mar 2024 22:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709763241;
	bh=jNi48i2+fTqYr+Y58lY9CyC84hVExCbXJ7dH0iED4sI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dtP0IQveXPFOCfjtVqkLfh3XrhZydw2wvGttiP5imzfdj6UF8pR/3oVVVDXHVM9wf
	 L5DynDz528mMoNmkAjsvVEKLoTJeOOFK0aGrt4G7MpZZlfo8YCOMVaFY5w6uS68UOl
	 KPHggEKI4UpCxNd3RbRlor8FjUPahA4Sda7oG6+32DxJalTWl0uZzv3LTwOPKdjcyN
	 SSTMfFHzdL62LqHWHYxEhuhGe1qIGKZf6Swdb47VxalENqAxW4BdA2TtH9Pvt7Kh27
	 5G3ASoVBtGobZvXr0EtlANsJ/jeQ5WjI5NX06C0i2W4WuUeaPT6ejSGEZ5zt5BSUaP
	 yJpYbxSIdpvzQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 Stuart Henderson <stuarth@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
References: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/5] ASoC: wm8962: Enable oscillator if
 selecting WM8962_FLL_OSC
Message-Id: <170976323989.264577.10300247732017142650.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 22:13:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: 432JSKEWQGNKTI5JKSB36BMIFGGY2MW4
X-Message-ID-Hash: 432JSKEWQGNKTI5JKSB36BMIFGGY2MW4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/432JSKEWQGNKTI5JKSB36BMIFGGY2MW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Mar 2024 16:14:35 +0000, Stuart Henderson wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: wm8962: Enable oscillator if selecting WM8962_FLL_OSC
      commit: 03c7874106ca5032a312626b927b1c35f07b1f35
[2/5] ASoC: wm8962: Enable both SPKOUTR_ENA and SPKOUTL_ENA in mono mode
      commit: 6fa849e4d78b880e878138bf238e4fd2bac3c4fa
[5/5] ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll
      commit: 96e202f8c52ac49452f83317cf3b34cd1ad81e18

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

