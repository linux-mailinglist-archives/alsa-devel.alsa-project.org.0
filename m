Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4E88C6DD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:28:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC702BB9;
	Tue, 26 Mar 2024 16:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC702BB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466901;
	bh=grkKelQsX82GN+mhakvoaLl2QHI3vzpYxQLvknB0Fys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qMs/Y/y/DRFkJmUpO4XP4Ro2I8Zd95ySma8eXrm1AH+EaBJmLtYiQAqbG4NpZjwYw
	 H1V01vQhsx7v5R+AxkmXCNj7stQtSuYwm4r1o95hNsUSCTiACdjBuHndzdhaZZ4rAX
	 iU7QRikAYZV2jz4XJq5qPhsm3uoQ+K1/Vj01wX8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A0F8F805A0; Tue, 26 Mar 2024 16:27:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C95F805A0;
	Tue, 26 Mar 2024 16:27:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16D16F8025F; Tue, 26 Mar 2024 16:27:44 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 42B71F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B71F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bkSh8Kky
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 991FD612B8;
	Tue, 26 Mar 2024 15:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53104C43390;
	Tue, 26 Mar 2024 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466855;
	bh=grkKelQsX82GN+mhakvoaLl2QHI3vzpYxQLvknB0Fys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bkSh8KkyQWCpYTjYjiV5w7aPLtY6PlZzfO8tu7CEQMCojpC+6L/fSddCc/szf6zWy
	 7utiKBAxT3cXcuRO6bPzWe11nNiYduIA97VJERqbXwxhD3gbxluTEaGW/ZG5q6t8pJ
	 UzRhYTsIIEmdZK0Uai96XjdNN60WXMXyH9vR/kbu6A5DfHr0LU4WxmfcapsbMP3RB1
	 6oEJJxWl1ITNy/kW7SoBpJCZFTLX9eSMj9iHDr3/4aKft7Tyk824MtX/IjYck0PHsO
	 hkjNwfflzpyiRRHAkrYid4RBQ3+rldNeqjvvd7bbq/m7rz8Z0Vgpekpi1ZeWfT+sSs
	 EM1M4N6s3BtmA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 ribalda@chromium.org, nicolas.ferre@microchip.com,
 u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 trevor.wu@mediatek.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Message-Id: <171146685206.132239.17987201870136073859.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: MTQCID3K2T5OUII6XH63IZCOH3SEVBDQ
X-Message-ID-Hash: MTQCID3K2T5OUII6XH63IZCOH3SEVBDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTQCID3K2T5OUII6XH63IZCOH3SEVBDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Jan 2024 11:52:40 +0100, AngeloGioacchino Del Regno wrote:
> This series converts MediaTek AFE drivers' probe functions to use
> dev_err_probe() and devm functions where possible and, in some
> cases, dropping the .remove_new() callback, reducing the size.
> 
> Cheers!
> 
> AngeloGioacchino Del Regno (7):
>   ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
>   ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
>   ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
>   ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
>   ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
>   ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
>   ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
      (no commit info)
[2/7] ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
      (no commit info)
[3/7] ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
      (no commit info)
[4/7] ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
      (no commit info)
[5/7] ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
      commit: 7aaaa22de56ce0dae15fd9f42a69a1d1a7a6e078
[6/7] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
      commit: 324c603a4efca7d1045e0bf3477ca54970eac72c
[7/7] ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback
      (no commit info)

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

