Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711874FEA1A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 00:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C92185B;
	Wed, 13 Apr 2022 00:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C92185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649802458;
	bh=MBNtZA6rXGXC12n4TUDLgxmGOvEAdEkXm7T+0dFTi00=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MWKp/fRLCHgngk5LKNUTxWYqcJe7mK3WPPpYcCGe0Wai2lHreqQerKWfr5/QS2sHL
	 oVPN1PR2fDyK4qLf0iNwTbngtiSw9nSRsrTfQaKsy21RZSzu4/B0MuDclEo80CH/de
	 YIxq5Wi7qh+XEBp+13s90m2uh+Q1kXjf4x6iBzYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5440DF80154;
	Wed, 13 Apr 2022 00:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47EE2F80109; Wed, 13 Apr 2022 00:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1D2BF80109
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 00:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1D2BF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oZ/hfLIh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE707B8206D;
 Tue, 12 Apr 2022 22:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FD1C385A1;
 Tue, 12 Apr 2022 22:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649802389;
 bh=MBNtZA6rXGXC12n4TUDLgxmGOvEAdEkXm7T+0dFTi00=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oZ/hfLIh0qXWOlbk/WYctNIyOey7eD/79V1sZ5ZcT/+vngPoL1ZENQWoe8BZz0inm
 iMUtjggXRDv8Gv0DHcT8uqZ3KbKnQDf9VT1qvADZ9Tjgip2z1LOCNW2ndPHl8WcOTM
 qNnXwmvyVmAmgntZU5JJn6u4v1o/KdyOyMJooMJLJUwy9JtwEl3XLL4H2Fn8S4VB2E
 TzO74IzSJEDXnZdcNYuydCWy4L3DnYWg7BqaHLHD1y65Q0FKCSXLUf5+MpRxABbmqq
 FXQJloMRUPIv3SQFiebN5WnSnrfL/UPVaK4k+/+LJOk/kGGZy0zqAr6r8ZsgZ24oCO
 ob5I0ADaZJwPg==
From: Mark Brown <broonie@kernel.org>
To: jmkrzyszt@gmail.com
In-Reply-To: <20220402120106.131118-1-jmkrzyszt@gmail.com>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
Message-Id: <164980238824.480306.8135927048445454022.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 23:26:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 peter.ujfalusi@gmail.com, lgirdwood@gmail.com
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

On Sat, 2 Apr 2022 14:01:06 +0200, Janusz Krzysztofik wrote:
> The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP1 custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
> 
> Update the driver to be compatible with CCF implementation of clock API.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: osk5912: Make it CCF clk API compatible
      commit: 90b76a3cb9bf208286851560cfc70830c91c1d3f

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
