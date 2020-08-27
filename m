Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A251B254658
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 15:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D09A17C8;
	Thu, 27 Aug 2020 15:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D09A17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598536753;
	bh=vKVPIVaZLNnE8mWtW64ir6RN5g6qmzufGrKD/jp+ymI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kuLlzdGnLdnheg7VuTvaq9IidAr1wDwa9nO0whD8pwg9kAP9cQdjQcuVIeUUQZOwB
	 2e74Mm6WaCGrexIUVH4QwiI/s/WgJrvuynVMhRWqt8HqbWinxuxsqzx3LvPSA683A7
	 3d5cCLcVwjv35hqEZ+KbLviVw0NV21qGWjrStCv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84BAFF801D9;
	Thu, 27 Aug 2020 15:57:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3582F8016F; Thu, 27 Aug 2020 15:57:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89BE3F80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 15:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89BE3F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nSAe24gL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F0AA22BF5;
 Thu, 27 Aug 2020 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598536641;
 bh=vKVPIVaZLNnE8mWtW64ir6RN5g6qmzufGrKD/jp+ymI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nSAe24gLIh0MzytpZ4TIHLFBeYFUQGixhIwaIOJg0I5eDH6QoUIGouKK4ZOTM468D
 ukDmh9kt4MhZWxwM/C7gCR8tJGv+yPHwRLZtjH5tRK0Tf/AgOxClwM4LQFiVXWWJQj
 udyGz/Hm7m4Xi6RX3ChgJGF59dXlUPkWw6qyfuok=
Date: Thu, 27 Aug 2020 14:56:44 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Pavel Dobias <dobias@2n.cz>
In-Reply-To: <20200827102528.29677-1-dobias@2n.cz>
References: <20200827102528.29677-1-dobias@2n.cz>
Subject: Re: [PATCH v3] ASoC: max9867: shutdown codec when changing filter type
Message-Id: <159853660472.29762.10733251036971542210.b4-ty@kernel.org>
Cc: ladis@linux-mips.org
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

On Thu, 27 Aug 2020 12:25:28 +0200, Pavel Dobias wrote:
> Changing filter type without disabling codec results in filter
> malfunction. Disable codec when changing filter type.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max9867: shutdown codec when changing filter type
      commit: a11ffbbac9cc7fdd73b01a0d8227ef8a1d2b95da

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
