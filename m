Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8D387BEA8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Mar 2024 15:15:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAC515FE;
	Thu, 14 Mar 2024 15:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAC515FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710425748;
	bh=lK23oJRJ/bA6d6jmZaBMLcWgOIERyQT1+j1cFBWNLd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GHzT+HiIbJ+GcLLmGrImZpZnUtEnqeiKpJUK2qt1WAvbDEwM8ZMAer8tFSeBLKPDc
	 8AxW4Z5yd9hkiFBqDhd1tJSXlg5L8pvM/ruiEPkZtvZEfbYDOnyg1xS0+EtN4F7Cwl
	 JbRJsjjV3IzQ5Qy9kUH7xNx/vFS/UA99EkmTy/sQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80918F8059F; Thu, 14 Mar 2024 15:15:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7EDCF805A0;
	Thu, 14 Mar 2024 15:15:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3148F8028D; Thu, 14 Mar 2024 15:14:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAB53F800E4
	for <alsa-devel@alsa-project.org>; Thu, 14 Mar 2024 15:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB53F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UTZo4JrG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B5DD614ED;
	Thu, 14 Mar 2024 14:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2362CC433C7;
	Thu, 14 Mar 2024 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710425648;
	bh=lK23oJRJ/bA6d6jmZaBMLcWgOIERyQT1+j1cFBWNLd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UTZo4JrGlYJvjvkqbKP9KYF2NnJrppTbDm9iTLI+SxMt0v4M0gEk8c9z8+Yae+S42
	 IGyjW+5xOoI/1FE9ZQf0er/hcFd/jhLCVnyzqKoFxXsQ+euUTlqFvpTb5ar0AzhqzI
	 OFelPUMUGPO0aWcHEZUkdYjj7HCYQwEdQ6FwKyMawyC8UoYfUvRvbV0+Cy1i4F7n4K
	 RajFBL3gIlgNOG5RtqYyRzQOEWrTLkCEBdRH/u+5/tpjGo2/cP+adQIpRiXNrMe/2Y
	 7kT9CkjUhLs/L853OBPVpzGxRiHvEG0IqaUnUPJF/gBfmFU6yaiWL+0zMnPUXGvEqv
	 mbEEATbnr4zyw==
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
Message-Id: <171042564484.33758.15956147423867309786.b4-ty@kernel.org>
Date: Thu, 14 Mar 2024 14:14:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: TNNU5OTFZRETMOPXZ6KKDIGTDKPY6SEW
X-Message-ID-Hash: TNNU5OTFZRETMOPXZ6KKDIGTDKPY6SEW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNNU5OTFZRETMOPXZ6KKDIGTDKPY6SEW/>
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

[1/7] ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates
      commit: 9e2ab4b18ebd46813fc3459207335af4d368e323

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

