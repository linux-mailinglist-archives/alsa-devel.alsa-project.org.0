Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F3561EDA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 17:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C42516E7;
	Thu, 30 Jun 2022 17:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C42516E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656601911;
	bh=kns8+0qB725KuYwFrosVJmskFRLv475UVQh24jxqzZw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jUmG+ntGeELTDWrps9d3RRhBNBkbSEJOF67+jD7jqRAZtW2yejVQMqToId9DTGC5a
	 u7wa4mdbTIGsktneXWsUW6zbDsQZ8v2YZJkzIPD7TuE6GILUG4j5ROeJVgF4wcPd54
	 Cpa5goN1iaIJvMPw5uYr675P7u4rXpBQsBa1tABA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20BC6F8052D;
	Thu, 30 Jun 2022 17:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 398F5F8052D; Thu, 30 Jun 2022 17:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88139F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 17:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88139F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WrXzuKEL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 928CD60E95;
 Thu, 30 Jun 2022 15:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382C2C34115;
 Thu, 30 Jun 2022 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656601818;
 bh=kns8+0qB725KuYwFrosVJmskFRLv475UVQh24jxqzZw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WrXzuKEL8eXydybg6sjJbvmscFiKhPlUHIJpUtZxuOJCd/rTV+d9ja4wH3dd1+H7T
 ErfJZinZnpjw4d+d4JrFD9T34LMc4CxF/xqXdnqCBZd1DRCDsH9SD49poMgCSnu7Cj
 Iv4SGD6GdR11jwQ5rLxXKnMrPbsbOnX9O5aQdHIRXeEQCSQavSfP7xBCRtHsD2iAIS
 vPdbLz9KOs5YVDCP9gQjsmTo9YMi2mj73Az+FICT7h646wa6ASCOR6rKXTfNs55PrZ
 oecVsVZ3hFiul7itI7kAG4tKsZyCkePxEHYVQRBaGyIZ4QGutRt5rj8y+Fq0F/+Geh
 /iOZkBn5AoOhg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, thierry.reding@gmail.com, lgirdwood@gmail.com,
 jonathanh@nvidia.com, kunyu@nfschina.com, tiwai@suse.com
In-Reply-To: <20220630020347.7148-1-kunyu@nfschina.com>
References: <20220630020347.7148-1-kunyu@nfschina.com>
Subject: Re: [PATCH] sound: delete a semicolon
Message-Id: <165660181594.664251.10913007808464337942.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 16:10:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Thu, 30 Jun 2022 10:03:47 +0800, Li kunyu wrote:
> extra semicolons could be deleted.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: delete a semicolon
      commit: d8d6253b36f55d199590ef908712fe52bb39ee97

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
