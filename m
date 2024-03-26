Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB988C6E8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 831FA2BC7;
	Tue, 26 Mar 2024 16:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 831FA2BC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466947;
	bh=d7mywm5rWXgjpSN3I9ojlV17yktCzrZdNxZNYpgH1yQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Woo2ENv9iP3eujUgunaBIpye6KhJXTo2T3KfXslmTkWDall3cROTPoEO/hQay0SrR
	 excIia3i95JO7g1Z9WePEQJ1OFRA8CsxnDlfEQeBscqPE6mCq7PmL1/R6YzRougOtt
	 n7a9hlZjIEkVWt8eaEpMi+eWMyRMUkx8dKOOWCWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C372FF80604; Tue, 26 Mar 2024 16:28:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 749C6F80607;
	Tue, 26 Mar 2024 16:28:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63FD5F805FA; Tue, 26 Mar 2024 16:28:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45695F805BA
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45695F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hp6Esqla
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06C16601D9;
	Tue, 26 Mar 2024 15:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166E3C433F1;
	Tue, 26 Mar 2024 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466873;
	bh=d7mywm5rWXgjpSN3I9ojlV17yktCzrZdNxZNYpgH1yQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hp6Esqla1sjCT4T/dOuLOdPJZJ401oUDnrm2g7ZKzIYsSHuUajnZnSUOxJ+ajTyMC
	 RmXLnvNEpkQi3Avbi9D5focccqQ1CCFjcz7btuhY7Zrykz/t7kC0MPV4AF2VmkPWwO
	 mQplefko5AwG3GGe/5rk+J8Wv2h5jafianOzsF1IsDMBP4+vPT7ZAo3Gj5X7UM91DC
	 Qy2+BaRHT2+GOPn8/8COxnkQylaqCzcNmPWySsBZtZ+j3QycwAWhg0Oj2yyzgNQgE7
	 nNIuQXfDipaZQeQRoZujONjXeJvkictOIygpcA3TdDHmDxu8da7rV7N/9JzZ7nyfr6
	 8nZKG4LEPmu+g==
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
In-Reply-To: 
 <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v3 00/22] SoC: Cleanup MediaTek soundcard
 machine drivers
Message-Id: <171146686681.132239.6648296431652591544.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: YQEUQNIRV5T7RXM5ZT46CRZ6MIVJILXR
X-Message-ID-Hash: YQEUQNIRV5T7RXM5ZT46CRZ6MIVJILXR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQEUQNIRV5T7RXM5ZT46CRZ6MIVJILXR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Mar 2024 12:01:25 +0100, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>  - Added audio-routing names in enum in all yaml files
>  - Added mention of disallowing old and new properties together in
>    commit message of bindings patches
>  - Fixed validation errors with sound-card-common.yaml inclusion
>    due to missing model property in examples
>  - Removed `else` enforcing headset-codec/speaker-codecs requirement
>    if xxx-dai-link not present to avoid future commit noise as the
>    deprecated statement will disallow deprecated properties as required
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/22] ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
        commit: 7aaaa22de56ce0dae15fd9f42a69a1d1a7a6e078
[02/22] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
        commit: 324c603a4efca7d1045e0bf3477ca54970eac72c
[03/22] ASoC: mediatek: Commonize ADDA rate transform functions and enums
        commit: d6c01755805d346a1382d2d81c214b2ca557487a
[04/22] ASoC: mediatek: Assign dummy when codec not specified for a DAI link
        commit: 5f39231888c63f0a7708abc86b51b847476379d8
[05/22] ASoC: mediatek: Add common machine soundcard driver probe mechanism
        (no commit info)
[06/22] ASoC: mediatek: common: Constify struct mtk_sof_priv
        (no commit info)
[07/22] ASoC: mediatek: mt8188: Migrate to mtk_soundcard_common_probe
        (no commit info)
[08/22] ASoC: mediatek: mt8195: Migrate to mtk_soundcard_common_probe
        (no commit info)
[09/22] ASoC: mediatek: mt8192: Migrate to mtk_soundcard_common_probe
        (no commit info)
[10/22] ASoC: mediatek: mt8186: Migrate to mtk_soundcard_common_probe
        (no commit info)
[11/22] ASoC: mediatek: Add common snd_soc_ops .startup() callback
        (no commit info)
[12/22] ASoC: mediatek: mt8195: Migrate to the common mtk_soundcard_startup
        (no commit info)
[13/22] ASoC: mediatek: mt8192: Migrate to the common mtk_soundcard_startup
        (no commit info)
[14/22] ASoC: mediatek: mt8186-rt1019: Migrate to the common mtk_soundcard_startup
        (no commit info)
[15/22] ASoC: mediatek: Add common mtk_afe_component_probe callback
        (no commit info)
[16/22] ASoC: mediatek: Use common mtk_afe_pcm_platform with common probe cb
        (no commit info)
[17/22] ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
        (no commit info)
[18/22] ASoC: dt-bindings: mt8195: Document audio-routing and dai-link subnode
        (no commit info)
[19/22] ASoC: dt-bindings: mt8192: Document audio-routing and dai-link subnode
        (no commit info)
[20/22] ASoC: dt-bindings: mt8186: Document audio-routing and dai-link subnode
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

