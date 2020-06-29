Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC420D08B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 20:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E6A84C;
	Mon, 29 Jun 2020 20:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E6A84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593454689;
	bh=HME3jm5v+kI3YX0e1z9z2PFpSji4Pm/di2GGIvU+mpM=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWuKX8q79LQXDmYWxqUfp72XiqwhVT2aXeLx2OwB+DOCl78PZsl2lpcxbX8wNcaJD
	 2q2jCd+VTZZfsvFnPM9MlP8wTKyICx0Fi3YUCu1jPbbt3a8FkDytnBmgGbG3LRq4VC
	 VjMwOv6rFYCEZFc80gIveRKO0DpGzuEdPfaCH6ZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA0C1F802A8;
	Mon, 29 Jun 2020 20:15:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D5AF8022B; Mon, 29 Jun 2020 20:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF083F8020C
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 20:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF083F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pqTxBMQQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C94A025599;
 Mon, 29 Jun 2020 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593454519;
 bh=HME3jm5v+kI3YX0e1z9z2PFpSji4Pm/di2GGIvU+mpM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pqTxBMQQ7VvDugyQK5aqKCae+tDtwremB2oe11I/J6sXrgwhq/Q0XqQLNhuX2KBdW
 RJm+2Bg0tIzcZeRo+V6/Bxo56MsCI22ceSzjrC4OXFpxcA/oPBE79FSBezP5486YaP
 5ZduXoLhipDZghr8b07IILTLCqqlCy55LSMj29SQ=
Date: Mon, 29 Jun 2020 19:15:17 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, plai@codeaurora.org,
 alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 Rohit kumar <rohitkr@codeaurora.org>
In-Reply-To: <1593265030-1451-1-git-send-email-rohitkr@codeaurora.org>
References: <1593265030-1451-1-git-send-email-rohitkr@codeaurora.org>
Subject: Re: [PATCH] asoc: Update supported rate and format for dummy dai
Message-Id: <159345450675.54191.18376967903850938054.b4-ty@kernel.org>
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

On Sat, 27 Jun 2020 19:07:10 +0530, Rohit kumar wrote:
> Add support for 384KHz sample rate and S24_3LE
> bitwidth for dummy dai.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] asoc: Update supported rate and format for dummy dai
      commit: abc17b2974d634c17d25be7f4472890c8533a005

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
