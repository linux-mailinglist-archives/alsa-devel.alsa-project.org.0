Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A9548B2F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 18:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51051775;
	Mon, 13 Jun 2022 18:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51051775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655136570;
	bh=ofTEpipiiCTcLZ9nRnwddO6MgodLiB0MWBb5pdOhKrk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dRtx5H3NEdj9V+cyB1JcsXX0IS7ncCC+ooSV5wWHaff0JOHcAmWWiHSLXNzXXuh9N
	 65LT9JSMn/IaX7goXli15HY2hJODgPYD4efutBLY/CSakru5itCmPFFr54zAFQTqX6
	 Ms9TZfXIo+yo1W5qlVqZeG217Puv6MEeQ4LNi9jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00204F8052E;
	Mon, 13 Jun 2022 18:08:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 074C9F800D8; Mon, 13 Jun 2022 18:08:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 825B2F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 18:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 825B2F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KS54XjTA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71AC06134A;
 Mon, 13 Jun 2022 16:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE025C34114;
 Mon, 13 Jun 2022 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655136473;
 bh=ofTEpipiiCTcLZ9nRnwddO6MgodLiB0MWBb5pdOhKrk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KS54XjTA3/fHZmm8NWQ8Khu4iUjQYw4ddpDifzeWJdKSFREvwH3wjIqL27ZtM9/9p
 w/GLiJ6h6Zd9LIOJfBMQGbrDNVRSOC/AnQCUZ3SxlE4bN6TYdOD9HDNA8DO0zvmDr3
 gEH7ND9mc1SNPctEBIRfTot82nH0MYeEeTrrfXXx90Klpsb5tiszvAfonXVo7D6dSD
 eO+m1a7Yk20Cp1fHkjrb0aU02MXnBWloZoQ4wQoAuY9tFzRuL2o5EAThCD4XuCzY+q
 Dpel2suHLNDM0tO8yBfSjVD6XXigfGY4khxFwrMayS8us+lv0jD3fUghoV87Tplzfi
 oM72NMaj+3C2w==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org, lgirdwood@gmail.com
In-Reply-To: <20220603122526.3914942-1-broonie@kernel.org>
References: <20220603122526.3914942-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wcd938x: Fix event generation for some controls
Message-Id: <165513647269.514792.6975404271674414840.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 17:07:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 3 Jun 2022 14:25:26 +0200, Mark Brown wrote:
> Currently wcd938x_*_put() unconditionally report that the value of the
> control changed, resulting in spurious events being generated. Return 0 in
> that case instead as we should. There is still an issue in the compander
> control which is a bit more complex.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd938x: Fix event generation for some controls
      commit: 65c1c99d96f160e3fead8c6ec67b669cbe62320f

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
