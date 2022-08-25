Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D4D5A10EA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:46:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D479AEA;
	Thu, 25 Aug 2022 14:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D479AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661431575;
	bh=Xwq1z8qZZw3qRrxoqGgWqlBuL1CljE25d5xlyMvsaUQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZtrrWauE/+iHzy6C7jrmbr52T6yWjqDmxnzLozNS3ls1kRcjzxHxsIff1Tb2HExQ
	 cA0K73rmUIGU3630S4FEMV80Oj84vrrt/W8IOZP7itnnxey1qgc/ZSxKjZS2c+JfR7
	 CQPl7JjXcJP9S2n3oSfW8Jarx/qVJWrjrjZMGNwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D81CCF804FD;
	Thu, 25 Aug 2022 14:45:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FEB0F8014B; Thu, 25 Aug 2022 14:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA330F8014B
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 14:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA330F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QMt3rpw5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8ED561C2E;
 Thu, 25 Aug 2022 12:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D95C433D6;
 Thu, 25 Aug 2022 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661431507;
 bh=Xwq1z8qZZw3qRrxoqGgWqlBuL1CljE25d5xlyMvsaUQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QMt3rpw53qYBhwO8KVEvW3brNNWezm69ZzHy738ktbGeoKWor7W/Mmg/NCtshpxK4
 j+XEvie8weh47vY7z6Sn6Qv2/CsMUUJ2z7IADQKBVVHPHnAzWtewnef8oYP52FZvAF
 P9uGnwvdVis19Pe7Hl68oVmo2rS+Gq/tqGaoZePDkuM9g2UfCOPVrCHLwzih8XwkWF
 Khj/OAV/15gPBIVtgNtpCkfIHqqlCjkGm6laE5tL6VabSUWDLQ63wGjQYh19ZWHrIT
 oFDuRgDqPIXY7c1ke1gdWb3nCkeHUHrneF8QozCOhPLaood7zXfeIMwZdsOtMqzpd+
 hK6vcr4cFo5Hg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhu Ning <zhuning0077@gmail.com>
In-Reply-To: <20220825014952.1038508-1-zhuning0077@gmail.com>
References: <20220825014952.1038508-1-zhuning0077@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: add suspend and resume for ES8316
Message-Id: <166143150633.98448.8112036464729539661.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 13:45:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: Zhu Ning <zhuning@everest-semi.com>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Thu, 25 Aug 2022 09:49:52 +0800, Zhu Ning wrote:
> The registers may be lost after suspend due to powerdown.
> regcache_sync solves this issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: add suspend and resume for ES8316
      commit: 4bac47a7b2f9f0c84411cb06944bab8f85c08757

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
