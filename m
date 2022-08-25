Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9855A10F2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1936B1614;
	Thu, 25 Aug 2022 14:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1936B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661431618;
	bh=pOtQJt9kEx8p4pkA3MWq57CKBS+/4IwMA0AR5ke4v1I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hk2QOSNa+vrbeonA7mmuiQk3mZbT27LJAU7rIoKsaP3Jx8l0wUjPOfRhRIBWLJ8r0
	 ONRKyX1Xacws6ir+hjARDhsnzZjTD7QuEWApXxNS4hf1Ib6PhAAtq0gI7IIrpqSBSM
	 yFLVs64gM+OwC6ey6vbKJXiSNpRoExo9QhR3T2rI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC79F8052D;
	Thu, 25 Aug 2022 14:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8892DF80528; Thu, 25 Aug 2022 14:45:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5459F8014B;
 Thu, 25 Aug 2022 14:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5459F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lLxYM08f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB2F461C35;
 Thu, 25 Aug 2022 12:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D60BC433D6;
 Thu, 25 Aug 2022 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661431512;
 bh=pOtQJt9kEx8p4pkA3MWq57CKBS+/4IwMA0AR5ke4v1I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lLxYM08fBDiqRFJl+zb/yqfIPSKEf49j9HQmj4Z9tJE3OGdfTXFYWLu7FXCPzxeDy
 oK5AqfeNt0cm9eak1kACO5Koe0/tw4RgysM9ymQU1Qi1GyW3xTCth170Hb3n9P/p1/
 dSJWO9Sshl0uaCsBvMdP2fJPjBsz28lCINbX1EZJ31pSYtUn8/Gjm/lKdebdHd9QsC
 Va1KwNKEBRBl9IutX0nwRB/oYxzZX0voLVYmW089GdfU39B+dndwyhSuCLBXZJ5v7G
 huP+/N2uTUj0g80haKehKDsRhENjpkmm7WPV7oempVCt2icrrKv76Afkx/GhyMOIot
 OZH+Y1hwQ6sSg==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, 
 Chunxu Li <chunxu.li@mediatek.com>, daniel.baluta@nxp.com,
 angelogioacchino.delregno@collabora.com
In-Reply-To: <20220825065411.31279-1-chunxu.li@mediatek.com>
References: <20220825065411.31279-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: mediatek: update SOF driver for mt8186
Message-Id: <166143150803.98448.11310238712995264626.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 13:45:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

On Thu, 25 Aug 2022 14:54:08 +0800, Chunxu Li wrote:
> In these patches, we update SOF driver for mt8186
> 
> Chunxu Li (3):
>   ASoC: SOF: mediatek: Add dai driver for mt8186
>   ASoC: SOF: mediatek: add snd_sof_dsp_ops callbacks for pcm and mail
>     box
>   ASoC: SOF: mediatek: Use generic implementation for .ipc_msg_data
>     field
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: mediatek: Add dai driver for mt8186
      commit: f3b75e9b56780e3bfaa910e560cb9ba4d8f38e53
[2/3] ASoC: SOF: mediatek: add snd_sof_dsp_ops callbacks for pcm and mail box
      commit: 82e93430e0ad13cc31e411cfa575e63118bb0ed4
[3/3] ASoC: SOF: mediatek: Use generic implementation for .ipc_msg_data field
      commit: 059846071f468da8389dcb8b8bbb38a781b02955

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
