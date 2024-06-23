Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5B913D3F
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 19:23:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3881ADF8;
	Sun, 23 Jun 2024 19:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3881ADF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719163409;
	bh=QX0DysE08n31ltsLk9kPjmr6O8fcwdo8lFg+WR0u57M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nr8i/UUsKz5BoINDlzrmz11KGMQqunapcpeMHv2g7u2+s2ynUBZh74NSbFwk6Zmf8
	 6uvBCXL9Eb7dl7r5UCTHpVYcN5OQhN494/u5Vpkfm9iSNgvY68iryrpcFPYramybhV
	 cgFjE0qnUg+HhPpTDszQLL0xyPxdKAdBs5/ssQNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EEFFF80610; Sun, 23 Jun 2024 19:22:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A3DAF80587;
	Sun, 23 Jun 2024 19:22:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 470E1F80589; Sun, 23 Jun 2024 19:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FCEAF80605
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 19:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FCEAF80605
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ivqen0+R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6CC6ECE0C65;
	Sun, 23 Jun 2024 17:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA83FC32786;
	Sun, 23 Jun 2024 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163328;
	bh=QX0DysE08n31ltsLk9kPjmr6O8fcwdo8lFg+WR0u57M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ivqen0+RQLn1pOzbOQWhQ+zfHAfEO8zjGVC2NSljtWWCVMPyslFKCx4BKiIRFoqjT
	 ixdajQX+DZBrsKOcXpGG9gZ95OzB4tNpJs3E24NLfeY5oUe9Bqa6nuHi+aOsIeWGNI
	 m2cYfI22Lh547dCcan2XiNXUOewkLgE9O8Jd71p3RUu9P7nPMo08J8ZEDw78VoRgIj
	 Zwj7k4HgG57qVGfVmPej/+Lmrxu0giEpvgL7cLaEAJDYJG56DHYKHDdVtB7rXCrV3S
	 JzBmeYoXiOJ+24hkXTdTDKcMZFKUW/7qhJJp5oUgH4/k3v1u5iG2eRouX94HPqSAf7
	 gzU2O0HqXPsPQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240622131245.2607533-1-christianshewitt@gmail.com>
References: <20240622131245.2607533-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: add compatible for ti,pcm5242
Message-Id: <171916332554.350242.4619581974113723543.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:22:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: XYLU2A52N6JFFSO2BVITJ326WUHZKPRJ
X-Message-ID-Hash: XYLU2A52N6JFFSO2BVITJ326WUHZKPRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYLU2A52N6JFFSO2BVITJ326WUHZKPRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 22 Jun 2024 13:12:43 +0000, Christian Hewitt wrote:
> Update bindings and add a driver compatible for the pcm5242
> chip used on the Odroid HiFi-Shield2 i2c mezzanine board.
> 
> v2 adds a compatible to the SPI variant at Mark's suggestion
> and fixes the binding patch title/description which I managed
> to fat-finger in v1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: sound: add ti,pcm5242 to pcm512x
      commit: 9427997a5e13320a3c404a0cb67a292ad8e00b62
[2/2] ASoC: Add support for ti,pcm5242 to the pcm512x driver
      commit: 9c9b172fdd918c2f852140fc4a3cd827b78fa947

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

