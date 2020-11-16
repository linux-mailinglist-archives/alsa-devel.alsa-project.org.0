Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3E2B5520
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 00:36:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2720F1776;
	Tue, 17 Nov 2020 00:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2720F1776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605569799;
	bh=t4gH+xslHGEpbSUE9Eg3+imKJ2LMXsAoQ97uWxZ0ZtQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2T6Ex9xjx388UEuKrXPMktctaDs6HOUs21/ZEkjnqWyQKQQI6SbpefsZkdjQQxFz
	 o9FF2MHifL4nSzr11O0kH99UaXwxQXaTF285iEdZVtlLB/4NuwcSchNHaLBMYvaN0O
	 6AXh2s6jXPMz+8+klu84GYZEUelDZG9igyWDlHuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C1EF804E6;
	Tue, 17 Nov 2020 00:33:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B5A8F804E5; Tue, 17 Nov 2020 00:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEF20F804DF
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 00:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF20F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cL1Oa9Ix"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B2F122280;
 Mon, 16 Nov 2020 23:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569614;
 bh=t4gH+xslHGEpbSUE9Eg3+imKJ2LMXsAoQ97uWxZ0ZtQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cL1Oa9Ix9Q75bJYgoFopJvlyodkHC/YzxNqOaedkRH7A3vssk9BPOcD/UqKhXYuLe
 7OXmOD6z33ZkJyo0TUn5NEknCcu5r3DHR2eT5NvEDBJv2nBBWhq4QClZxfIv1v1yNR
 5sCUzu0dRNh7Azwic4TcIXBdC34qlDaCoALiTFWA=
Date: Mon, 16 Nov 2020 23:33:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrick Lai <plai@codeaurora.org>,
 xuyuqing <xuyuqing@huaqin.corp-partner.google.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20201116125950.GA44063@mwanda>
References: <20201116125950.GA44063@mwanda>
Subject: Re: [PATCH] ASoC: qcom: sc7180: initialize the "no_headphone" variable
Message-Id: <160556956526.29683.11951945809418219234.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Mon, 16 Nov 2020 15:59:50 +0300, Dan Carpenter wrote:
> The "no_headphone" variable is never set to "false" so it could be
> uninitialized.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: initialize the "no_headphone" variable
      commit: 7141f25f14e03a0b049ffb2010b12abf652a10f3

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
