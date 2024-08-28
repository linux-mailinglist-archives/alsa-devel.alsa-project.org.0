Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B3D962EA1
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 19:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853E2EC1;
	Wed, 28 Aug 2024 19:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853E2EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724866634;
	bh=uuULYpzyY7vkv83GFC4CMHlgmGCvwWuQ0GzW2p7rV30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bJSxsxLpeIxEtbgn9riVQQfFL9FOARZK4a9KbmUkB+fPnEjIi6uRgaVj1kIkcKW3H
	 SgJRJgmxCh9+RpUKyEVwvUZLuCQnkVp64+oX9C75BYkKOQ1ySjb+1k1UCew5Nlg9m/
	 xnwCBLzUWX/k1bbqZtBeu89EVv2zBM3Q01A5M/LY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89631F805E1; Wed, 28 Aug 2024 19:36:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A953BF805DA;
	Wed, 28 Aug 2024 19:36:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48BDDF80518; Wed, 28 Aug 2024 19:36:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B7DF5F80107
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 19:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7DF5F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iP2RtPcJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B58DA4282A;
	Wed, 28 Aug 2024 17:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0B7C4CEC3;
	Wed, 28 Aug 2024 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724866583;
	bh=uuULYpzyY7vkv83GFC4CMHlgmGCvwWuQ0GzW2p7rV30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iP2RtPcJC4SUMZJww3Wl9DWkCBVXXswtktuD3s4Tlvdk0IOOqOqt0JaStBOYfIbXf
	 C6TnvZ52qgTI0GEYNCp3YH+fTTur8L7SbCGrd9fI+pPQIKwS7OPcNITNoq+3egkIJY
	 6B0pMsStRTiBPlkUY2Dsl+FsWpZGEuhANYe2UwrF8tIGbn1Y40x/dNM3C3x7WdmE9x
	 WPUuqzE8w80MenQBwsbcfaqsxshvd+N39aadz+BFfWZlSawyn4+wIip1MAnYGMQK1X
	 p6Sgesb3Ky5XjcZ1PiODytKfRJJyiR7hVUbi6kU03O+YPCgDCGu64d2TnVdjulhAHN
	 lbqgNyTZqJDdA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zfpzk6jq.wl-kuninori.morimoto.gx@renesas.com>
References: <871q3bll5c.wl-kuninori.morimoto.gx@renesas.com>
 <87zfpzk6jq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/2] ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to
 top
Message-Id: <172486658303.355291.17125853343768254170.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 18:36:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: LMN3VLIIGWWR33RXCNIVXMQ4O37R3RFE
X-Message-ID-Hash: LMN3VLIIGWWR33RXCNIVXMQ4O37R3RFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMN3VLIIGWWR33RXCNIVXMQ4O37R3RFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 01:33:13 +0000, Kuninori Morimoto wrote:
> This patch moves snd_soc_dpcm_can_be_xxx() functions to top of soc-pcm.c
> This is prepare for cleanup.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
      commit: 4dd4baa4408a15d50233e85bae611d576ef77b92
[2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local function
      commit: 290f31e943a29c93532b1684652b04fd60d0f696

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

