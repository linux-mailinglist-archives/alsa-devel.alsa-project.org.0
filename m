Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D27DA3CC
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 00:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2AAFE0D;
	Sat, 28 Oct 2023 00:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2AAFE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698447411;
	bh=WWpolZdlpae3gSp7g8pZghxt2V4LxG6S+F6aIwOouQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nh5NaGqKv9nzAM8ggYqJnu5br5vXSFEwFc5GiV11sSVkrprAus9JpZNrAAjodBBHO
	 lYx/SWtv4kaZMHYx88YuVAWfpzZTelagY6Qkwqa9aJwPK96TxLdymvHq7ZHiUtzjg7
	 brpX2HN6tQ+thpOxyFgqJ8StD88U7dX4avRmZ3R0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2A3AF80578; Sat, 28 Oct 2023 00:55:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DEBBF80568;
	Sat, 28 Oct 2023 00:55:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BF06F80165; Sat, 28 Oct 2023 00:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2869F8010B
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 00:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2869F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F787CzRP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 373A261E7E;
	Fri, 27 Oct 2023 22:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4E7C433C8;
	Fri, 27 Oct 2023 22:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698447290;
	bh=WWpolZdlpae3gSp7g8pZghxt2V4LxG6S+F6aIwOouQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F787CzRP/l/RTiZYpq8WfYJ43EcsPNvtyiCx4G3n2iZn/dr0UW34wT6cdMsWj1sra
	 udJV5iSsc0YysSHfzSHySlhb84bkVRUxKUvQoCgKuvQkUFcapOsqnGIggrQ3VuatD9
	 wB2nXn2+fUDs4Xl4FTxuJ1AS0i4XjSWwP9+RMnapDNR2FV4wiJv3/NyeU2T0/H6KcZ
	 KsABch9BgkL2Vfa7K2w5KnDqecH8MKfnuZnHb6nC4uoEGf6gZv+r46pKtfEVyZjPo0
	 9KVONkeHLDwibwO+gzALLXWyqEgDq/p/x/j7+Qrn1fz/qr0Wz4WnmeQTBuy1A6WE3b
	 tigR7MbjNOPJA==
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: ams-delta.c: use component after
 check
Message-Id: <169844728949.3013518.16732731655530708204.b4-ty@kernel.org>
Date: Fri, 27 Oct 2023 23:54:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: IACIXG7XPWFWDJFCD4BTZIKH3XFPSWL6
X-Message-ID-Hash: IACIXG7XPWFWDJFCD4BTZIKH3XFPSWL6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IACIXG7XPWFWDJFCD4BTZIKH3XFPSWL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Oct 2023 00:09:23 +0000, Kuninori Morimoto wrote:
> This patch-set fixup ams-delta.c's 2 warning/error.
> 
> [1/2] is for compile error of .receive_buf = cx81801_receive,
> [2/2] is for static checker warnings
> 
> Kuninori Morimoto (2):
>   ASoC: ams-delta.c: fixup cx81801_receive() parameter
>   ASoC: ams-delta.c: use component after check
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: ams-delta.c: use component after check
      commit: bd0f7498bc9084d8cccc5484cd004b40f314b763

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

