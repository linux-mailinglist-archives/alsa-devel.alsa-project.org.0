Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDD557D6E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 16:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 232E11B55;
	Thu, 23 Jun 2022 15:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 232E11B55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655992828;
	bh=2mVrmGmg0xr+Ozcvo3SQuzInJWS43tMd2u0JvspqRZY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSoqCRTAaXXeD2F3CHEqG7v2LWB4rmM8Aq7Dz9groMCzIMNRACT8yOL0runUZrVxz
	 y1dBu/iegbJT/Y8EC97HnYixRa8b8moy3HhS4HqkeXmaM2zSO3H28sXbMZr/SW0DBU
	 WfC0J3czVkQlaDV+7VtPayo+yhBVMyE/0DOAK0S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 483BAF800BD;
	Thu, 23 Jun 2022 15:59:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 340EFF804EC; Thu, 23 Jun 2022 15:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74C03F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 15:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C03F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VfDbK+9x"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78F3B61DE6;
 Thu, 23 Jun 2022 13:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E18C3411D;
 Thu, 23 Jun 2022 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655992733;
 bh=2mVrmGmg0xr+Ozcvo3SQuzInJWS43tMd2u0JvspqRZY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VfDbK+9xXR0NUdvVobxenGV/aPApAVTZ9kOoVcXuGXY4rLTPo7/ydth9gXKOuC5iP
 rfgMFrGZUnvRShxQbc5Gy2CKaUtV9a+fkRPWeUW0h/pi4OlfakqhiwGhO5GWcfVjrm
 7zp6uT2Gs5JohG5a2ru+g5GNyBKSuTSJR9In/JWC+EqLVtAC0i04AcIKpFc/v4A0xd
 QmqpeettfwY0aY1LxRulZrmBvBRnIvkDN6Q/tNBY+JApGKhQ+zX2o0dJAjfFR2c4Sk
 E31R06UEA4tXld+JtP2xo4WPARl7WmefM4Us3MW1XgotY7ysASsaxqBcmvUqGJNOnl
 66m0FG9WUsoog==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
References: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/6] ASoC: dapm: Initialise kcontrol data for
 mux/demux controls
Message-Id: <165599273226.179867.18058864820347037377.b4-ty@kernel.org>
Date: Thu, 23 Jun 2022 14:58:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com
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

On Thu, 23 Jun 2022 11:51:15 +0100, Charles Keepax wrote:
> DAPM keeps a copy of the current value of mux/demux controls,
> however this value is only initialised in the case of autodisable
> controls. This leads to false notification events when first
> modifying a DAPM kcontrol that has a non-zero default.
> 
> Autodisable controls are left as they are, since they already
> initialise the value, and there would be more work required to
> support autodisable muxes where the first option isn't disabled
> and/or that isn't the default.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[6/6] ASoC: dapm: Move stereo autodisable check
      commit: 4d6c2b46d81765e920007f76185a8d1fb5e41ca3

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
