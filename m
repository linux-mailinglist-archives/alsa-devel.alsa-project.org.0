Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EF6772FFC
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 21:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1222784C;
	Mon,  7 Aug 2023 21:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1222784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691438177;
	bh=S8fHhhG5KTO+rFTJGNR6dCoDYC/0ZDPxy88icZudfwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u5RguTEZWzp1MCpsIjkk0bQ0XoQnDKtmT7fd+99sd+ze5dYEBXLFOT/4sXxdA5yxI
	 +5JeYG+Db4bcnLv980IWTNhgsA8pMRH7DNoZm1r/z2+w0hCEYy+ti8ST6LyX6f/D3g
	 AEV5NPGUEFyPF252/JV5MY8mTIE0SuOjBaHpA45Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BF05F8055B; Mon,  7 Aug 2023 21:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00780F8055C;
	Mon,  7 Aug 2023 21:54:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A87ADF80520; Mon,  7 Aug 2023 21:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24F89F8016D
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 21:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F89F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IMpKlvH1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E204E620E8;
	Mon,  7 Aug 2023 19:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFD1C433C8;
	Mon,  7 Aug 2023 19:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691438058;
	bh=S8fHhhG5KTO+rFTJGNR6dCoDYC/0ZDPxy88icZudfwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IMpKlvH1Qhos0o/bFvz6KKI1vR5ORA8S2h7KHgmmd6xHtyfB0TnFLyvvoHPV49Lay
	 bigKE7ni/0LQPTg+/xE9LeRIa5utivdY6K9+LH5wTHolpYU+y9nAtbCKep69bQnQiS
	 Kda0Bv+TEXLKZ0wvpP2aP+cvhIGWaEsJEnoC1ZxgtWYP2rLlYnEt59Jrqv4jh9za7V
	 cJn2iz9nC+BvFwTKcWNxDdDLJ6rTm2v5CzI4EsBW083flei6ghnHNTpun7A885dWS9
	 zdbd0e0mho5C/YgAklSzWUEc6LvPXrjW3pysE9pi+q29EGsJan2GtYW16ptGSyKVG0
	 iOcUz8J/+e3dw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
Subject: Re: [PATCH 00/27] ASoC: Map missing jack kcontrols
Message-Id: <169143805578.302632.12010075061564886370.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 20:54:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: DPYG73R7VOBABXPU6VUSVHW3SP2IX2ET
X-Message-ID-Hash: DPYG73R7VOBABXPU6VUSVHW3SP2IX2ET
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 20:57:10 +0300, Alper Nebi Yasak wrote:
> This patchset adds missing jack kcontrols for each independently
> detectable audio peripheral and maps jack pins to those kcontrols
> accordingly, with the primary intent to enable/improve jack detection
> handling in PulseAudio and PipeWire through JackControl UCM values.
> 
> Usually it's just splitting a joint anything-is-connected "Headset Jack"
> kcontrol (from [1]) into those like "Headphone Jack" and "Headset Mic"
> (similar to a previous series for Intel Chromebooks [2]). This split is
> important to avoid automatically switching to a nonexistent external
> microphone when a headphone-only device is connected.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/27] ASoC: amd: acp-da7219-max98357a: Map missing jack kcontrols
        commit: 5532a1cfedda10ec0c5e9edbb8089e6165b532fe
[02/27] ASoC: amd: acp-rt5645: Map missing jack kcontrols
        commit: 596c92fb77a0402b3f2d3ebd36ef6c6aec45faf5
[03/27] ASoC: amd: acp: Map missing jack kcontrols
        commit: 7ac3404c2e21ff6b717fd9ac2f7b352e0149f7bd
[04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack kcontrols
        commit: 00c7ee820895c9563b7780f84f1b9420cbfbe6c7
[05/27] ASoC: Intel: avs: da7219: Map missing jack kcontrols
        commit: c699fc46f45bab70a831a56e95d6f6c6e51ac7be
[06/27] ASoC: Intel: bxt_da7219_max98357a: Map missing Line Out jack kcontrol
        commit: 92d7071f751a863fe22aaf8cfdd94f96749e0aa5
[07/27] ASoC: Intel: bytcr_wm5102: Map missing Line Out jack kcontrol
        commit: 4e06382c0d275fa1e365ca2ee9b2286b7c49b07f
[08/27] ASoC: Intel: kbl_da7219_max98357a: Map missing Line Out jack kcontrol
        commit: da09176f1f04baae467c97a4dc8b6d9fa5cd11b8
[09/27] ASoC: Intel: kbl_da7219_max98927: Map missing Line Out jack kcontrol
        commit: 2830bfdbe90b0bf6170f88ca0803fa72e1b1e506
[10/27] ASoC: Intel: sof_da7219_max98373: Map missing Line Out jack kcontrol
        commit: 7265089ade245d062fe8f9938261656ff2a49633
[11/27] ASoC: imx-es8328: Map missing jack kcontrols
        commit: 105e84586bfcbe8e48e386936899c4eb8c00be71
[12/27] ASoC: mediatek: mt8173-max98090: Configure jack as a Headset jack
        commit: 73864428ba983bc35e1efabc2e3ec04c6d87c67c
[13/27] ASoC: mediatek: mt8173-rt5650-rt5514: Map missing jack kcontrols
        commit: 87eb19815fa53220602fa40b77f7e3504bf6b476
[14/27] ASoC: mediatek: mt8173-rt5650-rt5676: Map missing jack kcontrols
        commit: 8badca99caf0cc843341e3ffa87d24f9caa206c9
[15/27] ASoC: mediatek: mt8173-rt5650: Map missing jack kcontrols
        commit: 0ef5533f7b54419f5b108d6004f56c6de78f026d
[16/27] ASoC: mediatek: mt8183-da7219-max98357: Map missing jack kcontrols
        commit: 9c7388baa2053f333dc524814be4d95f0c2c8ae7
[17/27] ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: Map missing jack kcontrols
        commit: 09a22368bb87a90a447d901e7f5bf2037f321769
[18/27] ASoC: mediatek: mt8186-mt6366-da7219-max98357: Map missing jack kcontrols
        commit: 26de9cc1b96eecfe9fb9c672272665e97c3cdc59
[19/27] ASoC: qcom: apq8016_sbc: Map missing jack kcontrols
        commit: 45bda58af84ffd5c951267f848c8dc10ea485c06
[20/27] ASoC: qcom: sc7180: Map missing jack kcontrols
        commit: 883bfefca437c9061686fa8d092d5a8fa04d06c8
[21/27] ASoC: qcom: sc7280: Map missing jack kcontrols
        commit: 4ab959e5a11624805983909d18ca7f653bab748c
[22/27] ASoC: qcom: sdm845: Map missing jack kcontrols
        commit: 242372d64e5ee39be518672abd7b797d5cd9521b
[23/27] ASoC: rk3399-gru-sound: Map missing Line Out jack kcontrol
        commit: d60e810a0fa83692116293b4b798ab0273668108
[24/27] ASoC: rockchip: rockchip_rt5645: Map missing jack kcontrols
        commit: 24127e5a07a8eac754be50f537df891ebdadf1b8
[25/27] ASoC: samsung: littlemill: Map missing jack kcontrols
        commit: 4d87362f017ea16b6035906613a1c29095a6134f
[26/27] ASoC: samsung: lowland: Split Line Out jack kcontrol from Headphone
        commit: c9d3401844fa6ec6fa924859dca95bac38b1e1ff
[27/27] ASoC: samsung: midas_wm1811: Map missing jack kcontrols
        commit: d27224a45e5457ad89195d92decdd57596253428

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

