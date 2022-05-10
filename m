Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF5521D04
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 16:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4535D190D;
	Tue, 10 May 2022 16:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4535D190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652194287;
	bh=6XuMp8z+zo3YDGe5VL1Tf2eEEjux9fkOX0TVJgBGhn0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPFJZOBAmGLBHpLq+KJxy3gWpLZZUPDbTtoIjKJL2fiG3qXXDyh50HimpBF3IwAHr
	 iQQRizIaAJ9GgBYd6BtXJtc0h27NyRFWU9gQPXQLBK2J8HwuWPta1y9ChONT/V1twv
	 JazKgiVp4TElb1doGMLi2+JSoBqezYOkyYItTuvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64065F80510;
	Tue, 10 May 2022 16:49:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03154F8011C; Tue, 10 May 2022 16:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C03F5F8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 16:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C03F5F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HpmGOfTd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1740E61944;
 Tue, 10 May 2022 14:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D3BC385C2;
 Tue, 10 May 2022 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652194179;
 bh=6XuMp8z+zo3YDGe5VL1Tf2eEEjux9fkOX0TVJgBGhn0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HpmGOfTdzuEbw4aomU+mEB5sr9X3wPkaBPXf40h+90ZQR56o676SLrqrzGhsxOorW
 CnQtAmapvti3U8sJ9ej1bnpvw9RzJviM+kdGyCMG/YqspKQOZgm6t3TXLYcv991KqB
 vu3uYl/WUQgYZ5oLEBFJ3GUTV0o0iusQKcuKC8wIKMa7LMXJ+tKYvq9vhyp/iTUZot
 d+2HipY1fCqzyog6FWn78MVVT9sAn5chqjUvmo3zHKbGUxvjg1Ham8VMkXlxngKedU
 6Sc8MMMoIJRhFdtmtfh0OPzmvtifqHf6pEX2jiEzNYhK2z9nBq1dxxxiIs7iHSW4DS
 Nwq0OwnZPzX0w==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220509170425.54640-1-pierre-louis.bossart@linux.intel.com>
References: <20220509170425.54640-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc: introduce cont_update_posn in
 sof_ipc_stream_params struct
Message-Id: <165219417785.388769.12855496179626110127.b4-ty@kernel.org>
Date: Tue, 10 May 2022 15:49:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, yc.hung@mediatek.com
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

On Mon, 9 May 2022 12:04:25 -0500, Pierre-Louis Bossart wrote:
> From: YC Hung <yc.hung@mediatek.com>
> 
> The host stream position is updated when no_stream_position is set as 0.
> However current implementation updates host stream position only when
> report data is larger than or equal to host period size which is decided
> by the period size of host side. It maybe cause host stream position
> update not in time. Therefore this patch introduces another field
> "cont_update_posn", a boolean value aimed to update host stream position
> continuously and based on period size of pipeline. It can get better
> precise when need to update host stream position from firmware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc: introduce cont_update_posn in sof_ipc_stream_params struct
      commit: 2cb29da3f2c29e62311eec6446be92aa5f2c1620

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
