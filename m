Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC8D4F7BE5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 11:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03651860;
	Thu,  7 Apr 2022 11:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03651860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649324454;
	bh=5s9OskJhRbRG2UiHya741d2AQEc7gXNCfqv7+61bHTo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+wJBA5WzDiwdJOZ8v/MIVI35HFgap6I7Ss4AriFxKpuumljZ98KpjK+LGZJkOTjc
	 DWRrgVA2HtVHyXXTStgPkyYeBL4B84WM8AeKhT81JBlD7fWLHtkZLdmt/n//Rx6/WT
	 hciu5QuE/nAamyj3lZYTN/k6+G5J7nAZZbHMtwTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 079F3F80535;
	Thu,  7 Apr 2022 11:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAF46F80538; Thu,  7 Apr 2022 11:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45823F80535
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 11:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45823F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oSgF3tta"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A97B2B826FA;
 Thu,  7 Apr 2022 09:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225A9C385A4;
 Thu,  7 Apr 2022 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649324312;
 bh=5s9OskJhRbRG2UiHya741d2AQEc7gXNCfqv7+61bHTo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oSgF3ttao0gVuOlFBOMt9yHpO0kCnAqrr5505QzbDPd51pMmOkIeBjYcQRtVRyGyP
 Ait3GuJuxl0/lyEPOO4Yf1AciPnd5o3Rd6UmadIK6jXimksRI2/q/QI7GfhL1og0f8
 F6sKXWjfmQQ4Flol+icFsLEmIGMmrSm6bN00haeFXqCqdpm6W5o2m0QaQt4+lM9sbs
 fwtOS8sWrSWcg5SE2Pyoq7Gn2rcmpwi4TnsOLybt/P1gf7xJVUPwLiBLS3aa9V9W1A
 2lCl6vYS7ej/9+1Rn4IHNx95h1v9aaKr5YDa+hHBXezAn6TPRcVsue0kemWQfKEp+7
 Xj0dRH+U6rSmg==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com
In-Reply-To: <20220404113252.1152659-1-rf@opensource.cirrus.com>
References: <20220404113252.1152659-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Avoid NULL deref in
 asoc_simple_set_tdm()
Message-Id: <164932431085.3844153.445127549627667818.b4-ty@kernel.org>
Date: Thu, 07 Apr 2022 10:38:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, lkp@intel.com,
 dan.carpenter@oracle.com, linux-kernel@vger.kernel.org
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

On Mon, 4 Apr 2022 12:32:52 +0100, Richard Fitzgerald wrote:
> Don't dereference simple_dai before it has been checked for NULL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Avoid NULL deref in asoc_simple_set_tdm()
      commit: 51a630a7051f7f4f1cfdd64c20c7110f9907c230

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
