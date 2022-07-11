Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658CA570492
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 15:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00FDB836;
	Mon, 11 Jul 2022 15:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00FDB836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657547038;
	bh=p8ORd2QPR8RvrqSvkiemyZJhadncjyk4UWpXgXg70WY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2svaiy2njdOn/Yk11FtMk+hcH277Kb4amwJDF99wx8MMKTifNc/JndLIulnr4iNo
	 0czy8FIexfpaul/Gp76OTRc1e8mUhuNadwsG9DJgFbX2lGifk1TbpNz6ZuDbz2dYcR
	 eoqajv2JIlqtM9hBMZ0io6L2na+P046TeyXmBe+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F5F7F800E1;
	Mon, 11 Jul 2022 15:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43AE7F80163; Mon, 11 Jul 2022 15:42:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2133BF800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 15:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2133BF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ldoLgmod"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7125EB80EFE;
 Mon, 11 Jul 2022 13:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F271C34115;
 Mon, 11 Jul 2022 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657546936;
 bh=p8ORd2QPR8RvrqSvkiemyZJhadncjyk4UWpXgXg70WY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ldoLgmodCYQDgStD4Vaqe5rs2omN2SKIuO4JfFJXoFYyKPfbijaa1TCZ5mKesN9Al
 qzO9CVdPg/qbr/arCiVJHeULdG+8FeaDVxn00mjkQSbgXqfjO4CEZWbxk+mEdvRc8U
 jza7EZVVyL9wW5r22EXOOmRVtVWW7TrzV+BXLTw6X8QZ4Ryw8+ASimKL68GgZ+mU+H
 eD4Ih7SSiyEqdtAaPYsU8vHqY2kWRpZwXBfc/M9TXFjDbVfla/fHz0cS1JoDfARR/o
 N+f/JFBNdC8bKodbgVpoW0gX829ViloCIzQ7D5ykdz+xIEh7f+nsg1RyqAcdWAZEtN
 QN+zNgD9+TjYw==
From: Mark Brown <broonie@kernel.org>
To: jiaxin.yu@mediatek.com, lgirdwood@gmail.com,
 angelogioacchino.delregno@collabora.com, tiwai@suse.com, hbut_tan@163.com,
 perex@perex.c, tanzhongjun@coolpad.com, matthias.bgg@gmail.com,
 colin.king@intel.com
In-Reply-To: <20220708024651.42999-1-hbut_tan@163.com>
References: <20220708024651.42999-1-hbut_tan@163.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Message-Id: <165754693321.334539.8263656402397393470.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 14:42:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 8 Jul 2022 10:46:51 +0800, Zhongjun Tan wrote:
> From: Zhongjun Tan <tanzhongjun@coolpad.com>
> 
> Remove condition with no effect
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Remove condition with no effect
      commit: 19bb587f3ffcb9c166bac2debdc3b08fb362c0b7

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
