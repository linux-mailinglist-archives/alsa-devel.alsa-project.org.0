Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2D7D875F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 19:12:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C304EDEC;
	Thu, 26 Oct 2023 19:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C304EDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698340347;
	bh=Va1jEBWyzwHMFJmzyliMsvcYTsQhokdCctBTTd7BWks=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HHA7QDAQhCpf+jEe9abD3/4t7MS390pKf2NSM0fAFTLi5L1TieW50lb0c+QPiWg1x
	 iUvSVz6Vz5hYvgb3yduQXzMCIuopsJN9YKZ9puLiiGVIcNCni2gR7ybiWQmR7mhhpB
	 7JMJjzFHjloXLO+ztGMsi5ZhkekaRvZSlZLWdarE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7181BF805A1; Thu, 26 Oct 2023 19:10:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F960F8057E;
	Thu, 26 Oct 2023 19:10:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC4E1F80587; Thu, 26 Oct 2023 19:10:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3376F8056F
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 19:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3376F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PhIcRJkA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E17E0B836CB;
	Thu, 26 Oct 2023 17:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28356C433CD;
	Thu, 26 Oct 2023 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698340225;
	bh=Va1jEBWyzwHMFJmzyliMsvcYTsQhokdCctBTTd7BWks=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PhIcRJkAlRvEUJKrmKS2QMIqgY34kubBOM7CJ2dz9jx7eL/QMCkhRfmsJygzZf/cQ
	 DlrzJl4vB5hk4L6rcHwKbGdUGfx2P9LIIEn7xYjzdaTpX1aZoRRQw3IReF+Duv/Gud
	 lFTgp3N/zdkkA1VTMjkdtkeDcx9Tqr2vDotqSL/pqYAFZDutEnNid/HWFiRCHVSI9q
	 7XWl3TAWHeb78ij9BENyAptFlO3Elvew6KX+mk22drx7L/Wg66PR5MUfmW55RJMQ3M
	 tFuMYbozMKxsHov4K4u2DHDxeiwG+mLafID8JZemuGSS8g6pgy1v6q0IhE5KSgCUXx
	 pWjp0dPIJFVwA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RFT PATCH 00/17] ASoC: fix widget name comparisons (consider
 DAI name prefix)
Message-Id: <169834021871.149939.12687771696008766047.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 18:10:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: L7HBU2DQ6QC5YENNYEIH5PVVOMOSB5VU
X-Message-ID-Hash: L7HBU2DQ6QC5YENNYEIH5PVVOMOSB5VU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7HBU2DQ6QC5YENNYEIH5PVVOMOSB5VU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 23 Oct 2023 11:54:11 +0200, Krzysztof Kozlowski wrote:
> Some codec drivers compare widget names with strcmp, ignoring
> the component name prefix.  If prefix is used, the comparisons start failing.
> 
> Except Qualcomm lpass-rx-macro, none of the patches were tested
> on hardware.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: codecs: 88pm860x: Handle component name prefix
        commit: ccd0c6c7097b52b01a2c5951cfe96714d4421cd2
[02/17] ASoC: codecs: adau1373: Handle component name prefix
        commit: 7a0762587a814387e631c07ae81169a7c646f012
[03/17] ASoC: codecs: adav80x: Handle component name prefix
        commit: ecea1812b911fed5e675b2d37b29ad4265c067ce
[04/17] ASoC: codecs: lpass-rx-macro: Handle component name prefix
        commit: 5efc1c903e2b43a267ad13696698fcc152ed873a
[05/17] ASoC: codecs: max9867: Handle component name prefix
        commit: a1fa72a780f428ddc956cf5ed4b97e2be76ceba3
[06/17] ASoC: codecs: rt5682s: Handle component name prefix
        commit: b2056ce3cf61a39796041dc5c94d7255de7f9f0c
[07/17] ASoC: codecs: rtq9128: Handle component name prefix
        commit: e2d38e1196f61735716f9c2dd89dff32c0655529
[08/17] ASoC: codecs: wcd9335: Handle component name prefix
        commit: 7df1e6a3c608ab0c345b8898f9ee5d5ac19f2eb4
[09/17] ASoC: codecs: wm8962: Handle component name prefix
        commit: e54db8826f48c9ca52f2abd108d6e030ff20cae5
[10/17] ASoC: codecs: wm8994: Handle component name prefix
        commit: e13b63c47578a27dbf8907974f0dcba0bb2efe58
[11/17] ASoC: codecs: wm8995: Handle component name prefix
        commit: 343b62590d5b950c8bf7f78fef7c81103c5f982c
[12/17] ASoC: mediatek: mt8183: Handle component name prefix
        commit: e84c7f5db97474cb4becd863a93d4ea541dc4110
[13/17] ASoC: mediatek: mt8186: Handle component name prefix
        commit: 0fe153a99fcc2edeae4e863b03c5a8f71376629e
[14/17] ASoC: mediatek: mt8188: Handle component name prefix
        commit: d1ecaabe9f1a669354de7420261bd8737da4bf48
[15/17] ASoC: mediatek: mt8192: Handle component name prefix
        commit: 86cfaf99e4d3c7b4707fb8cc9eb06d8db10c1414
[16/17] ASoC: samsung: speyside: Handle component name prefix
        commit: 317dd0dbadd8bd4de2d69fa6a0611456f3e15b1a
[17/17] ASoC: tegra: machine: Handle component name prefix
        commit: f82eb06a40c86c9a82537e956de401d497203d3a

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

