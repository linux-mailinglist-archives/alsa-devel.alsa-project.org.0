Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1B95A15D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 17:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2D5822;
	Wed, 21 Aug 2024 17:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2D5822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724253974;
	bh=jvfUaSEFX5wUYApQRI6vhc9gv8Cje13GwWTDx+WbFA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SLsoiHLDW/D7z8IyxgA1a0oEUYWfZ1kfKEOSHZkGai6KOHdhiyCaH02oXftePPPrV
	 WKv0GF0GjTV/OtQ+EOPrV0yBB3G24mFucvyCR1aoK9CwUWXtJhVX+u6NZnTMjl6rcM
	 2dP42+gQX0J1+JxOH0S4s1tcC+a+xLu7lnYZ+dY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 963F0F805B2; Wed, 21 Aug 2024 17:25:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E11EAF805B0;
	Wed, 21 Aug 2024 17:25:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20063F8049C; Wed, 21 Aug 2024 17:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E139CF800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 17:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E139CF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KhIIFKeU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74B08CE0E45;
	Wed, 21 Aug 2024 15:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A18C4AF0E;
	Wed, 21 Aug 2024 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724253881;
	bh=jvfUaSEFX5wUYApQRI6vhc9gv8Cje13GwWTDx+WbFA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KhIIFKeUBMICzrwhTnKz2t4as9qOCcKJYTOle2HUKHTLOm/8eDD1Vc2kqxXOynwZz
	 G7YmliZjCupzBjb9I9H/FUsq2rLFsFxviyO+mF+ABl0dbFTgqA415NFJ12OxoVyCM0
	 tmRKN/KJp4UVkQM8GwPJwJrXtc9PHRief5HzbmfCz196cLUQBgxItn2bqHen909Lcs
	 dCvnSw9U2h0jlADA7ojr7nTnYpWlY4L3CdGifh2zhhVp+feXSaoUKhzjI7VlrSnq9g
	 +WA8buAXznXHl9eQZzMuaQDtq8/tN8S2fom3M1PwVZk2Axi3dquwa+da+BCE1DyQ+b
	 loStk28N+MdCQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j87ll7k.wl-kuninori.morimoto.gx@renesas.com>
References: <874j87ll7k.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: remove
 snd_soc_dpcm_stream_lock_irqsave_nested()
Message-Id: <172425388083.1704682.7824983520897678274.b4-ty@kernel.org>
Date: Wed, 21 Aug 2024 16:24:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: LDNV3KUBMODLA7E6FQNXGNO4DS5GMTRN
X-Message-ID-Hash: LDNV3KUBMODLA7E6FQNXGNO4DS5GMTRN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDNV3KUBMODLA7E6FQNXGNO4DS5GMTRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 01:31:11 +0000, Kuninori Morimoto wrote:
> soc-pcm.c has snd_soc_dpcm_stream_lock_irqsave_nested() /
> snd_soc_dpcm_stream_unlock_irqrestore()  helper function,
> but it is almost nothing help. It just makes a code complex.
> Let's remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: remove snd_soc_dpcm_stream_lock_irqsave_nested()
      commit: 2d3b218d383e24623070f4439a0af64d200eb740

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

