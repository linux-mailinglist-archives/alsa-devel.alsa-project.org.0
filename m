Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD5B619AAA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 15:57:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50AA1670;
	Fri,  4 Nov 2022 15:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50AA1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667573852;
	bh=MnImCmWDPv3dphWbt7ZOdBidCmswfX5FKBN4bBqb3hM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjAYje3ObyS7S0n0UOcfcG6L5Kvr9r2flnB1wqU2qc0aQgS0PTREuT4vrcByfrBkx
	 w7uHbH+lvBHNYVAH2UVvSc1Y1HtZrco0C2wOZRDmJWL6bD9YA15NC53BVjQmts/wx9
	 oJjbZODmUJk8BmUjovDufNzR998u89C7z8UzY4fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AC16F804E7;
	Fri,  4 Nov 2022 15:56:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97994F804AC; Fri,  4 Nov 2022 15:56:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53055F8049E
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 15:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53055F8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rlv2JQx7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4AAFB82E8D;
 Fri,  4 Nov 2022 14:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AABC433D7;
 Fri,  4 Nov 2022 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667573769;
 bh=MnImCmWDPv3dphWbt7ZOdBidCmswfX5FKBN4bBqb3hM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rlv2JQx7uSqpV6bvQLw6X4fzO8gJTleJFba+KjQML3UvJei1aXOtfKOtJPaPv8TWy
 rmUmCUhjmWo/cpyy3uUxPqS0sgXcOtMNvcmAZVoZNCu4DivKzxjMzf5tfEPpk3blfd
 VVbMGfU9Qrq7kPeyLzxbyTW9mmYZ1jyS1TksVvpfjgn5d2C3ao6/JIwufzaKpxVioL
 6etkz0PkNTRYJyB4yysAhSDFcLTqcYj3xfaTQNZKs93KdXmOHbGn/PnQ0o9ds9Jkmq
 uzAWPoEmg8ARqnDcamjHjzzRakhrTZhjzSv3/nGL1v/Ell44uvp1yrLQoy/NVCe1hg
 ptkF7UYOJbXDg==
From: Mark Brown <broonie@kernel.org>
To: Sanjay R Mehta <sanju.mehta@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
In-Reply-To: <20221104100637.13376-1-vitalyr@opensource.cirrus.com>
References: <20221104100637.13376-1-vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH] spi: amd: Fix SPI_SPD7 value
Message-Id: <166757376782.346504.17328725307428801040.b4-ty@kernel.org>
Date: Fri, 04 Nov 2022 14:56:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Fri, 4 Nov 2022 10:06:37 +0000, Vitaly Rodionov wrote:
> According to data sheet SPI_SPD7 should be set to 7.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: amd: Fix SPI_SPD7 value
      commit: bff6bef701db784bb159a659e99c785b4594fc96

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
