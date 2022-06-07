Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51053FBCC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB5C1914;
	Tue,  7 Jun 2022 12:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB5C1914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598781;
	bh=zGH5b/STJj18mrG57UIzzjkiu2m/697Mzp28pW+tLkc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqLpkIb/HcdS99CCzSMipxcNqya/Jf1uWIIH+m6MAhaf4q3J5Fz8fQumHJNWYSIx5
	 R3D5Bmmp71e/3/eMZLuuVdFZQKBEYugwnSHBkoFNIqcC7qztYB5i7MhVyILFaQev0i
	 X6FYpl7m3q+Q4ZxrC7KPxynJyYP9vHN1pbXrqrfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 968A4F8028B;
	Tue,  7 Jun 2022 12:45:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40FF5F80116; Tue,  7 Jun 2022 12:45:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B928BF80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B928BF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MZ3Z69Wf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00C2F6152A;
 Tue,  7 Jun 2022 10:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1BCC34114;
 Tue,  7 Jun 2022 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598715;
 bh=zGH5b/STJj18mrG57UIzzjkiu2m/697Mzp28pW+tLkc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MZ3Z69WfLof8HyNjFb6ggN3qi90rV4dWtA0xnqnYR9cxdAqpIcsEGZ1D0upxLFZC+
 mEEiZLRBpZTAo6NTanz9ryEo+bVz4lOq3uP5S9sqX+UGqFd7hIh1yW/0zsGcc7gMkD
 rfAf6flBYGI+1va7+LipURXiddlgspFLkq/eT76ABPXhsra7mSETsBkNTppen93acd
 Ee4hWPMr41cZrSWMhNS38AY1k2rMwAbRRn0WcygCWmRdIh+Vioc7mgtZJQSFWTMntr
 4R36jstJG318S9EADa+JoVD1R5r9DSmLHRCwnwSscZB1wVnve9INlpLv/P0nal1ks8
 lhtovcmPzvdyA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com,
 shengjiu.wang@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1653015960-15474-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653015960-15474-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: enable dual fifo for ASRC P2P
Message-Id: <165459871277.301808.7959112198574702500.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 20 May 2022 11:06:00 +0800, Shengjiu Wang wrote:
> The SSI and SPDIF has dual fifos, enhance P2P for these
> case with using the sdma_peripheral_config struct
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: enable dual fifo for ASRC P2P
      commit: 6398b004cfcce38626f3ba6fa5853177a3501aae

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
