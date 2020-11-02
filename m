Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D42A3156
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 18:20:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98ED173F;
	Mon,  2 Nov 2020 18:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98ED173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604337619;
	bh=rIlQqLI71vK+ZxCSq1CjmvcmTyDLZVhKtkIly/VcKS0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8pqe9yyxqOIdn/DfSaBePJuhddw5fyRb8xoQ2NdcLFaAyUYhv2GN/lmwRT2xdjOJ
	 DFZ9p2TGe/EiwOhXafY2S3IEusOhLKb0Jsv84g24WSraqPnOUWJMg62qetIIuBcJh6
	 81XNLOEm9rKMHp++bpd+nHT8LchT1d/OSbG7aQ4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A00BF804AF;
	Mon,  2 Nov 2020 18:18:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 049D4F80232; Mon,  2 Nov 2020 18:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6C02F8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 18:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C02F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="go90C1Sv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C408822265;
 Mon,  2 Nov 2020 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604337496;
 bh=rIlQqLI71vK+ZxCSq1CjmvcmTyDLZVhKtkIly/VcKS0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=go90C1SvalxQUPofKKwjnKrZyIcQaUor3MaeiaeZf+Mir5giw/U4JLi0yIAY39TTq
 PJMN1Fi499TSxXdb2RIeybAJDcQ83H7vSs7l6qNhuCUoGrreGUS1nbgqugYb0GAOUt
 tbPCH9gjFUOzMvNUEx2mCQBkNCcmq+lfyvfF9nhQ=
Date: Mon, 02 Nov 2020 17:18:07 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Xu Wang <vulab@iscas.ac.cn>, alsa-devel@alsa-project.org,
 perex@perex.cz, lgirdwood@gmail.com, peter.ujfalusi@ti.com
In-Reply-To: <20201029082513.28233-1-vulab@iscas.ac.cn>
References: <20201029082513.28233-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: ti: davinci-evm: Remove redundant null check before
 clk_disable_unprepare
Message-Id: <160433748156.18840.4266667524928264145.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org
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

On Thu, 29 Oct 2020 08:25:13 +0000, Xu Wang wrote:
> Because clk_disable_unprepare() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-evm: Remove redundant null check before clk_disable_unprepare
      commit: ff3cfccba4dd87bb89ca185b58b38b9a74260138

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
