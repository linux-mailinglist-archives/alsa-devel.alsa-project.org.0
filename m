Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC822EE1F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 15:58:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CD216A3;
	Mon, 27 Jul 2020 15:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CD216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595858316;
	bh=cBvIlk8E7YyVn2XdywDqzcNs5DbT2ue8zeBexCna5m4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qN+KI35OYHKO1vBz7Xu+mdjtackivSRZTw88DoVi5rLyiovxuUNWc8wsUdCXWXB9N
	 2EHjRv+Mdqf4wxWm/xp1Pl41wicgVKOIGY2zi2xy7EJuwEOp3Vfq8H65R1DVwi3xGx
	 QTMZCh69FvLBo81UngOt0TtDVOsyoRvzpjMc9aAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D492DF800AD;
	Mon, 27 Jul 2020 15:56:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A14FF801D9; Mon, 27 Jul 2020 15:56:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D7B1F80158
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 15:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D7B1F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y+bJfa4a"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3544C2070A;
 Mon, 27 Jul 2020 13:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595858203;
 bh=cBvIlk8E7YyVn2XdywDqzcNs5DbT2ue8zeBexCna5m4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Y+bJfa4adDdnpO8PDjy2Ft7KiIPYz4+ozECo+qj/uza0GXPzxqwIb/3xciGRxp4zx
 p+9j8yuQHkzD1fVfLLtRFp+MnIi3axDHCmQwgRpDkLm7ac3wGCbPD28ZjoXAX+Rugh
 bgzJjnAELOI/fQ2jXRbgtV3QPnPomJXCKi0HDsf4=
Date: Mon, 27 Jul 2020 14:56:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
In-Reply-To: <20200724195600.11798-1-akshu.agrawal@amd.com>
References: <20200724195600.11798-1-akshu.agrawal@amd.com>
Subject: Re: [PATCH] ASoC: AMD: Restore PME_EN state at Power On
Message-Id: <159585818664.22279.12791067726810170753.b4-ty@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Sat, 25 Jul 2020 01:25:52 +0530, Akshu Agrawal wrote:
> PME_EN state needs to restored to the value set by fmw.
> For the devices which are not using I2S wake event which gets
> enabled by PME_EN bit, keeping PME_EN enabled burns considerable amount
> of power as it blocks low power state.
> For the devices using I2S wake event, PME_EN gets enabled in fmw and the
> state should be maintained after ACP Power On.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD: Restore PME_EN state at Power On
      commit: 1255296cf0233780b7b9af90f374983fbcdef7bb

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
