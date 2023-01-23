Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03844678211
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:44:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F31AE9;
	Mon, 23 Jan 2023 17:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F31AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674492286;
	bh=I6q+1TqaHhwNsgg4BdDkxDvo9F1rclT1/qSrFDqO+YM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jmR4iaMFJbd98nIwXpngZgeTrtrmD7kEjickiXmMgr6rRr5apb18sN8xBWy4tuQbi
	 hG1yfDLExh1jalTrrw7d02I8RSQwx2N6Pt73RYwQNYIX+Nk8bah/fvDQYuGhTXTboz
	 DfIj2eG2JP/UbzB2/Z2+rXUfmPjsCrKIRaSUkMwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F15F80515;
	Mon, 23 Jan 2023 17:43:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9FA8F8053D; Mon, 23 Jan 2023 17:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5023FF80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5023FF80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ptp60oyT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0FD360FB1;
 Mon, 23 Jan 2023 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B3AC433A0;
 Mon, 23 Jan 2023 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674492183;
 bh=I6q+1TqaHhwNsgg4BdDkxDvo9F1rclT1/qSrFDqO+YM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ptp60oyTKkwQPeovyuULop1bZsBG02hFVIVxS02La7Mktoop9wmWl4boWnW8aDB23
 tW96Nx+Mip0+JAlOU+E+0otkxbCzZuOezqq/zO4S0y6BPT/xD4Z85q3KlkjT1rvla2
 agDbOfqKOjI+p4kdxFQu/Yuh09y6JlFb5vpms+16nRzaES/AW9oMjjTjC7zxzpU5rV
 FtEVH/v9b9NOWw3siPzDxn3ffBOpZuTwEo+wngpN/8I81m3GSbD3Nep1rH8SzHrnT9
 oaA5mXkUL6Kpt14DYPac10PAX1ECenIvQhUEfd4ARNImIUraMixKamPE+K7wCC3uTI
 QHpIWUP6phTFw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com, 
 jiaxin.yu@mediatek.com, Chunxu Li <chunxu.li@mediatek.com>
In-Reply-To: <20230110092623.13035-1-chunxu.li@mediatek.com>
References: <20230110092623.13035-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: add AFE_DAC_CON0 to volatile
 register list
Message-Id: <167449218051.1484410.8537098920978259746.b4-ty@kernel.org>
Date: Mon, 23 Jan 2023 16:43:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 10 Jan 2023 17:26:23 +0800, Chunxu Li wrote:
> Mark AFE_DAC_CON0 as volatile since DSP firmware will access this
> register too.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: add AFE_DAC_CON0 to volatile register list
      commit: 42fc858cc7e3f9e7a5762b29f9daaf23a15e45ef

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

