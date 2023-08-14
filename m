Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8777AF07
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 02:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1265868;
	Mon, 14 Aug 2023 02:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1265868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691973347;
	bh=hhzk3CoCzoUmIzvYF+9ERXn0jLZ8kN4BZJDwzOq7VBE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ecZlmWtKga22L5q+Teiz/ApX0pZT/w3vJw2R1nIv1a55JuYhHS5jJgUyOhKI2iyNV
	 SYYcaKRhY8CtAfKbOyx5YlU2FrmbE11cjhyJU/FS27gSImxF3TL6r/3N4jJJMTfxBu
	 W4RKX9xI4+cZWtRZT8qsVogXjfp7Pe4T5/+xzgK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71D2F805A1; Mon, 14 Aug 2023 02:33:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF36F80553;
	Mon, 14 Aug 2023 02:33:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDE3DF805A1; Mon, 14 Aug 2023 02:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D623F80553
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 02:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D623F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LbXvGA0g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFCE960AC3;
	Mon, 14 Aug 2023 00:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4822C433C7;
	Mon, 14 Aug 2023 00:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691973209;
	bh=hhzk3CoCzoUmIzvYF+9ERXn0jLZ8kN4BZJDwzOq7VBE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LbXvGA0gtpbpnKZd2KdyjgVS0tjBoqroWIa09uSOnZsD83+Xc5teNPj/Umv1te9GV
	 UP/xkQT9R2KLv9Z+S9sFVKJ45tYwbNAGUdgu3uU//c30GmFsTvnShffTudkMz/sJnE
	 I38OmS8SohLbMxYdHrOKxwmH0Bz2CpY9k0wT6I8okZH6RQE3MJtTGSpK6JLlFAeppH
	 MxSRxPaioINRpLTIRajIbkWmlwBb4bKB5HwDAS720ags5APTJSrhdHd4AC9U5+WUDn
	 t+x8X5ddasyMFuX+EGNNpDIPcNsbNlQxHmd2RA3UANjUgtixSdw4Z/wIQoVjBO9HhK
	 cEFqU2n8ly0Ng==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, claudiu.beznea@tuxon.dev,
 lgirdwood@gmail.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, peda@axentia.se, lars@metafoo.de,
 nuno.sa@analog.com, povik+lin@cutebit.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, robh@kernel.org,
 u.kleine-koenig@pengutronix.de, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230811071426.2343133-1-ruanjinjie@huawei.com>
References: <20230811071426.2343133-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next 0/5] sound: Remove redundant of_match_ptr() macro
Message-Id: <169197320455.2741913.15830734476730877425.b4-ty@kernel.org>
Date: Mon, 14 Aug 2023 01:33:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: YF23IMLZ2YI76ABCVZ2NCSQK62HIPKZH
X-Message-ID-Hash: YF23IMLZ2YI76ABCVZ2NCSQK62HIPKZH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YF23IMLZ2YI76ABCVZ2NCSQK62HIPKZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Aug 2023 15:14:21 +0800, Ruan Jinjie wrote:
> Since these sound drivers depend on CONFIG_OF, there is
> no need to wrap the macro of_match_ptr() here.
> 
> Ruan Jinjie (5):
>   ASoC: atmel: Remove redundant of_match_ptr()
>   ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
>   ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
>   ASoC: ssm3515: Remove redundant of_match_ptr()
>   ALSA: Remove redundant of_match_ptr()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: atmel: Remove redundant of_match_ptr()
      commit: 67ed781228bdcca7a0d2058cf62d0c1860898330
[2/5] ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
      commit: f83e34034fcc5fd0551d9257b710b61d999a8174
[3/5] ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
      commit: 29546c3af6319a8a5308d4add1226343031da65b
[4/5] ASoC: ssm3515: Remove redundant of_match_ptr()
      commit: 6136b6a281b40cb795a76f1769eeb7ef5026b86f
[5/5] ALSA: Remove redundant of_match_ptr()
      commit: f479832b42df596775c1e787e02c7277bfba6a4a

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

