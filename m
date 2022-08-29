Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149505A4CDD
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 15:03:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BEB161D;
	Mon, 29 Aug 2022 15:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BEB161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661778182;
	bh=CZ+Ha6ACDYZ31GGjbUkwMq3dGzF9Rq7X/FgF0YKPPT0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLY4ggAqi0OKzOLQhuLbsl3qmidpU/7F4UMGyxDFFaMh2b80fCDDxyiTZkMI9R95A
	 1mCOpE84/A/ZlJXZdxKOCLLp6mvVDZau7nVsR2Z5Qnhpi1VWKadO3hwOMV3aURUzdV
	 8dOXxQUsmNeEaNmF4J8L6QLCo6kg5/VqmffnRjo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 466A3F803DD;
	Mon, 29 Aug 2022 15:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0EA2F802A0; Mon, 29 Aug 2022 15:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60B02F80217
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 15:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B02F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mjzOvsFe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94CF1611ED;
 Mon, 29 Aug 2022 13:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCF0C433C1;
 Mon, 29 Aug 2022 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661778088;
 bh=CZ+Ha6ACDYZ31GGjbUkwMq3dGzF9Rq7X/FgF0YKPPT0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=mjzOvsFeA4TTRMdz/sONIrEzkVLX1gWGXAGuQ4t+90agKVX7cK1Xmi7hSYaqUjg1n
 /Ke0l88pXFMnOjpophH04Y2ZA82Ohv/irKoDOGuSOSiTXzhnektJvEsAKAEdI5Lav+
 LNiGdzKginS5GFrrDj/F8XtjIHsf8rA+zPcHNuxd0cq6pjrBoelG+oKVi/ix0DqnCk
 u9rl8VpZCmmf1dGgnlicRVNcNP8ho7jZKLLIUgw2SEqteVVntQinPwvLQbbcv1tV70
 5LQDJLW2pyWLSLHMXw0KhGh6IrHteBC5r6yAE94wKNpJm6jqdSa3pkUahJIj7r1/JQ
 IsrCXDLmqaYUw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, krzysztof.kozlowski@linaro.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
References: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: allow compile testing without MFD drivers
Message-Id: <166177808650.741330.2635943625001283244.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 14:01:26 +0100
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

On Fri, 26 Aug 2022 12:36:59 +0300, Krzysztof Kozlowski wrote:
> Motorola CPCAP, Lochnagar Sound, Rockchip RK817 and Qualcomm
> WCD9340/WCD9341 do not depend on parent MFD driver in build time and can
> be compile tested without respective MFD part for increased build
> coverage.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: allow compile testing without MFD drivers
      commit: 5b7f4e5de61ba8c44317718936864da29eeba62a

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
