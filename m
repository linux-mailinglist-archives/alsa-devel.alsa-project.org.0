Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEC55BD7F3
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 400831638;
	Tue, 20 Sep 2022 01:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 400831638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629191;
	bh=8/D3JnwU0fDpp4yI4U64lVkY6DwN9AQz/S/fXprKgGo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0uKYwIAMDEs843FafmhVrEOMOasz/Q8g6zFFybBjKtNkfskbKGUN0HwrWG4Mo5Hp
	 +Dq8ITcU/kYRrJ8mCg//KoL9WW8InBTAmroC9glN/Y1H7yY8Zhtzh4/rVA679vuVjo
	 2BOduv0kWqunPitWqCIyaro/+V8YKAf2DvVEtwZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A2AFF80578;
	Tue, 20 Sep 2022 01:10:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B129F8057D; Tue, 20 Sep 2022 01:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74AFBF8056F;
 Tue, 20 Sep 2022 01:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74AFBF8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PiKcIoG6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0D7D620E5;
 Mon, 19 Sep 2022 23:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE474C433B5;
 Mon, 19 Sep 2022 23:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629009;
 bh=8/D3JnwU0fDpp4yI4U64lVkY6DwN9AQz/S/fXprKgGo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PiKcIoG6mxg/eQfMMvxVjJ/L0+FxCZDOpGEyYAfZHvTVUwrhZg7stNmNI1ldlxpMV
 eBVQbrqpUtrp7wY2ir3BsUIvRCNvPeKitlfSH0AnfYjWdc4fP6HsCzbbXM7aaemNRt
 SSb2PdRlR8lmtSbjoCdjxar0HghTIwvvNs4nn47Vmvhxur1gCq+bFz8hiXlhJLW/bw
 70OQtol93p7LX+TsG3QTvl6fUpCf8xy9wmkp3NpJufmM9713vxaA01H9pHYIWaY++/
 TLKQabQ5CjEyU3zRkbdxbt9Gl10/v+egv1/jhXqR6W6EXBjHZjD28XoU77vZz8WQO9
 H4Edvb3ZJMvDQ==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916062511.153962-1-ye.xingchen@zte.com.cn>
References: <20220916062511.153962-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASOC: SOF: use devm_kcalloc() instead of
 devm_kzalloc()
Message-Id: <166362900561.3419825.13047486503989578103.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

On Fri, 16 Sep 2022 06:25:11 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASOC: SOF: use devm_kcalloc() instead of devm_kzalloc()
      commit: 7b88552c26971ccbc6ff35e9d544f7fac94ffef1

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
