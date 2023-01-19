Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76C673D92
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 16:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D3F4064;
	Thu, 19 Jan 2023 16:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D3F4064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674142466;
	bh=H771fSfWeWB3a/8kw3DPz5R4e39zQUSOubvNIKtjKX4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dBkUA267rHrG91O0lwZ0nSPwZgj9MYA4qHqlLVmFHNtKDBifg15Q57VMyl3perf75
	 oIt8Y4mmDmSNl9B+mSbXSwyYJQKHhLiCueKOujtt8fxQmZcI9i61kIFrg1EDM/dvPl
	 yZbjRmLHHfCDgkrSSB+Thmc0tnAUJVXDa2aRJ1JA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 590AAF800F0;
	Thu, 19 Jan 2023 16:33:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24CB5F804DE; Thu, 19 Jan 2023 16:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2E60F800F0
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 16:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E60F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B6h7r9Sx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE8C561C52;
 Thu, 19 Jan 2023 15:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9AFC433EF;
 Thu, 19 Jan 2023 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674142399;
 bh=H771fSfWeWB3a/8kw3DPz5R4e39zQUSOubvNIKtjKX4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=B6h7r9Sxi4wnsa4Ax46HpkHlw4IIIf68GlWNrLMp/2RQqeCOQzmUzcaoXSgOpT0/6
 R4UCZJaClvRt5uKNh988KwdDhf176o2hoHU06zbrr8fQ/Lfjv8ukY+BsacoD2iEVZi
 KTEg+3gRD37fDSKXL5uwERrATcHuxjZvGxCyPtDJ9fkxnEzY30rq39l+1qBzi4od1u
 szO/1qdEto4avW2HFYjTjrVvgvN0pBiMOe3Xl9195cvSSOWWuekwBxPCBcL4S5G16l
 eY9qsO2hc9l9eZO59uH6ViYwtJd4MC9OSSnZ6J3N3iH8pwQQfaIFJZwOCKKf9F+ojf
 TaidLFyl9nzOw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20230116034131.23943-1-trevor.wu@mediatek.com>
References: <20230116034131.23943-1-trevor.wu@mediatek.com>
Subject: Re: [RESEND,v5 00/13] ASoC: mediatek: Add support for MT8188 SoC
Message-Id: <167414239535.1082520.4972233422127115256.b4-ty@kernel.org>
Date: Thu, 19 Jan 2023 15:33:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 16 Jan 2023 11:41:18 +0800, Trevor Wu wrote:
> This series of patches adds support for Mediatek AFE of MT8188 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v4:
>   - refine etdm dai driver based on reviewer's suggestions
>   - refine dt-binding files based on reviewer's suggestions
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[01/13] ASoC: mediatek: common: add SMC ops and SMC CMD
        commit: 7d40cc8eedbad7cce77226c5d01d891a40373eeb
[02/13] ASoC: mediatek: mt8188: add common header
        commit: f90f0dd809e6600cf20ab74f07237241925f5cf8
[03/13] ASoC: mediatek: mt8188: support audsys clock
        commit: fdd4e1a28d69648c35bea020c0df3735ddc74889
[04/13] ASoC: mediatek: mt8188: support adda in platform driver
        commit: 5d1c8e881ae0e6e931396952534d422facbebdbe
[05/13] ASoC: mediatek: mt8188: support etdm in platform driver
        commit: 2babb47774891bc8e68ae229d42ee7df90db9fd9
[06/13] ASoC: mediatek: mt8188: support pcmif in platform driver
        commit: 5d43bdd71200e1b08b7c4b7f3d3c86fdd23c4a3d
[07/13] ASoC: mediatek: mt8188: support audio clock control
        commit: f6b026479b1392b4b2aa51ed1edbfa99f6d49b59
[08/13] ASoC: mediatek: mt8188: add platform driver
        commit: bf106bf09376608e4992f9806c21842a4223f18b
[09/13] ASoC: mediatek: mt8188: add control for timing select
        commit: da387d3223aea9505fcd740105b7494df5bb44ad
[10/13] ASoC: dt-bindings: mediatek,mt8188-afe: add audio afe document
        commit: 692d25b67e1089a7683978d1860e511f2ca86e7b
[11/13] ASoC: mediatek: common: add soundcard driver common code
        commit: 4302187d955f166c03b4fa7c993b89ffbabfca4e
[12/13] ASoC: mediatek: mt8188: add machine driver with mt6359
        commit: 96035d46d4b45274208327826608b873ec6d7f06
[13/13] ASoC: dt-bindings: mediatek,mt8188-mt6359: add mt8188-mt6359 document
        commit: ce0382384e88c75d2506d4e49929ab8c22527dc7

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

