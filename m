Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E8349FD70
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 17:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5731713;
	Fri, 28 Jan 2022 17:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5731713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643385671;
	bh=07CO3JggCWBG9AkVQ3OmvAImtDUfRFqRTM+c1NkVMkg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fv8485O/BTk3Z9/CUpoA0QznaJUZj2o83Rwasml+CqiKbVbAOQcPr/RLMjlQD96JT
	 qIT0lNSVK3cYTyd2iyvdqCZht3Rm6bMDMMr9L6qLxufoGg6Kw2BVUoOfOGUQ2bK/s1
	 6SSZMHAqtRx6UWIlicz7cZLyIDgXnl4n4O08SWNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B88F80425;
	Fri, 28 Jan 2022 16:58:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C34F80425; Fri, 28 Jan 2022 16:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE7F5F80425
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE7F5F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZrmImSRR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58BCE61EC4;
 Fri, 28 Jan 2022 15:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC81C340E6;
 Fri, 28 Jan 2022 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385529;
 bh=07CO3JggCWBG9AkVQ3OmvAImtDUfRFqRTM+c1NkVMkg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZrmImSRR3DltT4PTcyJO+zd++jdKcI8NsQ/XpQiGTwIzK/JAMt5fuBvPXM+mbfFNP
 ncpuUSTJZ6kov9LUmSlTPudZMesVQ1QjGl2GEMygMRwGF64ayNwcAbtBZPq06NWqLI
 ZR906fjFWNKa9VDPKWNLwbGqJl8qnDu9DrQDLOQ6dAncKFfr78Yyep3bSRGtYqBPlX
 S9XQ9QWnBiDreMkj95vQ2JL8o/eaFB+v+0BWiIxKMDi/304E78MWkijM0YRoC+XYcS
 ZdYqIhwYLdZzA7BJ1Q5rl7uTnZ8FtkaAfVEOF0QWP3xxxkDc0QkyU++E9w1nkBx+j9
 zJnY4Ja7H15SA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220128120627.18443-1-peter.ujfalusi@linux.intel.com>
References: <20220128120627.18443-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: trace: Simplify count adjustment in trace_read
Message-Id: <164338552768.1711274.9786297428337296079.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 15:58:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Fri, 28 Jan 2022 14:06:27 +0200, Peter Ujfalusi wrote:
> The first count check and fixup against "buffer - lpos" can be removed as
> we will do the adjustment later against the "avail" in
> sof_dfsentry_trace_read()
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: trace: Simplify count adjustment in trace_read
      commit: 7bd04b8d46b9362fb1ade63b99cd6ddee0740af4

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
