Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C7722DB1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 19:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DEA782A;
	Mon,  5 Jun 2023 19:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DEA782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685986350;
	bh=WdV07oy/o91QEHR/yUMXPJbDhkHpn84JHUxwqIBH/a4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1XC9P8w3RwTcgF2lEI8lTMVjuYj/rIv8AZmRPQC2ZrjzyMJkEnio5sNpfpo6Yw/6
	 XNNhCbI44IKhidADVXvxolT9jOB905K5Ok3r22f+TaaY8jnavdO1uMaeX2iMmxaZSs
	 dKmXnzIZqY3oytGWUKyZ55vL/FQ8ovCa9PzOFp00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD78AF80549; Mon,  5 Jun 2023 19:30:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A2FFF80548;
	Mon,  5 Jun 2023 19:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC990F80199; Mon,  5 Jun 2023 19:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94F20F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 19:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F20F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WV4/J8Lx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5983261719;
	Mon,  5 Jun 2023 17:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35EAC433EF;
	Mon,  5 Jun 2023 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685986234;
	bh=WdV07oy/o91QEHR/yUMXPJbDhkHpn84JHUxwqIBH/a4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WV4/J8LxaHbnn83o/tFnncB95q1CEMouX8J6cEuJJ8BqIw+HxGKjSw4SggwJCclmh
	 bnjh16AvaQ+oXOk/C2vdQJGn1GFxuKQmc1VpkASsn8yAii3JkrBkBAuCWx+ctWSvGu
	 gt0Wog/LH9xfYCD5PsdFl3k5fIzFI5ZR7PIZw5mSkX+yMxSo5wUOHvGk3ZiCs2m7YD
	 sONooxx9S7MoWNN43+spGjmJwv+bC+aRgusr/ZmSoHbfAPAs7p1qAj2D86ugm2indf
	 wV3HvFI+N8Kt4VB73e7JiGcVPHCJYokX7vCk8UclcXKmq2AqPB5BMdTqAucGNrMvPq
	 Y6nAGTf53zMbg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: amergnat@baylibre.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20230526093150.22923-1-trevor.wu@mediatek.com>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 0/7] ASoC: mt8188: add new board support
Message-Id: <168598623165.103672.7353425800916087713.b4-ty@kernel.org>
Date: Mon, 05 Jun 2023 18:30:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: Z7SAY23T3F2F7RUTIYZ6DEU2V6AW7ABE
X-Message-ID-Hash: Z7SAY23T3F2F7RUTIYZ6DEU2V6AW7ABE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7SAY23T3F2F7RUTIYZ6DEU2V6AW7ABE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 May 2023 17:31:43 +0800, Trevor Wu wrote:
> In the series, we extend the capability of mt8188-mt6359 driver.
> 
> The following changes are included.
> 1. Divide ADDA BE dai into two dais for SOF.
> 2. Register hdmi/dp jack pins.
> 3. dai_fmt can be configured from device tree.
> 4. Add some I2S codecs support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: mediatek: mt8188: separate ADDA playback dai from capture dai
      commit: 2a7a1ae95c84d4199736872bfbc39d01f4b6b0ab
[2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove ADDA_BE from link-name
      commit: 9fba0d3ec0a074d1a7c094b2cb722f135215fab0
[3/7] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack pins
      commit: 73cf2b3f2b45fa4c231e8e84ae5d8cc80947d799
[4/7] ASoC: mediatek: common: soundcard driver add dai_fmt support
      commit: c0e7390e6d3f42b9a15a0e72add21facb8e17790
[5/7] ASoC: soc-dapm.c: clean up debugfs for freed widget
      commit: 8ad13cdc92f66333ae475251ae7722313f84e496
[6/7] ASoC: mediatek: mt8188-mt6359: support new board with nau88255
      commit: 9f08dcbddeb307793bbfff036db213d2cdf03a50
[7/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: add NAU8825 support
      commit: ee02b869dcad7ba3772b58e93dd90ab4f932fac5

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

