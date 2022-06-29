Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A817C5605C3
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 18:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C906F163E;
	Wed, 29 Jun 2022 18:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C906F163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656519916;
	bh=WuhLwVReyPIuFiHnuKnYYLH+rlvl1fOWMReZYjq2KMA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fraRA1Ss3YOKhs4oGVQ9i4mPLTrp4rn9TI7yUqOQEVxfOR3NHueZrPWO7o2FjHLWQ
	 uDdpq5q1TfbqkrOfLyRRiYAgWDdNG6VKK41RVzmM3g1k81lHpcZSezFPt6muy86q+N
	 HgiLtChefeVugYuLwfARwP2z8H67qpOsRWRbpHZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42327F800F8;
	Wed, 29 Jun 2022 18:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02317F800F8; Wed, 29 Jun 2022 18:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D180FF800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 18:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D180FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OI8Xg7Qm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B490261C3F;
 Wed, 29 Jun 2022 16:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F57C341CA;
 Wed, 29 Jun 2022 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656519846;
 bh=WuhLwVReyPIuFiHnuKnYYLH+rlvl1fOWMReZYjq2KMA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OI8Xg7Qm9dXd3I4PqyAiYwIlUZOwy/lTokjll5dxRNjUn/wcOvE+OG/l64Ia36WGu
 WUOOnr3BCdaPPggzW0noOgeAOnb9Jv6YCZWkwk3DRlTqSiAX6f5q1WqJF3eABy9vXM
 qsmLH0lwZ+8coBUg8YqhoK1dLdbtOgsdXBo/XbRoLM8yjKL2mwCH9NdsmoulXYzBgJ
 ews2ccFc96qp9YlyzTyq0Ua3775VSFnw8hZ41pVIlKhcrw+sMBB5V9GCvqOSPWQ/GQ
 wsvCSL+NmFADA5JeCTqM5o6RO8veIgJCV2dqDLTMzUfVOU8o+hxv+cQ/SfSxo2RKG7
 qtO9I2UGO+YNQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Liam Girdwood <lgirdwood@gmail.com>, bgoswami@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 yassine.oudjana@gmail.com, perex@perex.cz
In-Reply-To: <20220622061745.35399-1-y.oudjana@protonmail.com>
References: <20220622061745.35399-1-y.oudjana@protonmail.com>
Subject: Re: [PATCH] ASoC: wcd9335: Use int array instead of bitmask for TX
 mixers
Message-Id: <165651984367.2058781.2486729060656738913.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 17:24:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, y.oudjana@protonmail.com
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

On Wed, 22 Jun 2022 10:17:45 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Currently slim_tx_mixer_get reports all TX mixers as enabled when
> at least one is, due to it reading the entire tx_port_value bitmask
> without testing the specific bit corresponding to a TX port.
> Furthermore, using the same bitmask for all capture DAIs makes
> setting one mixer affect them all. To prevent this, and since
> the SLIM TX muxes effectively only connect to one of the mixers
> at a time, turn tx_port_value into an int array storing the DAI
> index each of the ports is connected to.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd9335: Use int array instead of bitmask for TX mixers
      commit: 4b07ef55d1d4178dbec584195be148685ea25c59

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
