Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F35676E8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F701700;
	Tue,  5 Jul 2022 20:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F701700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657047265;
	bh=z07d3tWCKO2PfBMX5iSdt+wsSGLf1g86UPV/UNCk/p8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=si3/Rz5jCuiqcCDFp0/wblt74RsEJsEUkCzrtJhXD9UEv3O+AJizdOwIA9p+RK/wv
	 5BV2FxMxdg2+DMGD7ooW+EhsxgStAJFA/9yad+H0vdQBqubKDCYKyNZO4EXXM0+c/2
	 LdVtTIjUb2289xHPlYERBhsac0ZVL31MkoYNoVYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF9B0F8053D;
	Tue,  5 Jul 2022 20:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28317F80515; Tue,  5 Jul 2022 20:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C92AF8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 20:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C92AF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="seMwPtb/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBE7A61A33;
 Tue,  5 Jul 2022 18:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545ABC341CB;
 Tue,  5 Jul 2022 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657047143;
 bh=z07d3tWCKO2PfBMX5iSdt+wsSGLf1g86UPV/UNCk/p8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=seMwPtb/+zKHmTc5VW84T6lNXiB3jKym3rlwZHR8mWiFd+ADQgJM1BWsyTxXQAJvX
 XFNPSMA9mQjmjHXOtvFelTJl7iR2VxyuKHHv5xyXg6OnsWWn66+Mb7Ij5ZA/yXkdt/
 SbEYsaN/5xc1uYTFtrNguXV8tlme/rKt0ea4drExUuVPan1YKbwSQ4e+wLeqifefhA
 hSVIJopLc437HG1Nu19P2sFmupe6Nlojs/jMzyQYSbQCUQ8PtUk5SRpJcu9zODSbzP
 ovDeVjyI0o1pRVMdj9gzFJ9+p2oJcok3/N6Crs9/qUfYrbmOxWXf2Eal8DN6YGGhI5
 6uN8tbawM5Big==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220705092645.101343-1-u.kleine-koenig@pengutronix.de>
References: <20220705092645.101343-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: xilinx: Suppress second error message about reset
 failure in .remove()
Message-Id: <165704714203.1050281.1377470823499304869.b4-ty@kernel.org>
Date: Tue, 05 Jul 2022 19:52:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, michal.simek@xilinx.com
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

On Tue, 5 Jul 2022 11:26:45 +0200, Uwe Kleine-König wrote:
> Returning an error value in a platform remove callback results in an error
> message being emitted by the platform core, but otherwise it doesn't make
> a difference. If ret is != 0, there is already an error message and another
> very generic doesn't add any value, so return 0 unconditionally.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: xilinx: Suppress second error message about reset failure in .remove()
      commit: 275cc7f5bd6f60565672ce339505b77fd47a8157

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
