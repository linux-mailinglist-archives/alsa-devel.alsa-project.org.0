Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBCB2052B8
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 14:42:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8333017CA;
	Tue, 23 Jun 2020 14:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8333017CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592916121;
	bh=brixnLgiNpjH3lbCFjImUCQDCfQaPq98NKVtSPD5vJA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBa/gDVIUfLeU6Rh6vJ15bJ+ouKV9f0nPqZ4hROIU6OgFG16OfAbJQOj0mXWLaHia
	 oq9t2g73idFBfcMavcYTLD79ho0t//L6yQt13M2YMswHIEXg2tVAF0ou/mX17sBhet
	 za5FxqcGc6QImJUe72o0ruPbsIYI90Ol0nUyX7Bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD676F802A2;
	Tue, 23 Jun 2020 14:39:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ADF0F802A1; Tue, 23 Jun 2020 14:39:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EFBAF80234
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFBAF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DEXpRMny"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F91E2072E;
 Tue, 23 Jun 2020 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592915956;
 bh=brixnLgiNpjH3lbCFjImUCQDCfQaPq98NKVtSPD5vJA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DEXpRMnyA0hN2nLrUQUaQAF5UuQu06hink2m06no9o2QauJNOvWSlAPXH34wfAyhg
 3rO/xsl7WYzuXhVEBXVvpQ9zbIyP8TqC2/jtsC0dRHE8dApgPH98buqhVxKW+G+bSP
 BUqAcNoe/vNA3m3usVZ/JQbWRbujlK4jWC+ouZ5Y=
Date: Tue, 23 Jun 2020 13:39:14 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com,
 timur@kernel.org, nicoleotsuka@gmail.com
In-Reply-To: <cover.1592888591.git.shengjiu.wang@nxp.com>
References: <cover.1592888591.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/2] Fix unchecked return value for clk_prepare_enable
Message-Id: <159291594453.44561.1878928339657994467.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 23 Jun 2020 14:01:10 +0800, Shengjiu Wang wrote:
> First patch is to remove the check of clock pointer before calling
> clk API.
> 
> Second patch is to fix the issue that the return value of
> clk_prepare_enable is not checked.
> 
> changes in v2:
> - split the patch to separate patches
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_mqs: Don't check clock is NULL before calling clk API
      commit: adf46113a608d9515801997fc96cbfe8ffa89ed3
[2/2] ASoC: fsl_mqs: Fix unchecked return value for clk_prepare_enable
      commit: 15217d170a4461c1d4c1ea7c497e1fc1122e42a9

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
