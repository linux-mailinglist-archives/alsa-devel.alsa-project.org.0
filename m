Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708933130A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1121E18C1;
	Mon,  8 Mar 2021 17:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1121E18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615219894;
	bh=dp5CLRZ/qcCLRBLFiX1Elejcb5Arx4EDlbEp0HHDH1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xi4Oq8Le/asXtM3/6oZtd0W+TsSrppttccERyOb47y9JRekoD/d/lzsAIHhn2QXwz
	 dKJ421Ns7I1eUTxyZIXornpkFE7JqQvuH33rep13NS9AIosbilT5OmffkvNj571vqw
	 /PMf6UX6CMTu1EnCmo/fGPRPNvJRuovvxPpVy/fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96382F804AC;
	Mon,  8 Mar 2021 17:08:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A96CF804AB; Mon,  8 Mar 2021 17:08:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EAE7F80482
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EAE7F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LfdzLPPb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EE6E65210;
 Mon,  8 Mar 2021 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219707;
 bh=dp5CLRZ/qcCLRBLFiX1Elejcb5Arx4EDlbEp0HHDH1Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LfdzLPPbq9W7CZ7v8EHQghN3CFK/Zuhx8Ptho+UIORomAXGE68s+X9ZyN4SceEvh1
 8Br2eVy6SLaJb0vC7ecRnFhW++wAvubKpCz42XKOablLrp73rEVHca9J6/dMgr6zGR
 2Fyy2H0/RTOfVG3jkCVcfSiLYjYCAoH5MXTA+xRVLnkeUeOZ4YOwuCOJGT/sWsvURn
 wuh1Wc7dDzKQitA5V3AO41N1U/CyYFGcHJhZNTPj3AIGSrfuAOwXh9oi5XtB/QdyGn
 MDNCyBiceExcVP9s9Um6vT2rp3sTFJjMu2M1abXdD6g1WHdkGeCxzgEi59002NVdG5
 jpuMJEOK7JsDA==
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>, perex@perex.cz, timur@kernel.org,
 nicoleotsuka@gmail.com, tiwai@suse.com, Xiubo.Lee@gmail.com
In-Reply-To: <20210302125002.23900-1-tangbin@cmss.chinamobile.com>
References: <20210302125002.23900-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Use
 devm_platform_ioremap_resource_byname() to simplify code
Message-Id: <161521960849.9621.15073900533403359434.b4-ty@kernel.org>
Date: Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Tue, 2 Mar 2021 20:50:02 +0800, Tang Bin wrote:
> In this function, devm_platform_ioremap_resource_byname() should be
> suitable to simplify code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Use devm_platform_ioremap_resource_byname() to simplify code
      commit: c5f48a78e0cb950eb821af36b8790b794cc745b1

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
