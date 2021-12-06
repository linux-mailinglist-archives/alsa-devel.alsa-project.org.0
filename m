Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937A46A3C5
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:04:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9DDE234D;
	Mon,  6 Dec 2021 19:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9DDE234D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813880;
	bh=TFrUdFOKOZTgMW/4vcU/Sx5rIGJgVMftP0iInpxV7XA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MR8WREIjlktfzQO+FdBBXFf4nz0UtymMwWLuV8acSkkMuBD8TV/rUlRMNE+/+vRUH
	 y5dPvJFYLkbdkVZLowWnCRGnjpZ4WWHWy7mPkKFIpwBCXUMJsxYNxYZj/weFycgqej
	 2OLgPS9NkUBuospN5LFL6lqrZdcVj/bDPRyKJO+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D364F80520;
	Mon,  6 Dec 2021 19:00:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31BB1F80533; Mon,  6 Dec 2021 19:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE1C1F80520
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE1C1F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DpIjXGwb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93F81B811E4;
 Mon,  6 Dec 2021 18:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FC3C341C5;
 Mon,  6 Dec 2021 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813648;
 bh=TFrUdFOKOZTgMW/4vcU/Sx5rIGJgVMftP0iInpxV7XA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=DpIjXGwbx+gA/gtxKTrn8PFwHP5CQ7sAnktk0nzXGsrelPvhUfF58d09ZLqrganLw
 bV/ka+XSf+adSaypZ7xLBNg283+wIdfVBphsShlXOPMyRVrgUgE9XPCoyLz+rsRtcz
 4I53089gRYExRyMHIlpHSWQ2nyjAdvyY2UKekt0JDs/CYLJSy+VVkxsyMquUz2YBGT
 bNnIE38JweOlQnIpvvcw7bVvABLTS/WLXbNU2CHZUQXWXeQVhvkMfl5T7c21sXd0Lx
 zt1BrxCu4HE5LSoThOjbz+mIf34Viau4aocxkjH9KKuDdYN4XqB51DYzWimHY0o2S2
 D8blUU/YQVbXg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 patches@opensource.cirrus.com, Bernard Zhao <bernard@vivo.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>
In-Reply-To: <20211206021100.321170-1-bernard@vivo.com>
References: <20211206021100.321170-1-bernard@vivo.com>
Subject: Re: [PATCH] sound/soc: remove useless bool conversion to bool variable
Message-Id: <163881364602.2769299.15385594323166864561.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 5 Dec 2021 18:11:00 -0800, Bernard Zhao wrote:
> This patch remove useless bool conversion to bool variable
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound/soc: remove useless bool conversion to bool variable
      commit: e733ab7e3e5dc1bf7d34e050e839fc902ce7ff98

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
