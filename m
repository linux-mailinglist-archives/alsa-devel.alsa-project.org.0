Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8FD57E19F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 14:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED74418A8;
	Fri, 22 Jul 2022 14:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED74418A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658494204;
	bh=dL30FDACnD/Tq8mIqMC/8m+71oRFtBVoo6U4J4KCW9E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BbgFu1Tl4O64h3xz/DDGWG7515Gd1zx4lcR69IHBRLzQYppj7RbzvZDRx4L8rFOAC
	 VZ2kDbvpLTn7jKUZk2LHD/RzDZyX2CLXhfFSX5j9g6OGq317vMB9HxNheeV1+90NXb
	 T3tV3Kt7O0aIRoa4MhnkBlCNg8XpqX0sJg7b6lhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D277AF8053C;
	Fri, 22 Jul 2022 14:48:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D12FF802DB; Fri, 22 Jul 2022 14:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C20DF80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 14:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C20DF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NDFK0zuV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E98C61F5B;
 Fri, 22 Jul 2022 12:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483B2C341C6;
 Fri, 22 Jul 2022 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658494098;
 bh=dL30FDACnD/Tq8mIqMC/8m+71oRFtBVoo6U4J4KCW9E=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=NDFK0zuVbb2ynDYvkw77nNGRoHBGQ4W02qbm2KLOBEvf2gyxkBrQWax7xuVD3qzYO
 +WdDLaq8d8HZczMcG3rpVeFuEukvEz9pFIMq5wfnayiBgtoXHpjXbMely1vj+YKa29
 T5fbL11yl/7n1WunVVKruaIztzVL2VOaT04BNdEEgmJWBsYeyUGPze5dZlR9Wu8yem
 PrEo0liUHhYX74fKEXiPENsi6vrYi364izS/ygcRrEd97KaVjyjC/vaT2+M4Oi46WQ
 Bik3wBbI07ZYH761B+Kf9DqlO5GpGhXYd5Yx73ze3cmLWB10bxR4gl30kaahKdlROu
 oO//9v4z2Xk3w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Liang He <windhl@126.com>, perex@perex.cz
In-Reply-To: <20220721144308.1301587-1-windhl@126.com>
References: <20220721144308.1301587-1-windhl@126.com>
Subject: Re: [PATCH] ASoC: audio-graph-card: Add of_node_put() in fail path
Message-Id: <165849409700.139149.11262963028531305739.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 13:48:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
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

On Thu, 21 Jul 2022 22:43:08 +0800, Liang He wrote:
> In asoc_simple_parse_dai(), we should call of_node_put() for the
> reference returned by of_graph_get_port_parent() in fail path.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card: Add of_node_put() in fail path
      commit: 65fb8e2ef3531a6e950060fca6e551c923fb0f0e

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
