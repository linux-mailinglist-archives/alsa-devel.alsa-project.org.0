Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351227928F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935D81909;
	Fri, 25 Sep 2020 22:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935D81909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066784;
	bh=uU0NF2rOcIq+EQc/Dwe/4Q/5HYbBlFEAQ1nalXduhRI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=chfmeFtPXTuiwnjxS/hnsSxWKom0khhmFK2WJ47YtvojwRq7yZrZDUy4Xjo+sbP5/
	 leWIAxZOS2Ll36axSRrFdMKMcS19ZAwh/wxxY+BbkCnZY6BvZmTSe/R9uaI/1LFBa3
	 FG3q3Zw7GYK6+2nRId1/+e7vw8CVJgr1iSPKcQE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 137DCF802E2;
	Fri, 25 Sep 2020 22:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1FFF80254; Fri, 25 Sep 2020 22:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A320F801EC
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A320F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wuZNf9SA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 138FA20838;
 Fri, 25 Sep 2020 20:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066551;
 bh=uU0NF2rOcIq+EQc/Dwe/4Q/5HYbBlFEAQ1nalXduhRI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=wuZNf9SASFoPRiPSlyCtDOULTeWVHwWnKANKW3p4AmPocFST10bjPRTFdJ9GqM1Jl
 FPqoKvPRp16q1fmTkDY5XLkfYPBbAeDzVjJLLjB+FbTJgv7mJiGVP+2QyKJh4qh7y/
 cDu7BXGfeFA2uP/OUSjRNCOk0b8pgJWI+/CGk/QM=
Date: Fri, 25 Sep 2020 21:41:36 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, robh+dt@kernel.org, Dan Murphy <dmurphy@ti.com>,
 lgirdwood@gmail.com
In-Reply-To: <20200924142641.12355-1-dmurphy@ti.com>
References: <20200924142641.12355-1-dmurphy@ti.com>
Subject: Re: [PATCH] dt-bindings: tas2770: Mark ti,asi-format to deprecated
Message-Id: <160106647646.2866.8134090264099146979.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Thu, 24 Sep 2020 09:26:41 -0500, Dan Murphy wrote:
> Mark the property ti,asi-format to deprecated as it is no longer
> supported.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: tas2770: Mark ti,asi-format to deprecated
      commit: ff1d9ff43878de14b6ee4a089eb9f4a7e8f28a7f

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
