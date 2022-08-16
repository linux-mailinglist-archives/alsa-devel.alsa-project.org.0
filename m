Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5347595DAE
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A6AF1664;
	Tue, 16 Aug 2022 15:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A6AF1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660657789;
	bh=TZr+q4bfiYW2wrvdLEG6cjLyujc1erJkRV5oTogwpCc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFDLesPL4+H4z4bRLTc8IRYDp5aQV3mPbaJa7wrr0cyEnzPIR91zBNeK3ASZq2Xpg
	 h/4qMuxoXBW9WCLS9KBP/bab91RJOkRto2D5xr0D57ZZB+WloLnjeel+3plohNa9bS
	 4ci9Vj5/lDhqq8lvg4kRbsQMgAtx5f2nXZKffA4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2107F8051D;
	Tue, 16 Aug 2022 15:48:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 113ABF8032D; Tue, 16 Aug 2022 15:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DEF5F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DEF5F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d8jD+Y9b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F31A160C4A;
 Tue, 16 Aug 2022 13:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2BEC433D6;
 Tue, 16 Aug 2022 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660657696;
 bh=TZr+q4bfiYW2wrvdLEG6cjLyujc1erJkRV5oTogwpCc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=d8jD+Y9b1X7SkdfkCJd8ZJ2JE3TOOsDU9d9shf2TQd68nUFqpFD/6IGDbIWUEre4q
 4aAlrb2l9XNsoSSbLD3sSNUVVpmC36jwP2Nffd5LW1q5FW0rmhVwSIITbw8Cv1UyI0
 rOPYtUXkN4w1oOECzq60RH/5nNppN8PfLO38LBhz+TXe7DuSXJFCKUeRt35BWlHPL8
 S/eYdWqPugIxBrE4UD0nlOo5pgGguoG4vEziEjoOtMrybbyb6F4XJqRqMuxn8/OigX
 fsUtY/KXOriEYlcwt6yNML4UeNED7hqtoKSJo+PiVZ45EYea4lNjrGMI6bI6YuUXLe
 6iytLEMRI6wYQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <20220810132913.1181247-1-venkataprasad.potturu@amd.com>
References: <20220810132913.1181247-1-venkataprasad.potturu@amd.com>
Subject: Re: [RESEND v4 0/2] Add support for linked list to store acp_stream
 and tdm support.
Message-Id: <166065769510.1387305.15486480353129377168.b4-ty@kernel.org>
Date: Tue, 16 Aug 2022 14:48:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: vsujithkumar.reddy@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com, Vijendar.Mukunda@amd.com
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

On Wed, 10 Aug 2022 18:59:11 +0530, Venkata Prasad Potturu wrote:
> This patch is to add support for linked list to store acp_stream instead static array and
> add tdm support for acp I2S stream.
> 
> 
> Ajit Kumar Pandey (1):
>   ASoC: amd: acp: Initialize list to store acp_stream during pcm_open
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: Initialize list to store acp_stream during pcm_open
      commit: 7929985cfe36c336e3d0753e9f23ac4c7758ea7e
[2/2] ASoC: amd: acp: Add TDM support for acp i2s stream
      commit: 12229b7e50cfa95fda55b83a2617eafd6ac4c8c5

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
