Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90677555270
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 19:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB451EF8;
	Wed, 22 Jun 2022 19:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB451EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655919126;
	bh=B9aUHJD3yJ+AfE8Llrw6Si0We0sEP5bH4s0Gorml2mU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqsxOXqR95makLO1pHpC43kB1jNPRCh9J80o8k9xQbrkO9KeLm9FX2eaMicVBvU4Z
	 LjWscEiXHyGndwW/owsT09apEqGQMsrmCUtTiHOqhCiSt3ckjFEUnBL6CT+v8ltMty
	 GBr83/bQzJ0Z1gWDX1cwb7S8hoHSmw3OMDN2ig38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5241AF80542;
	Wed, 22 Jun 2022 19:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F07FF8053E; Wed, 22 Jun 2022 19:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C08ADF8053C;
 Wed, 22 Jun 2022 19:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C08ADF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PbhL7BDb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 885D261C3D;
 Wed, 22 Jun 2022 17:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11686C34114;
 Wed, 22 Jun 2022 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655919016;
 bh=B9aUHJD3yJ+AfE8Llrw6Si0We0sEP5bH4s0Gorml2mU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PbhL7BDbL8ugnS61MPkvlHVei8H0YXV25HEjOO4yIEagzWBsXsOQ43PjjMKF0CX6J
 ztJjPP2SmofIZ+HgK8jFO5IDlrxo4pYcGT/0CEKmmgiT55cI04oI5mocctHOa89ZlF
 BOArjVrYOPZAwqwTyUt3vvSKqCxPZKlifuRsNd2EBMV06VeUDxtPNpAmtZeg0/11XO
 sIWLN5Zf6egJM3q5ctgUFJ7SXIDZMepAXFX433At2osHWiVd632iOy5gMd+2foB0HV
 ccFbiozoNwwY1oQSAHsHbAkp8VMo2bAXyJeX7tC3F5nhea+qZgBfizUkhP1H1dbK3o
 PbAVgLkTVaCXQ==
From: Mark Brown <broonie@kernel.org>
To: kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 yc.hung@mediatek.com, cujomalainey@chromium.org,
 yung-chuan.liao@linux.intel.com, tinghan.shen@mediatek.com,
 daniel.baluta@nxp.com, allen-kh.cheng@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220622062245.21021-1-tinghan.shen@mediatek.com>
References: <20220622062245.21021-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v4 0/4] Add MT8186 ADSP dt-binding
Message-Id: <165591901017.1405752.13178281441778356298.b4-ty@kernel.org>
Date: Wed, 22 Jun 2022 18:30:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 22 Jun 2022 14:22:41 +0800, Tinghan Shen wrote:
> v3 -> v4:
> 1. Update commit message of patch 1/4
> 2. Add review tag to path 3/4
> 
> v2 -> v3:
> 1. Change mbox-names to rx/tx for both mt8186 and mt8195.
> 2. Update description of mbox-names
> 3. Use static string array instead of kasprintf
> 4. Align clock names in dsp driver with dt-bindings
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] dt-bindings: dsp: mediatek: Use meaningful names for mbox
      commit: 009b21f392759ca7be91bc4be9d9534f6cee2878
[2/4] firmware: mediatek: Use meaningful names for mbox
      commit: 74bbdd632637628fef8f651bddc5d17aeb7eb46a
[3/4] dt-bindings: dsp: mediatek: Add mt8186 dsp document
      commit: 99370c4ea3d0cee8445f6a1104f25667e3fd47ba
[4/4] ASoC: SOF: mediatek: Align mt8186 clock names with dt-bindings
      commit: acaeb8c62fd1b2b57be1523b8d5b1d64a1a9dc38

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
