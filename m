Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453388A7A0A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Apr 2024 03:08:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B2C884C;
	Wed, 17 Apr 2024 03:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B2C884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713316114;
	bh=PqaHR/bHt9hKVQUfh175qxpXqBSt6Cu+r6+m3wImr+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XdKQgr74SkGRrpb0XChdog8fl1XP0rnBkrvOzUkfuHCg26gWa3AoX798yJVeN11Oy
	 zwmU6TvDWoky0zzwHJkRJd1gDpucAQ0Z8g0Xy0o4lHUTZ4xZDJrEUbW/Vyq03b+DKR
	 S2KctnrK0XklCh1YwVjbbYe0LAhoaGQYMBqdVszU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E809F805AC; Wed, 17 Apr 2024 03:08:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 899D7F805A0;
	Wed, 17 Apr 2024 03:08:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6421CF8025A; Wed, 17 Apr 2024 03:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E981F8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 03:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E981F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YaP22WSH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAB686137B;
	Wed, 17 Apr 2024 01:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB06C113CE;
	Wed, 17 Apr 2024 01:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713316066;
	bh=PqaHR/bHt9hKVQUfh175qxpXqBSt6Cu+r6+m3wImr+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YaP22WSH2mFF16qmU38TX/WfL40595sQMUWuh4SjGjdDwDI9syN8U72AZSWGZX9sj
	 CPRQghPIneIqYVv4x6Cb84PJfP0o0hrudvZ7rmfgkgUHVcVor0qjheufH31W8vEX8K
	 30oyOFpWVMcggnnPvtaNlk5azFoz8wIJnpcqGp1Lm0+MUIdnX8JSO1IALZ2RwarEJ9
	 w4Fpv6IO/u+XyNqVZqXowT2Y5Cgb7aY9jTNFz21NHsktiWUboix2pM241AcvC3YYVm
	 Sn6Ax1nBXGXg0J+6EgTk2MxlZjteCZUEyNFTF8lG1rgSMp/nLCfTpQC1N5y64X3fXd
	 uoWm9iilI0Eug==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v5 00/18] ASoC: Cleanup MediaTek soundcard
 machine drivers
Message-Id: <171331605897.1695927.18052173831276369230.b4-ty@kernel.org>
Date: Wed, 17 Apr 2024 10:07:38 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: SI5ATYUOUM7U6RBAMHJAUYSBHRQNKFVQ
X-Message-ID-Hash: SI5ATYUOUM7U6RBAMHJAUYSBHRQNKFVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SI5ATYUOUM7U6RBAMHJAUYSBHRQNKFVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Apr 2024 09:13:52 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v5:
>  - Cleaned up MT8186 soundcard migration commit which erroneously
>    had leftovers from development
>  - Changed the mtk_pcm_constraints_data structure to hold pointers
>    to snd_pcm_hw_constraint_list, as to really reuse the const data
>  - Tested again on all of the listed MTK platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: mediatek: Add common machine soundcard driver probe mechanism
        commit: bce93a162505f0bc0499888ace2f66bd56fb94b3
[02/18] ASoC: mediatek: common: Constify struct mtk_sof_priv
        commit: f8782f776db33066a9b1cd14d319142c4175561f
[03/18] ASoC: mediatek: mt8188: Migrate to mtk_soundcard_common_probe
        commit: aad45b8aa973a863dee2f256cea8c527acaaf56e
[04/18] ASoC: mediatek: mt8195: Migrate to mtk_soundcard_common_probe
        commit: 6718e1ed93cc28f0faefe21b7d21679ff0b04020
[05/18] ASoC: mediatek: mt8192: Migrate to mtk_soundcard_common_probe
        commit: 2d72cbb56327205ae04a9376c5b78a35b6347294
[06/18] ASoC: mediatek: mt8186: Migrate to mtk_soundcard_common_probe
        commit: 44a53c8ec9cad02ce7dfd55094e8d7aeb48eb73c
[07/18] ASoC: mediatek: Add common snd_soc_ops .startup() callback
        commit: fe071237dee6d617e5cb0eb4856b23576a877479
[08/18] ASoC: mediatek: mt8195: Migrate to the common mtk_soundcard_startup
        commit: 386fe4ceaf196360ef96cbd68d045ed2730251a7
[09/18] ASoC: mediatek: mt8192: Migrate to the common mtk_soundcard_startup
        commit: 94142cc1ffd959aa8e83857515a75779e8ba8064
[10/18] ASoC: mediatek: mt8186-rt1019: Migrate to the common mtk_soundcard_startup
        commit: f103ce4ff6932b6991e1922d1a39c29971ab2938
[11/18] ASoC: mediatek: Add common mtk_afe_component_probe callback
        commit: 9d9b182876a249b393158e9f43c255aeee4ef898
[12/18] ASoC: mediatek: Use common mtk_afe_pcm_platform with common probe cb
        commit: 1d2a6b3b5189b6c3e51f29e050aa9b2337b774e8
[13/18] ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
        commit: 6ed619b348bf0a490e70dea7a330cf44dc81c16d
[14/18] ASoC: dt-bindings: mt8195: Document audio-routing and dai-link subnode
        commit: dc7a31300a8f28af282974512c2d403ada0658b5
[15/18] ASoC: dt-bindings: mt8192: Document audio-routing and dai-link subnode
        commit: 5a50483c47b8cf3066eb151fa21e195f3dfab5a8
[16/18] ASoC: dt-bindings: mt8186: Document audio-routing and dai-link subnode
        commit: 787f190cd1cd3123555e33a3400f3e919ec94a81

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

