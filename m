Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4850A70B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5191A16AD;
	Thu, 21 Apr 2022 19:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5191A16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650561956;
	bh=5INB3gN/SAkPNZQ5UM6mylptmqZsyfxjKbIbVC01LrI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+Jv83nq9PPPVEW4XKZnqthuF7QAWiH2d6kuphYUEabIDdLpYUD5M1iuC9/Hd0bpQ
	 Tbor3mihOaIV3FaiTTrae+i/8uonpmGePQjAVdtjfTchxUV42PynGIJ3uAlfo5mxSj
	 gQ84f7CcYpDqd26qln2ovtYENbo+ZzdH7hbPJwys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0B74F804DA;
	Thu, 21 Apr 2022 19:24:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BAD9F804C1; Thu, 21 Apr 2022 19:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FED4F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FED4F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WPluND3R"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B7CD61D19;
 Thu, 21 Apr 2022 17:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82287C385A5;
 Thu, 21 Apr 2022 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561888;
 bh=5INB3gN/SAkPNZQ5UM6mylptmqZsyfxjKbIbVC01LrI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WPluND3RRWmNFYki8i0haBuoDbhRSwkLhpi0SBbKFVTEbEGu8TDF5smKJ1O+R3De1
 kbA3y25fHEhnDkgjIfmIq5FqmQI8M8qf4eHLS6dxI7uVkPMvd5PPoIKRpBUKKJTKLb
 1G/a+rgqbrfME/0gluBI6SOMgxacAEBmM2F8WuotRi+ZsK5q2QI3QM38dpXMEMlAdv
 /6KAe2IVvjW4LOCgsZR2AV9bAPJCJLLOA7e+VWYxhAv3I3W3h1H5M6O0D3kFsFAnad
 vgnm/zHnj2GnDwMASKt1ShZn77gqEHH6yx7YU820rRUuOWm8/iSl3BSILjUMy8AJNa
 1Pb4mYK/78eJg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, steve.lee.analog@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20220311132906.32292-1-steve.lee.analog@gmail.com>
References: <20220311132906.32292-1-steve.lee.analog@gmail.com>
Subject: Re: [V2 1/2] ASoC: max98390: Add reset gpio control
Message-Id: <165056188725.376935.1518021217219450490.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 18:24:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ryans.lee@maximintegrated.com
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

On Fri, 11 Mar 2022 22:29:05 +0900, Steve Lee wrote:
>  Add reset gpio control to support RESET PIN connected to gpio.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: max98390: Add reset gpio control
      commit: 397ff024960634962af93e9e2775fc0e4fe7de92
[2/2] ASoC: dt-bindings: max98390: add reset gpio bindings
      commit: 68514c9f6aa676f98328844336fc4400244a8479

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
