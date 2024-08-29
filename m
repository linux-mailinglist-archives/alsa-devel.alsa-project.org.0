Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF09643FA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 14:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD8AFAA;
	Thu, 29 Aug 2024 14:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD8AFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724933428;
	bh=KgMvNg9vlrPlxz4c1NDG/hOTZD1lYa/I+MSvbr8Ecyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EjokG3g7hMcsnh6ZTDnsX8jFsORN+ExAQthHjgxSEfavz9+Pxfo7Q1C4ANZNfrg27
	 AYdA4ugUPVYbOi9MNtAtPIPo0O21OhX8pQurdS1G8dxuVQjSuCnmOgBkyCNfzK9j3f
	 aM3xlb+O5x+puKQ5ZLBuISxZIDJSbg7j61iymOc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E27AF805BB; Thu, 29 Aug 2024 14:09:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A01EF805AB;
	Thu, 29 Aug 2024 14:09:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A393F80518; Thu, 29 Aug 2024 14:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24EF9F800AC
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 14:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24EF9F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JWMFSx4I
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04A8AA41DAC;
	Thu, 29 Aug 2024 12:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA357C4CEC1;
	Thu, 29 Aug 2024 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724933383;
	bh=KgMvNg9vlrPlxz4c1NDG/hOTZD1lYa/I+MSvbr8Ecyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JWMFSx4IDvgUncCaUB0GiDrKqA+pDhQd8T6uKPpnmuEmfBAb6uxdtxrrzxk550CWM
	 FpNolle7pSas6JKoeXJpaklPQxnfwu8LFBNg0x/kKRAyEdyUbnv9TITxjj4ku0r/kc
	 MKLbKEa97IZG5YxzbAi/tqrIRTnvROfT5FmCleYI+QxFvcwJS5sQQrMeXpTCHwSOkx
	 c9foLEHOHWN7AVoNjayjI6zYnPx9Spt2l+GPc3hoAR53TrP9hjaypP4661GytO38Gd
	 d/vyNuNAaiE53LO1f4NrIOxmHpJDbVcKalvBwpI4OoZxJs4h+9XAAiico70fBC7SIt
	 jyvjixqwqGosA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, angelogioacchino.delregno@collabora.com,
 Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 linux-mediatek@lists.infradead.org, yangxiaohua@everest-semi.com,
 zhuning@everest-semi.com
In-Reply-To: <20240816114921.48913-1-zhangyi@everest-semi.com>
References: <20240816114921.48913-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Modify key
Message-Id: <172493338155.25837.14171784732486140029.b4-ty@kernel.org>
Date: Thu, 29 Aug 2024 13:09:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: KMI2D6TEI356SWJJUMWCIKD3VMCFVISJ
X-Message-ID-Hash: KMI2D6TEI356SWJJUMWCIKD3VMCFVISJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMI2D6TEI356SWJJUMWCIKD3VMCFVISJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Aug 2024 19:49:21 +0800, Zhang Yi wrote:
> In order to get the correct keys when using the ES8326.We will associate
> SND_JACK_BTN_1 to KEY_VOLUMEUP and SND_JACK_BTN_2 to KEY_VOLUMEDOWN
> when the ES8326 flag is recognized.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: Modify key
      commit: 5325b96769a5b282e330023e1d0881018e89e266

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

