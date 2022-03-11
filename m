Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846B24D696A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:24:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A8261A2C;
	Fri, 11 Mar 2022 21:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A8261A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030291;
	bh=YsBWt/1b/coRAuiW5Ll4OeIE+LbscJPmSqzzxWr+rrU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dq3IYbSpPOjeMJEWmmwFppZ56jxfUFQugzUCRnmJJafZHmG0PtyYByMws6pC7TT82
	 DSIM0mFCBBnjBz2Y9GKU/R60gTMzF8kVdtfDAfcO5MdMwDGaBd3Tv2tXOrzrK/bfyR
	 VkiMXhGYO55GrllGRikeSWZs4qDFjf+7Gfrpfq3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F8F7F80519;
	Fri, 11 Mar 2022 21:22:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E805F80238; Fri, 11 Mar 2022 21:22:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 209EFF80238
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 209EFF80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O9CsUPvj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 269EBB82CF7;
 Fri, 11 Mar 2022 20:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA2FC340E9;
 Fri, 11 Mar 2022 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030161;
 bh=YsBWt/1b/coRAuiW5Ll4OeIE+LbscJPmSqzzxWr+rrU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O9CsUPvjz4zuDnPlbI3VSsZvEPqDx0EXOWENHempxe6HEPAZ9WK3J+b8Toboe1bWZ
 XZNUmWjHHiJFPJgdHVFjpdQ8WWYkHd7ebhZHkx/5IzNDO99ocMO/jrTFSwyqB3Z/Bu
 C3iD5ZjwPENr+eHpjfPt7QtX6pR6pmqqx3NA6tlPfZGwy497Obm/z9NhhMuMKc3XvS
 4Pg+HQxkn/5kH0gGnveRSsJt3ryyudUCzXo+5O9rb8kw2FFrsKV997CDuA8ZEn2FuN
 VNhgy2UdwhFSPQ6adIrKN6n4EG7gDvG2PV072pmgtqlV/3w2EECB0rg05XCj2Y6Qzm
 NJgwOoRq7FPJw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1646910999-2501-1-git-send-email-spujar@nvidia.com>
References: <1646910999-2501-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Don't reset clock of active DAI
Message-Id: <164703015990.264137.12664948520166474876.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: robert.hancock@calian.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stephan@gerhold.net,
 kuninori.morimoto.gx@renesas.com
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

On Thu, 10 Mar 2022 16:46:39 +0530, Sameer Pujar wrote:
> Playback or capture errors are seen when clock is reset during an active
> stage of DAI. Presently this scenario happens when DAI has both playback
> and capture sessions running and one of these finishes first which will
> be followed by clock rate reset. The remaining active session will be
> affected in such case.
> 
> Address this problem by allowing clock rate reset to happen only when
> the DAI is no more active.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Don't reset clock of active DAI
      commit: 5bbe2918acccfa60de1c1a2139de9cc5441d5796

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
