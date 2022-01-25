Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C149B135
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5C0320D6;
	Tue, 25 Jan 2022 11:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5C0320D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106117;
	bh=I/xlRThbfWWPaEeufqnk/aq7zAS5z4+CLNRXPyJ25ss=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F3xB2WLChyKroHo76m4Hi040l7zUdLHkyNtRGEETLAd1cHXoTgujkW3ubGp9zqSTo
	 tUMbeiC34EHJQhKZXwNHPnWmP6Ecizi1anGzGTJ+evB9RavWVOHt7nCRME0GMAu1Ed
	 44DxN55u5ZKLit5TwV7RQXZnHiUKbipJY9FiRS/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BBF6F804D6;
	Tue, 25 Jan 2022 11:20:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCA4F804D6; Tue, 25 Jan 2022 11:20:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A309F804D6
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A309F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XKEI6k4S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40942B81751;
 Tue, 25 Jan 2022 10:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDD5C340E5;
 Tue, 25 Jan 2022 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106017;
 bh=I/xlRThbfWWPaEeufqnk/aq7zAS5z4+CLNRXPyJ25ss=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XKEI6k4SrDlpucA8y9EplNQViAy+4+rC384X/WcAaoM6IW67f+JPrjtGYJYg8zYpj
 HfHQu132WfIUoAs2JRwjRWPfFiOuAaxlIPAW3B/eTVE48f6jkwhdAszylFop4OdWA/
 Iav9v3ilGM/TUx0CAAPOoh0kpn2csOHDbvO41tOAiuGdzNaiG+l8JwLNRWEU/qYFrU
 ZqszEpARDpRnaD/XwLBTCN1LkVbzOTPR8QtliluMNKGc6HoPDWIEMKkFQu+yZg2yUC
 MjOa1+c5aBOt06VA+mg6zkBx6lq6jhoFKcvYEvDEW1715FYy+0aKr7lmGOs3gpampd
 1fljAnv3lokGQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220112170030.569712-1-amadeuszx.slawinski@linux.intel.com>
References: <20220112170030.569712-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: topology: Fixes
Message-Id: <164310601551.74844.7832696445905579331.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

On Wed, 12 Jan 2022 18:00:27 +0100, Amadeusz Sławiński wrote:
> Following series performs few cleanups in topology code.
> 
> First patch reduces number of prints we get from failure.
> Second allos TLV controls to be either read or write which should be
> possible as evidenced by further code in function.
> Last one cleanups after refactoring of memory handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: topology: Remove superfluous error prints
      commit: 3ce57f22cb23eefdf485589bbf675a30e72aeb45
[2/3] ASoC: topology: Allow TLV control to be either read or write
      commit: feb00b736af64875560f371fe7f58b0b7f239046
[3/3] ASoC: topology: Optimize soc_tplg_dapm_graph_elems_load behavior
      commit: cc44c7492bad811dcb89f3f33f5aaacb564e1dfc

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
