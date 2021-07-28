Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767923D9978
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 01:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15F561F4A;
	Thu, 29 Jul 2021 01:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15F561F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627515095;
	bh=+NI/Q1mxn7g59Uo+U5KM4ZKoYVyNYBLPtk1ASgNvUow=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kftVuDk7qf1GsKrsQp3GGYgT3R47rFJsrtI1u711f9wDE2dFm+rG+E8MfVRR0tBpT
	 cG0LjFkLTO9gTwXigJqgGKWPMBwbiCv2HbrRd1sD5Pzpre9lFUBJazR4XdcWcpmNxR
	 PDhtBV8mi7a7M+osZcS2yD3WRJBE1QuJOBm/shnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4867F804E7;
	Thu, 29 Jul 2021 01:29:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1602F8049E; Thu, 29 Jul 2021 01:28:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40EDBF80127
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 01:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40EDBF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sM/HQQxJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4001160FD7;
 Wed, 28 Jul 2021 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627514903;
 bh=+NI/Q1mxn7g59Uo+U5KM4ZKoYVyNYBLPtk1ASgNvUow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sM/HQQxJ9CWHoyXxLvHXxSkkq9COWnITBIWqG+7dcHfD0q8N0JeH1Iy5ZkRMSa35i
 2oWnQzGbQPiQ/yo8c1hePDRUrG0tgi527dxv+9ygKv7hQLaN4e6Bku/yqvcHcOe/Yj
 5dthiKRs6MBRN4SNv+za0//bCuW+BGF26GFHKUuDpX72rg7nIfYO3mRUAIWFe85mGr
 cJTMlk164/qNidvgQs5nHaZ8FjaHo6K+7Z/ojdg36ctbUSk3XToZH71LKCUWaLXXAJ
 kLhlQr032pvKJsPPhhTBIZsjGYVryr+OqH+z6SOzq6znsSR2qmeLy2ZnZ5QdGyqIOd
 EGIeV+28SjGJw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Let soc_cleanup_component_debugfs remove
 debugfs
Date: Thu, 29 Jul 2021 00:27:57 +0100
Message-Id: <162751391068.10122.6522975229334793917.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728104416.636591-1-tanureal@opensource.cirrus.com>
References: <20210728104416.636591-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Adam Brickman <Adam.Brickman@cirrus.com>,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 James Schulman <james.schulman@cirrus.com>
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

On Wed, 28 Jul 2021 11:44:16 +0100, Lucas Tanure wrote:
> soc_cleanup_component_debugfs will debugfs_remove_recursive
> the component->debugfs_root, so adsp doesn't need to also
> remove the same entry.
> By doing that adsp also creates a race with core component,
> which causes a NULL pointer dereference

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Let soc_cleanup_component_debugfs remove debugfs
      commit: acbf58e530416e167c3b323111f4013d9f2b0a7d

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
