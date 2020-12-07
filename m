Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742D2D1768
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 18:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB441732;
	Mon,  7 Dec 2020 18:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB441732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607361762;
	bh=3bsg1/7JIEmM2sCoXIBnLHYqYDcZWModSSc7lZ3WKno=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFaC39Tb/FofVkH6qPYFOadfYgngYQisQQHuQjG6y7/wkhXRqKNPivcrOrxvnf4Qf
	 r64ruIISVGyD9Y4IebYXY9skR9QudlOQL7K5IY0GRtBmOQBlYywWfvaHTJGnsCHiUc
	 pZxTHLrJMPC6gdmvSffF2r0acuOTzJ4roOO++KHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EDDEF80217;
	Mon,  7 Dec 2020 18:21:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79748F80217; Mon,  7 Dec 2020 18:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4249EF800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 18:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4249EF800E1
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201204165014.2697903-1-kai.vehmanen@linux.intel.com>
References: <20201204165014.2697903-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: trace: Add runtime trace filtering mechanism
Message-Id: <160736164880.53222.15259224372038544033.b4-ty@kernel.org>
Date: Mon, 07 Dec 2020 17:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>, daniel.baluta@nxp.com
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

On Fri, 4 Dec 2020 18:50:14 +0200, Kai Vehmanen wrote:
> The "filter" debugfs file defines the log levels used by
> the firmware and reported by sof-logger.
> 
> The file contains the formatted entry list, where each entry
> follows the following syntax in plain text:
> log_level uuid_id pipe_id comp_id;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: trace: Add runtime trace filtering mechanism
      commit: 8f6cfbb6d4272635311b4604194e39172e7719ad

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
