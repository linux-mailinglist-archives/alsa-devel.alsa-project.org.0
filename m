Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5CD4A048A
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 00:49:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 292AA173D;
	Sat, 29 Jan 2022 00:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 292AA173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643413785;
	bh=YbZLwG+eJY1ZimQ3PDJ414ftXS0oYjH5t+IwvoH0++s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sY00DlnLX5I3QL6KCoaw9dhW7hALQzkT09FEcKb7+GinXsYjm5294jv+qCxIt0O9/
	 GhtdippUfHK0cBHhWiAEoI9ISp1cedE7Dsk70+mbuXbLnQLVqQI2Dv577PKmawxzdF
	 gTGkCW3Gm1jBCbvhslvr/2RujXLRJwAfzAHr/3Fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36198F80526;
	Sat, 29 Jan 2022 00:47:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BB2DF8050F; Sat, 29 Jan 2022 00:47:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A8BF80246
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A8BF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H6N+qa02"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DFE361F3E;
 Fri, 28 Jan 2022 23:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1611DC340E8;
 Fri, 28 Jan 2022 23:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413620;
 bh=YbZLwG+eJY1ZimQ3PDJ414ftXS0oYjH5t+IwvoH0++s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H6N+qa02zvveNZcva5WhrGiGfFlJ66Cb6+yfRLYilkduh+hulF7T0OeTu/hburMzI
 yri78rLL6daKW9gr8X08EibZESI18/IBpN1Pbc1hUchVwsl9f1LfyCo1WFwktqwb8/
 WhMvDqfjoXFeMWDKTJAFvPq07d9H9J95VdV4XpgahRGHn8cMJcF4WTXB1tus4t4Uh1
 5GnvTRmAL9qKEWspIPzel0cYJTWOmOhQW3fmKwYGPfuBHC5T3VxISuz3I97zsJVC+N
 KJ0PrtCoVJ9qsR9tTbUB13DANVzaUtP5ujdmoAOK3ZTdma0dMi9TkcPU5eWB2rSYik
 XmBrYqh7uuWpQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>
In-Reply-To: <20220114230209.4091727-1-briannorris@chromium.org>
References: <20220114230209.4091727-1-briannorris@chromium.org>
Subject: Re: (subset) [PATCH v2 0/3] (Re)enable DP/HDMI audio for RK3399 Gru
Message-Id: <164341361780.694709.13259283241590347085.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 23:46:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 14 Jan 2022 15:02:06 -0800, Brian Norris wrote:
> This series fixes DP/HDMI audio for RK3399 Gru systems.
> 
> First, there was a regression with the switch to SPDIF. Patch 1 can be
> taken separately as a regression fix if desired. But it's not quite so
> useful (at least on Chrome OS systems) without the second part.
> 
> Second, jack detection was never upstreamed, because the hdmi-codec
> dependencies were still being worked out when this platform was first
> supported.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] drm/rockchip: cdn-dp: Support HDMI codec plug-change callback
      commit: 9da1467b49ad6c02840e8f331c5da69f6a5bdb2e
[3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
      commit: 6a8bc4b68ca0c6ef73518b692c00b7e1e010d056

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
