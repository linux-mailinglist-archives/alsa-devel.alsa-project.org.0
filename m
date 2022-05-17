Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E66652A790
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 18:02:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C8B850;
	Tue, 17 May 2022 18:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C8B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652803341;
	bh=3pOjCkAU200y6m9nlnhOIQw/WFG50rXKot5rpFhX6us=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MXhX07IrHgPOKon2NVEUDVl+XAdwIgCr3FQhLrQyIOpkAFsUnD9yUnU+rZ2wuUuCJ
	 wt2f690Sl/dEIohI8rXLLuV4WVboF37+MTKL0dNZCcXZFC230LqPDF81fiX9gqFSrF
	 0Sl/Vmdf45H08+06SaYv6DX3EurkZA8/ar9CRbRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C9BF8053E;
	Tue, 17 May 2022 17:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D11A5F8053D; Tue, 17 May 2022 17:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20F5EF80537
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 17:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20F5EF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M3QEnWDd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DA8D6124C;
 Tue, 17 May 2022 15:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BFDC34118;
 Tue, 17 May 2022 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803178;
 bh=3pOjCkAU200y6m9nlnhOIQw/WFG50rXKot5rpFhX6us=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=M3QEnWDdlSHJyGbFL1cs75vxvYtgKutUZVOTn5mTLQoU35BxHWb3uuvhG++9mQp5U
 2Ep5awWCXz7yxd5JZyXoqFRnL3GyvIK3mk3UixU2HIervwLCuh3tkSKvwwHFljBilF
 qDCixSCdaTUmmg1UeBUFhc3edTRqmc7XJEwS0RKXH2I9i6cdYScEG4QF7r+cpnvRdR
 ZkkKKRnoihOQVkueV/6Uad00a93Goh5oGE++8iQuHO6ur4xxY97+HbtFoOV/zom1QH
 RZzUAhyKeFGOQNrFFygst/D0bgwUtuLiTWSXQqTsCHIgeql/tdvSn85Gn0edL3TGwH
 VowOkJvIj8xqQ==
From: Mark Brown <broonie@kernel.org>
To: hanyihao@vivo.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, rikard.falkeborn@gmail.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220517033050.5191-1-hanyihao@vivo.com>
References: <20220517033050.5191-1-hanyihao@vivo.com>
Subject: Re: [PATCH] ASoC: ux500: mop500: Check before clk_put() not needed
Message-Id: <165280317718.1635268.9001989398219393939.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:37 +0100
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

On Mon, 16 May 2022 20:30:46 -0700, Yihao Han wrote:
> clk_put() already checks the clk ptr using !clk and IS_ERR()
> so there is no need to check it again before calling it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ux500: mop500: Check before clk_put() not needed
      commit: 37a86b32bf0e5c5ca23567d7b120306b9ac8497d

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
