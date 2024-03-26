Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5B88C8F4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:23:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F11D12C51;
	Tue, 26 Mar 2024 17:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F11D12C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711470187;
	bh=//W8P4cggBSW4ea8DF0U9iBbG/iet5qmMnbhF2CbDqw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V9ErRD2WEWCpxK6zUEJi4kmhsCGo0unuTsoBqdFeh/d7Rl80jLNHTtSuk3n4YXABM
	 OnGfHLCTNv+3Pd7D4gDAJii+Xcq/Qvgsu042x4gGJR4MjRLZNITCZwpicr5lTuSuO7
	 h9XugPs1/pP0nX2KE8gD94Ub9LCSLQwtMkuWtHM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B429FF805A1; Tue, 26 Mar 2024 17:22:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 345DDF80587;
	Tue, 26 Mar 2024 17:22:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 991A0F8025F; Tue, 26 Mar 2024 17:22:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2AEBF801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:22:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2AEBF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WdMrYjnh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23708612CC;
	Tue, 26 Mar 2024 16:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA99C433C7;
	Tue, 26 Mar 2024 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711470142;
	bh=//W8P4cggBSW4ea8DF0U9iBbG/iet5qmMnbhF2CbDqw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WdMrYjnhXYNxEf9pNXnLav5F4Q4epZrMVL+Zz2HGT5iP/apNBDGKnDGgaXPEvRqrt
	 OSt7ASfME63Asis7oPSNMMgDVkQ/tEhvKBMxVpzSrdnS/N75iru8LP3FECq+002ak4
	 gEyUzMeFj6KXQKuwDvIfyQQRgiUP6nX62l2D26HzNjSef8Oz+1ECVc+zo0iExP5RRS
	 rLgLMDcuR5YKGuOCC2PuNBrfu0P1FJeJ/hNj4mY/rqdwsDnwSvOxF572bK07/6t3KK
	 Q4sddwI+t3yMJBC95MgpPLzqKjF5xzaeAY5h8sL/UBc/OVCZpMbeY0KvMCb4pEzdtd
	 dMKOk7KIy4enA==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
In-Reply-To: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
References: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
Subject: Re: (subset) [PATCH v4 0/7] Add support for the internal RK3308
 audio codec
Message-Id: <171147013904.144152.3554445649674983907.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 16:22:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: L7YPCFHPXH7ZIEL3NW4EIQIZGEVBEQMT
X-Message-ID-Hash: L7YPCFHPXH7ZIEL3NW4EIQIZGEVBEQMT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7YPCFHPXH7ZIEL3NW4EIQIZGEVBEQMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Mar 2024 15:36:27 +0100, Luca Ceresoli wrote:
> This series adds a driver for the internal audio codec of the Rockchip
> RK3308 SoC, along with some related patches. This codec is internally
> connected to the I2S peripherals on the same chip, and it has some
> peculiarities arising from that interconnection.
> 
> For proper bidirectional operation with the internal codec at any possible
> combination of sampling rates, the I2S peripheral needs two clock sources
> (tx and rx), while connection with an external codec commonly needs only
> one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/7] ASoC: dt-bindings: Add Rockchip RK3308 internal audio codec
      commit: cce4cbb157493483f03c21213753b66425a31430
[3/7] ASoC: core: add SOC_DOUBLE_RANGE_TLV() helper macro
      commit: d75a21611a6e723d81db3f827e131ad39b69186c
[4/7] ASoC: codecs: Add RK3308 internal audio codec driver
      commit: 4ed0915f5bc4bcc81bca783a5b984f3d81e9764e

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

