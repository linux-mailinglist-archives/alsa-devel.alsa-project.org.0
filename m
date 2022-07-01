Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7472E563AED
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 22:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19BB16B3;
	Fri,  1 Jul 2022 22:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19BB16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656707442;
	bh=LRv/lknPG+TK7cFzeL9s/nW+r/KwFiZfeygFv4ksOgM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UwVhAgO6CInsgQ3Ihh9gMzPXJeh1T7nVzqMkZE70htf9IVOzTl/vu8ChfobLl9tkN
	 14yVMnHYvOS6oqOeVhYGe7YUFrqyuJj+vdLZ//SVizwShJIQ8EaACNK34um9Zxsrzg
	 skJfwlGOmF84bsP+1TDHLSTPwqNNx57Q6oACZKmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BD78F80256;
	Fri,  1 Jul 2022 22:29:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2196DF80155; Fri,  1 Jul 2022 22:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DDA4F80107
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 22:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DDA4F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fsgRBIer"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BD1F621D1;
 Fri,  1 Jul 2022 20:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D122FC3411E;
 Fri,  1 Jul 2022 20:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656707371;
 bh=LRv/lknPG+TK7cFzeL9s/nW+r/KwFiZfeygFv4ksOgM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fsgRBIerB9z5HYWvjNT7XVDV6eu1XnZ62DTm7R+k1unSuDM2okZUd5r6XCYKUBKE7
 L4QsJe9C4I0qHEB7SNl3/QWzbpOtCRR9wPX3meix0mcZCixS1Hcw4+dFPvnX96wwYT
 xeY2tkgbIAAW5yvLojHwYruPVqCXFwZ+Ilxf3QWEbycijAKceuTrU4Dot1K+wAcrfX
 AzS97LP5cr9YOjUXky2shCNdSbU2VggU4toKuvLzYP33K4m4o/df3abvmDV2hEehtp
 SK8UBp3BOwYf+rvihHsHM9L/Nd3aJJRi+y7LGgZLzM61PCF1v63ZFY2ouPYr3RyUi2
 +zdkOjSgs+IMQ==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
In-Reply-To: <20220701125515.32332-1-srinivas.kandagatla@linaro.org>
References: <20220701125515.32332-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: add missing break statement
Message-Id: <165670736945.209342.14096327749907091103.b4-ty@kernel.org>
Date: Fri, 01 Jul 2022 21:29:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lkp@intel.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com
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

On Fri, 1 Jul 2022 13:55:15 +0100, Srinivas Kandagatla wrote:
> Add missing break in one of the switch statement.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa883x: add missing break statement
      commit: 68f26639dc40b5d6aca201f3e250a1538e68eae6

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
