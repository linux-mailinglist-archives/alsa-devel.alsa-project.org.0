Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FC75B069A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1031E1674;
	Wed,  7 Sep 2022 16:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1031E1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662561038;
	bh=JiG4OMVdJz6MGyJ5Eyg3FGUXY+/mdIJYNhGg0aNUHFg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CrRGgGHd9qT0agBSz4vQPyPk7WDG57g8P8M/HsWLv3GfCwWAEGm4Jd/8A6MBk2yPt
	 jUv+zq4MpknsyR1EWRN6GXun1vArSsCrt737U4/r2OYoOOLLfqsUqr6QME3H1iPGCg
	 ja974ocM9IWbO3iUGRpcjk8U7gKAmZV3rlh4lcHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C2DF80118;
	Wed,  7 Sep 2022 16:29:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5789F8028D; Wed,  7 Sep 2022 16:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42020F80118;
 Wed,  7 Sep 2022 16:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42020F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QJV2XHmI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C948A617D2;
 Wed,  7 Sep 2022 14:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D15C433C1;
 Wed,  7 Sep 2022 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662560971;
 bh=JiG4OMVdJz6MGyJ5Eyg3FGUXY+/mdIJYNhGg0aNUHFg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QJV2XHmIRt6pj3UdbrtHmM7FwcxMC+QbMjV1HVM3CYIVcMBKCJ3meDxMza79bGx71
 aha0tSB4pLRxVuS/UjBg7e/uR0+XV9ZRy2/jSl55u9Y8z7FyFaCsZQvCjx6N6ZdcE8
 Kcw0JLQ2JzouI7WR5l2iV61ilvqMd1KzF3l0p/CsnMRF0l6XLkZTJN3b4BMl/C1ERj
 m4QTmjwbFwc8C0RnyxDVw25YE/WfnoVcwITFaIw+77h2aBuusyLiest2ykOvuNFi4E
 SGXzkbW47BP2sHvaHW9hRyKXhPLq5VU5F9zvtnn7CrlhDws4aV+S+x8WzM+K/+omnJ
 8EOtoQ96LqS6w==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/5] ASoC: Fixes for MT8195 SOF support
Message-Id: <166256096652.159155.11970501436356826295.b4-ty@kernel.org>
Date: Wed, 07 Sep 2022 15:29:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 Allen-KH.Cheng@mediatek.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, yung-chuan.liao@linux.intel.com,
 sound-open-firmware@alsa-project.org, daniel.baluta@nxp.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, tzungbi@google.com, geert@linux-m68k.org,
 ranjani.sridharan@linux.intel.com, wenst@chromium.org, trevor.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 peter.ujfalusi@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, yc.hung@mediatek.com
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

On Tue, 6 Sep 2022 11:27:22 +0200, AngeloGioacchino Del Regno wrote:
> This series fixes Sound Open Firmware support for MT8195 by making
> sure that the sound card driver is actually able to probe and IPC
> can finally happen.
> It is now possible to get DSP support for audio.
> 
> Tested on MT8195 Tomato - Acer Chromebook Spin 513 CP513-2H (Pipewire).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mediatek: mt8195-mt6359: Properly register sound card for SOF
      commit: 64ec924c781ee846bd469be8d1d6bbed78c0f439
[2/5] ASoC: SOF: mediatek: mt8195: Import namespace SND_SOC_SOF_MTK_COMMON
      commit: 404bec4c8f6c38ae5fa208344f1086d38026e93d
[3/5] ASoC: SOF: mediatek: mt8195: Add mailbox generic callbacks for IPC
      commit: c2186a9b3a98f1ff814996aa52a019158bfad9c9
[4/5] ASoC: SOF: mediatek: mt8195: Add generic pcm_{open,close} callbacks
      commit: cf84edeeb95ee8e76f12bb02a7444876d031bea7
[5/5] ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies
      commit: 8a7d5d85ed2161869452ddb9ec45345dad665f52

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
