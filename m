Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8DD75070A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456506C1;
	Wed, 12 Jul 2023 13:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456506C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162638;
	bh=TGhw0BOQLfLCUfvKyBi3wy+x2YHrjsCaDwvjVbjEVZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YqMI93XzQtIqdNx7JLCqEswZduuHhHDjOy04MrLkpT/cad6Pasnvj/hb7W3FIngrU
	 D5wEcUTrPRWkaGJrb8qkbWwGdy+0OPyQBBKulQUU6dmnP/VKbSOseiNv/zlWw6HPgO
	 uYsnJSyW1c0bAlsCKAU9WbdLNA9cYAHU9qJ4w0jI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7311BF805F2; Wed, 12 Jul 2023 13:47:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEBA7F805E6;
	Wed, 12 Jul 2023 13:47:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23CA8F805D2; Wed, 12 Jul 2023 13:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09570F80290
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09570F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m+a21ZBw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA6DD617A2;
	Wed, 12 Jul 2023 11:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF00C433CA;
	Wed, 12 Jul 2023 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162426;
	bh=TGhw0BOQLfLCUfvKyBi3wy+x2YHrjsCaDwvjVbjEVZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m+a21ZBwBD0dLXB9dUo3vmJ1K4Ko4ztyANwi9/iMKKtwbXia2rmAGh9lzTvFfquBH
	 bb6U6QwxZ8wz5c8QcOT52DKSEhGNA80SaZPpO1Cy3Rey2D0GydCcV3Io1jHm0wofH4
	 LDMYsllnFWxuLIFlPTNfOA2pvow6mzET8nKCuPljaLd5i/rxCwdbF446poiMzF1jIt
	 seC+a9Phb7jS92O2SlmY1cMWcicKAi1S7BXxs/8ylnfL0p7VRN8uBYJ7Q5acnQCluk
	 HPvXdIfUlRYx4pJ8YCre+jpIqPhLiygd3TvUK6kRTcbZWaCtGTExNgw35IYUSG/LqY
	 S5S5A1IJVXifQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <20230629074348.21670-1-trevor.wu@mediatek.com>
References: <20230629074348.21670-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mt8188: add memory-region support
Message-Id: <168916242315.46574.12917006493052835977.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: ML5JMHLLVDMUEJNDCRWX44XWSANVM255
X-Message-ID-Hash: ML5JMHLLVDMUEJNDCRWX44XWSANVM255
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ML5JMHLLVDMUEJNDCRWX44XWSANVM255/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Jun 2023 15:43:46 +0800, Trevor Wu wrote:
> This series introduces support for memory-region, allowing afe memif to
> utilize the region specified in dts.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8188: add memory-region support
>   ASoC: dt-bindings: mediatek,mt8188-afe: add memory-region
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8188: add memory-region support
      commit: fd9965235099fc4cccd94f82a371192bf7645a3e
[2/2] ASoC: dt-bindings: mediatek,mt8188-afe: add memory-region
      commit: e3326e3bc4937622b4dc6e9721262483109b0f0c

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

