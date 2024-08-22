Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1839295C102
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 00:45:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AA6C826;
	Fri, 23 Aug 2024 00:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AA6C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724366718;
	bh=nby6NWEBHz0kldiD4Q3r2GYBLGenjWviTDtS0NIzTDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VhLOG1sEP11DxOk5G4kzDeNwQ5m85emC44E9bSit+R6/sNrogSC3TqihC2P8BW2Ql
	 3IsegHHyJNOQSu67QCbQ9lTMY+LRA44Zdo23xHXs4bNUtWd/1/03o9yNn3s/ZyAwJk
	 hiXERFuf3DJQ0pVBbosw3by3hyXDaxi0OLePDW9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 858DDF805AC; Fri, 23 Aug 2024 00:44:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A26EDF80588;
	Fri, 23 Aug 2024 00:44:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F00F2F80496; Fri, 23 Aug 2024 00:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CDF5F8016E
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 00:44:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CDF5F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nm2EOj7f
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA79BCE1072;
	Thu, 22 Aug 2024 22:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B694C32782;
	Thu, 22 Aug 2024 22:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724366663;
	bh=nby6NWEBHz0kldiD4Q3r2GYBLGenjWviTDtS0NIzTDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nm2EOj7fh9RLIYhKN5wkFMBJYGfu+IzeJw5xNcgeMV/D2XVcPkXjqumeOr1vGTLrV
	 Fu0OUHvVC3s2+KHFt0O8wUOdhZc9P32nSXH06kJvPVRWHHbI7fKKLZxj8zBz9TNaSj
	 dGUZM5GnPqVZQdivOQQ3Xroo+of1oiQt9nLyoU85B6KBab5ER415CwSGmUYqFze+of
	 76D5y7jLvNotdyE57Bo5R+Vwk+4aJEHn30GMUyuQrW+iXlC8wMn7Q4n11bAgFmLc6L
	 Lc66T3xOYyX6hwgPtm5AgYK9bE26iYhF7GUa7AtYaAWDf/Z4vCFXhTslZjuWpDDy74
	 b+9yLacrc52uw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v8 0/4] ASoC: grace time for DPCM cleanup
Message-Id: <172436665530.825985.3481759967594111541.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 23:44:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 3K24X4WOVP7ZKBLHWTARKAJUGHK5MWTP
X-Message-ID-Hash: 3K24X4WOVP7ZKBLHWTARKAJUGHK5MWTP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3K24X4WOVP7ZKBLHWTARKAJUGHK5MWTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Aug 2024 02:13:29 +0000, Kuninori Morimoto wrote:
> Cc each ASoC driver maintainer
> 
> This is v8 of DPCM cleanup
> 
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
      commit: fd69dfe6789f4ed46d1fdb52e223cff83946d997
[2/4] ASoC: remove snd_soc_dai_link_set_capabilities()
      commit: 12806510481497a01d01edd64d7bb53a4d9ec28d
[3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
      commit: 46fb727a28d8c7195f915150a669d927d463069b
[4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
      commit: 61e1f74f739546415570ccc1ac14e1b26afe4705

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

