Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FD6913D40
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 19:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1BEE65;
	Sun, 23 Jun 2024 19:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1BEE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719163440;
	bh=4Z+DdY/AmZkeRi1o/ATZw3inl/MJjwIZjOmrWyVhK2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldf9FYpAL446d/QRouLeWYfkpNua5n9Ee50v/WeFym/0odLzrpxwLOZB4T5p7aE8s
	 blIZRayN+eQ8RnlLb2CSdXfJYmVA3knZhlBB7FpWeovsmQBk5OVVCee6XNDGmROAP5
	 C/ejjDscdDvEuRy1gXaTi5oI5F19ezgsELYHhyck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D627F805A8; Sun, 23 Jun 2024 19:23:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B218CF80588;
	Sun, 23 Jun 2024 19:23:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10E69F80589; Sun, 23 Jun 2024 19:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C890AF80154
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 19:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C890AF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oIGKP1fw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 180266255A;
	Sun, 23 Jun 2024 17:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0B0C4AF0B;
	Sun, 23 Jun 2024 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163316;
	bh=4Z+DdY/AmZkeRi1o/ATZw3inl/MJjwIZjOmrWyVhK2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oIGKP1fw89bYksXVYKyrZ2ZMZtAdLGYBrF0TUvAE6YWzckKJDh79T9VC8R5YsHXU6
	 /IJIiQz4rHXhmYCwsFYRF1N0+nFxfDSQhYhALpTmRQJj+fr7ofw/z5aToDsGMi5Cs/
	 JL+3xMwEtJy/gVLCb6xFM6MzVMDg/CmpS8qXhFcVZ45iD+50wUoBJaIHF8924Jh17w
	 aUTUEs2vp1Pb8uxXBvDD6w1BloyvlKKIguMApkpakI0zgklVDg9ZOj7TtKT+m4Ll9G
	 Mx7adBw3Va0AfyTXwk8MTQDw3r+JhuEXezz4b7+/u5qoFFjG45FssuCFmb1qvtzRiG
	 fVr3SWoybDlPQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org,
 Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzilwxxd.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzilwxxd.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 0/2] ASoC: Add ak4619 codec support
Message-Id: <171916331542.350242.5751102725550795286.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: B67JCKRXX2FVIHXDXIUBKXNFCRN5TF5S
X-Message-ID-Hash: B67JCKRXX2FVIHXDXIUBKXNFCRN5TF5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B67JCKRXX2FVIHXDXIUBKXNFCRN5TF5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jun 2024 00:58:39 +0000, Kuninori Morimoto wrote:
> This is v3 patch-set for ak4619 driver.
> It was created by Khanh, and I updated/adjusted to upstream.
> It was tested on Renesas V4M GrayH
> 
> Link: https://lore.kernel.org/r/877ceotnrg.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87frtb3x4k.wl-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Add ak4619 codec support
      commit: d6bb39fe4fa077883a409f6eaca569ce61a28a94
[2/2] ASoC: dt-bindings: ak4619: Add initial DT binding
      commit: 6469267afed4ffb9d16ce8c44a2b518b9b31c215

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

