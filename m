Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B0638C22
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:28:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15AFD1735;
	Fri, 25 Nov 2022 15:27:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15AFD1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386497;
	bh=liB9cYSIC9imj2GLnkeULuir5cwbsVdlwrWjGPMNH48=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aW+wR+jawWN+u2ITUxJ034MsX3rLU3w1Xsm9TOMzrZUxOXYSYiYkUQIP1LatoisgN
	 hWSFtNiJfTf5JVsOmXH+0gK1SEHE5lx61/KJeUdKbjhCqlzcODGWj3qMyQpEVjtw1y
	 8tXEqeNkuHOWX9dMYG3OhXO1/eznxmisEx0d5qts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E52FBF8047C;
	Fri, 25 Nov 2022 15:26:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4729DF80236; Fri, 25 Nov 2022 15:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4FE6F8014E
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4FE6F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eM4cqkKB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 169CC62475;
 Fri, 25 Nov 2022 14:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4DDC433C1;
 Fri, 25 Nov 2022 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386407;
 bh=liB9cYSIC9imj2GLnkeULuir5cwbsVdlwrWjGPMNH48=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eM4cqkKBYGROLcu/cUdBis9HAHDNxBYeF1DvRPbtZfsH6C3Y6yqlsGBrCd8O7ee3U
 BuCsld7Xqsan/aKl/RRgViN+ZYBz9xa29LCGoWmo6wRn9Fe4ltOg75+vDTcjmrvzUv
 FQZqIfN5K+0j6kJmFyax3xCZQy5eMqRSe4/tFMofTmC35BCcUYvdRBWw67k6IfNkhC
 DHoMJkD7jOdYttCfhH5nDkVVXPVGsLUVv/mk9JMnJpQFlYnvMpxcZlzfRdbLX2mqXB
 lbw4mscdCNUckma7LQstr9fTwG4kEhih5c/01c3lHFy+TGCe78icg1+acZGw1R2NDt
 wyysmKa+Rj4gw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20221123145140.2784030-1-rf@opensource.cirrus.com>
References: <20221123145140.2784030-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: wm_adsp: Report when a control write changes
 the value
Message-Id: <166938640633.506633.103320860626722762.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Wed, 23 Nov 2022 14:51:38 +0000, Richard Fitzgerald wrote:
> Writing a firmware control should be returning 1 if the control value
> changed, so these two patches add that.
> 
> Though this is an ALSA requirement it is also useful for non-ALSA clients
> of cs_dsp to know if the control value changed, so the main handling is
> implemented in cs_dsp. TLV controls are specifically an ALSA thing so they
> are handled specially in wm_adsp.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] firmware: cs_dsp: cs_dsp_coeff_write_ctrl() should report changed
      commit: c56f4b2442d33bd94c418697f753271099384bee
[2/2] ASoC: wm_adsp: Return whether changed when writing controls
      commit: 7406bdbc4fb8b99cf0150cb2056a585c95ceafe7

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
