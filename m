Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C52769D7C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:00:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88049852;
	Mon, 31 Jul 2023 18:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88049852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822848;
	bh=CJXv5LTyvEZlFSDwEZHeU4bYBpFsz8Qe4FlzBgpaJXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ulO1waAV20Cfvd+CUKnXM94ycyPUw0oy5uQhA4xAchsrnSIoXObWFEk7a2OsdVAeU
	 nfi8QLdFE61AV7NpHT9XElRSLNvkJPJ7nsjdE+fiHPYVzVYncN/MIJDfT5DiJth3Kg
	 0u5f39jesRP7bKUpzkbeyI5H8SAtOQ17ZAl7OrQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 303A3F805CB; Mon, 31 Jul 2023 18:58:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C945EF80551;
	Mon, 31 Jul 2023 18:58:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896D9F805C5; Mon, 31 Jul 2023 18:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 449D7F80548
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 449D7F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mWdHtK6e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DDDC6123E;
	Mon, 31 Jul 2023 16:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906BFC433C8;
	Mon, 31 Jul 2023 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690822689;
	bh=CJXv5LTyvEZlFSDwEZHeU4bYBpFsz8Qe4FlzBgpaJXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mWdHtK6eRA+JGRP2MaoMMo72/BqzlMnoO3Lw2tx+VUmXmUqh9S4hFR5Ea8ZvkEGOY
	 C0oYF8sOZK+mJnTMZKuq+kbmOf5KUMHgL/q8xop5dztVOQv3Z0VZdP5iIqiS20pFaq
	 M1HYrWt+F+PcRxU8wUb0t6yidzC3aDeHSfZ/ltN3IIvi0TkAmEdGO0KWUAkMI8qvX7
	 GXlbm5/f8tzOo4K8e98bPZEmWHZR/m1JEVw2EMZZxVOPIYdbSY4eiOJS+wFoV2FouU
	 8TlomChhqc638ExpmF+ZMLnoXANOp9YXh7UNRkyOxttco2r3GwAbAiNHe31R57tkGV
	 aIC9Ep10U0SLA==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
In-Reply-To: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: rsnd: add multi Component support
Message-Id: <169082268827.169960.7424993017597355804.b4-ty@kernel.org>
Date: Mon, 31 Jul 2023 17:58:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: X3KOA3XD2OTLHP5R4QWKCIN6LI4O66V4
X-Message-ID-Hash: X3KOA3XD2OTLHP5R4QWKCIN6LI4O66V4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3KOA3XD2OTLHP5R4QWKCIN6LI4O66V4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Jul 2023 00:20:54 +0000, Kuninori Morimoto wrote:
> These are part of "ASoC: add multi Component support" patch-set.
> The patch-set supports below case as "2 Cards".
> 
> 	+-- basic board --------+
> 	|+--------+             |
> 	|| CPU ch0| <--> CodecA |
> 	||     ch1| <-+         |
> 	|+--------+   |         |
> 	+-------------|---------+
> 	+-- expansion board ----+
> 	|             |         |
> 	|             +-> CodecB|
> 	+-----------------------+
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rsnd: use DAI driver ID instead of DAI ID
      commit: 8897a1475f278eb36d76df9684466b17b8dd4cab
[2/5] ASoC: rsnd: cleanup rsnd_dai_of_node()
      commit: 6328489c135b60380b9e12b4d23854433e96a8b0
[3/5] ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2
      commit: 547b02f74e4ac1e7d295a6266d5bc93a647cd4ac
[4/5] ASoC: dt-bindings: renesas,rsnd.yaml: add common port-def
      commit: 289f6e3bdc3f3cf752794be3820b0e5c394b2733
[5/5] ASoC: dt-bindings: renesas,rsnd.yaml: enable multi ports for multi Component support
      commit: 1638290414bd68a87acae125e9fe3e419267bd01

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

