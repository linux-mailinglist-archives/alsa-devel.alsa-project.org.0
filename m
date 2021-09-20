Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF241184E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 17:33:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E804616CA;
	Mon, 20 Sep 2021 17:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E804616CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632152018;
	bh=5SUx8buOsjwOJtAUJHLBlHJVOvKWNd1nkQgnqMJvSLo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9Z2cqj2LYq641kyq7XGuGp+YfKzEj8HFbiGectMaSSq1t0+moanZlSu7hDTAC1Tr
	 fvRO60s8W8Q8I+Zu0Gcz4d45+Y7CpRVs+vztsQ/71sWjPkmd077ROe+F2II2jVjmlZ
	 pJqnQOl+QhYHatC1/f6azMzUORqzm5zWEKt9M/yU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D9EFF804E5;
	Mon, 20 Sep 2021 17:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CF77F802A0; Mon, 20 Sep 2021 17:31:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56175F80246
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 17:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56175F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cIG85Odd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 384DD610A8;
 Mon, 20 Sep 2021 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632151907;
 bh=5SUx8buOsjwOJtAUJHLBlHJVOvKWNd1nkQgnqMJvSLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cIG85OddmNqcnY6tlYM3NGQXt3sKl4eKjdW/Trad8kWQZj6rRvUQa6GI1tJA8ocxJ
 W3hBUCFTgJoxx+q/o+KzAWAX2bHH9pXUnlsJj462hDKzD1oiZOvDfJ0twZZY7ZgnhY
 kvh5Fk2JP+zaYCFg3zfMqjueGkZI8/Dz7wcsyuexoCJFfKD8oZ3pQnDmTrxbO/Hf7n
 FbVAvdwsiSfp4d+5qkJwFtC0F+AGCzQrUpHOBHPnf2IMStpoIzZxa2L3Vc88WsQ1RI
 ihkPjMDD4/gLP2aWmN0Siv8OAsIAU2uPqgV09e/eWj+IE1F6V26fKT8C1amPj4d8I3
 ePFdTLbGFLN7Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Remove struct sof_ops_table and sof_get_ops()
 macro
Date: Mon, 20 Sep 2021 16:30:47 +0100
Message-Id: <163215150720.38322.10059497973679611617.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920064156.4763-1-peter.ujfalusi@linux.intel.com>
References: <20210920064156.4763-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Mark Brown <broonie@kernel.org>, daniel.baluta@nxp.com, bard.liao@intel.com
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

On Mon, 20 Sep 2021 09:41:56 +0300, Peter Ujfalusi wrote:
> sof_get_ops() is not used and the struct sof_ops_table is only used by that
> macro.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Remove struct sof_ops_table and sof_get_ops() macro
      commit: 600e0ae9aa7175d777cbac16d0d3bbbebe63e2a5

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
