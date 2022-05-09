Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 187F6520598
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 21:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3BA16CD;
	Mon,  9 May 2022 21:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3BA16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652126333;
	bh=xKlmdHLZkImPaVJ0vEbDOGtDhEjWXzfx0mxKGKDFUxc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyGgQzKLVVVZggpQ6UFaoBjPB73YlbGRNxMrvjqeh9aCswVdcSo8EBJCeS+j+IbVE
	 xgY3R6QTKsDdzBnBcYZp6p9snlWdsEOcXNyxeAGXJznlqutAZhd905xCQnlCZCuOIc
	 L59qacfFmokCtJNcwvk8eZt0o8zY91FKfzTirHUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168CBF8014C;
	Mon,  9 May 2022 21:57:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63AAFF800D3; Mon,  9 May 2022 21:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E2F1F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 21:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E2F1F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PmlGsU9s"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34FB2B8191F;
 Mon,  9 May 2022 19:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C267C385B2;
 Mon,  9 May 2022 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652126264;
 bh=xKlmdHLZkImPaVJ0vEbDOGtDhEjWXzfx0mxKGKDFUxc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PmlGsU9so7KVEDdzDsc5qWpNV6GzoLmKQ6M4uuNs8KZuP0ur01kpRPaWxJjBIrj4C
 VTUypkjSTLbcXK/sqFIa+cG4DdtdT0ZHSgb1zjjtqReoLiBMxYg3F98jmahaWTJ/mw
 ViU7DHcDQjd8O4A5KasMR2Xhn3l+aLeh1cDdxPr5tTu28ef5wADDfTFG7czn/SI/u0
 eUY2/ax3Hbbj/Al8z3DVlz7DZl4dEI2jqqDtSYcXC4ad6ovWhoRTYMdvxDR7GQGcZL
 Km4bRMrYIgbwzqfwcN1sNTCnqg7qyxdIZP5odFp5cvLoBsTqDXR90PYRC3fQwVG3LA
 RrfjZNnHmH+zQ==
From: Mark Brown <broonie@kernel.org>
To: nfraprado@collabora.com
In-Reply-To: <20220509185625.580811-1-nfraprado@collabora.com>
References: <20220509185625.580811-1-nfraprado@collabora.com>
Subject: Re: [PATCH] Revert "ASoC: dt-bindings: mediatek: mt8192: Add
 i2s-share properties"
Message-Id: <165212626102.1478109.3697258153804528211.b4-ty@kernel.org>
Date: Mon, 09 May 2022 20:57:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
 shane.chien@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, krzk+dt@kernel.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
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

On Mon, 9 May 2022 14:56:25 -0400, Nícolas F. R. A. Prado wrote:
> This reverts commit e056cf4341ae3f856f1e38da02b27cb04de4c69b. The commit
> was merged while the property name and definition were still being
> discussed. Revert the commit for now and a follow up commit will re-add
> the property after it is further discussed and reviewed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: dt-bindings: mediatek: mt8192: Add i2s-share properties"
      commit: d94d1486952b860dcedd04d0ff8ade2176418905

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
