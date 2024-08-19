Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D479573D8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2024 20:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4D61F5;
	Mon, 19 Aug 2024 20:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4D61F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724093170;
	bh=gU0/EKnZ0FkuHkxxhgkNiyKt5kHXaxnPAjw+Ang2LMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ENl00sSZ4PUxTGUtpJKXkVgAZqtT3U4olDyvOlESKwZDz0Pp+Zf0V9AWOhTRbHj6D
	 7r0+gwaOnHXCpSaTe7q36adK9sQSzgEgricwpqVWt3qRoiZ33JavDm2Ps0NRopG0R0
	 g71IGVDM+xxSpmqm29hrttl7kiWIlRHYDjTnrUjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01054F805A0; Mon, 19 Aug 2024 20:45:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 542E1F80517;
	Mon, 19 Aug 2024 20:45:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4BF0F80494; Mon, 19 Aug 2024 20:45:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93609F8016E
	for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2024 20:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93609F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hXu2LxOw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD1E660C8B;
	Mon, 19 Aug 2024 18:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10BEC32782;
	Mon, 19 Aug 2024 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724093124;
	bh=gU0/EKnZ0FkuHkxxhgkNiyKt5kHXaxnPAjw+Ang2LMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hXu2LxOwp7l//53NucZem7LHWkGWhAaN14DjXkA34y5aMxMkcWlV5TFjJLLp2tC4K
	 nvPJ3ltQW+kSFScKc4A2VYviqQikEfXyGeiUhG2NaEGCoARB/pfTWr//XSmooCHfwk
	 /GtkRg8PpfRSpCWErPT54J7fQkFU6S7C/BDP+6f7i9NkhS6Gmtp0lLOznEJLgF661V
	 mtq8S0Hx18SntGHiCB9mjW4bTyfDcnOYDaMKECq6bmmujDpUOsiz49tQ1sCbZojyL4
	 KYlpxyu0pU5wtmk/1u5vK90Wy1xLCEofKCHwFsF4S2lBzLdfLQIKbU83eMhpAKvybJ
	 zWip5I9NT6wyQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20240814174422.4026100-1-Frank.Li@nxp.com>
References: <20240814174422.4026100-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: convert tlv320aic31xx.txt to
 yaml
Message-Id: <172409312157.107250.1290467548898227873.b4-ty@kernel.org>
Date: Mon, 19 Aug 2024 19:45:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: FXA4LYVA3NPIKF7PRNM3ZRLBUMF55YKV
X-Message-ID-Hash: FXA4LYVA3NPIKF7PRNM3ZRLBUMF55YKV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXA4LYVA3NPIKF7PRNM3ZRLBUMF55YKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Aug 2024 13:44:20 -0400, Frank Li wrote:
> Convert binding doc tlv320aic31xx.txt to yaml format.
> Additional change:
> - add i2c node in example.
> - replace MICBIAS_OFF with MICBIAS_2_0v in example because MICBIAS_OFF have
> been defined in header file.
> - add ref to dai-common.yaml.
> - add #sound-dai-cells.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: convert tlv320aic31xx.txt to yaml
      commit: e486feb7b8ec04ec7cd53476acc9e18afd4a6a7d

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

