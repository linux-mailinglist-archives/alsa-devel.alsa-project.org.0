Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2C09524A0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 23:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E0372BAB;
	Wed, 14 Aug 2024 23:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E0372BAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723670407;
	bh=T4e77Y99NRLK2JgAPx23mU0xKKYQhP4ex6PPtFeSEyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hJzSg8Mok+oNUYzZAyPu+PMOS+Y0JVsFs8/dJklK4/Mlc5lsPmiDHvjJA1UkgeA53
	 Dlcj9kHT6EIQEY/kLI2CNu1Kx7fJKfbTWJwdG3qbb4qId8tLl2k7GEiLic+04kpigR
	 nxyuPZgx0GtEj9znae1Casuk3HOEVIBuU1/R4NHI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59DA6F805C1; Wed, 14 Aug 2024 23:19:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2958F805C7;
	Wed, 14 Aug 2024 23:19:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F09EDF80423; Wed, 14 Aug 2024 23:19:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6CB8F8016E
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 23:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6CB8F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Brh6ilrw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46898CE1AD9;
	Wed, 14 Aug 2024 21:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C44C116B1;
	Wed, 14 Aug 2024 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723670351;
	bh=T4e77Y99NRLK2JgAPx23mU0xKKYQhP4ex6PPtFeSEyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Brh6ilrwS7MdQsLLm8WIwfoZ/eF4nqgJ7NxE1UTkCcVAvBuJuQMwUy5+Ayv25vtkp
	 W5xBr03YkNSp3sAiaDHFbDFaRcaEvnN0OMfvwqbzuieTEDI4sIfFXYwhp2ZqcwRDia
	 FiVH7jpLrb6FZ+NW1cDgrpTGpVaySV9PfRj2fdvQGAP4ZZpwCNIbCMA32Cm03Dwy0E
	 QuSG80KKCWlek4ha3lW3k16Xvf1f/4YxH+Q0u5T49JqBMqH+j4dHU+CyierM3w4Cyw
	 Wgajx/eJfkYDPkYfGP4drnuXYx1vKuHitYW/xf5QQTTiyvXkeNh0ZljKFGnjLnZPyp
	 75eUTgr2FfOpw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <875xsnll85.wl-kuninori.morimoto.gx@renesas.com>
References: <875xsnll85.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: remove
 snd_soc_dpcm_stream_{lock/unlock}_irq()
Message-Id: <172367035070.341883.14182343560699840675.b4-ty@kernel.org>
Date: Wed, 14 Aug 2024 22:19:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: NQGXM2KQ2EOLYSWN3F2XL5XR7S2UBYJR
X-Message-ID-Hash: NQGXM2KQ2EOLYSWN3F2XL5XR7S2UBYJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQGXM2KQ2EOLYSWN3F2XL5XR7S2UBYJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 01:30:51 +0000, Kuninori Morimoto wrote:
> soc-pcm.c has snd_soc_dpcm_stream_{lock/unlock}_irq() helper function,
> but it is almost nothing help. It just makes a code complex.
> Let's remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: remove snd_soc_dpcm_stream_{lock/unlock}_irq()
      commit: c8c3d9f8e3ffc3e095159fdfda37038df74efdc5

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

